; Enunciado:
;
; E7:	Desenvolva uma função, que a partir de um vector de elementos armazenado na memória,
;	e sabendo quantos são elementos tem o vector (num_V), permita escrever esse vector no monitor.
;	outVector(endV num_V-- )
;

.file "ex_e_7_moodle_res.s"

.include "auxil.s"      		; definições auxiliares
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
	
	pop ct							;coloca em CT o número de vezes que deverá executar
	
	ciclo_escreve::
		push						;duplica o endereço actual
		ld []						;lê o elemento da memória
		call io_printLong			;imprime o long
		
		push ct						;obtém o ct para verificar se escreve o último separador
		dec #1						;decremanta 1 a ct, pois na última posição ct = 1
		bz nao_escreve_separador	;compara com 0, se for zero, então não escreve o separador
		push #44					;coloca o ASCII de ',' em formato decimal 
		emit						;escreve a vírgula
	
		nao_escreve_separador::
		add #4						;avança no vector
		dbr ciclo_escreve			
	
	push lstack						;HK - coloca o valor anterior de CT na OStack
	pop ct							;HK - coloca o valor de CT em CT
	
	pop								;elimina o endereço inicial
	
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