.file "biblioteca1.s"

;mydivu( n1_low n1_high n2 -- quociente resto )
;desc:	n1_high n1_low/n2=quociente resto
;input: 
;	n1_low: dividendo(parte baixa do numero de 64 bits)
;	n1_high:dividendo(parte baixa do numero de 64 bits)
;	n2: divisor
;		
;output:
;	quociente: quociente 
;	resto: resto
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		      
mydivu:: 
		push 	g0    		
        pop 	lstack
        pop  	g0      			; colocar o divisor em g0
        divu
        push 	lstack
        pop 	g0      			; recuperar o registo g0
        ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;mymulu ( n1 n2 -- n3_low n3_high )
;desc:	n1*n2=(n3_highn3_low)(64 bits)
;input:
;	n1: multiplicando
;	n2: multiplicador
;		
;output:
;	n3_low: resultado(parte baixa do numero de 64 bits)
;	n3_high: resultado(parte baixa do numero de 64 bits)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		      
mymulu::
	push 	g0      
        pop 	lstack
        pop  	g0      ; colocar n2 em g0
        push.n 	#0
        mulu
        push 	lstack
        pop 	g0      ; recuperar o registo g0
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;escrb (byte addr -- )
;desc:	escreve um byte na memória 
;input:
;	byte: o byte a guardar
;	addr: o endereço a guardar o byte
;output:
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
escrb::	
	push	x
	pop		lstack
	pop		x
	ld 		[x]
	replb
	st 		[x]
	push	lstack
	pop		x
	ret	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;escrw (word addr -- )
;desc:	escreve um word na memória 
;input:
;	word: a word a guardar
;	addr: o endereço a guardar a word
escrw::	
	push x
	pop lstack
	pop x
	ld [x]
	replw
	st [x]
	push lstack
	pop x
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;estadentro (lim_inf lim_sup valor -- 0|f)
;desc:	verificar se  um valor pertence a um intevalo
;input:
;	lim_inf: o limite inferior
;	lim_sup: o limite superior
;	valor: o valor a verificar
;output:
;	0|f: 
;			f: se o valor esta dentro dos limites(inclusivé)
;			0: em caso contrario
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
estadentro::	
	pop	lstack			;valor->r2
	pop	lstack			;lim_sup->r1
	pop	lstack			;lim_inf->r0

	push	r2
	push	r0
	mxm		
	xcg
	pop
	push	r2
	sub

	push	r2
	push	r1
	mxm		
	pop
	push	r2
	sub

	or
	eqz
	push	lstack		
	pop	
	push	lstack			
	pop
	push	lstack			
	pop

	ret	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;emaiorouigual (valor1 valor2 -- maior 0|f)
;desc:	verifica se valor2 é maior ou igual ao valor1
;input:
;	valor1: o valor a verificar
;	valor2: o valor a verificar
;
;output:
;	maior:	o valor maior
;	0|f: 
;			f: se o valor2 é maior ou igual ao valor1
;			0: em caso contrario
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		      
emaiorouigual::
		xcg
		push
		pop		lstack
		mxm
		xcg		
		push	lstack
		sub
		eqz
		ret
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;eum ( n1 n2-- 0|-1) 
;desc:	verifique se o bit n2 (numero de ordem)de n1 é um . 
;	Se sim a rotina deixa -1 na stack, senão deixa 0
;input:
;	n1: numero (32 bits)
;	n2: número de ordem do bit a considerar
;output:
;			-1: se o numero é par
;			0: em caso contrario
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
eum::
	dec		#1
	push.n	#1
	xcg
	shift
	and
	eqz
	eqz
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;eigual ( n1 n2 -- 0|-1) 
;desc:	verifique se os números de 32 bits sem sinal  são iguais. 
;	Se sim a rotina deixa -1 na stack, senão deixa 0
;input:
;	n1: valor (32 bits)
;	n2: valor (32 bits)
;       
;output:
;			-1: se os numero são iguais
;			0: em caso contrario
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
eigual::
	xor
	eqz
ret

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
		;junta4b ( b0 b1 b2 b3 -- n )	
		;desc:	junta 4 bytes num long
		;input:
		;	b0 b1 b2 b3: valores a juntar (bytes)
		;
		;output:
		;	n: numero de 32 bits com a concatenação dos 4 bytes
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
		junta4b::  	
			push.b #0xff 
		    	and
			shl #8

			xcg
			push.b #0xff
			and
			or
			shl #8

			xcg
			push.b #0xff
			and
			or
			shl #8

			xcg
			push.b #0xff
			and
			or

			ret   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
		;cifra ( n1 n2 -- n3) 
		;desc:	dado o numero n1 e a chave n3, cifra n1 com a chave n2. 
		;	
		;input:
		;	n1: valor (32 bits)
		;	n2: chave (32 bits)
		;
		;output:
		;			n3: valor cifrado
		;			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
