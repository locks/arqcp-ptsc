; Enunciado:
;
; D1:	Tendo uma string armazenada em mem�ria que termina com o valor 0 (zero), fa�a uma rotina que calcule a dimens�o dessa string.
;	tamString(end_string -- tamanho)
;

.file "ex_d_1.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

string: .byte	"isto � uma string",0

tamString::					;(endere�o -- tamanho)
		push #0				;inicializa o contador a zero
		xcg					;troca o endere�o com o contador

ciclo::
		push				;duplica endere�o actual de caracter
		pop lstack			;guarda o endee�o actual na LStack
		ld.b []				;carrega o byte para verificar se � 0 
		bz fim_tamString	;se o valor lido for zero, acaba de ler a string e termina

		inc #1				;caso contr�rio, incrementa em 1 o contador de caracteres
		push lstack			;recupera endere�o actual de caracter
		inc #1				;incrementa o endere�o de caracter
		br ciclo			;recome�a o ciclo na posi��o seguinte de mem�ria
		
fim_tamString::
		inc #1				; o zero tamb�m conta? - se o zero conar adicionar um elemento ao contador
		push lstack			;colocar o endere�o em OStack
		pop					;remover o endere�o de mem�ria
		ret
	
inicio::
		push.l #string		;colocar o endere�o da string na OStack
		call tamString	

        halt
       	.end