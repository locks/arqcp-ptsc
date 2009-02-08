; Enunciado:
;
; E7:	Desenvolva uma fun��o, que a partir de um vector de elementos armazenado na mem�ria,
;	e sabendo quantos s�o elementos tem o vector (num_V), permita escrever esse vector no monitor.
;	outVector(endV num_V-- )
;

.file "ex_e_7_moodle_res.s"

.include "auxil.s"      		; defini��es auxiliares
.include "io_biblioteca.s"
.include "mul_div.s"
.include "write_byte_word.s"

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

vector:: .long 323,432,444,22445,5322,44
vector1:: .long 323
vector2:: .long 323,432

outVector::				;(endV num_V-- )

	push ct							;HK - coloca o valor de ct na OStack
	pop lstack 						;HK - coloca o valor de ct na LStack
	
	pop ct							;coloca em CT o n�mero de vezes que dever� executar
	
	ciclo_escreve::
		push						;duplica o endere�o actual
		ld []						;l� o elemento da mem�ria
		call io_printLong			;imprime o long
		
		push ct						;obt�m o ct para verificar se escreve o �ltimo separador
		dec #1						;decremanta 1 a ct, pois na �ltima posi��o ct = 1
		bz nao_escreve_separador	;compara com 0, se for zero, ent�o n�o escreve o separador
		push #44					;coloca o ASCII de ',' em formato decimal 
		emit						;escreve a v�rgula
	
		nao_escreve_separador::
		add #4						;avan�a no vector
		dbr ciclo_escreve			
	
	push lstack						;HK - coloca o valor anterior de CT na OStack
	pop ct							;HK - coloca o valor de CT em CT
	
	pop								;elimina o endere�o inicial
	
	ret	

inicio::
	push #vector
	push #6
	call outVector

	push #0xA				;mudar de linha, escrever um line feed
	emit					;escrever o line feed
		
	push #vector1
	push #1
	call outVector
	
	push #0xA				;mudar de linha, escrever um line feed
	emit					;escrever o line feed

	push #vector2
	push #2
	call outVector
	
	halt
	.end