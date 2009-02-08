; Enunciado:
;
; E5:	Desenvolva uma função, que a partir de um valor escrito na memória (não ASCII!), 
;	escreva esse valor como um valor numérico inteiro no monitor.
;	outInt( n -- )
;

.file "ex_e_5_moodle_res.s"

.include "auxil.s"      ;definições auxiliares
.include "mul_div.s"	

.org 0x1000        		;programa inicia-se no byte 4096 = 0x1000

        br inicio

outInt::				;( n -- )
	push #1				;iniciar o contador de operações - começa em 1 pois um int/long é sempre pelo menos 0
	pop lstack			;colocar o contador de operações na LStack
	
	ciclo_divisoes::
		push #10			;coloca o valor do divisor pretendido
		call mydivu			;efectuar a divisão (dividendo divisor -- quociente resto)
		
		xcg					;trocar o quociente com o resto para analisar o quociente e verificar se é zero = condição de paragem
		push
		push #0
		xor					;verificar se o quociente é zero
		bz fim

		push lstack			;coloca o contador na OStack
		inc #1				;incrementa o contador em 1
		pop lstack			;coloca o contador na LStack
		
		br ciclo_divisoes
		
fim ::						;começa a escrever os restos que ficaram na OStack
	pop						;eliminar o útimo quociente 
	push lstack				;coloca em OStack o número de operações efectuadas
	pop ct					;coloca o número de operações efectuadas em CT
	
	ciclo_write_alg::
		push #0x30			;adiciona a base do algarismo que se pretende escrever
		add	
		emit				;escreve o algarismo para o ecrã
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