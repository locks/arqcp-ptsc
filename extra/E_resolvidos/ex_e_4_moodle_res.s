; Enunciado:
;
; E4:	Desenvolva uma função, que a partir de uma string armazenada em memória que termina com o valor 0 (zero), escreva essa string no monitor.
;	outString(endS -- )
;

.file "ex_e_4_moodle_res.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

string: .byte "abcde",0			;definir uma variável do tipo string com o valor "a" e tamanho 0

outString::						;(endS -- )
		pop 	lstack     		;colocar na lstack o endereço da string que está no topo
	
write_string_ciclo::        
		push 	r0				;colocar no topo o endereço da string
		ld.b 	[]				;obter o valor do byte menos significativo

        push					;colocar este valor de novo no topo da pilha
        bz  write_string_fim	;se o valor do topo for 00 então acabava de escrever a string

        emit					;escreve o caracter no ecrã

        push 	r0				;colocar no topo da stack de operandos o valor de r0 = endereço da string
        inc 	#1				;incrementa o endereço da string em + 1 byte (index)
        pop 	r0				;colocar no topo da stack local o endereço da string

        br  write_string_ciclo	;recomeçar o ciclo de escrita na nova posição

write_string_fim::
		pop						;descartar o valor do CR do topo da pilha de operandos
		push lstack				;obter o endereço da string que está na pilha local
		pop						;descartar o endereço
	
		ret

outString2::					;(endS -- ) - Uma segunda abordagem ao problema sem usar a LStack
		push					;duplica o endereço da string que está em OStack
		ld.b 	[]				;obter o valor do byte
		
        push					;colocar este valor de novo no topo da pilha
        bz  write_string_fim2	;se o valor do topo for 0 então acabava de escrever a string, pois tinha chegado à condição de paragem
        
		emit					;escreve o caracter no ecrã
		
        inc 	#1				;incrementa o endereço da string em + 1 byte (index)

        br  outString2			;recomeçar o ciclo de escrita na nova posição

write_string_fim2::
		pop						;descartar o valor do CR do topo de OStack
		pop						;remover o endereço da memória
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