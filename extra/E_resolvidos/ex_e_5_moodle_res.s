; Enunciado:
;
; E5:	Desenvolva uma fun��o, que a partir de um valor escrito na mem�ria (n�o ASCII!), 
;	escreva esse valor como um valor num�rico inteiro no monitor.
;	outInt( n -- )
;

.file "ex_e_5_moodle_res.s"

.include "auxil.s"      ;defini��es auxiliares
.include "mul_div.s"	

.org 0x1000        		;programa inicia-se no byte 4096 = 0x1000

        br inicio

outInt::				;( n -- )
	push #1				;iniciar o contador de opera��es - come�a em 1 pois um int/long � sempre pelo menos 0
	pop lstack			;colocar o contador de opera��es na LStack
	
	ciclo_divisoes::
		push #10			;coloca o valor do divisor pretendido
		call mydivu			;efectuar a divis�o (dividendo divisor -- quociente resto)
		
		xcg					;trocar o quociente com o resto para analisar o quociente e verificar se � zero = condi��o de paragem
		push
		push #0
		xor					;verificar se o quociente � zero
		bz fim

		push lstack			;coloca o contador na OStack
		inc #1				;incrementa o contador em 1
		pop lstack			;coloca o contador na LStack
		
		br ciclo_divisoes
		
fim ::						;come�a a escrever os restos que ficaram na OStack
	pop						;eliminar o �timo quociente 
	push lstack				;coloca em OStack o n�mero de opera��es efectuadas
	pop ct					;coloca o n�mero de opera��es efectuadas em CT
	
	ciclo_write_alg::
		push #0x30			;adiciona a base do algarismo que se pretende escrever
		add	
		emit				;escreve o algarismo para o ecr�
	dbr ciclo_write_alg

	ret
	
inicio::
	push #12
	call outInt
	
	push #0xA				;mudar de linha, escrever um line feed
	emit					;escrever o line feed
	
	push #34204240
	call outInt

	push #0xA				;mudar de linha, escrever um line feed
	emit					;escrever o line feed
	
	push #0
	call outInt

	push #0xA				;mudar de linha, escrever um line feed
	emit					;escrever o line feed

	push #12
	call outInt
	
	halt
	.end