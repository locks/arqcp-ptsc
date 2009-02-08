
.file "ex_teste_1.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "Biblioteca.s"			; biblioteca de funções

;Desenvolva de forma eficiente e estruturadamente uma sub-rotina que
;altere o valor de cada uma das variáveis var1..var4 (long),de tal forma que:

;var4=var4+var3
;var3=var3+var2
;var2=var2+var1
;var1=var0+var1

;A várias variáveis envolvidas têm endereços sequenciais, 
;sendo o endereço de var0<endereço de var1<endereço de var2, e assim sucessivamente.

;Portanto a sub-rotina a desenvolver deverá ter a seguinte interface:

;altera4  ( end_var1 end_var2 end_var3 end_var4 -- )



var1:: .long 1
var2:: .long 2
var3:: .long 3
var4:: .long 4


altera4::  ;( end_var1 end_var2 end_var3 end_var4 -- )

;var4=var4+var3
;var3=var3+var2
;var2=var2+var1
;var1=var0+var1

		push			;(e1, e2, e3, e4, e4)	
		ld[]			;(e1, e2, e3, e4, v4)
		xcg			;(e1, e2, e3, v4, e4)
		pop lstack		;(e1, e2, e3, v4)		L(e4)
		xcg			;(e1, e2, v4, e3)		L(e4)
		push			;(e1, e2, v4, e3, e3)		L(e4)
		ld[]			;(e1, e2, v4, e3, v3)		L(e4)
		rev			;(e1, e2, e3, v3, v4)		L(e4)
		add			;(e1, e2, e3, soma43)		L(e4)
		push lstack 		;(e1, e2, e3, soma43, e4)	L()
		st[] ;st[](n add -- n)	;(e1, e2, e3, soma43)		L()
		pop			;(e1, e2, e3)			L()
		push 			;(e1, e2, e3, e3)		L()
		bz FimAltera4		;(e1, e2, e3)			L()
		br altera4		;(e1, e2, e3)			L()

FimAltera4::
		ret
	
inicio:: 
	push.l #var1
	push.l #var2
	push.l #var3
	push.l #var4

	call altera4

        halt
       	.end