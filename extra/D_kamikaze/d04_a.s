; Enunciado:
;
; D4:	Tendo uma string em mem�ria que termina com o valor 0 (zero),
;	fa�a uma rotina que a divida em duas a partir da posi��o pretendida.
;	No programa principal determine ainda a dimens�o de cada uma delas.
; 	Separa(end_s1 end_s2 nIndex -- )
;

.file "ex_d_4.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de fun��es
str1::	.byte	"omg1 omg2",0
str2:	.space	5
index:	.long	5

Separa::
		pop lstack
		pop lstack
		pop lstack
		push r2
		push r0
		add
		push r1
		call copiar
		push r2
		push r0
		add
		push #0
		call escrb 
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop


		ret

	
inicio::	
		push #str1
		push #str2
		push #index
		ld[]
		
		
		

		call Separa

        	halt
       		.end