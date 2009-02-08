
.file "ex4.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; definições auxiliares

ex4::		    ; 3*2 -> 3 2 *
push.b #3
push.b #2
pop g0
push.n #0
mulu

ret

inicio::
		call ex4

		halt
		.end