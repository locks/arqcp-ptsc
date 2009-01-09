; Enunciado:
;
; C6:	Faça uma rotina que partindo de dois números de 64 bits colocados na memória os adicione e guarde o resultado na memória.
;	Na pilha, os parâmetros de entrada e de saída são os apresentados na indicação feita para referência à rotina:
;	SOMA64 (n1_low n1_high n2_low n2_high -- n3_low n3_high)
;

.file "ex_c_6.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        	br inicio

n1_low:		.long	2
n1_high:	.long	3
n2_low:		.long	4
n2_high:	.long	5
n3_low:		.long	0
n3_high:	.long	0

soma_n64::				; soma_n64(  n1_low n1_high n2_low n2_high -- n3_low n3_high)
					;desc:	soma dois números de 64 bits.
					;input:
					;	n1_low:  32 bits menos significativa do numero n1
					;	n1_high: 32 bits mais significativa do numero n1
					;	n2_low:  32 bits menos significativa do numero n2
					;	n2_high: 32 bits mais significativa do numero n2
					;
					;output:
					;	n3_low: soma das partes menos significativas
					;	n3_high: soma das partes mais significativas


		completar

		ret


inicio::
		; soma_n64: usar inicialmente constantes (longs)
		push.l #0xaaaaaaaa
		push.l #0xbbbbbbbb
		push.l #0x22222222
		push.l #0x33333333
		
		call soma_n64

		; soma_n64: depois com variáveis (longs)

		compeltar

		call soma_n64

		completar

        	halt
       		.end
