; Enunciado:
;
; D1:	Tendo uma string armazenada em memória que termina com o valor 0 (zero), faça uma rotina que calcule a dimensão dessa string.
;	tamString(end_string -- tamanho)
;

.file "ex_d_1.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

string: .byte	"isto é uma string",0

tamString::					;(endereço -- tamanho)
		push #0				;inicializa o contador a zero
		xcg					;troca o endereço com o contador

ciclo::
		push				;duplica endereço actual de caracter
		pop lstack			;guarda o endeeço actual na LStack
		ld.b []				;carrega o byte para verificar se é 0 
		bz fim_tamString	;se o valor lido for zero, acaba de ler a string e termina

		inc #1				;caso contrário, incrementa em 1 o contador de caracteres
		push lstack			;recupera endereço actual de caracter
		inc #1				;incrementa o endereço de caracter
		br ciclo			;recomeça o ciclo na posição seguinte de memória
		
fim_tamString::
		inc #1				; o zero também conta? - se o zero conar adicionar um elemento ao contador
		push lstack			;colocar o endereço em OStack
		pop					;remover o endereço de memória
		ret
	
inicio::
		push.l #string		;colocar o endereço da string na OStack
		call tamString	

        halt
       	.end