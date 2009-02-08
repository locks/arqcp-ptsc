; Enunciado:
;
; E4:	Desenvolva uma fun��o, que a partir de uma string armazenada em mem�ria que termina com o valor 0 (zero), escreva essa string no monitor.
;	outString(endS -- )
;

.file "ex_e_4_moodle_res.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

string: .byte "abcde",0			;definir uma vari�vel do tipo string com o valor "a" e tamanho 0

outString::						;(endS -- )
		pop 	lstack     		;colocar na lstack o endere�o da string que est� no topo
	
write_string_ciclo::        
		push 	r0				;colocar no topo o endere�o da string
		ld.b 	[]				;obter o valor do byte menos significativo

        push					;colocar este valor de novo no topo da pilha
        bz  write_string_fim	;se o valor do topo for 00 ent�o acabava de escrever a string

        emit					;escreve o caracter no ecr�

        push 	r0				;colocar no topo da stack de operandos o valor de r0 = endere�o da string
        inc 	#1				;incrementa o endere�o da string em + 1 byte (index)
        pop 	r0				;colocar no topo da stack local o endere�o da string

        br  write_string_ciclo	;recome�ar o ciclo de escrita na nova posi��o

write_string_fim::
		pop						;descartar o valor do CR do topo da pilha de operandos
		push lstack				;obter o endere�o da string que est� na pilha local
		pop						;descartar o endere�o
	
		ret

outString2::					;(endS -- ) - Uma segunda abordagem ao problema sem usar a LStack
		push					;duplica o endere�o da string que est� em OStack
		ld.b 	[]				;obter o valor do byte
		
        push					;colocar este valor de novo no topo da pilha
        bz  write_string_fim2	;se o valor do topo for 0 ent�o acabava de escrever a string, pois tinha chegado � condi��o de paragem
        
		emit					;escreve o caracter no ecr�
		
        inc 	#1				;incrementa o endere�o da string em + 1 byte (index)

        br  outString2			;recome�ar o ciclo de escrita na nova posi��o

write_string_fim2::
		pop						;descartar o valor do CR do topo de OStack
		pop						;remover o endere�o da mem�ria
		ret
	
inicio::
		push #string			;colocar no topo o valor a imprimir
		call outString		

		push #0xA				;mudar de linha, escrever um line feed
		emit					;escrever o line feed

		push #string			;colocar no topo o valor a imprimir
		call outString2			;uma segunda abordagem ao problema, sem usar a LStack
		halt
		.end