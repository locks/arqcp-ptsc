; Enunciado:
;
; D3:	Tendo duas strings em mem�ria, terminando cada uma delas com o valor 0 (zero), fa�a uma rotina que as junte numa s� que termina tamb�m com o valor 0 (zero).
;	No programa principal determine ainda a sua dimens�o.
;	Junta(end_s1 end_s2 end_s3 -- );

.file "ex_d_3.s"


.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio
.include "auxil.s"      	; defini��es auxiliares
.include "string.s"			
.include "write_byte_word.s"			
.include "io_biblioteca.s"	;s� para testar o resultado
.include "mul_div.s"		;s� para testar o resultado

string1:: .byte	"isto � uma string ",0
string2:: .byte	"e ainda outra string",0
string3:: .space.b 200


Junta::					;end_s1 end_s2 end_s3 -- )
		pop lstack		;reserva end_string3 (r2)
		pop lstack		;reserva end_string2 (r1)
		pop lstack		;reserva end_string1 (r0)
						;ficamos com a seguinte LStack (L: string3 string2 string1)
		
		push r0			;coloca o endere�o da string1 em OStack
		push r2			;coloca o endere�o da string3 em OStack
		;call copia			;podia-se utilizar o resultado do ex_d_2.s
		call stringCopy ;(origem destino -- ) = (string1 string3 --)  copia a string 1 para a string 3
							
		
		push r0			;coloca o endere�o da string1 em OStack
		;call tamString
		call stringLen	;obt�m o tamanho da string 1
		
		push r2			;coloca o endere�o da string3 na OStack
		add				;adiciona ao endere�o da nova string (string3) o n�mero de bytes copiados da string1
		dec #1			;decrementa um para escrever a string 2 por cima do 0, para haver continuidade da string
		pop r2			;coloca o endere�o a escrever da string3 em r2

		push r1			;coloca o endere�o da string2 em OStack 
		push r2			;coloca o endere�o da string3 em OStack
		;call copia
		call stringCopy	;;(origem destino -- ) = (string2 string3 --)  copia a string2 para a string3
		
		push lstack		;coloca o endere�o da string1 na OStack
		pop				;remover
		push lstack		;coloca o endere�o da string2 na OStack
		pop				;remover
		push lstack		;coloca o endere�o da string3 na OStack
		pop				;remover
		
		ret
				
		
inicio::
		push #string1
		push 				;s� para testar
		call io_printString	;s� para testar
		
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		
		push #string2
		push 				;s� para testar
		call io_printString	;s� para testar
		
		push #0xA			;mudar de linha, escrever um line feed
		emit				;escrever o line feed
		
		push #string3
		push				;s� para testar
		pop g5				;colocar o endere�o da string3 em g5

		call Junta	
		
		push g5				;s� para testar
		call io_printString	;s� para testar
        
		halt
       	.end