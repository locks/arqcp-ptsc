; Enunciado:
;
; C4:	Tendo dois n�meros de 32 bits que representam um deles o endere�o IP de uma m�quina e o outro a m�scara dessa rede,
;	fa�a uma rotina que lhe permita detectar o endere�o da rede em causa e o seu espa�o de endere�amento de hosts.
;	RedeHost(m�scara endere�o -- end_rede end_host) 
;

.file "exc4.s"

.include "auxil.s"      		; defini��es auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca.s"			; biblioteca de fun��es

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