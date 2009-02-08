; Enunciado:
;
; C4:	Tendo dois números de 32 bits que representam um deles o endereço IP de uma máquina e o outro a máscara dessa rede,
;	faça uma rotina que lhe permita detectar o endereço da rede em causa e o seu espaço de endereçamento de hosts.
;	RedeHost(máscara endereço -- end_rede end_host) 
;

.file "exc4.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de funções

RedeHost::
push 
pop g0
and
push g0
push.l #0x0000ffff
and
		ret

	
inicio::
;10.0.0.2
;255.0.0.0

push.l #0xff000000
push.l #0x0a000002

		

		call RedeHost

        	halt
       		.end