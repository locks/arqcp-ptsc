.file "ex1.s"
.org 0x1000        			; programa inicia-se no byte 0x1000
        	br inicio
.include  "auxil.s"      		; definições auxiliares


ex1::	
push.b #5
push.b #4
add
push.b #6
sub		; 5+4-6 -> 4 5 + 6 -
ret

inicio::
		call ex1

		halt
		.end
