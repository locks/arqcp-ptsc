
.file "biblioteca1.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        Table of Contents                               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   1. mydivu                                            ;
;   2. mymulu                                            ;
;   3. escrb                                             ;
;   4. escrw                                             ;
;   5. estadentro                                        ;
;   6. emaiorouigual                                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;mydivu( n1_low n1_high n2 -- quociente resto )
;
;desc:
;		n1_high n1_low/n2=quociente resto
;
;input: 
;		n1_low: dividendo(parte baixa do numero de 64 bits)
;		n1_high:dividendo(parte baixa do numero de 64 bits)
;		n2: divisor
;output:
;		quociente: quociente 
;		resto: resto
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
;
;desc:
;		n1*n2=(n3_highn3_low)(64 bits)
;
;input:
;		n1: multiplicando
;		n2: multiplicador
;output:
;		n3_low: resultado(parte baixa do numero de 64 bits)
;		n3_high: resultado(parte baixa do numero de 64 bits)
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
;
;desc:
;		escreve um byte na memória 
;
;input:
;		byte: o byte a guardar
;		addr: o endereço a guardar o byte
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
;
;desc:
;		escreve um word na memória
;
;input:
;		word: a word a guardar
;		addr: o endereço a guardar a word
;output:
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;
;desc:
;		verificar se  um valor pertence a um intevalo
;
;input:
;		lim_inf: o limite inferior
;		lim_sup: o limite superior
;		valor: o valor a verificar
;output:
;		0|f: 
;			f: valor esta dentro dos limites (inclusivé)
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
;
;desc:
;		verifica se valor2 é maior ou igual ao valor1
;
;input:
;		valor1: o valor a verificar
;		valor2: o valor a verificar
;output:
;		maior: o valor maior
;		0|f:
;			f: se o valor2 é maior ou igual ao valor1
;			0: em caso contrario
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		      
emaiorouigual::
	xcg
	push
	pop lstack
	mxm
	xcg
	push lstack
	sub
	eqz
ret