cifra::
	xor
ret
		    
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
		;decifra ( n1 n2 -- n3) 
		;desc:	dado o numero n1 e a chave n3, decifra n1 com a chave n2. 
		;	
		;input:
		;	n1: valor (32 bits)
		;	n2: chave (32 bits)
		;
		;output:
		;			n3: valor decifrado
		;			
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
decifra::
	xor
ret
                
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
				;stringLen( addr_string -- len) 
				;desc:	Rotina que calcula o comprimento duma string, assumindo que o último cracter é o \0
				;input:
				;	addr_string: enderço da string
				;output:
				;	len: número de caracters da string(exceptuando o \0)
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
				;desc:	Rotina que copia o conteúdo duma string para outra. 
				;	Não tem em atenção os tamnhos das strings
				;input:
				;	addr_string_source: enderço da string de origem
				;	addr_string_dest: enderço da string de destino
				;output:
				;	len: número de caracters copiados
				;	
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
				;desc:	Rotina que copia o conteúdo duma string para outra tendo em atenção  
				;	o numero de caractres da string de destino
				;input:
				;	addr_string_source: enderço da string de origem
				;	addr_string_dest: enderço da string de destino
				;	len_dest: numero de bytes da string de destino
				;output:
				;	len: número de caracters copiados
				;
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
				;desc:	Rotina que compara o conteúdo de duas strings
				;input:
				;	addr_string_1: enderço da string 1
				;	addr_string_2: enderço da string 2
				;output:
				;			-1: se o forem iguais 
				;			0: em caso contrario
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
	br  	stringCmp_fim

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

stringCmp_fim::
	eqz
	push	lstack
	push	lstack
	pop
	pop
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;num2ascii(b  --  a)	
;desc:	altera um numerico para ascii 
;input:
;	b: byte a alterar
;output:
;	a: codigo ascii do b
;;;;;;;;;;;	
num2ascii::
	push.b	#'0'
	add
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;ascii2num(a  --  b)	
;desc:	altera um ascii para numerico 
;input:
;	a: byte a alterar
;output:
;	b: valor do a
;;;;;;;;;;;	
ascii2num::
	push.b	#'0'
	sub
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_printByte (b  --  )	
;desc:	imprime na consola um byte
;input:
;	b: byte a imprimir
;output:
;	
;;;;;;;;;;;	
io_printByte::
	emit
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_printString ( addr  -- )	
;desc:	imprime no terminal uma string colocada na memória. 
;	A função recebe como parâmetros o endereço da string. 
;	A string possui no seu fim um byte com o valor 0 (zero). 
;input:
;	addr: endereço do strings (bytes)
;
;output:
;	
;;;;;;;;;;;;	
io_printString ::  
	pop 	lstack          
io_printString_loop::        
	push 	r0
	ld.b 	[]
	push
	bz  io_printString_end

	call io_printByte
	push 	r0
	inc 	#1
	pop 	r0
	br  io_printString_loop

io_printString_end::
	pop
	push lstack
	pop
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_readByte ( --  b)	
;desc:	lê da consola um byte para a stack
;input:
;	
;output:
;	b: byte lido (codigo ascii)
;;;;;;;;;;;	
io_readByte ::
	key
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_readString ( addr len  -- num )	
;desc:	lê do "terminal" uma string terminada por CR 
;	tendo em atenção o tamanho da string. 
;	A função deve escrever na memória os caracteres lidos a partir 
;	de um determinado endereço, e guardar no fim da string o byte 0 (zero) 
;	deixando na stack o número de caracteres lidos. 
;	O  "Carriage Return" não deve ser guardado na memória nem  deve ser contado
;	O backspace elimina os caracteres já digitados
;input:
;	addr: endereço do strings (bytes)
;	len: dimensão da string
;
;output:
;	num: numero de caracteres efectivamente lidos
;;;;;;;;;;;;;;;;;;
io_readString::  
	push		ct
	pop		lstack
	dec		#1
	pop		ct
	push.n	#0
	pop		lstack
	pop		lstack		;r0:addr; r1:contador
	io_readString_loop::
		call io_readByte 
		push
		push.b 	#0xd			;CR
		sub
		bz 	io_readString_end
		push
		call io_printByte
		push
		push.b	#0x8			;backspace
		sub
		bz 	io_readString_backspace
		push 	r0
		call 	escrb
		
		push 	r0  
		inc 	#1
		pop 	r0

		push 	r1  
		inc 	#1
		pop 	r1
	dbr io_readString_loop
	push.b	#'\n'
	br io_readString_end

	io_readString_backspace::
		pop
		push 	r1
		bz	io_readString_loop
		
		push 	ct
		inc 	#1
		pop 	ct

  		push 	r1
		dec 	#1
		pop 	r1

  		push 	r0
		dec 	#1
		pop 	r0

	br io_readString_loop

	io_readString_end::  
		call io_printByte
		push.n 	#0
		push 	r0
		call 	escrb 
		push.b	#'\n'
		call io_printByte
			
		push 	lstack
		pop
		push 	lstack
		push 	lstack
		pop     ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_printLong (n -- )	
