.file "biblioteca2.s"
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