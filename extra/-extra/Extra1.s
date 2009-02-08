;Exercicio treino para teste das séries E e F
;
;Dada uma string, contar o numero de vogais minusculas
;	(Estr -- aNum eNum iNum oNum uNum)
;

.file "Extra1.s"
.include  "auxil.s"      		; definições auxiliares
.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
	
str1: .byte "Tinha na minha vida, a puta que me fez o melhor broche de sempre!",0	

contaVogais::
	pop lstack
	
	loop::
		push r0
		ld.b []
		push.l #'a'
		sub
		bz contaA
		push r0
		ld.b []
		push.l #'e'
		sub
		bz contaE
		push r0
		ld.b []
		push.l #'i'
		sub
		bz contaI
		push r0
		ld.b []
		push.l #'o'
		sub
		bz contaO
		push r0
		ld.b []
		push.l #'u'
		sub
		bz contaU
		push r0
		ld.b []
		push.l #'0'
		sub
		bz fim
		push r0
		inc #1
		pop r0
		br loop

	contaA::
		push g0
		inc #1
		pop g0
		push r0
		inc #1
		pop r0
		br loop
		
	contaE::
		push g1
		inc #1
		pop g1
		push r0
		inc #1
		pop r0
		br loop
		
	contaI::
		push g2
		inc #1
		pop g2
		push r0
		inc #1
		pop r0
		br loop
		
	contaO::
		push g3
		inc #1
		pop g3
		push r0
		inc #1
		pop r0
		br loop
		
	contaU::
		push g4
		inc #1
		pop g4
		push r0
		inc #1
		pop r0
		br loop

	fim::
		push lstack
		pop
		push g4
		push g3
		push g2
		push g1
		push g0		
	ret
	
inicio::
	push #str1
	call contaVogais
	halt
	.end