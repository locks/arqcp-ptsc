;
;	Exercício treino para teste das séries E e F
;
;	Imprimir em hexadecimal um inteiro de 32 bits sem sinal em formato hexadecimal
;	io_HexPrintLong ( valor -- )
;
;	usar a rotina io_printByte ( b -- ) da Biblioteca4
;	e tambem, num2hexascii ( valor -- caractere ) que diz-se desenvolvida para este exercicio
;

.file  "Extra6.s"
.include  "auxil.s"      		; definições auxiliares
.include  "Biblioteca1.s"		; Biblioteca 
.include  "Biblioteca2.s"		; Biblioteca 
.include  "Biblioteca3.s"		; Biblioteca 
.include  "Biblioteca4.s"		; Biblioteca 
.org 0x400    	    			; programa inicia-se no byte 0x400
	br inicio
	
str:: .space.b 50
	
io_HexPrintLong::
	pop lstack
	push #str
	pop lstack		; valor em r1, endereço string em r0
	push r1
	ld[]
	call num2hexascii
	push r0
	call escrb

	ret	
	
inicio::
	push #1988
	
	call io_HexPrintLong
	halt
	.end