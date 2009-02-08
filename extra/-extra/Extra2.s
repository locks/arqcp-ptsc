;Exercicio treino para teste das séries E e F
;
;--------- STRING À MODA DO PORTO -----------------------------
;Dada uma string, substituir os 'v' pelos 'b' e os 'V' pelos 'B'
;	fazer a contagem de cada substituição
;	e escrever a nova string no ecrã
;
;(eStr -- bNum BNum)
;

.file "Extra2.s"
.include  "auxil.s"      		; definições auxiliares
.include  "Biblioteca1.s"		; Biblioteca com a rotina escreveByte
.include  "Biblioteca3.s"		; Biblioteca com a rotina io_print_byte
.org 0x400        			; programa inicia-se no byte 0x1000
	br inicio

str1: .byte "Vvós a força está na Vvinha, na Vvontade e no ser da Vvida!V",0
	
Porto::
	pop lstack
	
	loop::
		push r0
		ld.b []
		push.l #'v'
		sub
		bz mete_b
		push r0
		ld.b []
		push.l #'V'
		sub
		bz mete_B
		push r0
		ld.b []
		push.l #'0'
		sub
		bz fim
		push r0
		inc #1
		pop r0
		br loop
	
	mete_b::
		push r0
		push #'b'	; 'b' ficam guardados em g0
		call escrb
		push g0
		inc #1
		pop g0
		push r0
		inc #1
		pop r0
		br loop

	mete_B::
		push r0
		push #'B'	; 'B' ficam guardados em g1
		call escrb
		push g0
		inc #1
		pop g1
		push r0
		inc #1
		pop r0
		br loop
		
	fim::
		push lstack
		pop
		push g1
		push g0
	
	ret


inicio::
	push #str1
	call Porto
	
	halt
	.end