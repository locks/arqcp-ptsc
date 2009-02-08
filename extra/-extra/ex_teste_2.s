
.file "ex_teste_2.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "Biblioteca.s"			; biblioteca de funções

;Faça uma sub-rotina (castw) que dada uma variável do tipo long (n1),
;copie os 2 bytes menos significativos para uma variável do tipo word (n2).


;Faça uma sub-rotina (castb) que dada uma variável do tipo word (n1),
;copie o byte menos significativo para uma variável do tipo byte (n2):


var1:: .long 0x42F123
var2:: .word 0
var3:: .byte 0

castw:: ;( n1 n2 -- )
	
	xcg				;(end2, end1)
	ld[]			;(end2, v1)
	push.l #0xFFFF  ;(end2, v1, FFFF)
	and				;(end2, 16bits1)
	xcg				;(16bits1, end2)
	st[]			;(16bits1)
	pop				;()
	
	ret

castb:: ;( n1 n2 -- )
	
	xcg				;(end2, end1)
	ld[]			;(end2, v1)
	push.l #0xFF 	;(end2, v1, FF)
	and				;(end2, 8bits1)
	xcg				;(8bits1, end2)
	st[]			;(8bits1)
	pop				;()
	
	ret
	
inicio:: 
	push #var1
	push #var2

	call castw

	push #var2
	push #var3

	call castb

        halt
       	.end