
.org 0x1000
	br inicio
.include "auxil.s"
.include "Biblioteca1.s"

n1::	.long 0x00232445
	
n2::    .long 0x00232445  ; (quociente)(resto)

; 1.a
; comparaFFFF ( end_num -- n ) : n=0 se valor do end_num > 0xffff, -1 se valor do end_num =< 0xffff  	
	
; 1.b	
comparaFFFF::			; ( end_num -- n ) : n=0 se valor do end_num > 0xffff, -1 se valor do end_num =< 0xffff  
	ld []				; ( val_end_num )
	push #0xFFFF0000	; ( val_end_num 0xFFFF0000)
	and					; ( 0x????0000 )
	bz menor_igual
	push #0
	ret
menor_igual::
	push #-1
	ret
			  
			  
; 1.c	
comparaFFFFc::			; ( end_num -- n ) : n=0 se valor do end_num > 0xffff, -1 se valor do end_num =< 0xffff  
	ld []				; ( val_end_num )
	push #0xFFFF0000	; ( val_end_num 0xFFFF0000)
	and					; ( 0x????0000 )
	eqz					; ( 0 | -1 )
	ret
	
; 2	
quocienteRestoCelula:: ; ( Word Byte EndereçoCelula -- )
	pop lstack			;  ( Word Byte ) ; (L: EndereçoCelula )
	push #0				; ( Word Byte 0 )  ; (L: EndereçoCelula )
	xcg					; ( Word 0 Byte )  ; (L: EndereçoCelula )
	call mydivu			; ( n1_low n1_high n2 -- quociente resto )
						; ( quociente resto )  ; (L: EndereçoCelula )
	xcg					; ( resto quociente )  ; (L: EndereçoCelula )
	shl	#16				; ( resto quociente_high )
	or					; ( quociente_high_resto_low ) ; (L: EndereçoCelula )
	push lstack			; ( quociente_high_resto_low EndereçoCelula ) ; (L: )
	
	st []				; ( )
	ret
	
inicio::

	push #100
	push #3
	push #n2
	call quocienteRestoCelula

	push #n1
	call comparaFFFF
	

	halt
	.end
	