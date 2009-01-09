; Enunciado:
;
; C4:	Tendo dois números de 32 bits que representam um deles o endereço IP de uma máquina e o outro a máscara dessa rede,
;	faça uma rotina que lhe permita detectar o endereço da rede em causa e o seu espaço de endereçamento de hosts.
;	RedeHost(máscara endereço -- end_rede end_host) 
;

.file "ex_c_4.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

RedeHost::

ret

inicio::

	call RedeHost

	halt
.end