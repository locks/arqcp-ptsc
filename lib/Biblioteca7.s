
.file "biblioteca7.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;esta biblioteca assume que a estrutura funcionario é definida da seguinte forma
;
;funcionario::	
;		.long		0x0	;número	
;		.space.b	50	;nome
;		.space.b	30	;categoria
;		.long		0x0	;vencimento
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;definição de labels
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
	pop	lstack
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
	pop	lstack
	push.b	#'\n'
	call 	io_printByte
	push.l	#num
	call 	io_printString
	push	r0
	call 	getFuncNumAddr
	ld		[]
	call 	io_printLong
	push.b	#'\n'
	call 	io_printByte
	push.l	#nome
	call 	io_printString
	push	r0
	call 	getFuncNomeAddr
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	