;
;	Exercício treino para teste das séries E e F
;
;	Eliminar o primeiro caracter de uma string e ajusta-la, diminuindo o seu comprimenteo em uma unidade
;	apagaC1( stringAddr -- )
;
;	Pode-se recorrer às rotinas stringCopy e escrb
;


.file  "Extra4.s"
.include  "auxil.s"      		; definições auxiliares
.include  "Biblioteca1.s"		; Biblioteca 
.include  "Biblioteca2.s"		; Biblioteca 
.include  "Biblioteca3.s"		; Biblioteca 
.org 0x400    	    			; programa inicia-se no byte 0x400
	br inicio

str::  .byte "Olá Novo Mundo!",0

apagaC1::
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
	

inicio::
	push #str
	call apagaC1
	halt
	.end