
.file "biblioteca4.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        Table of Contents                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   1. eum                                               ;
;   2. eigual                                            ;
;   3. junta4b                                           ;
;   4. cifra                                             ;
;   5. decifra                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

	