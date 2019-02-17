.data
	newline:   .asciiz  "\n"
	msgGreet:  .asciiz  "\nStart playing a One-Player Snakes Game."
	
	board:  .ascii   "\n\n    . . . . . .      0 1 2 3 4 5"
            .ascii     "\n    . . . . . .      6 7 8 9 a b"
            .ascii     "\n    . . . . . .      c d e f g h"
            .ascii     "\n    . . . . . .      i j k l m n"
            .ascii     "\n    . . . . . .      o p q r s t"
            .asciiz    "\n    . . . . . .      u v w x y z\n"
              
    msgPickPiece:    	  .asciiz "Pick a piece: (X|O) "
    msgPlaceX:       	  .asciiz "Enter X's next move: [0..z] "
    msgPlaceO:       	  .asciiz "Enter O's next move: [0..z] "
    msgContinue:    	  .asciiz "\nContinue? (y/n) "
    msgXWins:		 	  .asciiz "\nX wins!"
    msgOWins:		 	  .asciiz "\nO wins!"
    msgNewGame:	     	  .asciiz "\nNew game? (y/n) "
    msgInvalidMove:  	  .asciiz "\n\nSorry, that move is invalid.\n"
    msgCheckedNeighborsO: .asciiz "\nO's checked neighbors: "
    msgCheckedNeighborsX: .asciiz "\nX's checked neighbors: "
              
    offset:	 .half     6,   8,  10,  12,  14,  16  
             .half    39,  41,  43,  45,  47,  49
             .half    72,  74,  76,  78,  80,  82
             .half   105, 107, 109, 111, 113, 115
             .half   138, 140, 142, 144, 146, 148
             .half   171, 173, 175, 177, 179, 181
              
	neighbors:  .ascii   "16  "  # 0
           	    .ascii   "027 "  # 1
           	    .ascii   "138 "  # 2
           	    .ascii   "249 "  # 3
           	    .ascii   "35a "  # 4
           	    .ascii   "4b  "  # 5
           	    .ascii   "07c "  # 6
           	    .ascii   "168d"  # 7
           	    .ascii   "279e"  # 8
           	    .ascii   "38af"  # 9
           	    .ascii   "49bg"  # a (10)
           	    .ascii   "5ah "  # b (11)
           	    .ascii   "6di "  # c (12)
           	    .ascii   "7cej"  # d (13)
           	    .ascii   "8dfk"  # e (14)
           	    .ascii   "9egl"  # f (15)
           	    .ascii   "afhm"  # g (16)
           	    .ascii   "bgn "  # h (17)
           	    .ascii   "cjo "  # i (18)
           	    .ascii   "dikp"  # j (19)
           	    .ascii   "ejlq"  # k (20)
           	    .ascii   "fkmr"  # l (21)
           	    .ascii   "glns"  # m (22)
           	    .ascii   "hmt "  # n (23)
           	    .ascii   "ipu "  # o (24)
           	    .ascii   "joqv"  # p (25)
           	    .ascii   "kprw"  # q (26)
           	    .ascii   "lqsx"  # r (27)
           	    .ascii   "mrty"  # s (28)
           	    .ascii   "nsz "  # t (29)
           	    .ascii   "ov  "  # u (30)
           	    .ascii   "puw "  # v (31)
           	    .ascii   "qvx "  # w (32)
           	    .ascii   "rwy "  # x (33)
           	    .ascii   "sxz "  # y (34)
           	    .ascii   "ty  "  # z (35)

