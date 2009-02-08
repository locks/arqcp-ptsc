; Enunciado:
;
; D3:	Tendo duas strings em memória, terminando cada uma delas com o valor 0 (zero), faça uma rotina que as junte numa só que termina também com o valor 0 (zero).
;	No programa principal determine ainda a sua dimensão.
;	Junta(end_s1 end_s2 end_s3 -- );

.file "ex_d_3.s"


.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio
.include "auxil.s"      	; definições auxiliares
.include "string.s"			
.include "write_byte_word.s"			
.include "io_biblioteca.s"	;só para testar o resultado
.include "mul_div.s"		;só para testar o resultado

string1:: .byte	"isto é uma string ",0
string2:: .byte	"e ainda outra string",0
string3:: .space.b 200


Junta::					;end_s1 end_s2 end_s3 -- )
		pop lstack		;reserva end_string3 (r2)
		pop lstack		;reserva end_string2 (r1)
		pop lstack		;reserva end_string1 (r0)
						;ficamos com a seguinte LStack (L: string3 string2 string1)
		
		push r0			;coloca o endereço da string1 em OStack
		push r2			;coloca o endereço da string3 em OStack
		;call copia			;podia-se utilizar o resultado do ex_d_2.s
		call stringCopy ;(origem destino -- ) = (string1 string3 --)  copia a string 1 para a string 3
							
		
		push r0			;coloca o endereço da string1 em OStack
		;call tamString
		call stringLen	;obtém o tamanho da string 1
		
		push r2			;coloca o endereço da string3 na OStack
		add				;adiciona ao endereço da nova string (string3) o número de bytes copiados da string1
		dec #1			;decrementa um para escrever a string 2 por cima do 0, para haver continuidade da string
		pop r2			;coloca o endereço a escrever da string3 em r2

		push r1			;coloca o endereço da string2 em OStack 
		push r2			;coloca o endereço da string3 em OStack
		;call copia
		call stringCopy	;;(origem destino -- ) = (string2 string3 --)  copia a string2 para a string3
		
		push lstack		;coloca o endereço da string1 na OStack
		pop				;remover
		push lstack		;coloca o endereço da string2 na OStack
		pop				;remover
		push lstack		;coloca o endereço da string3 na OStack
		pop				;remover
		
		ret
				
		
inicio::
		push #string1
		push 				;só para testar
		call io_printString	;só para testar
		
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		
		push #string2
		push 				;só para testar
		call io_printString	;só para testar
		
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		
		push #string3
		push				;só para testar
		pop g5				;colocar o endereço da string3 em g5

		call Junta	
		
		push g5				;só para testar
		call io_printString	;só para testar
        
		halt
       	.end