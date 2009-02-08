

.include "auxil.s"
.org 0x1000
	br inicio
	
str::		.byte "0101334456,93940", 0
str2:: 		.byte "0101334456", 0
		

stringChar::      ;  ( string char -- n|-1 )
	push ct
	pop lstack		; (L: copiadoCT ) : Copia valor actual do CT para lstack. No final tem de repor
	
	pop lstack		; ( string ) (L: char )
	pop lstack		; ( ) (L: char string )
	
	push #0
	pop ct			; ct=0 : vamos usar o ct como indice na string
	
loopprocura:: 

	push r0			; ( string )  (L: char string )
	ld.b []			; ( charString )  (L: char string ) : carrega na stack o caractere cujo endereco esta no topo da stack
	
	push			; ( charString charString )  (L: char string )
	bz fim			; ( charString )  (L: char string ) : para terminar caso estamos no fim da string
	
	push r1			; ( charString char ) (L: char string ) : colocamos na stack o caractere a comparar/pesquisar
	xor				; ( 0|<>0 )   (L: char string ) : se ficar 0 na stack encontramos o caractere
	
	bz encontrou
	
	; se estamos aqui é porque ainda nao encontramos. Vamos avancar para o proximo
	push r0
	inc #1
	pop r0		; incrementar para o proximo caracetere () (L: char string+1 )

	push ct
	inc #1
	pop ct		; incrementar o indice em ct
	
	br loopprocura
		
encontrou::	
	; () (L: char string )
	push lstack
	push lstack
	pop
	pop					; () (L:) Libertamos a lstack
	
	push ct				; ( indice ) (L:) colocamos o indice na stack 
	
	push lstack
	pop ct				; repoe o valor original do CT
	ret
	
fim::
	; () (L: char string )
	push lstack
	push lstack
	pop
	pop					; () (L:) Libertamos a lstack

	push lstack
	pop ct				; repoe o valor original do CT
	
	push #-1
	ret
	
	
stringIntDecimal::     ; ( string -- 0|-1 ) : 0 inteiro; -1 decimal

	push #','			; ( string ',' )
	call stringChar		;  ( string ',' -- n|-1 )
	
	inc #1				; ( 0..n+1 ) 0 nao encontrou ; >0 encontrou
	
	eqz 				; ( -1|0 ) -1 se nao encontrou (inteiro); 0 se encontrou (decimal)
	eqz					; (-1|0) 0 se nao encontrou (inteiro); -1 se encontrou (decimal)
	ret
	
inicio::

		push #str
		push #'6'
		call stringChar

		push #str2
		call stringIntDecimal
		
		halt
		.end
		