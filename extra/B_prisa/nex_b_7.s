.file "ex_b_7.s"
.include "auxil.s"      		
.include "biblioteca.s"			
.org 0x1000        				
        br inicio


l1:	.long 1
l2:	.long 3
l3:	.long 2
l4:	.long 0


F5::					
		pop g0
		pop g1
		pop g2
		
		push g0
		push g1
		add
		
		push g0
		push g2
		add
		
		sub
		push.l #l4
		st[]
		
		
		ret

	


inicio::
		push.l #l1
		ld[]
		push.l #l2
		ld[]
		push.l #l3
		ld[]

		call F5

        	halt
       		.end