; Enunciado:
;
; B8:	Uma loja de venda de CD�s est� a fazer a campanha �Leve 3, Pague 2�.
;	Fa�a uma rotina que partindo do n�mero de unidades de compradas, e sabendo o pre�o por unidade de CD, obtenha como resultado o pre�o a pagar.
;	L3P2 (CDs_adquiridos preco_unitario -- quantia )
;

.file "ex_b_8.s"

.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; defini��es auxiliares

l3p2::
		completar

		ret


inicio::
		completar
		
		call l3p2

	       	halt
       		.end
