
.file "biblioteca5.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Table of Contents                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   1. io_readVector                                     ;
;   2. io_printVector                                    ;
;   3. maiorVector                                       ;
;   4. mediaVector                                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;io_readVector (addr len -- )
;
;desc:
;		l� do "terminal" um len d�gitos(long) e armazena-os
;	a partir do enedre�o addr.
;
;input:
;		addr: endere�o do vector (long)
;		len : dimens�o do vector
;output:
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
	dbr io_readVector_ciclo

	push	lstack
	pop
	push	lstack
	pop		ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;io_printVector (addr len -- )
;
;desc:
;		escreve no "terminal" len d�gitos(long) a partir do
;	endere�o addr. Os digitos s�o separados por um espa�o
;
;input:
;		addr: endere�o do vector (long)
;		len: dimens�o do vector
;output:
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
	pop ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;maiorVector (addr len -- maior)
;
;desc:
;		dado um vector de longs determina qual o maior
;	elemento do vector.
;
;input:
;		addr: endere�o do vector (long)
;		len: dimens�o do vector
;output:
;		maior: o maior elemento do vector
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
		call maior2
	dbr		maiorVector_ciclo
	
	push	lstack
	pop
	push	lstack
	pop		ct
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;mediaVector (addr len -- media);
;
;desc:
;		dado um vector de longs calcula a media
;
;input:
;		addr: endere�o do vector (long)
;		len: dimens�o do vector
;output:
;		media: a media dos elementos do vector
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