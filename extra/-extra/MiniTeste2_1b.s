;
;	1.  Considere uma string composta por vários caracteres ‘0’-‘9’ e zero ou um caracter ‘,’. 
;		b.  Desenvolva uma rotina que, usando a rotina anterior, determine se uma string representa 
;			um número inteiro ou decimal. O resultado da rotina é 0 se for inteiro ou -1 se for 
;			decimal. 
;
;	A interface da rotina é portanto: 				
;	stringIntDecimal  ( string -- 0|-1 ) 
;

.file  "MiniTeste2_1b.s"
.include  "auxil.s"      		; definições auxiliares
.include  "Biblioteca1.s"		; Biblioteca 
.include  "Biblioteca3.s"		; Biblioteca 
.org 0x400    	    			; programa inicia-se no byte 0x400
	br inicio2

str2:: .byte "8534,875",0

stringChar::
	pop lstack
	pop lstack		; endereço da string em r0 -- caracter indexador em r1
	push ct
	pop ct
	
	push r0
	call stringLen
	pop g0
	
	loop::
		push r0
		ld.b []
		push r1
		sub
		bz encontrado
		push ct
		inc #1
		pop ct
		push ct
		push g0
		sub
		bz nao_encontrado
		push r0
		inc #1
		pop r0
		br loop
	
	encontrado::
		push ct
		br fim
		
	nao_encontrado::
		push.n #0
		eqz
		br fim
	
	fim::
		push lstack
		push lstack
		push g0
		pop
		pop
		pop

	ret




stringIntDecimal::
	pop lstack
	push r0
	push #','
	call stringChar
	push.n #1
	add
	bz fim2
	eqz
	
	fim2::
		push lstack
		pop
	
	ret


inicio2::
	push #str2
	call stringIntDecimal
	halt
	.end