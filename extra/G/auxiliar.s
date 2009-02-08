matrizes_numero_linhas::			; (end_m -- numero_linhas )
	ld []
ret

matrizes_numero_colunas::		; (end_m -- numero_colunas )
	inc #4
	ld []
ret

matrizes_endereco_elemento::		; (end_m coluna linha -- endereco_elemento )
	pop lstack
	inc #1
	pop lstack
	inc #1
	pop lstack
	push r0
	inc #4
	pop r0
	push r0
	ld []
	push r2
	call mymulu
	pop
	push #4
	call mymulu
	pop
	push r0
	add
	push r0
	ld []
	push #4
	call mymulu
	pop
	sub
	push r1
	push #4
	call mymulu
	pop
	add
	push lstack 
	pop
	push lstack 
	pop
	push lstack 
	pop
ret

matrizes_le_elemento::
	pop lstack
	pop lstack
	pop lstack

	push r0
	inc #4
	pop r0
	push r0
	ld []
	push r2
	ld []
	call mymulu
	pop
	push #4
	call mymulu
	pop
	push r0
	add

	push r0
	ld []
	push #4
	call mymulu
	pop
	sub
		push r1
		ld []
		push #4
		call mymulu
		pop
		add
	    ld []
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
ret

matrizes_grava_elemento::			; (end_m coluna linha elemento -- )
	pop lstack
		pop lstack
		pop lstack
		pop lstack
		push r0
		inc #4
		pop r0
		push r0
		ld []
		push r2
		ld []
		call mymulu
		pop
		push #4
		call mymulu
		pop
		push r0
		add
		
		
		push r0
		ld []
		push #4
		call mymulu
		pop
		sub
		push r1
		ld []
		push #4
		call mymulu
		pop
		add
		push r3
		xcg
		st []
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
		
		ret

matrizes_tamanho_igual::			; 1 = TRUE; 0 = FALSE

		pop lstack
		pop lstack
		push r0
		call getNlinhas
		push r0
		call getNcolunas
		call mymulu
		pop
		push r1
		call getNlinhas
		push r1
		call getNcolunas
		call mymulu
		pop
		sub
		bz igual
		push #0
		br fim
		
igual::
	push #1
	br fim
	

fim::
	push lstack
	push lstack
	pop
	pop
ret
