; Enunciado:
;
; E1:	Desenvolva uma rotina que permita ler um caracter [ASCII] do teclado e o deixe no topo da stack.
;	inCaracter( -- c)
;

.file "ex_e_1_moodle_res.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000
        br inicio

inCaracter::					; -- b)

	key							; (-- b) obtém o valor ASCII da tecla pressionada e coloca o valor em formato hexadecimal na stack de operandos
	ret
								
inicio::
	call inCaracter
	
	push						;para testar: apenas para o valor ser mostrado no ecrã e permitir ainda utilizá-lo
	emit						;para testar: (b --)mostra o caracter na janela de output
	
	halt
	.end