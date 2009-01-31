
.file "biblioteca6.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Table of Contents                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   1. getElemAddr                                       ;
;   2. getNlinhas                                        ;
;   3. getNcolunas                                       ;
;   4. io_readMatriz                                     ;
;   5. io_printMatriz                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Nesta biblioteca assume-se o seguinte formato para a definição da matriz
;
;mat::
;		.long	4		;numero de linhas
;		.long	5		;numero de colunas
;		.space.l 20	;espaço para os dados do tipo long
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;getElemAddr(addr i j -- addr_ij)
;
;desc:
;		retorna o endereço da posição i j da matriz
;
;input:
;		addr: o endereço base matriz
;		i:    indice das linhas
;		j:    indice das colunas
;output:
;		addr_ij: endereço da posição i j
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getElemAddr::
	pop	lstack
	pop	lstack
	pop	lstack
	ld	[r0++]
	pop
	ld	[r0++]
	push 	lstack
	xcg
	push	lstack
	call mymulu
	pop
	push	lstack
	add
	shl	#2	;multiplicar por 4
	add
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;getNlinhas(addr -- nlinhas)
;
;desc:
;		retorna o numero de linhas
;
;input:
;		addr: o endereço base matriz
;output:
;		nlinhas: numero de linhas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getNlinhas::
	ld	[]
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;getNcolunas(addr -- ncolunas)
;
;desc:
;		retorna o numero de colunas
;
;input:
;		addr: o endereço base matriz
;output:
;		nlinhas: numero de colunas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getNcolunas::
	inc	#4
	ld	[]
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;io_readMatriz(addr--)
;
;desc:
;		lê uma matriz de longs
;
;input:
;		addr: o endereço base da matriz
;output:
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
io_readMatriz::
	push	ct
	pop	lstack
	push.n	#0
	push	
	pop	lstack
	pop	lstack
	push	
	call  getNcolunas
	pop 	lstack
	push	
	call  getNlinhas
	pop	lstack
	pop	lstack	; r0:addr	r1:nlinhas	r2:ncolunas	r3: indice das linhas	r4:indice das colunas
	push	r1
	pop	ct
	io_readMatriz_ciclo_i::
		push	ct
		pop	r1
		push	r2
		pop	ct
		push.n	#0
		pop	r4
		io_readMatriz_ciclo_j::
			call 	io_readLong
			push	r0
			push	r3
			push	r4
			call	getElemAddr
			st	[]
			pop
			push	r4
			inc	#1
			pop	r4
		dbr io_readMatriz_ciclo_j
		push	r3
		inc	#1
		pop	r3
		push	r1
		pop	ct
	dbr io_readMatriz_ciclo_i
	push.n	#5
	pop	ct
	io_readMatriz_ciclo::
		push	lstack
		pop
	dbr 	io_readMatriz_ciclo
	push	lstack
	pop	ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;io_printMatriz(addr--)
;
;desc:
;		lê uma matriz de longs
;
;input:
;		addr: o endereço base da matriz
;output:
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
io_printMatriz::
	push	ct
	pop	lstack
	push.n	#0
	push	
	pop	lstack
	pop	lstack
	push	
	call  getNcolunas
	pop 	lstack
	push	
	call  getNlinhas
	pop	lstack
	pop	lstack	; r0:addr	r1:nlinhas	r2:ncolunas	r3: indice das linhas	r4:indice das colunas
	push	r1
	pop	ct
	io_printMatriz_ciclo_i::
		push	ct
		pop	r1
		push	r2
		pop	ct
		push.n	#0
		pop	r4
		io_printMatriz_ciclo_j::
			push	r0
			push	r3
			push	r4
			call	getElemAddr
			ld	[]
			call 	io_printLong

			push.b	#','
			call io_printByte

			push	r4
			inc	#1
			pop	r4
		dbr io_printMatriz_ciclo_j

		push.b	#'\n'
		call io_printByte

		push	r3
		inc	#1
		pop	r3
		push	r1
		pop	ct
	dbr io_printMatriz_ciclo_i
	push.n	#5
	pop	ct
	io_printMatriz_ciclo::
		push	lstack
		pop
	dbr 	io_printMatriz_ciclo
	push	lstack
	pop	ct
ret