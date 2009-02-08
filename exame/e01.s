.file "exame_1.s"
.include "lib/auxil.s"

.org 0x1000
	br inicio

difHora::
	call converte_para_segundos
	pop lstack
	call converte_para_segundos
	push lstack
		; (total1 total2)
	call verificar_24h

	call converte_final ; (segundos_resultado -- seg3 min3 hor3)
ret

	converte_para_segundos::
		push.l #3600
		call mymulu
		pop

		xcg
		push.l #60
		call mymulu
		pop

		add
		add
	ret

	verificar_24h::
		; (seg_total_1 seg_total_2)
		pop lstack
		pop lstack	; (r1:seg_total_2 r0:seg_total_1)
	
		push r0
		push r1
		mxm

		xcg
		pop
		push r1
		AND
		bz hora2_eh_maior
	
		push lstack
		push lstack
		sub
	ret

		hora2_eh_maior::
			;
			; acrescenta 24h ao total_1:
			;   1:30 (t1) - 2:40 (t2) daria erro, o relógio precisa "dar a volta"
			;   24h+1h30 - 2h40
			;
			push lstack
			push.l #24horas
			ld []
			add
			push lstack
			sub
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