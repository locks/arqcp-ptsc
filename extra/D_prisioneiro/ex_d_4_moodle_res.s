; Enunciado:
;
; D4:	Tendo uma string em memória que termina com o valor 0 (zero),
;	faça uma rotina que a divida em duas a partir da posição pretendida.
;	No programa principal determine ainda a dimensão de cada uma delas.
; 	Separa(end_s1 end_s2 nIndex -- )
;

.file "ex_d_4.s"

.include "auxil.s"      		; definições auxiliares
.include "string.s"
.include "write_byte_word.s"
.include "io_biblioteca.s"		;só para testar resultados
.include "mul_div.s"			;só para testar resultados

.org 0x1000        				; programa inicia-se no byte 4096 = 0x1000

        br inicio

string1:: .byte	"isto é uma string",0
string2:: .space.b 200 

Separa::						;( addr_string_source addr_string_dest nIndex -- ) 

	xcg							;fica (addr_string_source nIndex addr_string_dest )
	pop lstack					;colocar o endereço da string2 em r0

	add							;adicionar ao endereço da string1 o index pretendido
	push						;duplica o valor a partir de onde deve copiar
	push lstack					;coloca o endereço de string2 na OStack
	call stringCopy				;(endereço_a_copiar endereço_string2) copia os valores até ao zero inclusivé
	
	push #0						;carrega um zero na memória
	xcg							;troca o zero com o endereço da string1
	call writeByte				; (byte end) coloca 0 para finalizar a primeira string

	ret
	
inicio::
		push #string1
		push				;para testar
		pop g4				;para testar
		
		push #string2
		push				;para testar
		pop g5				;para testar
		
		push #8
		call Separa

		push g4				;para testar
		call io_printString	;para testar
		
		push #0xA			;mudar de linha, escrever um line feed
		emit
		
		push g5 			;para testar
		call io_printString	;para testar
		
        halt
       	.end