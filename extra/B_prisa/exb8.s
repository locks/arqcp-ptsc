; Enunciado:
;
; B8:	Uma loja de venda de CD�s est� a fazer a campanha �Leve 3, Pague 2�.
;	Fa�a uma rotina que partindo do n�mero de unidades de compradas, e sabendo o pre�o por unidade de CD, obtenha como resultado o pre�o a pagar.
;	L3P2 (CDs_adquiridos preco_unitario -- quantia )
;

.file "exb8.s"

.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s" 

n1::	.long	2
n2::	.long	3     		; defini��es auxiliares
n3::    .long   0

mult::

	push 	g0      
        pop 	lstack
        pop  	g0      ; colocar n2 em g0
        push.n 	#0
        mulu
        push 	lstack
        pop 	g0      ; recuperar o registo g0
	ret

l3p2::
	


inicio::

push.l #n1
ld[]
push.l #n2
ld[]
call mult
call l3p2
push.l #n3
st[]
halt
.end
