; Enunciado:
;
; D2:	Faça uma rotina que copie uma string colocada em memória para outra posição de memória.
;	Parta do princípio que a s2 têm pelo menos o mesmo tamanho que a s1.
;	Copia(end_s1 end_s2 -- )
;

.file "ex_d_2.s"

.include "auxil.s"      		; definições auxiliares
.include "write_byte_word.s"	
.include "string.s"				;apenas para testar o resultado
.include "mul_div.s"			;apenas para testar o resultado
.include "io_biblioteca.s"		;apenas para testar o resultado	

.org 0x1000        				; programa inicia-se no byte 4096 = 0x1000

        br inicio

string1: .byte	"isto é uma string",0
string2: .space.b 40

Copia::					;(end_s1 end_s2 -- )
		push ct			; reserva ct - House Keeping
		pop lstack		; guarda CT na LStack
		push g2			; reserva g2 - obtém o valor de g2
		pop lstack		; coloca o valor de g2 na LStack
		push g1			; reserva g1 - obtém o valor de g1
		pop lstack	    ; coloca o valor de g1 na LStack L(ct - g2 - g1)

		pop g2			; guarda end_string2 em g2
		push			; duplica o end de string1 - para poder efectuar o stringlen
		pop g1			; guarda end_string1 em g1

		;call tamString		;poderia ser utilizado o do ex_d_1.s
		call stringLen	; obtém o tamanho da string
		pop ct			; coloca em ct o tamanho da string a copiar

cicloCopia::
		push g1			;coloca o endereço de string1 em OStack 
		push			;duplica o endereço da string1 
		inc #1			;incrementa o endereço da string1
		pop g1			; coloca o endereço seguinte da string1 em g1
		ld.b []			;carrega o byte actual da string1

		push g2			;coloca o endereço de string2 em OStack 
		push			;duplica o endereço da string2
		inc #1			;incrementa o endereço da string2
		pop g2			; coloca o endereço seguinte da string2 em g2

		call writeByte  ;temos na Ostack (byte string2 -- )
		dbr cicloCopia  ;executa quantas vezes o tamanho da string1
		
		push lstack		; repõe g1
		pop g1			; escreve g1

		push lstack		; repõe g2
		pop g2			; escreve g2

		push lstack		; repõe ct
		pop ct			;escreve ct

		ret
		
outString::
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
        br  write_string_ciclo			;recomeçar o ciclo de escrita na nova posição

write_string_fim::
		pop								;descartar o valor do CR do topo da pilha de operandos
		push lstack						;obter o endereço da string que está na pilha local
		pop								;descartar o endereço
	
		ret
		
		
inicio::
		push #string1
		
		push				;só para testar
		call io_printString	;só para testar
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		push				;só para testar
		pop g4				;só para testar
		
		push #string2
		push				;só para testar
		pop g5				;só para testar
		
		;call stringCopy
		call Copia

		push g4				;só para testar
		call io_printString	;só para testar
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		
		push g5				;só para testar
		call io_printString	;só para testar
		halt
   		.end