;desc:	a função recebe um valor(positivo) de 32 bits e imprime-o no terminal.
;
;input:
;	n	: valor a imprimir	
;
;output:
;	
;;;;;;;;;;;;;;
io_printLong::
	push		ct
	pop		lstack
	push.n	#0
	pop		lstack
	io_printLong_loop::
		push		
		bz		io_printLong_end
		push.n	#0
		push.b	#10
		call mydivu
		xcg
		push		r0
		inc		#1
		pop		r0
	br io_printLong_loop
	io_printLong_end::
	pop
	push	lstack
	push
	bz io_printLong_zero
	pop		ct
	io_printLong_loop1::
		call num2ascii
		call io_printByte
	dbr io_printLong_loop1
	br io_printLong_end1
	io_printLong_zero::
		push.b	#'0'
		add
		call io_printByte
	io_printLong_end1::
	push	lstack
	pop 	ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_readLong ( -- n)	
;desc:	a função lê da consola um valor(positivo) de 32 bits até o CR seja digitado.
;
;input:
;		
;
;output:
;	n	: valor lido
;;;;;;;;;;;;;;
io_readLong ::
	push		ct
	pop		lstack
	push		g0
	pop		lstack
	push.n	#0
	pop		g0
	io_readLong_loop::
		call io_readByte
		push	
		call	io_printByte
		push	
		push		#0xd
		sub	
		bz		io_readLong_end
		push	
		push		#0x8; CR
		sub	
		eqz		
		bz		io_readLong_notcr
		pop
		push		g0
		bz		io_readLong_loop

		push		lstack		;retira lstack
		pop
		push		g0
		dec		#1
		pop		g0
		br io_readLong_loop
		io_readLong_notcr::
			pop		lstack		;guarda na lstack
			push		g0
			inc		#1
			pop		g0
		br io_readLong_loop
	io_readLong_end::
	pop
	push	g0
	bz io_readLong_zero
	push	g0
	pop	ct
	io_readLong_loop1::
		push		lstack
		call ascii2num
	dbr io_readLong_loop1
	push	g0
	pop		ct
	push.n	#0
	io_readLong_loop2::
		push.b	#10
		call		mymulu
		pop
		add
	dbr io_readLong_loop2
	br io_readLong_end1
	io_readLong_zero::
		push.b	#0
	io_readLong_end1::
	push	lstack
	pop 	g0
	push	lstack
	pop 	ct
	push.b	#'\n'
	call io_printByte
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_readVector (addr len -- )	
;desc:	lê do "terminal" um len dígitos(long) e armazena-os a partir 
;		do enedreço addr 
;
;input:
;	addr: endereço do vector (long)
;	len: dimensão do vector
;output:
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

io_readVector::
	push	ct
	pop 	lstack
	pop		ct
	pop		lstack		;r0=addr r1=ct
	io_readVector_ciclo::
		call io_readLong
		st[r0++]
	dbr		io_readVector_ciclo
	push	lstack
	pop
	push	lstack
	pop		ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;io_printVector (addr len -- )	
;desc:	escreve no "terminal" len dígitos(long) a partir 
;		do enedreço addr. Os digitos são separados por um espaço
;
;input:
;	addr: endereço do vector (long)
;	len: dimensão do vector
;output:
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
io_printVector::
	push	ct
	pop 	lstack
	pop		ct
	pop		lstack		;r0=addr r1=ct
	io_printVector_ciclo::
		ld[r0++]
		call io_printLong
		push.b	#' '
		emit
	dbr		io_printVector_ciclo
	push	lstack
	pop
	push	lstack
	pop		ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;maiorVector (addr len -- maior)	
