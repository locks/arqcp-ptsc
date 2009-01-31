.file "prep.s"
.include "lib/auxil.s"
.include "[X]/setup.s"

.org 0x1000
	br inicio

inicio::
	call [exercicio]

	halt
.end