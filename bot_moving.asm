asect  0x00
	
start:	
	ldi r1, V
	ld r1, r1
	
	ldi r2, 0b10000000 # get the direction of x_speed
	
	if
		and r1, r2
	is pl
		# if the direction is toward the bot
	
		# set k to r0, where 248 <= k * x_speed < 248 + x_speed
		# x_speed = 4
		ldi r0, X_ball
		ld r0, r0
		ldi r2, 251
	
		sub r2, r0
		
		clr r3
		tst r3
		shr r0
		tst r3
		shr r0
		

		
		# set y_speed to r1, direction y_speed to r2 
		ldi r2, 0b00001000
		and r1, r2	
		ldi r3, 0b00000111
		and r3, r1
		 	
		
		
		ldi r3, Y_ball
		ld r3, r3
		
		
		# reverse field if the direction of y_speed = 1
		if 
			tst r2
		is nz
			ldi r2, 1
			not r3
		fi
		# r2 is reverse counter
		
		
		
		# set the y_ball of the ball to r3 when 248 <= x_ball
		while
			tst r1
		stays nz
			if
				add r0, r3
			is cs
				inc r2
				inc r3
			fi
			dec r1
		wend
		
		
		# reverse field if r2 is odd
		if 
			shr r2
		is cs
			not r3
		fi
		
		
	else 
		# if the direction is toward the player
		
		ldi r3, 128
	fi
		
	ldi r0, RES
	st r0, r3
	
	br start
    halt

asect 0xF0
X_ball:      ds 1
Y_ball:      ds 1
V:			 ds 1
RES:     	 ds 1
end