;desc:	dado um vector de longs determina qual o maior elemento do vector
;
;input:
;	addr: endereço do vector (long)
;	len: dimensão do vector
;output:
;	maior: o maior elemento do vector
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
maiorVector::
	push	ct
	pop 	lstack
	dec		#1
	pop		ct
	pop		lstack		;r0=addr r1=ct
	ld[r0++]
	maiorVector_ciclo::
		ld[r0++]
;		call maior2
	dbr		maiorVector_ciclo

	push	lstack
	pop
	push	lstack
	pop		ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;mediaVector (addr len -- media)	
;desc:	dado um vector de longs calcula a media
;
;input:
;	addr: endereço do vector (long)
;	len: dimensão do vector
;output:
;	media: a media dos elementos do vector
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mediaVector::
	push	ct
	pop 	lstack
	push
	pop 	lstack
	pop		ct
	pop		lstack		;r0=addr r1=len r2=ct
	push.n	#0
	mediaVector_ciclo::
		ld[r0++]
		add
	dbr		mediaVector_ciclo
	push	lstack
	pop
	push.n	#0
	push	lstack
	call	mydivu
	pop
	push	lstack
	pop		ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Nesta biblioteca assume-se o seguinte formato para a definição da matriz
    ;
    ;mat:: 	.long	4 ;numero de linhas
    ;	.long	5 ;numero de colunas
    ;	.space.l 20 ; espaço para os dados do tipo long

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
    ;getElemAddr(addr i j -- addr_ij)	
    ;desc:	retorna o endereço da posição i j da matriz
    ;input:
    ;	addr: o endereço base matriz
    ;	i: indice das linhas
    ;	j: indice das colunas
    ;output:
    ;	addr_ij: endereço da posição i j
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
    ;desc:	retorna o numero de linhas
    ;input:
    ;	addr: o endereço base matriz
    ;	
    ;output:
    ;	nlinhas: numero de linhas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getNlinhas::
	ld	[]
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
    ;getNcolunas(addr -- ncolunas)	
    ;desc:	retorna o numero de colunas
    ;input:
    ;	addr: o endereço base matriz
    ;	
    ;output:
    ;	nlinhas: numero de colunas
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getNcolunas::
	inc	#4
	ld	[]
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
    ;io_readMatriz(addr--)	
    ;desc:	lê uma matriz de longs
    ;input:
    ;	addr: o endereço base da matriz
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
    ;desc:	lê uma matriz de longs
    ;input:
    ;	addr: o endereço base da matriz
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BIBLIOTECA 7 
;
;esta biblioteca assume que a estrutura funcionario é definida da seguinte forma
;
;funcionario::
;		.long		0x0	;número
;		.space.b	50	;nome
;		.space.b	30	;categoria
;		.long		0x0	;vencimento
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;definição de labels
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
num:	.byte "Numero: ",0x0
nome:	.byte "Nome: ",0x0
cat:	.byte "Categoria: ",0x0
venc:	.byte "Vencimento: ",0x0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
;getFuncNumLen(--  len)	
;desc:	retorna o tamanho do campo num
;
;input:
;	
;
;output:
;	len: tamanho do campo	num
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncNumLen::
	push.n	#4
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncNomeLen(--  len)	
        ;desc:	retorna o tamanho do campo nome
        ;
        ;input:
        ;	
        ;
        ;output:
        ;	len: tamanho do campo	nome
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncNomeLen::
	push.b	#50
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncVencLen(--  len)	
        ;desc:	retorna o tamanho do campo venc
        ;
        ;input:
        ;	
        ;
        ;output:
        ;	len: tamanho do campo	venc
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncVencLen::
	push.b	#4
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncCatLen(--  len)	
        ;desc:	retorna o tamanho do campo cat
        ;
        ;input:
        ;	
        ;
        ;output:
        ;	len: tamanho do campo	cat
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncCatLen::
	push.b	#30
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncLen(--  len)	
        ;desc:	retorna o tamanho da estrutura funcionario
        ;
        ;input:
        ;	
        ;
        ;output:
        ;	len: tamanho da estrutura
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncLen::
	call	getFuncNumLen
	call	getFuncNomeLen
	call	getFuncCatLen
	call	getFuncVencLen
	add
	add
	add
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncNumAddr(addr_base  --  addr_num)	
        ;desc:	retorna o endereço do campo num
        ;
        ;input:
        ;	addr_base: endereço base da estrutura funcionario
        ;
        ;output:
        ;	addr_num: endereço do campo num	
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
getFuncNumAddr::
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncNomeAddr(addr_base  --  addr_nome)	
        ;desc:	retorna o endereço do campo nome
        ;
        ;input:
        ;	addr_base: endereço base da estrutura funcionario
        ;
        ;output:
        ;	addr_nome: endereço do campo nome
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncNomeAddr::
	call	getFuncNumLen
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncCatAddr(addr_base  --  addr_cat)	
        ;desc:	retorna o endereço do campo categoria
        ;
        ;input:
        ;	addr_base: endereço base da estrutura funcionario
        ;
        ;output:
        ;	addr_cat: endereço do campo categoria
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncCatAddr::
	call	getFuncNumLen
	call	getFuncNomeLen
	add
	add
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;getFuncVencAddr(addr_base  --  addr_venc)	
        ;desc:	retorna o endereço do campo categoria
        ;
        ;input:
        ;	addr_base: endereço base da estrutura funcionario
        ;
        ;output:
        ;	addr_venc: endereço do campo vencimento
        ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getFuncVencAddr::
	call	getFuncNumLen
	call	getFuncNomeLen
	call	getFuncCatLen
	add
	add
	add
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;io_readFuncionario(addr  --  )	
        ;desc:	lê os dados de um funcionario
        ;		Os dados dos funcionários são os seguintes: 
        ;		o número (4 bytes) 
        ;		o nome (50 bytes)
        ;		a categoria (30 bytes);
        ;		o vencimento (4 bytes).
        ;input:
        ;	addr: endereço
        ;
        ;output:
        ;	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
