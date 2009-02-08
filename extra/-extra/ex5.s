.file "ex5.s"

.org 0x1000        			
       	
.include  "auxil.s"
br inicio

mymulu::				
pop g0
push.n #0
mulu
ret
					      	
mymuls::				
pop g0
push.n #0
muls				 
ret					

inicio:: 
push.b #3
push.b #2
call mymulu
push.b #4     		
push.b #2
call mymuls
halt 
.end

					
          	
