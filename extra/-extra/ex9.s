.file "ex9.s"
.org 0x100
.include  "auxil.s" 
br inicio
rotina::
push.b #3
push.b #2
pop g0
push.n #0
divu
ret 
inicio::
call rotina
halt
.end     		