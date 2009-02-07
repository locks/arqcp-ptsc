.file "exame_1.s"
.include "lib/auxil.s"

.org 0x1000
	br inicio

difHora::
	push.l #0
	push
	push
	pop lstack ;r4 flag minutos
	pop lstack ;r3 flag horas
	
	pop lstack ;r2 hor2
	pop lstack ;r1 min2
	pop lstack ;r0 seg2
	
	rev			; (min1 hor1 seg1 --)
	push lstack ; (min1 hor1 seg1 seg2 --)
	sub			; (min1 hor1 res_seg --)
	call verifica_segundos
		;
		;   esta rotina verifica se o res_seg é menor que
		; zero. se sim, incrementa a flag_minutos.
		;
	
	rev			; (hor1 res_seg min1 --)
	push lstack ; (hor1 res_seg min1 min2 --)
	sub			; (hor1 res_seg res_min --)
	call verifica_minutos
	
	rev			; (res_seg res_min hor1 --)
	push lstack	; (res_seg res_min hor1 hor2--)
	sub			; (res_seg res_min res_hor --)
	
	pop lstack	; (res_seg res_min res_hor flag_hor --)
	sub
	xcg			; (res_seg hor_fim res_min --)
	pop lstack	; (res_seg hor_fim res_min flag_min --)
	sub			; (res_seg hor_fim min_fim)
	xcg
ret

inicio::
	push.n #seg1
	ld []
	push.n #min1
	ld []
	push.n #hor1
	ld []
	push.n #seg2
	ld []
	push.n #min2
	ld []
	push.n #hor2
	ld []
	call difHora

	halt
.end