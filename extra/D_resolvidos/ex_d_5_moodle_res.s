; Enunciado:
;
; D5:	Faça uma rotina que permita detectar se duas strings colocadas em memória são iguais.
;	Caso sejam deverá deixar -1 no topo da stack; caso não sejam deverá deixar 0 (zero).
;	Iguais(end_s1 end_s2 -- n1)
;

.file "ex_d_5.s"
.include "auxil.s"      		; definições auxiliares
.include "string.s"
.include "write_byte_word.s"

.org 0x200        				; programa inicia-se no byte 4096 = 0x1000
        br inicio

string1: .byte "is5",0
string2: .byte "is",0
string3: .byte "is",0

Iguais::						;(end_string1 end_string2 -- iguais)
		push					;duplica o endereço da string2
		call stringLen			;obtém o tamanho da string2 (string2 -- tamanho2)
	
		rev						;(string2 tamanho2 string1)
		push					;duplica o endereço da string1
		call stringLen			;obtém o tamanho da string1
		
		rev						;(string2 tamanho2 string1 tamanho1) => (string2 string1 tamanho1 tamanho2)
		xor						;verifica se tem o mesmo tamanho
		bz cicloIguais			;se o resultado for 0, significa que têm o mesmo tamanho e é necessário analisar o conteúdo

		pop						; se não tiver o mesmo tamanho limpa lstack - string1
		pop						; limpa string 2

		push.l #0				; retorno - deixa 0 não são iguais
		ret

cicloIguais::					;(string2 string1)
		push					;duplica string1 (string2 string1 string1)
		pop lstack				;coloca na lstack (string2 string1) (L:string1)
		ld.b []					;lê um byte da string1 (string2 byteS1) 

		xcg						;(byteS1 string2)

		push					;duplica string2 (byteS1 string2 string2)
		pop lstack				;(byteS1 string2) (L:string1 string2)
		ld.b []					;lê um byte da string2 (byteS1 byteS2)

		push					;duplica o byte lido para ver se é o byte final
		bz saoIguais			;se têm o mesmo tamamnho e chegaram ao mesmo tempo aqui, e têm 0 no fim, significa que são iguais

		xor						;caso contrário compara o byte da s1 com o da s2
		eqz						;faz o inverso, por isso, se forem iguais dá -1 e não entra no bz seguinte
		bz diferentes			

		push lstack				;coloca o endereço string2 na OStack		
		inc #1					;incrementa string2
		push lstack				;coloca o endereço string1 na OStack	
		inc #1					;incremente string1
		br cicloIguais

diferentes:
		push #0
		br fimIguais

saoIguais::
		pop			; caracter string 1
		pop			; caracter string 2

		push #-1		; retorno

fimIguais::
		push lstack		; end string 1
		pop
		push lstack		; end string 1
		pop

		ret
	
inicio::
		push #string1
		push #string2
		call Iguais

		push #string2
		push #string3
		call Iguais

		halt
       	.end