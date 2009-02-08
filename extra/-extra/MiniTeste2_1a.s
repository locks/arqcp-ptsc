;
;	1.  Considere uma string composta por v�rios caracteres �0�-�9� e zero ou um caracter �,�. 
;		a.  Desenvolva uma rotina que determine o �ndice dum determinado caracter (ex. �,�). O 
;			resultado da rotina deve ser o �ndice do caracter na string, ou -1 se o caracter n�o existir.
;
;	A interface da rotina � portanto: 
;	stringChar  ( string char -- n|-1 ) 
; 

.file  "MiniTeste2_1a.s"
.include  "auxil.s"      		; defini��es auxiliares
.include  "Biblioteca1.s"		; Biblioteca 
.include  "Biblioteca3.s"		; Biblioteca 
.org 0x400    	    			; programa inicia-se no byte 0x400
	br inicio

str1:: .byte "8536104965104371034875",0
	
stringChar::
	pop lstack
	pop lstack		; endere�o da string em r0 -- caracter indexador em r1
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
		push.n #-1
		br fim
	
	fim::
		push lstack
		push lstack
		push g0
		pop
		pop
		pop

	ret
	
	
inicio::
	push #str1
	push #','
	call stringChar
	halt
	.end