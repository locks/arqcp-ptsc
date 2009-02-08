; Enunciado:
;
; G10:	Faça uma função que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posições de memória, efectue a multiplicação das duas matrizes.
;	A matriz resultado deverá ser guardada a partir do endereço de memória da matriz M3.
;	MultiplicacaoMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_10.s"
.include "auxil.s"      		; definições auxiliares
.include "biblioteca1.s"			; biblioteca de funções
.include "biblioteca4.s"
.include "biblioteca6.s"
.include "auxiliar.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio

m1:: .long 2,3,1,3,5,2,4,6
m2:: .long 3,5,1,4,7,10,13,2,5,8,11,14,3,6,9,12,15
m3:: .space.l 50

MultiplicacaoMat::

		pop lstack ;m3 = r2
		pop lstack ;m2 = r1
		pop lstack ;m1 = r0
	
		push r0
		inc #4
		ld []
		push r1
		ld []
		sub
		
		bz matok
		push.b #'E'
		emit
		push lstack
		pop
		push lstack
		pop		
		push lstack
		pop
		ret

matok::
	push r0
	ld []
	push r2
	st []
	push r1
	inc #4
	ld []
	push r2
	inc #4
	st []
	pop lstack ;r3 nº col
	pop lstack ;r2 nº linhas
	push r1	
	pop lstack ;r1 nº coluna corrente
	push r1
	pop lstack ;r0 linha corrente

ciclo::
	push r0 ; linha corrente
	push r1 ; coluna corrente
	push r4 ; m1
	push r5 ; m2
	push r6 ; m3
	call fazer_um_elemento
	push r0
	dec #1
	push 
	pop r0
	bz mudar_col
	br ciclo

mudar_col::
	push r3
	pop r0
	push r1
	dec #1
	push
	pop r1
	bz fim3
	br ciclo

fim3::
	push lstack
	pop	
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	ret

fazer_um_elemento::		;(l col m1 m2 m3 --)
	push ct
	pop lstack
	pop lstack	; r0 = l
	pop lstack	; r1 = col
	pop lstack	; r2 = m1
	pop lstack	; r3 = m2
	pop lstack	; r4 = m3
	push r3
	call getNlinhas
	pop ct
	push.n #0
ciclo1::
	push r2  ; matriz_1
	push ct 
	dec #1  ; coluna (ct -1 )
	push r0  ; (linha d trabalho constante)
	call matrizes_le_elemento
	push r3  ; matriz_2
	push r1  ; coluna constante
	pop ct   ; linha ( ct -1 )
	dec #1
	call matrizes_le_elemento
	call mymulu
	pop
	add
	dbr ciclo1

	push lstack
	push r4
	push r1
	push r0
	pop lstack
	call matrizes_grava_elemento
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop ct
	ret
	

inicio::

		push #m1
		push #m2
		push #m3

		call MultiplicacaoMat

        	halt
       		.end