; Enunciado:			
;
; E3:	Desenvolva uma função, que permita ler uma string do teclado, sabendo que o terminar dessa introdução é reconhecido pelo ASCII [CR] – Carriage return.
;	O seu armazenamento deve ser feito em memória, terminando com o valor 0 (zero), e de seguida se guarde em memória também o seu tamanho. 
;	inString( endS -- )
;

.file "ex_e_3_moodle_res.s"

.include "auxil.s"      	; definições auxiliares
.include "write_byte_word.s"
.include "io_biblioteca.s"	;para testar
.include "mul_div.s"		;para testar

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

string: .space.b 256		;reservar o espaço equivalente a 256 chars

inString::
		push #0				;iniciar o contador de caracteres a zero
		pop lstack			;colocar o contador na LStack
		pop lstack			;colocar o endereço na LStack
							;(L:contador endereço)
read_new_char::
		key					;ler um caracter do teclado
		push				;duplica o valor ASCII
		push #13			;coloca CR no topo da OStack
		xor					;efectua xor entre o valor lido e o CR
		bz carriage_return	;se topo 0 (resultado de ser igual a CR) salta para carriage_return = fim de introdução de dados
							;o bz faz o pop do valor 0
							
		push r0				;coloca o endereço da string em OStack
		call writeByte		;(endereço byte) escreve o valor no endereço de memória
		
		push r0				;coloca o endereço da string em OStack
		inc #1				;incrementa um (neste caso um byte) ao apontador da string
		pop r0				;coloca o endereço em r0 de novo
		
		push r1				;actualização do contador - coloca o contador em OStack
		inc #1				;incrementa o contador em 1
		pop r1				;coloca o valor de novo em r1
		br read_new_char	;continua a ler caracteres
	
carriage_return::
		pop					;retira o caracter lido do topo da pilha - era o CR
		push #0				;coloca o valor 0 (decimal) no topo da pilha
		push r0				;obtém o endereço da string
		call writeByte		;escreve 0 no fim da string para a finalizar

		push r1				;coloca o contador na OStack
		push r0				;coloca o endereço da string em OStack
		inc #1				;aumenta em um o endereço da string
		call writeByte		;escreve o valor numérico no fim da string introduzida
	
		push lstack			;coloca o endereço da string em OStack
		pop					;elimina o endereço da string
		push lstack			;coloca o contador em OSTacks
		pop					;elimina o contador

		ret
		
inicio::
		push #string
		push				;para testar
		pop g5				;para testar
		call inString
		
		push g5
		call io_printString	;para testar
		halt
		.end