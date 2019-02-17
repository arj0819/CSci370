.data
	newline:   .asciiz  "\n"
	msgGreet:  .asciiz  "\nStart playing a Snakes Game."
	
	board:  .ascii   "\n\n    . . . . . .      0 1 2 3 4 5"
            .ascii     "\n    . . . . . .      6 7 8 9 a b"
            .ascii     "\n    . . . . . .      c d e f g h"
            .ascii     "\n    . . . . . .      i j k l m n"
            .ascii     "\n    . . . . . .      o p q r s t"
            .asciiz    "\n    . . . . . .      u v w x y z\n"
              
    msgSystemIsFirst:     .asciiz "I (the System) am first and I pick @." # offset to @ is 35
    msgHitSpacebar:    	  .asciiz "Hit the spacebar to start the System's next move."
    msgYouAreFirst:       .asciiz "You are first. "
    msgPickPiece:    	  .asciiz "Pick a piece: (X|O) "
    msgEnterYourMove:  	  .asciiz "Enter your move: (0..z) "
    msgContinue:    	  .asciiz "\nContinue? (y/n) "
    msgSystemWins:  	  .asciiz "\n******* The System (@) wins! *******" # offset to @ is 21
    msgUserWins:	 	  .asciiz "\n******* The User (@) wins! *******" # offset to @ is 19
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
             
    indices:  .byte    0,   1,   2,   3,   4,   5
              .byte    6,   7,   8,   9,  10,  11
              .byte   12,  13,  14,  15,  16,  17
              .byte   18,  19,  20,  21,  22,  23
              .byte   24,  25,  26,  27,  28,  29
              .byte   30,  31,  32,  33,  34,  35
              
    systemHeadNeighbors: .ascii  "@@@@"  # Used to hold neighbors of System's head when it's determining where to place its next move.
    
    sysFirstNbrRowNum:   .word   -1
    sysFirstNbrColNum:   .word   -1
    sysSecondNbrRowNum:  .word   -1
    sysSecondNbrColNum:  .word   -1
    sysThirdNbrRowNum:   .word   -1
    sysThirdNbrColNum:   .word   -1
    sysLastNbrRowNum:    .word   -1
    sysLastNbrColNum:    .word   -1
    
    userHeadRowNum:      .word   -1
    userHeadColNum:      .word   -1
    
    #sysFirstNbrCoord:    .ascii  "@@"    # Used to hold the first neighbor's of System's head coordinates 
    #sysSecondNbrCoord:   .ascii  "@@"    # Used to hold the second neighbor's of System's head coordinates 
    #sysThirdNbrCoord:    .ascii  "@@"    # Used to hold the third neighbor's of System's head coordinates 
    #sysLastNbrCoord:     .ascii  "@@"    # Used to hold the last neighbor's of System's head coordinates 
    #userHeadCoord:       .ascii  "@@"    # Used to hold the User's head coordinates.
              
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
           	    
	#coordinates:  .ascii   "05"  # 0
    #       	      .ascii   "15"  # 1
    #       	      .ascii   "25"  # 2
    #       	      .ascii   "35"  # 3
    #       	      .ascii   "45"  # 4
    #       	      .ascii   "55"  # 5
    #       	      .ascii   "04"  # 6
    #       	      .ascii   "14"  # 7
    #       	      .ascii   "24"  # 8
    #       	      .ascii   "34"  # 9
    #       	      .ascii   "44"  # a (10)
    #       	      .ascii   "54"  # b (11)
    #       	      .ascii   "03"  # c (12)
    #       	      .ascii   "13"  # d (13)
    #       	      .ascii   "23"  # e (14)
    #       	      .ascii   "33"  # f (15)
    #       	      .ascii   "43"  # g (16)
    #       	      .ascii   "53"  # h (17)
    #       	      .ascii   "02"  # i (18)
    #       	      .ascii   "12"  # j (19)
    #       	      .ascii   "22"  # k (20)
    #       	      .ascii   "32"  # l (21)
    #       	      .ascii   "42"  # m (22)
    #       	      .ascii   "52"  # n (23)
    #       	      .ascii   "01"  # o (24)
    #       	      .ascii   "11"  # p (25)
    #       	      .ascii   "21"  # q (26)
    #       	      .ascii   "31"  # r (27)
    #       	      .ascii   "41"  # s (28)
    #       	      .ascii   "51"  # t (29)
    #       	      .ascii   "00"  # u (30)
    #       	      .ascii   "10"  # v (31)
    #       	      .ascii   "20"  # w (32)
    #       	      .ascii   "30"  # x (33)
    #       	      .ascii   "40"  # y (34)
    #       	      .ascii   "50"  # z (35)