io_readFuncionario::
	pop		lstack

	push.l	#num
	call 	io_printString
	call	io_readLong
	push	r0
	call 	getFuncNumAddr
	st		[]
	pop

	push.l	#nome
	call 	io_printString
	push	r0
	call 	getFuncNomeAddr

	push.b	#50
	call	io_readString
	pop

	push.l	#cat
	call 	io_printString
	push	r0
	call 	getFuncCatAddr

	push.b	#30
	call	io_readString
	pop

	push.l	#venc
	call 	io_printString
	call	io_readLong
	push	lstack
	call 	getFuncVencAddr
	st		[]
	pop
	pop
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;io_printFuncionario(addr  --  )	
        ;desc:	escreve na consola os dados de um funcionario
        ;		Os dados dos funcionários são os seguintes: 
        ;		o número (4 bytes) 
        ;		o nome (50 bytes)
        ;		a categoria (30 bytes);
        ;		o vencimento (4 bytes).
        ;input:
        ;	addr: endereço
        ;
        ;output:
        ;	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
io_printFuncionario::
	pop		lstack
	push.b	#'\n'
	call	io_printByte
	push.l	#num
	call	io_printString
	push	r0
	call	getFuncNumAddr
	ld		[]
	call	io_printLong
	push.b	#'\n'
	call	io_printByte
	push.l	#nome
	call 	io_printString
	push	r0
	call	getFuncNomeAddr
	call	io_printString
	push.b	#'\n'
	call 	io_printByte
	push.l	#cat
	call 	io_printString
	push	r0
	call 	getFuncCatAddr
	call	io_printString
	push.b	#'\n'
	call 	io_printByte
	push.l	#venc
	call 	io_printString
	push	lstack
	call 	getFuncVencAddr
	ld		[]
	call	io_printLong
	pop
ret

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
        ;io_readNFuncionario(addr n --  )	
        ;desc:	lê os dados de n funcionarios
        ;		Os dados dos funcionários são os seguintes: 
        ;		o número (4 bytes) 
        ;		o nome (50 bytes)
        ;		a categoria (30 bytes);
        ;		o vencimento (4 bytes).
        ;input:
        ;	addr: endereço
        ;	n:	numero de funcionarios
        ;output:
        ;	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
io_readNFuncionario::
	push	ct
	pop	lstack
	pop	ct
io_readNFuncionario_ciclo::
	push
	call	io_readFuncionario
	call	getFuncLen
	add
	dbr	io_readNFuncionario_ciclo
	pop
	push	lstack
	pop	ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;io_printNFuncionario(addr n --  )	
;desc:	escreve os dados de n funcionarios
;		Os dados dos funcionários são os seguintes: 
;		o número (4 bytes) 
;		o nome (50 bytes)
;		a categoria (30 bytes);
;		o vencimento (4 bytes).
;input:
;	addr: endereço
;	n:	numero de funcionarios
;output:
;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
io_printNFuncionario::
	push	ct
	pop		lstack
	pop		ct
io_printNFuncionario_ciclo::
	push
	call	io_printFuncionario
	call	getFuncLen
	add
	dbr	io_printNFuncionario_ciclo
	pop
	push	lstack
	pop	ct
ret