.text
	greet:
		la $a0, msgGreet      # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # Print the greeting message.
		jal printBoard        # Jump and link to printBoard.
		la $a0, newline       # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # Print the newline.
		la $a0, msgPickPiece  # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # Print the pick piece message.
		li $v0, 12            # Load $v0 with code to read a char.
		syscall               # Read the char.

		li $s7, '.'           # Load the empty spot char into $s7 to indicate that this is
							  # the first play of the game.
		beq $v0, 'X', placeX  # Branch to PlaceX if the user selects to be X.
		beq $v0, 'O', placeO  # Branch to PlaceO if the user selects to be O.
		
		# (Implicit continuation to code in printBoard. This forces the program to accept 
		# a valid piece selection
		# because the $ra in printBoard will continuously jump back to the location where
		# it was called, which was
		# just after msgGreet was printed in the greet subroutine. The branches to placeX
		# and placeO will only occur
		# upon valid piece selection, which will break this continuous loop. After 
		# branching, the $ra will be filled
		# with a different return address, so this loop only works because printBoard
		# subroutine is directly beneath greet.)
		
	printBoard:
		la $a0, board  # Load the message address into $a0.
		li $v0, 4      # Load $v0 with code to pring a string.
		syscall        # Print the game board.
		jr $ra         # Return to the caller (greet, placeX, or placeO depending on 
					       # program's state of execution).
			
	placeX:
		la $a0, newline              # Load message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the newline.
		la $a0, msgPlaceX            # Load the message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the message telling user it's X's turn.
		li $v0, 12                   # Load $v0 with code to read a char.
		syscall                      # Read the char.
		move $s0, $v0                # Store the user's piece placement choice as a char 
									 # in $s0.
		jal determinePiecePlacement  # Jump and link to determinePiecePlacement so we can
                                     # return here after determinePiecePlacement is done.
        li $s3, 'P'                  # Store an 'P' in $s3 to flag validatePiecePlacement
                                     # that we're validating a piece placement.
		jal validatePiecePlacement   # Jump and link to validatePiecePlacement so we can 
		                             # return here after validatePiecePlacement is done.
			
		move $t0, $s0          # Move the determined offset value stored in $s0 by 
		                       # determinePiecePlacement into $t0 to place X in
		                       # correct spot.
		mul  $t0, $t0, 2       # Multiply the current offset value by 2 to reach next
		                       # board location because each spot on board is 
		                       # 2 bytes long.
   		lh   $t1, offset($t0)  # Load $t1 with the offset of the index $t0.
   		li   $t2, 'X'          # Load the piece 'X' in $t2.
   		sb   $t2, board($t1)   # Put the piece at the location, board+offset.
		jal printBoard         # Print the board before writing O's snake over O's 
		                       # head location.

   		lh   $s5, offset($t0)      # Load $s5 with X's current head location, used in 
   		                           # PlaceO to overwrite X's head location with X's 
   		                           # snake char.
		beq  $s7, '.', skipSnakeO  # Skip writing O's snake if this is the first play of 
		                           # the game (as $s7 was set by greet).
		
   		sb   $s7, board($s6) # Put O's snake char over O's head location after board 
   		                     # has been printed.
   		
   		jal checkWinCondition  # Check if either player has won after at least the 
   		                       # second play of the game (Begins checking win condition
   		                       # after skipSnakeO because it's impossible to win on the 
   		                       # first play).
  
        #(Implicit continuation to code in skipSnakeO, although we didn't actually skip
        # placing snake if we got here).
     		
		skipSnakeO:
		    li $s7, '$' # Load X's snake char to $s7, to be written to the board 
		                # in PlaceO.
		    li $s1, 'O' # Load 'O' to $s1 (to determine who's turn is next if 
		                # game is continued from continue).	    
		    j continue  # Jump to continue.
			
	placeO:
		la $a0, newline              # Load message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the newline.
		la $a0, msgPlaceO            # Load the message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the message telling user it's O's turn.
		li $v0, 12                   # Load $v0 with code to read a char.
		syscall                      # Read the char.
		move $s0, $v0                # Store the user's piece placement choice as a.
		                             # char in $s0.
		jal determinePiecePlacement  # Jump and link to determinePiecePlacement so we 
		                             # can return here after determinePiecePlacement 
		                             # is done.
        li $s3, 'P'                  # Store an 'P' in $s3 to flag 
                                     # validatePiecePlacement that we're validating a 
                                     # piece placement.
		jal validatePiecePlacement   # Jump and link to validatePiecePlacement so we 
		                             # can return here after validatePiecePlacement 
		                             # is done.
			
		move $t0, $s0         # Move the determined offset value stored in $s0 by 
		                      # determinePiecePlacement into $t0 to place O in 
		                      # correct spot.
		mul  $t0, $t0, 2      # Multiply the current offset value by 2 to reach next 
		                      # board location because each spot on board is 2 
		                      # bytes long.
   		lh   $t1, offset($t0) # Load $t1 with the offset of the index $t0.
   		li   $t2, 'O'         # Load the piece 'O' in $t2.
   		sb   $t2, board($t1)  # Put the piece at the location, board+offset.
		jal printBoard        # Print the board before writing X's snake over X's 
		                      # head location.

   		lh   $s6, offset($t0)      # Load $s6 with O's current head location, used 
   		                           # in PlaceX to overwrite O's head location with 
   		                           # O's snake char.
		beq  $s7, '.', skipSnakeX  # Skip writing X's snake if this is the first 
		                           # play of the game (as $s7 was set by greet).

   		sb   $s7, board($s5) # Put X's snake char over X's head location after board
   		                     # has been printed.
   		
   		jal checkWinCondition  # Check if either player has won after at least the 
   		                       # second play of the game (Begins checking win 
   		                       # condition after skipSnakeX because it's impossible
   		                       # to win on the first play).
			
	    #(Implicit continuation to code in skipSnakeX, although we didn't actually
	    # skip placing snake if we got here).
			
		skipSnakeX:
		    li $s7, '+'  # Load O's snake char to $s7, to be written to the board 
		                 # in PlaceX.
		    li $s1, 'X'  # Load 'X' to $s1 (to determine who's turn is next if game 
		                 # is continued from continue).
		    j continue   # Jump to continue.
			
	exit:
		li $v0, 10  # Load exit code into $v0.
		syscall     # Issue syscall to exit game.
			
	newGame:
		la $a0, msgNewGame  # Load the message address into $a0.
		li $v0, 4           # Load $v0 with code to print a string.
		syscall             # Print the New Game message.
		li $v0, 12          # Load $v0 with code to read a char.
		syscall             # Read the char.
			
		beq $v0, 'n', exit      # Branch to exit if user types 'n'.
		la $a0, newline         # If user doesn't type 'n', load $a0 with 
		                        # newline address.
		li $v0, 4               # Load $v0 with code to print a string
		syscall                 # Print the newline.
		li $s4, 0               # Load the value 0 into $s4 (this will be starting 
		                        # offset value to reset the board).
		j resetBoardForNewGame  # Jump to resetBoardForNewGame.
			
	continue:
		la $a0, msgContinue  # Load message address into $a0.
		li $v0, 4            # Load $v0 with code to print a string.
		syscall              # Print the continue message.
		li $v0, 12           # Load $v0 with code to read a char.
		syscall              # Read the char.
			
		beq $v0, 'n', newGame  # If user entered 'n', call newGame.
		beq $s1, 'X', placeX   # If user entered anything but 'n' and $s1 contains 
		                       # 'X' (as set by PlaceO), it's X's turn, so branch 
		                       # to PlaceX.
		beq $s1, 'O', placeO   # If user entered anything but 'n' and $s1 contains 
		                       # 'O' (as set by PlaceX), it's O's turn, so branch 
		                       # to PlaceO.
			
	resetBoardForNewGame:
		move $t0, $s4           # Load the index (set to 0 from newGame) at $s4 
		                        # into $t0.
		mul  $t0, $t0, 2        # Multiply the current offset value by 2 to reach 
		                        # next board location because each spot on board 
		                        # is 2 bytes long.
   		lh   $t1, offset($t0)   # Load $t1 with the offset of the index $t0.
   		li   $t2, '.'           # Put the piece '.' in $t2.
   		sb   $t2, board($t1)    # Put the piece at the location, board+offset.
		addi $s4, $s4, 1        # Increment the index by 1 and store it in $s4
		beq  $s4, 36, greet     # Branch to greet only when we've reset the 
		                        # entire board.
		j resetBoardForNewGame  # Keep resetting the board until we've reset the 
		                        # whole board.

	validatePiecePlacement:
            move $t0, $s0
			mul  $t0, $t0, 2      # Multiply the current offset value by 2 to reach 
			                      # next board location because each spot on board 
			                      # is 2 bytes long.
   			lh   $t1, offset($t0) # Load $t1 with the offset of the index $t0.
			lb   $t2, board($t1)  # Load the current marker at $t1 (whatever marker 
			                      # is on the board at that location).
   			
            #li $v0, 11          # Load $v0 with the code to print a char.
            #lb $a0, board($t1)  # Load $a0 with the char at the location $t1 on 
                                 # the board.
            #syscall             # Print whatever marker is on the board at 
                                 # location $t1.
            
            beq $t2, '.', validationSuccess          # Branch to validationSuccess
                                                     # if the marker is a '.' 
                                                     # (indicating an open spot).
            beq $s3, 'W', returnToCheckWinCondition  # If there's a W in $s3 
                                                     #(as set by checkWinCondition), 
                                                     # we're using 
                                                     # validatePiecePlacement to 
                                                     # check valid neighbors.
            
        #(Implicit continuation to validationFailure. We arrive here if we didn't 
        # branch to validationSuccess.)
            
        validationFailure:
            li $v0, 4               # Load message address into $a0.
            la $a0, msgInvalidMove  # Load message address into $a0.
            syscall                 # Print the message saying the user made an 
                                    # invalid move.
            j continue              # Jump to continue.
            
        validationSuccess:
            li $s2, 'S'  # Store an 'S' in $s2 for successful checkWinCondition 
                         # (meaning the game should continue).
            jr $ra       # Jump back to the caller (could be placeO, placeX, 
                         # nextNeighborO, or nextNeighborX).
            
        returnToCheckWinCondition:
        	jr $ra  # Jump back to $ra (which will always be in either 
        	        # nextNeighborO or nextNeighborX).

    checkWinCondition:
    	# If the current player's (X or O) new head location has no open neighbors, 
    	# then the other player has won the game.
        li $s3, 'W'          # Store an 'W' in $s3 to flag validatePiecePlacement 
                             # that we're checking win condition.
		jal checkNeighborsO  # Once checkNeighborsO confirms O did not lose, it 
		                     # will branch to checkNeighborsX automatically.        
		
	checkNeighborsO:
		li $s2, 'F'          # Store an 'F' in $s2 for failed checkWinCondition 
		                     # (used here as a flag. If it remains unchanged, 
		                     # the game is over)
		add $a1, $s6, 17     # Add 17 to the O's head offset value to retrieve 
		                     # it's associated placement marker (0-9,a-z).
		lb  $s0, board($a1)  # Load the placement marker into $s0 so 
		                     # determinePiecePlacement can get its index value.
		
		jal determinePiecePlacement  # Use determinePiecePlacement to retrieve 
		                             # the placement marker's index value so we 
		                             # can find its neighbors.
		
		li  $t4, 4        # Store the iterator in $t4.
        mul  $a1, $s0, 4  # Multiply the index value in $s0 by 4 (to retrieve 
                          # the correct neighbors) and store in $a1.
        
        #la $a0, msgCheckedNeighborsO  # Load the message into $a0.
        #li $v0, 4                     # Load the string code into $v0.
        #syscall                       # Print a message saying that the 
                                       # following neighbors of O have been 
                                       # checked.

        nextNeighborO:
            lb   $s0, neighbors($a1) # Load the first neighbor into $s0 so we 
                                     # can determine if its place is taken on 
                                     # the board.
            
            #lb  $a0, neighbors($a1)  # Load the current neighbor in $a0.
            #li  $v0, 11              # Load code to print a char in $v0.
            #syscall                  # Print the current neighbor.
            
            beq  $s0, ' ', winnerX        # We didn't find an 'S' in $s2, meaning
                                          # we found no valid neighbors around O's 
                                          # current head, so X wins!
            jal  determinePiecePlacement  # Find the index of this neighbor.
            jal  validatePiecePlacement   # Validate that this neighbor's spot 
                                          # isn't already occupied on the board.

            beq $s2, 'S', checkNeighborsX   # If we find an 'S' in $s2, 
                                            # checkWinCondition succeeded, meaning 
                                            # we now have to check X's neighbors.
            beqz $t4, winnerX               # If the iterator is 0 and we didn't 
                                            # have successful checkWinCondition, 
                                            # O has no valid neighbors, X has won 
                                            # the game!
            
            add $a1, $a1, 1  # Increment the $a1 to check the next neighbor.
            sub $t4, $t4, 1  # Decrement the counter to denote we have one less 
                             # neighbor to check.
            j nextNeighborO  # Back through the loop.
            
    checkNeighborsX:
		li $s2, 'F'          # Store an 'F' in $s2 for failed checkWinCondition 
		                     # (used here as a flag. If it remains unchanged, 
		                     # the game is over).
		add $a1, $s5, 17     # Add 17 to the X's head offset value to retrieve 
		                     # it's associated placement marker (0-9,a-z).
		lb  $s0, board($a1)  # Load the placement marker into $s0 so 
		                     # determinePiecePlacement can get its index value.
		
		jal determinePiecePlacement  # Use determinePiecePlacement to retrieve 
		                             # the placement marker's index value so 
		                             # we can find its neighbors.
		
		li  $t4, 4        # Store the iterator in $t4.
        mul  $a1, $s0, 4  # Multiply the index value in $s0 by 4 (to retrieve 
                          # the correct neighbors) and store in $a1.
		
		#la $a0, msgCheckedNeighborsX  # Load the message into $a0.
        #li $v0, 4                     # Load the string code into $v0.
        #syscall                       # Print a message saying that the 
                                       # following neighbors of O have 
                                       # been checked.
        
        nextNeighborX:
            lb   $s0, neighbors($a1) # Load the neighbor into $s0 so we can 
                                     # determine if its place is taken on 
                                     # the board.
            
            #lb  $a0, neighbors($a1)  # Load the current neighbor in $a0.
            #li  $v0, 11              # Load code to print a char in $v0.
            #syscall                  # Print the current neighbor.
            
            beq  $s0, ' ', winnerO        # We didn't find an 'S' in $s0, 
                                          # meaning we found no valid 
                                          # neighbors around X's current 
                                          # head, so O wins!
            jal  determinePiecePlacement  # Find the index of this neighbor.
            jal  validatePiecePlacement   # Validate that this neighbor's spot 
                                          # isn't already occupied on the board.
            
            beq $s2, 'S', returnToPlay  # If we find an 'S' in $s2, 
                                        # checkWinCondition succeeded, meaning we 
                                        # should return to playing the game.
            beqz $t4, winnerO           # If the iterator is 0 and we didn't have 
                                        # successful checkWinCondition, X has no 
                                        # valid neighbors, O has won the game!
            
            add $a1, $a1, 1  # Increment the $a1 to check the next neighbor.
            sub $t4, $t4, 1  # Decrement the counter to denote we have one less 
                             # neighbor to check.
            j nextNeighborX  # Back through the loop.
            
            returnToPlay:
            	beq $s7, '$', skipSnakeX  # If X's snake char is in $s7, we have 
            	                          # to branch back to skipSnakeX to continue
            	                          # the game.
            	beq $s7, '+', skipSnakeO  # If O's snake char is in $s7, we have 
            	                          # to branch back to skipSnakeO to continue
            	                          # the game.
            
     winnerX:
		la $a0, msgXWins      # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # X has won the game!
		j newGame
     
     winnerO:
		la $a0, msgOWins      # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # X has won the game!
		j newGame
            
	determinePiecePlacement:
		beq $s0, '0', setPlacementValue0  # Get the placement value of the char in 
		                                  # $s0 (the char user picked as determined
		                                  # by PlaceX or PlaceO).
		beq $s0, '1', setPlacementValue1
		beq $s0, '2', setPlacementValue2
		beq $s0, '3', setPlacementValue3
		beq $s0, '4', setPlacementValue4
		beq $s0, '5', setPlacementValue5
		beq $s0, '6', setPlacementValue6
		beq $s0, '7', setPlacementValue7
		beq $s0, '8', setPlacementValue8
		beq $s0, '9', setPlacementValue9
		beq $s0, 'a', setPlacementValue10
		beq $s0, 'b', setPlacementValue11
		beq $s0, 'c', setPlacementValue12
		beq $s0, 'd', setPlacementValue13
		beq $s0, 'e', setPlacementValue14
		beq $s0, 'f', setPlacementValue15
		beq $s0, 'g', setPlacementValue16
		beq $s0, 'h', setPlacementValue17
		beq $s0, 'i', setPlacementValue18
		beq $s0, 'j', setPlacementValue19
		beq $s0, 'k', setPlacementValue20
		beq $s0, 'l', setPlacementValue21
		beq $s0, 'm', setPlacementValue22
		beq $s0, 'n', setPlacementValue23
		beq $s0, 'o', setPlacementValue24
		beq $s0, 'p', setPlacementValue25
		beq $s0, 'q', setPlacementValue26
		beq $s0, 'r', setPlacementValue27
		beq $s0, 's', setPlacementValue28
		beq $s0, 't', setPlacementValue29
		beq $s0, 'u', setPlacementValue30
		beq $s0, 'v', setPlacementValue31
		beq $s0, 'w', setPlacementValue32
		beq $s0, 'x', setPlacementValue33
		beq $s0, 'y', setPlacementValue34
		beq $s0, 'z', setPlacementValue35
			
	setPlacementValue0:    
		li $s0, 0  # Load the corresponding placement char value back into $s0 
		           # (to be used after returning from determinePlacementValue).
		jr $ra     # Return to where determinePlacementValue was called.
	setPlacementValue1:
		li $s0, 1
		jr $ra
	setPlacementValue2:
		li $s0, 2
		jr $ra
	setPlacementValue3:
		li $s0, 3
		jr $ra
	setPlacementValue4:
		li $s0, 4
		jr $ra
	setPlacementValue5:
		li $s0, 5
		jr $ra
	setPlacementValue6:
		li $s0, 6
		jr $ra
	setPlacementValue7:
		li $s0, 7
		jr $ra
	setPlacementValue8:
		li $s0, 8
		jr $ra
	setPlacementValue9:
		li $s0, 9
		jr $ra
	setPlacementValue10:
		li $s0, 10
		jr $ra
	setPlacementValue11:
		li $s0, 11
		jr $ra
	setPlacementValue12:
		li $s0, 12
		jr $ra
	setPlacementValue13:
		li $s0, 13
		jr $ra
	setPlacementValue14:
		li $s0, 14
		jr $ra
	setPlacementValue15:
		li $s0, 15
		jr $ra
	setPlacementValue16:
		li $s0, 16
		jr $ra
	setPlacementValue17:
		li $s0, 17
		jr $ra
	setPlacementValue18:
		li $s0, 18
		jr $ra
	setPlacementValue19:
		li $s0, 19
		jr $ra
	setPlacementValue20:
		li $s0, 20
		jr $ra
	setPlacementValue21:
		li $s0, 21
		jr $ra
	setPlacementValue22:
		li $s0, 22
		jr $ra
	setPlacementValue23:
		li $s0, 23
		jr $ra
	setPlacementValue24:
		li $s0, 24
		jr $ra
	setPlacementValue25:
		li $s0, 25
		jr $ra
	setPlacementValue26:
		li $s0, 26
		jr $ra
	setPlacementValue27:
		li $s0, 27
		jr $ra
	setPlacementValue28:
		li $s0, 28
		jr $ra
	setPlacementValue29:
		li $s0, 29
		jr $ra
	setPlacementValue30:
		li $s0, 30
		jr $ra
	setPlacementValue31:
		li $s0, 31
		jr $ra
	setPlacementValue32:
		li $s0, 32
		jr $ra
	setPlacementValue33:
		li $s0, 33
		jr $ra
	setPlacementValue34:
		li $s0, 34
		jr $ra
	setPlacementValue35:	
		li $s0, 35
		jr $ra
			
			
			
			
			
		
			


