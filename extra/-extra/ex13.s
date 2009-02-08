.file "ex13.s"

.org 0x1000        			
	br inicio
.include  "auxil.s"  
.include "biblioteca1.s"  
  		
celsiusFahrenheit::                     

push.b #50
push.b #32
sub
push.l #9
call mymuls
pop
push.b #5
xcg
call mydivu
ret
inicio::

	call celsiusFahrenheit

	halt
	.end