; Enunciado:
;
; D2:	Fa�a uma rotina que copie uma string colocada em mem�ria para outra posi��o de mem�ria.
;	Parta do princ�pio que a s2 t�m pelo menos o mesmo tamanho que a s1.
;	Copia(end_s1 end_s2 -- )
;

.file "ex_d_2.s"

.include "auxil.s"      		; defini��es auxiliares
.include "write_byte_word.s"	
.include "string.s"				;apenas para testar o resultado
.include "mul_div.s"			;apenas para testar o resultado
.include "io_biblioteca.s"		;apenas para testar o resultado	

.org 0x1000        				; programa inicia-se no byte 4096 = 0x1000

        br inicio

string1: .byte	"isto � uma string",0
string2: .space.b 40

Copia::					;(end_s1 end_s2 -- )
		push ct			; reserva ct - House Keeping
		pop lstack		; guarda CT na LStack
		push g2			; reserva g2 - obt�m o valor de g2
		pop lstack		; coloca o valor de g2 na LStack
		push g1			; reserva g1 - obt�m o valor de g1
		pop lstack	    ; coloca o valor de g1 na LStack L(ct - g2 - g1)

		pop g2			; guarda end_string2 em g2
		push			; duplica o end de string1 - para poder efectuar o stringlen
		pop g1			; guarda end_string1 em g1

		;call tamString		;poderia ser utilizado o do ex_d_1.s
		call stringLen	; obt�m o tamanho da string
		pop ct			; coloca em ct o tamanho da string a copiar

cicloCopia::
		push g1			;coloca o endere�o de string1 em OStack 
		push			;duplica o endere�o da string1 
		inc #1			;incrementa o endere�o da string1
		pop g1			; coloca o endere�o seguinte da string1 em g1
		ld.b []			;carrega o byte actual da string1

		push g2			;coloca o endere�o de string2 em OStack 
		push			;duplica o endere�o da string2
		inc #1			;incrementa o endere�o da string2
		pop g2			; coloca o endere�o seguinte da string2 em g2

		call writeByte  ;temos na Ostack (byte string2 -- )
		dbr cicloCopia  ;executa quantas vezes o tamanho da string1
		
		push lstack		; rep�e g1
		pop g1			; escreve g1

		push lstack		; rep�e g2
		pop g2			; escreve g2

		push lstack		; rep�e ct
		pop ct			;escreve ct

		ret
		
outString::
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
        br  write_string_ciclo			;recome�ar o ciclo de escrita na nova posi��o

write_string_fim::
		pop								;descartar o valor do CR do topo da pilha de operandos
		push lstack						;obter o endere�o da string que est� na pilha local
		pop								;descartar o endere�o
	
		ret
		
		
inicio::
		push #string1
		
		push				;s� para testar
		call io_printString	;s� para testar
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		push				;s� para testar
		pop g4				;s� para testar
		
		push #string2
		push				;s� para testar
		pop g5				;s� para testar
		
		;call stringCopy
		call Copia

		push g4				;s� para testar
		call io_printString	;s� para testar
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		
		push g5				;s� para testar
		call io_printString	;s� para testar
		halt
   		.end