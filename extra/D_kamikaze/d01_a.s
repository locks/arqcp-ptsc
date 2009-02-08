; Enunciado:
;
; D1:	Tendo uma string armazenada em mem�ria que termina com o valor 0 (zero), fa�a uma rotina que calcule a dimens�o dessa string.
;	tamString(end_string -- tamanho)
;

.file "ex_d_1.s"

.include "../auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

;.include "../biblioteca.s"			; biblioteca de fun��es

str1::	.byte	"o kamikazi e um fixe",0

tamString::
		
		pop lstack
		push #0
		
sl_loop::
		push r0
		ld.b []
		bz sl_fim
		inc #1
		push r0
		inc #1
		pop r0
		br sl_loop
				
		

		
sl_fim::
		push lstack
		pop
		ret

	
inicio::

		push #str1
		

		call tamString

        	halt
       		.end