; Enunciado:
;
; F1:	Desenvolva uma rotina que, dado o endere�o de in�cio do vector,
;	determina o n�mero de elementos dum vector:
;	vectorNumElem(end_v -- n)
;

.file "ex_f_1_moodle_res.s"

.include "auxil.s"      		; defini��es auxiliares
.include "io_biblioteca.s"
.include "write_byte_word.s"
.include "mul_div.s"

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio
		
vector1:: .long 5, 234223, 4322, 0, 256543, 456545

vector2:  .byte 5
.align 4 								;importante para apenas come�ar a escrita dos pr�ximos
										;valores na c�lula seguinte
.long 234223,4322,0,256543,456545

vector3: .word 6
.align 4
.long 4,5,6,7,8,7

texto_pre: .byte "O vector tem ", 0
texto_suf: .byte " elementos.", 0

vectorNumElemGenerico::					;(vector tipo_dados_cabe�alho -- tamanho)
	push #4								;colocar o maior tamanho de bytes de dados de uma c�lula em OStack
	xcg									;trocar o tamanho em bytes com o tipo de dados
	sub									;subtrair ao tamanho m�ximo o tipo que e passado: ex para byte: 4-1 = 3 
	push #8								;colocar o valor 8 equivalente ao n�mero de bits necess�rios para um shift de um byte
	call mymulu							;multiplicar o n�mero de vezes (3) por 8 para saber quantos bits colocar no shift
	pop									
	
	push #0x80000000					;colocar a m�scara para activar o bit negativo (para o shift ser efectuado para a direita o n�mero tem de ser negativo)
	or									
	
	xcg									;trocar o n�mero de bits com o endere�o do vector
	ld []								;colocar o valor (long) de mem�ria apontado pelo vector na OStack
	
	xcg									;trocar o valor com o n�mero de bits para aplicar o shift
	shift								;efectua o shift
	ret

vectorNumElemByte::
		ld.b []
		;ou
		;ld []
		;shr #8
		;shr #8
		;shr #8
		ret

vectorNumElemWord::
		ld.w []
		;ou
		;ld []
		;shr #8
		;shr #8
		ret
vectorNumElemLong::
		ld []
		ret

inicio::
	push #vector1
	call vectorNumElemLong
	push					;para testar o resultado
	push #texto_pre			;para testar o resultado
	call io_printString		;para testar o resultado
	call io_printLong		;para testar o resultado	
	push #texto_suf			;para testar o resultado
	call io_printString		;para testar o resultado
		
	push #0xA				;mudar de linha, escrever um line feed
	emit

	push #vector2
	call vectorNumElemByte	
	push					;para testar o resultado
	push #texto_pre			;para testar o resultado
	call io_printString		;para testar o resultado
	call io_printLong		;para testar o resultado
	push #texto_suf			;para testar o resultado
	call io_printString		;para testar o resultado
	
	push #0xA				;mudar de linha, escrever um line feed
	emit

	push #vector3
	call vectorNumElemWord
	push					;para testar o resultado
	push #texto_pre			;para testar o resultado
	call io_printString		;para testar o resultado
	call io_printLong		;para testar o resultado
	push #texto_suf			;para testar o resultado
	call io_printString		;para testar o resultado
	
	push #0xA				;mudar de linha, escrever um line feed
	emit

	push #vector1
	push #4
	call vectorNumElemGenerico
	push					;para testar o resultado
	push #texto_pre			;para testar o resultado
	call io_printString		;para testar o resultado
	call io_printLong		;para testar o resultado	
	push #texto_suf			;para testar o resultado
	call io_printString		;para testar o resultado
		
	push #0xA				;mudar de linha, escrever um line feed
	emit

	push #vector2
	push #1
	call vectorNumElemGenerico
	push					;para testar o resultado
	push #texto_pre			;para testar o resultado
	call io_printString		;para testar o resultado
	call io_printLong		;para testar o resultado
	push #texto_suf			;para testar o resultado
	call io_printString		;para testar o resultado
	
	push #0xA				;mudar de linha, escrever um line feed
	emit

	push #vector3
	push #2
	call vectorNumElemGenerico
	push					;para testar o resultado
	push #texto_pre			;para testar o resultado
	call io_printString		;para testar o resultado
	call io_printLong		;para testar o resultado
	push #texto_suf			;para testar o resultado
	call io_printString		;para testar o resultado
	
    halt	
	.end