.text
	greet:
		la $a0, msgGreet      # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # Print the greeting message.
		jal printBoard        # Jump and link to printBoard.
		la $a0, newline       # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # Print the newline.
		
		jal determineWhoStarts
		
	printBoard:
		la $a0, board  # Load the message address into $a0.
		li $v0, 4      # Load $v0 with code to pring a string.
		syscall        # Print the game board.
		jr $ra         # Return to the caller (greet, placeX, or placeO depending on 
					   # program's state of execution).
		
	determineWhoStarts:
		li $s7, '.'           # Load the empty spot char into $s7 to indicate that this is the first play of the game.
		xor $a0, $a0, $a0
		li $a1, 2
		li $v0, 42
		syscall
		beqz $a0, systemGoesFirst
		j userGoesFirst
	
	systemGoesFirst:
		jal systemRandomFirstMove
		xor $a0, $a0, $a0
		li $a1, 2
		li $v0, 42
		syscall
		beqz $a0, systemPicksX
		j systemPicksO
		
	systemPicksX:
		li $t0, 'O'
		sb $t0, msgUserWins + 19
		li $t0, 'X'
		sb $t0, msgSystemIsFirst + 35
		sb $t0, msgSystemWins + 21
		la $a0, msgSystemIsFirst
		li $v0, 4
		syscall
		j systemPlacesX
		
	systemPicksO:
		li $t0, 'X'
		sb $t0, msgUserWins + 19
		li $t0, 'O'
		sb $t0, msgSystemIsFirst + 35
		sb $t0, msgSystemWins + 21
		la $a0, msgSystemIsFirst
		li $v0, 4
		syscall
		j systemPlacesO
		
	userGoesFirst:
		la $a0, msgYouAreFirst  # Load the message address into $a0
		li $v0, 4               # Load $v0 with the code to print a string.
		syscall                 # Let the User know he/she is going first.
		la $a0, msgPickPiece    # Load the message address into $a0.
		li $v0, 4               # Load $v0 with code to print a string.
		syscall                 # Print the pick piece message.
		li $v0, 12              # Load $v0 with code to read a char.
		syscall                 # Read the char.
		
		beq $v0, 'X', userPicksX  # Branch to PlaceX if the user selects to be X.
		beq $v0, 'O', userPicksO  # Branch to PlaceO if the user selects to be O.
		
	userPicksX:
		li $t0, 'O'
		sb $t0, msgSystemIsFirst + 35
		sb $t0, msgSystemWins + 21
		li $t0, 'X'
		sb $t0, msgUserWins + 19
		j placeX
	
	userPicksO:
		li $t0, 'X'
		sb $t0, msgSystemIsFirst + 35
		sb $t0, msgSystemWins + 21
		li $t0, 'O'
		sb $t0, msgUserWins + 19
		j placeO
			
	placeX:
		lb $t0, msgSystemIsFirst + 35  # Load in whatever piece the System is playing as.
		beq $t0, 'X', systemPlacesX    # If the System is X, go to systemPlacesX.
		
		la $a0, newline              # Load message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the newline.
		la $a0, msgEnterYourMove     # Load the message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the message telling user it's X's turn.
		li $v0, 12                   # Load $v0 with code to read a char.
		syscall                      # Read the char.
		move $s0, $v0                # Store the user's piece placement choice as a char in $s0.
		jal determinePieceIndexNum   # Jump and link to determinePieceIndexNum so we can return here after determinePieceIndexNum is done.
        li $s3, 'P'                  # Store an 'P' in $s3 to flag validatePiecePlacement that we're validating a piece placement.
		jal validatePiecePlacement   # Jump and link to validatePiecePlacement so we can return here after validatePiecePlacement is done.
			
		move $t0, $s0          # Move the determined offset value stored in $s0 by determinePieceIndexNum into $t0 to place X in correct spot.
		mul  $t0, $t0, 2       # Multiply the current offset value by 2 to reach next board location because each spot on board is 2 bytes long.
   		lh   $t1, offset($t0)  # Load $t1 with the offset of the index $t0.
   		li   $t2, 'X'          # Load the piece 'X' in $t2.
   		sb   $t2, board($t1)   # Put the piece at the location, board+offset.
		jal printBoard         # Print the board before writing O's snake over O's head location.

   		lh   $s5, offset($t0)      # Load $s5 with X's current head location, used in PlaceO to overwrite X's head location with X's snake char.
		beq  $s7, '.', skipSnakeO  # Skip writing O's snake if this is the first play of the game (as $s7 was set by greet).
		
   		sb   $s7, board($s6)  # Put O's snake char over O's head location after board has been printed.
   		
   		jal checkWinCondition  # Check if either player has won after at least the second play of the game (Begins checking win condition after skipSnakeO because it's impossible to win on the first play).
  
        #(Implicit continuation to code in skipSnakeO, although we didn't actually skip
        # placing snake if we got here).
     		
		skipSnakeO:
		    li $s7, '$' # Load X's snake char to $s7, to be written to the board in PlaceO.
		    li $s1, 'O' # Load 'O' to $s1 (to determine who's turn is next if game is continued from continue).	    
		    j continue  # Jump to continue.
		    
	systemPlacesX:
		la $a0, newline              # Load message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the newline.
		la $a0, msgHitSpacebar       # Load the message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the message telling user to hit spacebar to allow System to place its piece.
		li $v0, 12                   # Load $v0 with code to read a char.
		syscall                      # Read the char.
		bne $v0, ' ', systemPlacesX     # Keep repeating above until a ' ' is received from user input.
		beq $s7, '.', systemFirstTurnX  # If the System has first turn, directly place the piece using index num from systemRandomFirstMove.
		
		# BEGIN SHORTEST PATH CALCULATION FOR SYSTEM PIECE PLACEMENT
		# It should place it's piece as close as possible to the User
		checkSystemNeighborsX:
			add $a1, $s5, 17     # Add 17 to the X's head offset value to retrieve it's associated index char (0-9,a-z).
			lb  $s0, board($a1)  # Load the index char into $s0 so determinePieceIndexNum can get its index number.
			jal determinePieceIndexNum  # Use determinePieceIndexNum to retrieve the index char's index number so we can find its neighbors.
			li  $a2, 4       # Store the iterator in $a2.
        	mul $a1, $s0, 4  # Multiply the index value in $s0 by 4 (to retrieve the correct neighbors) and store in $a1.
        	
            lb   $s0, neighbors($a1)     # Load the first neighbor of Sys head into $s0 so we can determine its index number.
            sb   $s0, systemHeadNeighbors+0  # Store the first neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the first neighbor of Sys head, returned into $s0.
            move $t0, $s0                # Store the first neighbor's index num in $t0.
            add  $a1, $a1, 1             # Increment $a1 so we can retrieve the second neighbor of Sys head.
            lb   $s0, neighbors($a1)     # Load the second neighbor of Sys head into $s0 so we can determine its index number.
            sb   $s0, systemHeadNeighbors+1  # Store the second neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the second neighbor of Sys head, returned into $s0.
            move $t2, $s0                # Store the second neighbor's index num in $t2.
            add  $a1, $a1, 1             # Increment $a1 so we can retrieve the third nieghbor of Sys head.
            lb   $s0, neighbors($a1)     # Load the third neighbor of Sys head into $s0 so we can determine its index number.
            li   $t4, -1                 # Load a -1 into $t4 in case we branch away to calculations, indicating no neighbor was found.
            beq  $s0, ' ', calcColPositionsForSysNbrsX  # If the third neighbor of Sys head is a ' ', branch to calc column positions for Sys X neighbors.
            sb   $s0, systemHeadNeighbors+2  # Store the third neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the third neighbor of Sys head, returned into $s0.
            move $t4, $s0                # Store the third neighbor's index num in $t4.
            add  $a1, $a1, 1             # Increment $a1 so we can retrieve the last neighbor of Sys head.
            lb   $s0, neighbors($a1)     # Load the last neighbor of Sys head into $s0 so we can determine its index number.
            li   $t6, -1                 # Load a -1 into $t4 in case we branch away to calculations, indicating no neighbor was found.
            beq  $s0, ' ', calcColPositionsForSysNbrsX  # If the third neighbor of Sys head is a ' ', branch to calc column positions for Sys X neighbors.
            sb   $s0, systemHeadNeighbors+3  # Store the last neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the last neighbor of Sys head, returned into $s0.
            move $t6, $s0                # Store the last neighbor's index num in $t6.

		calcColPositionsForSysNbrsX:
		    li   $a3, 6    # Load the value 6 into $a3 to perform modulus and find each System neighbor's lateral position.
		    div  $t0, $a3  # Divide index number of first neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t1       # Move the modulus of previous instruction into $t1 so we can calculate the row position of this neighbor later.
		    div  $t2, $a3  # Divide index number of second neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t3       # Move the modulus of previous instruction into $t3 so we can calculate the row position of this neighbor later.
		    beq  $t4, -1, calcRowPositionsForSysNbrsX  # If no neighbor was found in $t4, branch to calc the row positions of the neighbors of head of System's snake.
		    div  $t4, $a3  # Divide index number of third neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t5       # Move the modulus of previous instruction into $t5 so we can calculate the row position of this neighbor later.
		    beq  $t6, -1, calcRowPositionsForSysNbrsX  # If no neighbor was found in $t4, branch to calc the row positions of the nieghbors of head of System's snake.
		    div  $t6, $a3  # Divide index number of last neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t7       # Move the modulus of previous instruction into $t7 so we can calculate the row position of this neighbor later.
		    
		calcRowPositionsForSysNbrsX:
			sw   $t1, sysFirstNbrColNum  # Store the col number of first neighbor so we can make room to calculate the User's head coordinates
			sub  $t1, $t0, $t1  # Subtract the remainder from the index number of first neighbor to retrieve the row position as a multiple of 6.
			div  $t1, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t0            # Move the division of previous instruction into $t0 so we can calculate distance the first neighbor of Sys's head is from User's head.
			sw   $t0, sysFirstNbrRowNum  # Store the row number of first neighbor so we can make room to calculate the User's head coordinates
			sw   $t3, sysSecondNbrColNum  # Store the col number of second neighbor so we can make room to calculate the User's head coordinates
			sub  $t3, $t2, $t3  # Subtract the remainder from the index number of second neighbor to retrieve the row position as a multiple of 6.
			div  $t3, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t2            # Move the division of previous instruction into $t2 so we can calculate distance the second neighbor of Sys's head is from User's head.
			sw   $t2, sysSecondNbrRowNum  # Store the row number of second neighbor so we can make room to calculate the User's head coordinates
			beq  $t4, -1, findSysClosestNbrToUserX  # If no neighbor was found in $t4, branch to find the Sys's closest neighbor to User's head
			sw   $t5, sysThirdNbrColNum  # Store the col number of third neighbor so we can make room to calculate the User's head coordinates
			sub  $t5, $t4, $t5  # Subtract the remainder from the index number of first neighbor to retrieve the row position as a multiple of 6.
			div  $t5, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t4            # Move the division of previous instruction into $t4 so we can calculate distance the third neighbor of Sys's head is from User's head.
			sw   $t4, sysThirdNbrRowNum  # Store the row number of third neighbor so we can make room to calculate the User's head coordinates
			beq  $t6, -1, findSysClosestNbrToUserX  # If no neighbor was found in $t6, branch to find the Sys's closest neighbor to User's head
			sw   $t7, sysLastNbrColNum  # Storethe col number of last neighbor so we can make room to calculate the User's head coordinates
			sub  $t7, $t6, $t7  # Subtract the remainder from the index number of first neighbor to retrieve the row position as a multiple of 6.
			div  $t7, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t6            # Move the division of previous instruction into $t6 so we can calculate distance the last neighbor of Sys's head is from User's head.
			sw   $t6, sysLastNbrRowNum  # Store the row number of last neighbor so we can make room to calculate the User's head coordinates
		
		findSysClosestNbrToUserX:       # System is X, so User must be O.
			add $a1, $s6, 17            # Add 17 to the O's head offset value to retrieve it's associated index char (0-9,a-z).
			lb  $s0, board($a1)         # Load the index char into $s0 so determinePieceIndexNum can get its index number.
			jal determinePieceIndexNum  # Use determinePieceIndexNum to retrieve the index char's index number so we can find its neighbors.
        	move $t6, $s0               # Move the User's head index number into $t6 so we can calculate it's column number.
			
		calcColPositionsForUserHeadX:  # System is X, so User must be O.
			div  $t6, $a3              # Divide index number of User's head by 6 to retrieve the column number from hi.
		    mfhi $t7                   # Move the modulus of previous instruction into $t7 so we can calculate the row position of the User's head later.
		    
		calcRowPositionsForUserHeadX:  # System is X, so User must be O.
			sw   $t7, userHeadColNum   # Store the col number of User's head so we can make room to calculate the shortest distance
			sub  $t7, $t6, $t7         # Subtract the remainder from the index number of User's head to retrieve the row position as a multiple of 6.
			div  $t7, $a3              # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t6                   # Move the division of previous instruction into $t6 so we can calculate the distance from User's head to Sys's closest neighbor
			sw   $t6, userHeadRowNum   # Store the row number of User's head so we can make room to calculate the shortest distance
			
			#lb $a0, systemHeadNeighbors+0  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print first neighbor.
        	#lb $a0, systemHeadNeighbors+1  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print second neighbor.
        	#lb $a0, systemHeadNeighbors+2  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print third neighbor.
        	#lb $a0, systemHeadNeighbors+3  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print last neighbor.
        	
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysFirstNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysFirstNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysSecondNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysSecondNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysThirdNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysThirdNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysLastNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysLastNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, userHeadRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, userHeadColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	
        	
        	
		
		#move $s0, $v0               # Store the user's piece placement choice as a char in $s0.
		jal determinePieceIndexNum   # Jump and link to determinePieceIndexNum so we can return here after determinePieceIndexNum is done.
        li $s3, 'P'                  # Store an 'P' in $s3 to flag validatePiecePlacement that we're validating a piece placement.
		jal validatePiecePlacement   # Jump and link to validatePiecePlacement so we can return here after validatePiecePlacement is done.
		
		systemFirstTurnX:
		move $t0, $s0          # Move the determined offset value stored in $s0 by determinePieceIndexNum into $t0 to place X in correct spot.
		mul  $t0, $t0, 2       # Multiply the current offset value by 2 to reach next board location because each spot on board is  2 bytes long.
   		lh   $t1, offset($t0)  # Load $t1 with the offset of the index $t0.
   		li   $t2, 'X'          # Load the piece 'X' in $t2.
   		sb   $t2, board($t1)   # Put the piece at the location, board+offset.
		jal printBoard         # Print the board before writing O's snake over O's head location.

   		lh   $s5, offset($t0)      # Load $s5 with X's current head location, used in PlaceO to overwrite X's head location with X's snake char.
		beq  $s7, '.', skipSnakeO  # Skip writing O's snake if this is the first play of the game (as $s7 was set by greet).
		
   		sb   $s7, board($s6)  # Put O's snake char over O's head location after board has been printed.
   		
   		jal checkWinCondition  # Check if either player has won after at least the second play of the game (Begins checking win condition after skipSnakeO because it's impossible to win on the first play).
  
        #(Implicit continuation to code in skipSnakeO, although we didn't actually skip
        # placing snake if we got here).
		j skipSnakeO
		
	placeO:
		lb $t0, msgSystemIsFirst + 35  # Load in whatever piece the System is playing as.
		beq $t0, 'O', systemPlacesO    # If the System is O, go to systemPlacesO.
		
		la $a0, newline              # Load message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the newline.
		la $a0, msgEnterYourMove     # Load the message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the message telling user it's O's turn.
		li $v0, 12                   # Load $v0 with code to read a char.
		syscall                      # Read the char.
		move $s0, $v0                # Store the user's piece placement choice as a char in $s0.
		jal determinePieceIndexNum      # Jump and link to determinePieceIndexNum so we can return here after determinePieceIndexNum is done.
        li $s3, 'P'                  # Store an 'P' in $s3 to flag validatePiecePlacement that we're validating a piece placement.
		jal validatePiecePlacement   # Jump and link to validatePiecePlacement so we can return here after validatePiecePlacement is done.
			
		move $t0, $s0         # Move the determined offset value stored in $s0 by determinePieceIndexNum into $t0 to place O in correct spot.
		mul  $t0, $t0, 2      # Multiply the current offset value by 2 to reach next board location because each spot on board is 2 bytes long.
   		lh   $t1, offset($t0) # Load $t1 with the offset of the index $t0.
   		li   $t2, 'O'         # Load the piece 'O' in $t2.
   		sb   $t2, board($t1)  # Put the piece at the location, board+offset.
		jal printBoard        # Print the board before writing X's snake over X's head location.

   		lh   $s6, offset($t0)      # Load $s6 with O's current head location, used in PlaceX to overwrite O's head location with O's snake char.
		beq  $s7, '.', skipSnakeX  # Skip writing X's snake if this is the first play of the game (as $s7 was set by greet).

   		sb   $s7, board($s5)  # Put X's snake char over X's head location after board has been printed.
   		
   		jal checkWinCondition  # Check if either player has won after at least the second play of the game (Begins checking win condition after skipSnakeX because it's impossible to win on the first play).
			
	    #(Implicit continuation to code in skipSnakeX, although we didn't actually
	    # skip placing snake if we got here).
			
		skipSnakeX:
		    li $s7, '+'  # Load O's snake char to $s7, to be written to the board in PlaceX.
		    li $s1, 'X'  # Load 'X' to $s1 (to determine who's turn is next if game is continued from continue).
		    j continue   # Jump to continue.
			    
	systemPlacesO:
		la $a0, newline              # Load message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the newline.
		la $a0, msgHitSpacebar       # Load the message address into $a0.
		li $v0, 4                    # Load $v0 with code to print a string.
		syscall                      # Print the message telling user to hit spacebar to allow System to place its piece.
		li $v0, 12                   # Load $v0 with code to read a char.
		syscall                      # Read the char.
		bne $v0, ' ', systemPlacesO     # Keep repeating above until a ' ' is received from user input.
		beq $s7, '.', systemFirstTurnO  # If the System has first turn, directly place the piece using index num from systemRandomFirstMove.
		
		# BEGIN SHORTEST PATH CALCULATION FOR SYSTEM PIECE PLACEMENT
		# It should place it's piece as close as possible to the User
		checkSystemNeighborsO:
			add $a1, $s6, 17     # Add 17 to the O's head offset value to retrieve it's associated index char (0-9,a-z).
			lb  $s0, board($a1)  # Load the index char into $s0 so determinePieceIndexNum can get its index number.
			jal determinePieceIndexNum  # Use determinePieceIndexNum to retrieve the index char's index number so we can find its neighbors.
        	mul $a1, $s0, 4  # Multiply the index value in $s0 by 4 (to retrieve the correct neighbors) and store in $a1.
        	
            lb   $s0, neighbors($a1)     # Load the first neighbor of Sys head into $s0 so we can determine its index number.
            sb   $s0, systemHeadNeighbors+0  # Store the first neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the first neighbor of Sys head, returned into $s0.
            move $t0, $s0                # Store the first neighbor's index num in $t0.
            add  $a1, $a1, 1             # Increment $a1 so we can retrieve the second neighbor of Sys head.
            lb   $s0, neighbors($a1)     # Load the second neighbor of Sys head into $s0 so we can determine its index number.
            sb   $s0, systemHeadNeighbors+1  # Store the second neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the second neighbor of Sys head, returned into $s0.
            move $t2, $s0                # Store the second neighbor's index num in $t2.
            add  $a1, $a1, 1             # Increment $a1 so we can retrieve the third nieghbor of Sys head.
            lb   $s0, neighbors($a1)     # Load the third neighbor of Sys head into $s0 so we can determine its index number.
            li   $t4, -1                 # Load a -1 into $t4 in case we branch away to calculations, indicating no neighbor was found.
            beq  $s0, ' ', calcColPositionsForSysNbrsO  # If the third neighbor of Sys head is a ' ', branch to calc column positions for Sys O neighbors.
            sb   $s0, systemHeadNeighbors+2  # Store the third neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the third neighbor of Sys head, returned into $s0.
            move $t4, $s0                # Store the third neighbor's index num in $t4.
            add  $a1, $a1, 1             # Increment $a1 so we can retrieve the last neighbor of Sys head.
            lb   $s0, neighbors($a1)     # Load the last neighbor of Sys head into $s0 so we can determine its index number.
            li   $t6, -1                 # Load a -1 into $t4 in case we branch away to calculations, indicating no neighbor was found.
            beq  $s0, ' ', calcColPositionsForSysNbrsO  # If the third neighbor of Sys head is a ' ', branch to calc column positions for Sys O neighbors.
            sb   $s0, systemHeadNeighbors+3  # Store the last neighbor of Sys head in memory so we can pick the correct next move later.
            jal  determinePieceIndexNum  # Get the index num of the last neighbor of Sys head, returned into $s0.
            move $t6, $s0                # Store the last neighbor's index num in $t6.
		    
		calcColPositionsForSysNbrsO:
		    li   $a3, 6    # Load the value 6 into $a3 to perform modulus and find each System neighbor's lateral position.
		    div  $t0, $a3  # Divide index number of first neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t1       # Move the modulus of previous instruction into $t1 so we can calculate the row position of this neighbor later.
		    div  $t2, $a3  # Divide index number of second neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t3       # Move the modulus of previous instruction into $t3 so we can calculate the row position of this neighbor later.
		    beq  $t4, -1, calcRowPositionsForSysNbrsO  # If no neighbor was found in $t4, branch to calc the row positions of the neighbors of head of System's snake.
		    div  $t4, $a3  # Divide index number of third neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t5       # Move the modulus of previous instruction into $t5 so we can calculate the row position of this neighbor later.
		    beq  $t6, -1, calcRowPositionsForSysNbrsO  # If no neighbor was found in $t4, branch to calc the row positions of the nieghbors of head of System's snake.
		    div  $t6, $a3  # Divide index number of last neighbor of Sys head by 6 to retrieve the column number from hi.
		    mfhi $t7       # Move the modulus of previous instruction into $t7 so we can calculate the row position of this neighbor later.
		    
		calcRowPositionsForSysNbrsO:
			sw   $t1, sysFirstNbrColNum  # Store the col number of first neighbor so we can make room to calculate the User's head coordinates
			sub  $t1, $t0, $t1  # Subtract the remainder from the index number of first neighbor to retrieve the row position as a multiple of 6.
			div  $t1, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t0            # Move the division of previous instruction into $t0 so we can calculate distance the first neighbor of Sys's head is from User's head.
			sw   $t0, sysFirstNbrRowNum  # Store the row number of first neighbor so we can make room to calculate the User's head coordinates
			sw   $t3, sysSecondNbrColNum  # Store the col number of second neighbor so we can make room to calculate the User's head coordinates
			sub  $t3, $t2, $t3  # Subtract the remainder from the index number of second neighbor to retrieve the row position as a multiple of 6.
			div  $t3, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t2            # Move the division of previous instruction into $t2 so we can calculate distance the second neighbor of Sys's head is from User's head.
			sw   $t2, sysSecondNbrRowNum  # Store the row number of second neighbor so we can make room to calculate the User's head coordinates
			beq  $t4, -1, findSysClosestNbrToUserO  # If no neighbor was found in $t4, branch to find the Sys's closest neighbor to User's head
			sw   $t5, sysThirdNbrColNum  # Store the col number of third neighbor so we can make room to calculate the User's head coordinates
			sub  $t5, $t4, $t5  # Subtract the remainder from the index number of first neighbor to retrieve the row position as a multiple of 6.
			div  $t5, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t4            # Move the division of previous instruction into $t4 so we can calculate distance the third neighbor of Sys's head is from User's head.
			sw   $t4, sysThirdNbrRowNum  # Store the row number of third neighbor so we can make room to calculate the User's head coordinates
			beq  $t6, -1, findSysClosestNbrToUserO  # If no neighbor was found in $t6, branch to find the Sys's closest neighbor to User's head
			sw   $t7, sysLastNbrColNum  # Store the col number of last neighbor so we can make room to calculate the User's head coordinates
			sub  $t7, $t6, $t7  # Subtract the remainder from the index number of first neighbor to retrieve the row position as a multiple of 6.
			div  $t7, $a3       # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t6            # Move the division of previous instruction into $t6 so we can calculate distance the last neighbor of Sys's head is from User's head.
			sw   $t6, sysLastNbrRowNum  # Store the row number of last neighbor so we can make room to calculate the User's head coordinates
		    
		findSysClosestNbrToUserO:        # System is O, so User must be X.
			add  $a1, $s5, 17            # Add 17 to the X's head offset value to retrieve it's associated index char (0-9,a-z).
			lb   $s0, board($a1)         # Load the index char into $s0 so determinePieceIndexNum can get its index number.
			jal  determinePieceIndexNum  # Use determinePieceIndexNum to retrieve the index char's index number so we can find its neighbors.
			move $t6, $s0                # Move the User's head index number into $t6 so we can calculate it's column number.
			
		calcColPositionsForUserHeadO:  # System is O, so User must be X.
			div  $t6, $a3              # Divide index number of User's head by 6 to retrieve the column number from hi.
		    mfhi $t7                   # Move the modulus of previous instruction into $t7 so we can calculate the row position of the User's head later.
		    
		calcRowPositionsForUserHeadO:  # System is O, so User must be X.
			sw   $t7, userHeadColNum  # Store the col number of User's head so we can make room to calculate the shortest distance
			sub  $t7, $t6, $t7         # Subtract the remainder from the index number of User's head to retrieve the row position as a multiple of 6.
			div  $t7, $a3              # Divide the row position by 6 to retrieve the row number from lo.
			mflo $t6                   # Move the division of previous instruction into $t6 so we can calculate the distance from User's head to Sys's closest neighbor
			sw   $t6, userHeadRowNum   # Store the row number of User's head so we can make room to calculate the shortest distance
			
			#lb $a0, systemHeadNeighbors+0  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print first neighbor.
        	#lb $a0, systemHeadNeighbors+1  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print second neighbor.
        	#lb $a0, systemHeadNeighbors+2  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print third neighbor.
        	#lb $a0, systemHeadNeighbors+3  # Load the char into $a0.
        	#li $v0, 11                     # Load the char code into $v0.
        	#syscall                        # Print last neighbor.
        	
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysFirstNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysFirstNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysSecondNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysSecondNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysThirdNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysThirdNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, sysLastNbrRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, sysLastNbrColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	#lw $a0, userHeadRowNum
        	#li $v0, 1
        	#syscall
        	#lw $a0, userHeadColNum
        	#li $v0, 1
        	#syscall
        	#la $a0, newline               # Load the message into $a0.
        	#li $v0, 4                     # Load the string code into $v0.
        	#syscall                       # Print a newline.
        	
        	

		    
		
		#move $s0, $v0               # Store the user's piece placement choice as a char in $s0.
		jal determinePieceIndexNum   # Jump and link to determinePieceIndexNum so we can return here after determinePieceIndexNum is done.
        li $s3, 'P'                  # Store an 'P' in $s3 to flag validatePiecePlacement that we're validating a piece placement.
		jal validatePiecePlacement   # Jump and link to validatePiecePlacement so we can return here after validatePiecePlacement is done.
		                             
		systemFirstTurnO:
		move $t0, $s0         # Move the determined offset value stored in $s0 by determinePieceIndexNum into $t0 to place O in correct spot.
		mul  $t0, $t0, 2      # Multiply the current offset value by 2 to reach next board location because each spot on board is 2 bytes long.
   		lh   $t1, offset($t0) # Load $t1 with the offset of the index $t0.
   		li   $t2, 'O'         # Load the piece 'O' in $t2.
   		sb   $t2, board($t1)  # Put the piece at the location, board+offset.
		jal printBoard        # Print the board before writing X's snake over X's head location.

   		lh   $s6, offset($t0)      # Load $s6 with O's current head location, used in PlaceX to overwrite O's head location with O's snake char.
		beq  $s7, '.', skipSnakeX  # Skip writing X's snake if this is the first play of the game (as $s7 was set by greet).

   		sb   $s7, board($s5)  # Put X's snake char over X's head location after board has been printed.
   		
   		jal checkWinCondition  # Check if either player has won after at least the second play of the game (Begins checking win condition after skipSnakeX because it's impossible to win on the first play).
			
	    #(Implicit continuation to code in skipSnakeX, although we didn't actually
	    # skip placing snake if we got here).
		j skipSnakeX
		
	systemRandomFirstMove:
		xor $a0, $a0, $a0
		li $a1, 36
		li $v0 42
		syscall
		move $s0, $a0
		jr $ra
	
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
		la $a0, newline         # If user doesn't type 'n', load $a0 with newline address.
		li $v0, 4               # Load $v0 with code to print a string
		syscall                 # Print the newline.
		li $s4, 0               # Load the value 0 into $s4 (this will be starting offset value to reset the board).
		                        
		li $t0, '@'                    # Load the '@' char into $t0
		sb $t0, msgSystemIsFirst + 35  # Replace the System's piece type with @
		sb $t0, msgSystemWins + 21     # Replace the System's piece type with @
		sb $t0, msgUserWins + 19       # Replace the User's piece type with @
		
		j resetBoardForNewGame  # Jump to resetBoardForNewGame.
			
	continue:
		la $a0, msgContinue  # Load message address into $a0.
		li $v0, 4            # Load $v0 with code to print a string.
		syscall              # Print the continue message.
		li $v0, 12           # Load $v0 with code to read a char.
		syscall              # Read the char.
			
		beq $v0, 'n', newGame  # If user entered 'n', call newGame.
		beq $s1, 'X', placeX   # If user entered anything but 'n' and $s1 contains 'X' (as set by PlaceO), it's X's turn, so branch to PlaceX.
		beq $s1, 'O', placeO   # If user entered anything but 'n' and $s1 contains 'O' (as set by PlaceX), it's O's turn, so branch to PlaceO.
			
	resetBoardForNewGame:
		move $t0, $s4           # Load the index (set to 0 from newGame) at $s4 into $t0.
		mul  $t0, $t0, 2        # Multiply the current offset value by 2 to reach next board location because each spot on board is 2 bytes long.
   		lh   $t1, offset($t0)   # Load $t1 with the offset of the index $t0.
   		li   $t2, '.'           # Put the piece '.' in $t2.
   		sb   $t2, board($t1)    # Put the piece at the location, board+offset.
		addi $s4, $s4, 1        # Increment the index by 1 and store it in $s4
		beq  $s4, 36, greet     # Branch to greet only when we've reset the entire board.
		j resetBoardForNewGame  # Keep resetting the board until we've reset the whole board.

	validatePiecePlacement:
            move $t0, $s0
			mul  $t0, $t0, 2      # Multiply the current offset value by 2 to reach next board location because each spot on board is 2 bytes long.
   			lh   $t1, offset($t0) # Load $t1 with the offset of the index $t0.
			lb   $t2, board($t1)  # Load the current marker at $t1 (whatever marker is on the board at that location).
   			
            #li $v0, 11          # Load $v0 with the code to print a char.
            #lb $a0, board($t1)  # Load $a0 with the char at the location $t1 on the board.
            #syscall             # Print whatever marker is on the board at location $t1.
            
            beq $t2, '.', validationSuccess          # Branch to validationSuccess if the marker is a '.' (indicating an open spot).
            beq $s3, 'W', returnToCheckWinCondition  # If there's a W in $s3 (as set by checkWinCondition), we're using validatePiecePlacement to check valid neighbors.
            
        #(Implicit continuation to validationFailure. We arrive here if we didn't 
        # branch to validationSuccess.)
            
        validationFailure:
            li $v0, 4               # Load message address into $a0.
            la $a0, msgInvalidMove  # Load message address into $a0.
            syscall                 # Print the message saying the user made an invalid move.
            j continue              # Jump to continue.
            
        validationSuccess:
            li $s2, 'S'  # Store an 'S' in $s2 for successful checkWinCondition (meaning the game should continue).
            jr $ra       # Jump back to the caller (could be placeO, placeX, nextNeighborO, or nextNeighborX).
            
        returnToCheckWinCondition:
        	jr $ra  # Jump back to $ra (which will always be in either nextNeighborO or nextNeighborX).

    checkWinCondition:
    	# If the current player's (X or O) new head location has no open neighbors, 
    	# then the other player has won the game.
        li $s3, 'W'          # Store an 'W' in $s3 to flag validatePiecePlacement that we're checking win condition.
		jal checkNeighborsO  # Once checkNeighborsO confirms O did not lose, it will branch to checkNeighborsX automatically.        
		
	checkNeighborsO:
		li $s2, 'F'          # Store an 'F' in $s2 for failed checkWinCondition (used here as a flag. If it remains unchanged, the game is over)
		add $a1, $s6, 17     # Add 17 to the O's head offset value to retrieve it's associated placement marker (0-9,a-z).
		lb  $s0, board($a1)  # Load the placement marker into $s0 so determinePieceIndexNum can get its index value.
		
		jal determinePieceIndexNum  # Use determinePieceIndexNum to retrieve the placement marker's index value so we can find its neighbors.
		
		li  $t4, 4        # Store the iterator in $t4.
        mul  $a1, $s0, 4  # Multiply the index value in $s0 by 4 (to retrieve the correct neighbors) and store in $a1.
        
        #la $a0, msgCheckedNeighborsO  # Load the message into $a0.
        #li $v0, 4                     # Load the string code into $v0.
        #syscall                       # Print a message saying that the following neighbors of O have been checked.

        nextNeighborO:
            lb   $s0, neighbors($a1)  # Load the first neighbor into $s0 so we can determine if its place is taken on the board.
            
            #lb  $a0, neighbors($a1)  # Load the current neighbor in $a0.
            #li  $v0, 11              # Load code to print a char in $v0.
            #syscall                  # Print the current neighbor.
            
            beq  $s0, ' ', winnerX        # We didn't find an 'S' in $s2, meaning we found no valid neighbors around O's current head, so X wins!
            jal  determinePieceIndexNum   # Find the index of this neighbor.
            jal  validatePiecePlacement   # Validate that this neighbor's spot isn't already occupied on the board.

            beq $s2, 'S', checkNeighborsX   # If we find an 'S' in $s2, checkWinCondition succeeded, meaning we now have to check X's neighbors.
            beqz $t4, winnerX               # If the iterator is 0 and we didn't have successful checkWinCondition, O has no valid neighbors, X has won the game!
            
            add $a1, $a1, 1  # Increment the $a1 to check the next neighbor.
            sub $t4, $t4, 1  # Decrement the counter to denote we have one less neighbor to check.
            j nextNeighborO  # Back through the loop.
            
    checkNeighborsX:
		li $s2, 'F'          # Store an 'F' in $s2 for failed checkWinCondition (used here as a flag. If it remains unchanged, the game is over).
		add $a1, $s5, 17     # Add 17 to the X's head offset value to retrieve it's associated placement marker (0-9,a-z).
		lb  $s0, board($a1)  # Load the placement marker into $s0 so determinePieceIndexNum can get its index value.
		
		jal determinePieceIndexNum  # Use determinePieceIndexNum to retrieve the placement marker's index value so we can find its neighbors.
		
		li  $t4, 4        # Store the iterator in $t4.
        mul  $a1, $s0, 4  # Multiply the index value in $s0 by 4 (to retrieve the correct neighbors) and store in $a1.
		
		#la $a0, msgCheckedNeighborsX  # Load the message into $a0.
        #li $v0, 4                     # Load the string code into $v0.
        #syscall                       # Print a message saying that the following neighbors of O have been checked.
        
        nextNeighborX:
            lb   $s0, neighbors($a1)  # Load the neighbor into $s0 so we can determine if its place is taken on the board.
            
            #lb  $a0, neighbors($a1)  # Load the current neighbor in $a0.
            #li  $v0, 11              # Load code to print a char in $v0.
            #syscall                  # Print the current neighbor.
            
            beq  $s0, ' ', winnerO        # We didn't find an 'S' in $s0, meaning we found no valid neighbors around X's current head, so O wins!
            jal  determinePieceIndexNum   # Find the index of this neighbor.
            jal  validatePiecePlacement   # Validate that this neighbor's spot isn't already occupied on the board.
            
            beq $s2, 'S', returnToPlay  # If we find an 'S' in $s2, checkWinCondition succeeded, meaning we should return to playing the game.
            beqz $t4, winnerO           # If the iterator is 0 and we didn't have successful checkWinCondition, X has no valid neighbors, O has won the game!
            
            add $a1, $a1, 1  # Increment the $a1 to check the next neighbor.
            sub $t4, $t4, 1  # Decrement the counter to denote we have one less neighbor to check.
            j nextNeighborX  # Back through the loop.
            
            returnToPlay:
            	beq $s7, '$', skipSnakeX  # If X's snake char is in $s7, we have to branch back to skipSnakeX to continue the game.
            	beq $s7, '+', skipSnakeO  # If O's snake char is in $s7, we have to branch back to skipSnakeO to continue the game.
            
     winnerX:
		la $a0, msgUserWins   # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # The User (X) has won the game!
		j newGame
     
     winnerO:
		la $a0, msgUserWins   # Load the message address into $a0.
		li $v0, 4             # Load $v0 with code to print a string.
		syscall               # The User (O) has won the game!
		j newGame
		
    systemWinnerX:
		la $a0, msgSystemWins  # Load the message address into $a0.
		li $v0, 4              # Load $v0 with code to print a string.
		syscall                # The System (X) has won the game!
		j newGame
		
    systemWinnerO:
		la $a0, msgSystemWins  # Load the message address into $a0.
		li $v0, 4              # Load $v0 with code to print a string.
		syscall                # The System (O) has won the game!
		j newGame

	determinePieceIndexNum:
		beq $s0, '0', setIndexNum0  # Get the index number of the char in $s0 (the char user picked as determined by placeX, placeO, systemPlacesX, or systemPlacesO).
		beq $s0, '1', setIndexNum1
		beq $s0, '2', setIndexNum2
		beq $s0, '3', setIndexNum3
		beq $s0, '4', setIndexNum4
		beq $s0, '5', setIndexNum5
		beq $s0, '6', setIndexNum6
		beq $s0, '7', setIndexNum7
		beq $s0, '8', setIndexNum8
		beq $s0, '9', setIndexNum9
		beq $s0, 'a', setIndexNum10
		beq $s0, 'b', setIndexNum11
		beq $s0, 'c', setIndexNum12
		beq $s0, 'd', setIndexNum13
		beq $s0, 'e', setIndexNum14
		beq $s0, 'f', setIndexNum15
		beq $s0, 'g', setIndexNum16
		beq $s0, 'h', setIndexNum17
		beq $s0, 'i', setIndexNum18
		beq $s0, 'j', setIndexNum19
		beq $s0, 'k', setIndexNum20
		beq $s0, 'l', setIndexNum21
		beq $s0, 'm', setIndexNum22
		beq $s0, 'n', setIndexNum23
		beq $s0, 'o', setIndexNum24
		beq $s0, 'p', setIndexNum25
		beq $s0, 'q', setIndexNum26
		beq $s0, 'r', setIndexNum27
		beq $s0, 's', setIndexNum28
		beq $s0, 't', setIndexNum29
		beq $s0, 'u', setIndexNum30
		beq $s0, 'v', setIndexNum31
		beq $s0, 'w', setIndexNum32
		beq $s0, 'x', setIndexNum33
		beq $s0, 'y', setIndexNum34
		beq $s0, 'z', setIndexNum35
			
	setIndexNum0:    
		lb $s0, indices+0  # Load the corresponding index number back into $s0 (to be used after returning from determinePieceIndexNum).
		jr $ra             # Return to where determinePieceIndexNum was called.
	setIndexNum1:
		lb $s0, indices+1
		jr $ra
	setIndexNum2:
		lb $s0, indices+2
		jr $ra
	setIndexNum3:
		lb $s0, indices+3
		jr $ra
	setIndexNum4:
		lb $s0, indices+4
		jr $ra
	setIndexNum5:
		lb $s0, indices+5
		jr $ra
	setIndexNum6:
		lb $s0, indices+6
		jr $ra
	setIndexNum7:
		lb $s0, indices+7
		jr $ra
	setIndexNum8:
		lb $s0, indices+8
		jr $ra
	setIndexNum9:
		lb $s0, indices+9
		jr $ra
	setIndexNum10:
		lb $s0, indices+10
		jr $ra
	setIndexNum11:
		lb $s0, indices+11
		jr $ra
	setIndexNum12:
		lb $s0, indices+12
		jr $ra
	setIndexNum13:
		lb $s0, indices+13
		jr $ra
	setIndexNum14:
		lb $s0, indices+14
		jr $ra
	setIndexNum15:
		lb $s0, indices+15
		jr $ra
	setIndexNum16:
		lb $s0, indices+16
		jr $ra
	setIndexNum17:
		lb $s0, indices+17
		jr $ra
	setIndexNum18:
		lb $s0, indices+18
		jr $ra
	setIndexNum19:
		lb $s0, indices+19
		jr $ra
	setIndexNum20:
		lb $s0, indices+20
		jr $ra
	setIndexNum21:
		lb $s0, indices+21
		jr $ra
	setIndexNum22:
		lb $s0, indices+22
		jr $ra
	setIndexNum23:
		lb $s0, indices+23
		jr $ra
	setIndexNum24:
		lb $s0, indices+24
		jr $ra
	setIndexNum25:
		lb $s0, indices+25
		jr $ra
	setIndexNum26:
		lb $s0, indices+26
		jr $ra
	setIndexNum27:
		lb $s0, indices+27
		jr $ra
	setIndexNum28:
		lb $s0, indices+28
		jr $ra
	setIndexNum29:
		lb $s0, indices+29
		jr $ra
	setIndexNum30:
		lb $s0, indices+30
		jr $ra
	setIndexNum31:
		lb $s0, indices+31
		jr $ra
	setIndexNum32:
		lb $s0, indices+32
		jr $ra
	setIndexNum33:
		lb $s0, indices+33
		jr $ra
	setIndexNum34:
		lb $s0, indices+34
		jr $ra
	setIndexNum35:	
		lb $s0, indices+35
		jr $ra

	determinePieceIndexChar:
		beq $s0, 0, setIndexChar0  # Get the index char of the index num in $s0.
		beq $s0, 1, setIndexChar1
		beq $s0, 2, setIndexChar2
		beq $s0, 3, setIndexChar3
		beq $s0, 4, setIndexChar4
		beq $s0, 5, setIndexChar5
		beq $s0, 6, setIndexChar6
		beq $s0, 7, setIndexChar7
		beq $s0, 8, setIndexChar8
		beq $s0, 9, setIndexChar9
		beq $s0, 10, setIndexChar10
		beq $s0, 11, setIndexChar11
		beq $s0, 12, setIndexChar12
		beq $s0, 13, setIndexChar13
		beq $s0, 14, setIndexChar14
		beq $s0, 15, setIndexChar15
		beq $s0, 16, setIndexChar16
		beq $s0, 17, setIndexChar17
		beq $s0, 18, setIndexChar18
		beq $s0, 19, setIndexChar19
		beq $s0, 20, setIndexChar20
		beq $s0, 21, setIndexChar21
		beq $s0, 22, setIndexChar22
		beq $s0, 23, setIndexChar23
		beq $s0, 24, setIndexChar24
		beq $s0, 25, setIndexChar25
		beq $s0, 26, setIndexChar26
		beq $s0, 27, setIndexChar27
		beq $s0, 28, setIndexChar28
		beq $s0, 29, setIndexChar29
		beq $s0, 30, setIndexChar30
		beq $s0, 31, setIndexChar31
		beq $s0, 32, setIndexChar32
		beq $s0, 33, setIndexChar33
		beq $s0, 34, setIndexChar34
		beq $s0, 35, setIndexChar35
		
	setIndexChar0:    
		lb $s0, '0'  # Load the corresponding index char back into $s0 (to be used after returning from determinePieceIndexChar).
		jr $ra       # Return to where determinePieceIndexChar was called.
	setIndexChar1:
		lb $s0, '1'
		jr $ra
	setIndexChar2:
		lb $s0, '2'
		jr $ra
	setIndexChar3:
		lb $s0, '3'
		jr $ra
	setIndexChar4:
		lb $s0, '4'
		jr $ra
	setIndexChar5:
		lb $s0, '5'
		jr $ra
	setIndexChar6:
		lb $s0, '6'
		jr $ra
	setIndexChar7:
		lb $s0, '7'
		jr $ra
	setIndexChar8:
		lb $s0, '8'
		jr $ra
	setIndexChar9:
		lb $s0, '9'
		jr $ra
	setIndexChar10:
		lb $s0, 'a'
		jr $ra
	setIndexChar11:
		lb $s0, 'b'
		jr $ra
	setIndexChar12:
		lb $s0, 'c'
		jr $ra
	setIndexChar13:
		lb $s0, 'd'
		jr $ra
	setIndexChar14:
		lb $s0, 'e'
		jr $ra
	setIndexChar15:
		lb $s0, 'f'
		jr $ra
	setIndexChar16:
		lb $s0, 'g'
		jr $ra
	setIndexChar17:
		lb $s0, 'h'
		jr $ra
	setIndexChar18:
		lb $s0, 'i'
		jr $ra
	setIndexChar19:
		lb $s0, 'j'
		jr $ra
	setIndexChar20:
		lb $s0, 'k'
		jr $ra
	setIndexChar21:
		lb $s0, 'l'
		jr $ra
	setIndexChar22:
		lb $s0, 'm'
		jr $ra
	setIndexChar23:
		lb $s0, 'n'
		jr $ra
	setIndexChar24:
		lb $s0, 'o'
		jr $ra
	setIndexChar25:
		lb $s0, 'p'
		jr $ra
	setIndexChar26:
		lb $s0, 'q'
		jr $ra
	setIndexChar27:
		lb $s0, 'r'
		jr $ra
	setIndexChar28:
		lb $s0, 's'
		jr $ra
	setIndexChar29:
		lb $s0, 't'
		jr $ra
	setIndexChar30:
		lb $s0, 'u'
		jr $ra
	setIndexChar31:
		lb $s0, 'v'
		jr $ra
	setIndexChar32:
		lb $s0, 'w'
		jr $ra
	setIndexChar33:
		lb $s0, 'x'
		jr $ra
	setIndexChar34:
		lb $s0, 'y'
		jr $ra
	setIndexChar35:	
		lb $s0, 'z'
		jr $ra