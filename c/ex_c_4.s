; Enunciado:
;
; C4:	Tendo dois n�meros de 32 bits que representam um deles o endere�o IP de uma m�quina e o outro a m�scara dessa rede,
;	fa�a uma rotina que lhe permita detectar o endere�o da rede em causa e o seu espa�o de endere�amento de hosts.
;	RedeHost(m�scara endere�o -- end_rede end_host) 
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