;last update @ 2008/10/13

.file "biblioteca3.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        Table of Contents                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   1. stringLen                                         ;
;   2. stringCopy                                        ;
;   3. stringNCopy                                       ;
;   4. stringCmp                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;stringLen( addr_string -- len)
;
;desc:
;		Rotina que calcula o comprimento duma string,
;	assumindo que o �ltimo cracter � o \0
;
;input:
;		addr_string: ender�o da string
;output:
;		len: n�mero de caracters da string (excepto \0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stringLen::
	push #0
	xcg
	pop	lstack
	stringLen_loop::
		push	r0
		ld.b	[]
		bz 	stringLen_end
		inc 	#1
		push	lstack
		inc	#1
		pop	lstack
	br stringLen_loop

stringLen_end::
	push lstack
	pop
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;stringCopy( addr_string_source addr_string_dest -- len)
;
;desc:
;		Rotina que copia o conte�do duma string para outra.
;		N�o tem em aten��o os tamnhos das strings.
;
;input:
;		addr_string_source: endere�o da string de origem
;		addr_string_dest:   endere�o da string de destino
;output:
;		len: n�mero de caracters copiados
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stringCopy::
	push #0
	pop	lstack
	pop	lstack
	pop	lstack
	stringCopy_loop::
		push	r0
		ld.b	[]
		push
		bz	stringCopy_end
		
		push	r1
		call escrb
		push	r0
		inc	#1
		pop	r0
		push	r1
		inc	#1
		pop	r1
		push	r2
		inc	#1
		pop	r2
	br 	stringCopy_loop

stringCopy_end::
	push lstack
	pop
	push	lstack
	call escrb
	push lstack
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;stringNCopy( addr_string_source addr_string_dest len_dest -- len)
;
;desc:
;		Rotina que copia o conte�do duma string para
;	outra tendo em aten��o o numero de caractres da
;	string de destino.
;
;input:
;		addr_string_source: endere�o da string de origem
;		addr_string_dest:   endere�o da string de destino
;		len_dest: numero de bytes da string de destino
;output:
;		len: n�mero de caracters copiados
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stringNCopy::
	push #0
	pop	lstack
	dec	#1
	pop	lstack
	pop	lstack
	pop	lstack
	stringNCopy_loop:: ;r0:addr_string_source r1:addr_string_dest r2: len_dest r3: contador
		push	r2
		push
		bz	stringNCopy_end
		pop
		push	r0
		ld.b	[]
		push
		bz	stringNCopy_end
		
		push	r1
		call escrb
		push	r0
		inc	#1
		pop	r0
		push	r1
		inc	#1
		pop	r1
		push	r2
		dec	#1
		pop	r2
		push	r3
		inc	#1
		pop	r3
	br 	stringNCopy_loop

stringNCopy_end::
	push lstack
	pop
	push	lstack
	call escrb
	push lstack
	pop
	push lstack
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;stringCmp( addr_string_1 addr_string_2 -- 0|-1)
;
;desc:
;		Rotina que compara o conte�do de duas strings
;
;input:
;		addr_string_1: ender�o da string 1
;		addr_string_2: ender�o da string 2
;output:
;		0|-1
;			-1: se o forem iguais 
;			 0: em caso contrario
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stringCmp::	
	pop lstack
	pop lstack
	stringCmp_loop::
		push 	r0
		ld.b	[]
		push 	r1
		ld.b	[]
		xor
		bz 	stringCmp_cont
		
	push.n	#-1
	stringCmp_fim::
		eqz
		push lstack
		push lstack
		pop
		pop
	ret

	stringCmp_cont::
		push 	r0
		ld.b	[]
		push
		bz 	stringCmp_fim
	
		pop
		push	r0
		inc	#1
		pop	r0
		push	r1
		inc	#1
		pop	r1
	br 	stringCmp_loop