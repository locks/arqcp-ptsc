;
;	Exercício treino para teste das séries E e F
;
;	Eliminar o caracter indexado de uma string e ajustá-la, diminuindo o seu comprimento em uma unidade
;	apagaCx( stringAddr index -- )
;
;	Pode-se recorrer às rotinas stringCopy e escrb
;

.file  "Extra5.s"
.include  "auxil.s"      		; definições auxiliares
.include  "Biblioteca1.s"		; Biblioteca 
.include  "Biblioteca2.s"		; Biblioteca 
.include  "Biblioteca3.s"		; Biblioteca 
.org 0x400    	    			; programa inicia-se no byte 0x400
	br inicio
	
str::  .byte "Olá Nuovo Mundo!",0	

apagaC1::			; Rotina desenvolvida no exercicio anterior
	pop lstack
	
	loop::
		push r0
		inc #1
		ld.b []
		push
		push #'0'
		sub
		bz fim
		push r0
		xcg
		call escrb
		push r0
		inc #1
		pop r0
		br loop
	
	fim::
		push r0
		xcg
		call escrb
		push lstack
		pop
	
	ret

apagaCx::
	add
	call apagaC1
	
	ret
	
	
inicio::
	push #str
	push #5
	call apagaCx
	halt
	.end