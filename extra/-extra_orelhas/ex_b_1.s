.file "ex_b_1.s"
.org 0x1000        			
       	br inicio
.include  "auxil.s"


n1::	.long	2
n2:	.long	3
n3:	.long	4
n4:	.long	0

F1::				; F1(n1 n2 n3 – n4): n4=n1+n2-n3
		rev
		rev
		add
		xcg
		sub
		ret


inicio::
		push.l #n1
		ld[]
		push.l #n2
		ld[]
		push.l #n3
		ld[]
		
		call F1
		
		push.l #n4
		st[]
	
        	halt
       		.end
