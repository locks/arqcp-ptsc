;Exercicio treino para teste das s�ries E e F
;
;Inverter ums string
;
;(str1Add len -- )
;

.file  "Extra3.s"
.include  "auxil.s"      		; defini��es auxiliares
.include  "Biblioteca1.s"		; Biblioteca com a rotina escreveByte
.include  "Biblioteca3.s"		; Biblioteca com a rotina io_print_byte
.org 0x400    	    			; programa inicia-se no byte 0x400
	br inicio

	
str1:: .byte "Ol� Mundo Novo!",0

inverteString::
	pop lstack
	pop lstack		;tamanho da string em r1, endere�o da string em r0
	push r1
	push r0
	add
	pop lstack		;r0=endere�o final da string -- r1=endere�o de inicio da string -- r2 = tamanho da string
	
	loop::
		push r0
		push r1
		sub
		bz fim
		push r0
		ld.b []
		push r1
		ld.b []
		push r0
		call escrb
		push r1
		call escrb
		push r0
		dec #1
		pop r0
		push r1
		inc #1
		pop r1
		br loop
	
	fim::
		push lstack
		push lstack
		push lstack
		pop
		pop
		pop
	
	ret
	

inicio::
	push #str1
	pop lstack		;endere�o da string em r0
	push r0
	call stringLen	
	pop lstack		;tamanho da string em r0, endere�o da string em r1
	push lstack
	push lstack		;tamanho da string em s1, endere�o da string em s0
	xcg				;tamanho da string em s0, endere�o da string em s1
	call inverteString
	halt
	.end