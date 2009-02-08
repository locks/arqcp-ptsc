
        .file "intmini.s"          ; Trabalho antigo 
        .include  "auxil.s"      ; definicoes auxiliares

        .org 0x200        ; programa inicia-se no byte 512
                          ;  0x200 = hexadecimal
        br inicio
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Espaco para overflow das stacks

        .align 4 
        .space.l 0x200
 
rstack: .space.l 0x200       
vstack: 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Funcoes auxiliares ;;;;;;;;;;

escrb:: push x            ; escrb   ( byte addr --  )
        pop  lstack       ; guardar o valor do registo X
                          ; na stack local
        pop x
        ld [x]            ; ler 32bits
        replb             ; substituir o byte
        st [x]            ; escrever os 32bits

        push lstack
        pop x             ; restaurar o registo X
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mymul::   push g0      ;  ( n1 n2 -- n3 )
          pop lstack
          pop  g0      ; colocar n2 em g0
          push.n #0
          mulu
          push lstack
          pop g0      ; recuperar o registo g0
          pop         ; deitamos for a parte alta da multiplicacao
          ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  +++ 
;  
;    ler uma string  do teclado e respeitar o backspace  
;    deixa na pilha o numero de carcteres lidos 
;    
readstring::      pop lstack         ;      ( ender num_max -- num )
                  push
                  pop lstack

                  pop lstack
                  push.n  #0
                  pop lstack           ; r0=num           r2=ender
                                       ; r1=ender_inicio  r3=num_max
ciclo2::          key
                  push
                  push.b #0xd         ;  Ver se a tecla = carriage return
                  sub                 ;
                  bz fim_string       ;

                  push


                  emit   ;           ; imprimir o caracter

                  push
                  push.b #8
                  sub             ; caracter = backspace ?

                  bz paratras     ; voltar um caracter atras na string

                  push r2
                  call escrb         ; escrever o byte na memoria

                  push r2  ; avancar ender
                  inc #1
                  pop r2

                  push r0  ; num ++
                  inc #1
                  push
                  pop r0

                  push r3        ;
                  sub            ;
                  bz  fim_string ; num=num_max ?


                  br ciclo2

paratras::        pop      ; se o caracter = backspace nao vai ser metido na string
                  push r2  ; decrementar ender
                  dec  #1
                  push r1  ;
                  mxm      ;
                  xcg      ;  novo ender = max ( ender-1,ender_inicial)
                  pop      ;
                  pop r2

                  push r0  ; num --
                  dec  #1
                  push.n #0
                  mxm
                  xcg
                  pop      ; novo num = max ( num -1 , 0 )
                  pop r0

                  br ciclo2

fim_string::      pop   ; deitar fora o ultimo char lido

                  push lstack  ; deixar na stack num_chars_lidos
                  push lstack
                  pop         ; deitar fora ender_inicio
                  push lstack
                  pop         ; deitar fora ender

                  push lstack
                  pop         ; deitar fora num_max
                  ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

inputbuf:   .space.b   80   ; "buffer"  de entrada de texto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

parse::
            push             ;  rotina parse   ( addr num -- )
                             ;
            bz fim_parse     ; string vazia  !!!

            call salta_espacos
            push

            bz fim_parse     ; podemos ter ficado sem chars ao
                             ; "saltar" os espacos

            call fim_palavra ;  ( addr1 num1 -- addr2 num2 addrpal num_pal )
            pop  lstack     ;  r0 =addr pal
            pop  lstack     ;  r1 = num pal
            push r0
            push r1
            call tonumber
            bz   numbnot_ok
                           ; number ok
            rev
            rev            ; colocar o numero por baixo do "addr1 num1"

            push lstack    ;
            pop            ; Se a conversao para num teve sucesso podemos
            push lstack    ;
            pop            ;  deitar fora o endereco da palavra

            br parse_again

numbnot_ok:: pop             ; deitar fora o numero que resultou

             pop lstack      ; da stack de valores sai tudo
             pop lstack     ; para que as rotinas possam ser chamadas

             push r2        ;  ( addr_pal num_pal -- )
             push r3
             call procura_faz    ;  ( addr2 num2 -- )

             push lstack
             push lstack

             push lstack   ;  deitar fora os enderceos da palavra processada
             pop
             push lstack   ;
             pop


parse_again::  push
            eqz
            bz parse         ; num2 <> 0 ?
fim_parse:: pop
            pop
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

salta_espacos::  push               ;  ( addr num -- addr num )

                 bz fim_salta       ; string vazia !!!

                 xcg                  ;StacK:( num addr -- )
                 push                 ; ( num addr addr -- )
                 ld.b []              ; ( num addr char -- )
                 push.b #' '          ; ( num addr char ' ' -- )
                 sub                  ; ( num addr flag -- )
                 pop lstack
                 xcg
                 push lstack          ; ( addr num flag -- )
                 eqz
                 bz fim_salta         ; o primeiro elemento da string
                                      ;    <> de espaco

                 dec #1               ; decrementar o numero de elem da string
                 xcg
                 inc #1
                 xcg                  ; incrementar o endereco

                 br salta_espacos     ; voltar a fazer o mesmo

fim_salta::       ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fim_palavra::     push.n #0       ; ( addr1 num1 -- addr2 num2 addrpal numpal )
                  pop lstack      ; dada uma string que nao comeca por espacos
                  xcg
                  push             ; tirar a primeira palavra
                  pop lstack       ; devolvendo o endereco e num chars da palavra
                  xcg              ; e o ender e num char da string restante
                  pop lstack
                  pop lstack      ;  r3= numpal=0   r2= addr palavra
                                  ;  r1= num        r0 = addr string_restante

char_seguinte::   push r1
                  bz acabou_palavra  ; fim da string restante


                  push r0
                  ld.b []
                  push.b #' '
                  sub
                  bz acabou_palavra  ;  encontramos um espaco

                  push r0
                  inc #1
                  pop r0      ; addr string restante ++

                  push r1     ;
                  dec #1      ;  menos um caracter
                  pop r1      ;  na string restante

                  push r3     ;  mais um caracter na nossa palavra
                  inc #1      ;
                  pop r3      ;

                  br char_seguinte

acabou_palavra::  push lstack
                  push lstack
                  push lstack
                  push lstack
                  ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; +++ 
;; Conversao  de "strings" em numeros

                  .align 4
base:             .long 10    ; base numerica a utilizar

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  maior ( n1 n2 -- flag )   ; -1 se n2 maior que n1

maior::     sub
            push.l #0x80000000
            and 
            eqz 
            eqz 
            ret

menor::     xcg           ; ( n1 n2 -- flag  )
            call maior
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         ver se um char  e' ou nao um digito numa dada base 
; 
digit::     pop lstack      ;; ( char base -- n -1 )
                            ;;  se char for um digito
                            ;; ( char base -- char 0 ) 
                            ;; se char nao for um digito

            push
            push.b  #'0'
            call maior
            eqz             ; se der  '0' > char
            bz    no_digit  ; nao pode ser um digito

            push
            push.b #'9'+1
            call maior
            eqz
            bz menor_ig9
              ;; maior que '9'

            push
            push.b #'A'
            call maior
            eqz
            bz no_digit  ;; menor do que 'A'

            push
            push.b #'a'
            call maior
            eqz
            bz   n_minusc
            push.b #'a'-'A'    ; minusc -> Maiusc
            sub

n_minusc::  push.b #'A'-'9'-1   ;  tirar a diferenca
            sub                 ;


menor_ig9:: push.b #'0'         ;
            sub

            push
            push lstack         ; base
            call maior          ; em todos os casos base > digito

            ret


no_digit::  push lstack
            pop
            push.n #0
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;+++ 

;; a partir de uma string da qual sabemos o endereco e o tamanho
;; converter num numero mais uma flag que indica o sucesso da conversao 
;;;
                        ;; converter uma string num numero
tonumber::              ;;    (  addr count -- number t/f )

           push ct       ;
           pop  lstack   ;  guardar ct
           pop  ct
                         ;; ct = count
           pop  lstack             ;; r0 = addr

           push.n #0               ;; num = 0 inicialmente

cicnum::   push r0
           push
           inc #1
           pop r0                  ; guardar o endereco do char seguinte
           ld.b []                 ; ler o char onde estamos
           push.l #base

           ld []    ; ler a base
           call   digit

           bz     insucesso

           xcg                   ; sucesso
           push.l #base
           ld []
           call mymul            ; num = num*base + digito
           add
           dbr  cicnum

           push lstack        ;
           pop                ; deitar fora o endereco
           push lstack        ;
           pop ct             ; recuperar ct
           push.n #-1         ; conversao bem feita
           ret

insucesso:: pop                ; deitar fora o digito
            push lstack
            pop                ; deitar fora o endereco

            push lstack        ;

            pop ct             ; recuperar ct

            push.n #0         ; conversao mal feita
            ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mydivu::  push g0    ;  ( n1_low n1_high n2 -- quociente resto )
          pop lstack
          pop  g0      ; colocar o divisor em g0
          divu
          push lstack
          pop g0      ; recuperar o registo g0
          ret

         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

               ; rotina mudivmod a dar aos alunos
               ;   ( ud1 u -- resto ud2 )
               ; divide um "duplo" de 64 bits por um inteiro de 32
               ; dando um "duplo" de 64 bits e um resto de 32

mudivmod:: pop lstack  ; r0 = ud1 high
           pop lstack  ; r1 = ud1 low
           pop lstack  ; r2 = u (divisor)

           push r0    ; ud1 high = parte baixa da 1 div
           push.n #0  ; 0 = parte alta da 1 div
           push r2
           call mydivu   ;
                         ; resto da 1 divisao = parte alta da 2 divisao

           push r1       ; ud1 low
           xcg
           push r2       ;
           call mydivu   ; 2 divisao
           rev           ;
           rev           ;
           push lstack
           pop
           push lstack
           pop
           push lstack
           pop
           ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; rotinas de impressao de numeros 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ver trabalho 2 de 2003 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 
        .align 4
; variaveis usadas
hld:    .long 0     ; apontador para a posicao corrente
                    ; dentro da string que vamos construir 

padarea: .space.b 79              ; 79 bytes + 1
                    ; area de 80 bytes onde vamos fazer a string 
                           
pad:    .byte 0 ; fim da area  -> e' aqui que comecamos a fazer a string 


        .align 4
        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  type  ( addr n -- )  imprime n chars a partir de addr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +++
type::  push ct
        pop lstack    ; guardar ct
        pop ct
ciclt:: push        ; guardar o endereco
        ld.b []
        emit
        inc #1
        dbr ciclt
        pop          ; deitar fora o endereco
        push lstack
        pop ct        ; recuperar ct
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  +++  rotinas de mudana de base 
; 
;  binary ( --  )
; 
binary:: push.n #2
         push.l #base
         st []
         pop 
         ret

; decimal ( -- ) 
decimal:: push.b #10
         push.l #base
         st []
         pop 
         ret
; hex ( -- ) 
hex:: push.b #16
         push.l #base
         st []
         pop 
         ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +++
;  hold ( char -- )    ; dado um char inserir-lo na string

hold::  push.l #hld        ;  escrever o byte na posicao apontada por hld
        ld []              ;
        call escrb         ; exercicio 8
        push.l #hld
        ld []
        dec  #1            ;
        push.l #hld        ; decrementar a variavel hld
        st []              ;
        pop
        ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +++ 
; inicio da  conversao 
;  strtdigs ( -- ) 

strtdigs::   push.l #pad      ;  hld comeca por apontar para 
             push.l #hld       ; o fim da area => pad
             st []
             pop
             ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +++ 
; 
;  dig ( d1 -- d2 ) dado um numero duplo retirar um digito
;                   e colocar o char correspondente na string 
;
dig::      push.l #base
           ld []
           call mudivmod  ; dividir o numero pela base
           rev            ; colocar o resto no topo da stack
           push.b #'0'
           add            ; somar ao resto 0 em ascii para dar o char correspondente
           push 
           
           push.b #'9'
           
           call menor 
           bz   n_maior            ; deu numa letra maior que '9'                   
           push.b  #'A'-'9'-1
           add
n_maior:: call hold
           ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +++ 
; 
;  digs ( d1 -- 0 0 ) ; converter todos os digitos de 
                      ; um numero duplo ate que este seja 0 
;
digs::     call dig
           pop lstack
           pop lstack
           push r0
           push r1
           push lstack
           push lstack
           or
           eqz
           bz   digs
           ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +++ 
; enddigs	( d -- ender num )    ;  tira um nœmero duplo da pilha 
;                                 ;   e deixa o endereco e num chars  
; 
enddigs::  pop
           pop
           push.l #pad
           push.l #hld
           ld[]
           sub           ; num de caracteres

           push.l #hld
           ld []
           inc #1        ; endereco do primeiro
           xcg
           ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; +++
; printnum  ( d -- ) 
; 
printnum:: call strtdigs      ; imprimir um numero duplo 
           call digs
           call enddigs
           call type
           ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  +++         
; print    ( n -- )          ;imprimir um numero 
print::    push.n # 0
           xcg  
           call printnum 
           ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    INICIO TRABALHO 2 DE 2004  
;;   
;;
;;   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  vocabulario 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       .align 4
plus_entry:    .word 0 ; flags
       		.word 1 ; comprimento da string
		.long 0 ; anterior n/ existe
		.long plus_code  ; codigo
		.byte "+"  ; string 
plus_code::	add 
		ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			.align 4 
sub_entry:	.word 0 ; flags 
			.word 1 ; comprimento
			.long plus_entry ; anterior
			.long sub_code  ; codigo
			.byte "-" ; string
sub_code::		sub 
			ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			.align 4 
drop_entry:	.word 0 ; flags 
			.word 4 ; comprimento
			.long sub_entry ; anterior 
			.long drop_code ; codigo
			.byte "drop" ; string
drop_code::		pop 
			ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
			.align 4 
decimal_entry:	.word 0 ; flags 
			.word 7 ; comprimento
			.long drop_entry ; anterior 
			.long decimal ; codigo
			.byte "decimal" ; string 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			.align 4 
hex_entry:	.word 0 ; flags 
			.word 3 ; comprimento
			.long decimal_entry ; anterior 
			.long hex ; codigo
			.byte "hex" ; string 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			.align 4 
bin_entry:	.word 0 ; flags 
			.word 6 ; comprimento
			.long hex_entry ; anterior 
			.long binary ; codigo
			.byte "binary" ; string 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			.align 4 
print_entry:	.word 0 ; flags 
			.word 5 ; comprimento
			.long bin_entry ; anterior 
			.long print ; codigo
			.byte "print" ; string 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mul_entry::
		.word	0
		.word	1
		.long	print_entry
		.long	mymul
		.byte	"*"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fim do vocabulario 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			.align 4 
last:		.long  mul_entry ; apontador para a ultima entrada
                              ; se adicionarmos entradas temos de mudar o 
                              ; apontador 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;  compstr ( addr1 n1 addr2 n2 -- flag ) 
;;  dadas duas strings devolve -1 se forem iguais ou 0 
;;  se forem diferentes 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
compstr::  	push s2    ; copiar n1 para o topo
         	push s1    ; copiar n2 para o topo  
         	sub
         	eqz        ; -1 => n1 = n2 
         	bz         n1n2_niguais
         	pop        ; deitar fora n2 porque n1=n2 
         	xcg        ; n1 vem para o topo
         	push ct 
         	pop lstack  ; guardar ct 
         	pop ct     ; ct = n1
         	pop lstack   ; r1 = addr2 
         	pop lstack   ; r0 = addr1
ciclostr:: 	push r1 
            push 
            inc #1
            pop r1   ; addr2++ 
            ld.b []  ; ler char 
            push r0 
            push 
            inc #1
            pop r0 ; addr1++
            ld.b []  ; ler char
            sub 
            eqz 
            bz chars_niguais
            dbr ciclostr   ; passar ao char seguinte
            push.n #-1     ; se fim ciclo todos os chars sao iguais
            push lstack 
            pop            ; addr1 vai fora
            push lstack 
            pop            ; addr2 vai fora 
            push lstack 
            pop  ct        ; recuperar ct
            ret 
  
chars_niguais:: 	push.n #0      ; se 2 chars diferentes 
            		push lstack    ; as strings sao diferentes
            		pop            ; addr1 vai fora
            		push lstack 
           			pop            ; addr2 vai fora 
            		push lstack 
            		pop  ct        ; recuperar ct
            		ret            
 
n1n2_niguais:: 	pop    ; 
				pop    ; deitar fora parametros
				pop    ;  
				pop
				push.n #0   ;   strings n/ sao iguais 
				ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

str_erro:    .byte " Erro !",'\n'

erro::   	push.l #str_erro
		push.b #8 
                call type 
                ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 	
;;; procura_faz ( addr n -- )     				     
;;;  procura uma string no vocabulario e chama a rotina correspondente 
;;;
procura_faz::   pop lstack   ; r2 = n 
				pop lstack   ; r1 = addr 
				push.l #last
				ld []         ; ler apontador para inicio 
                pop lstack    ; r0 = endereco da estrutura 
ciclo_proc::    push r0 
                bz     fim_vocab  ; n ha mais definicoes 
                push r0 
                push.b #12 
                add        ; ender string = inicio + 12
                push r0 
                push.n #2
                add 
                ld.w []    ; comprimento = inicio +2
                push r1   ; addr  
                push r2   ; n 
                call compstr 
                bz nfound
                push r0        ; encontramos 
                push.b #8 
                add 
                ld []        ; codigo = inicio + 8 bytes 
                call []      ; chamar a rotina 
                push lstack ; deitar fora valores
                pop 
                push lstack 
                pop 
                push lstack 
                pop 
                ret ; fim da rotina 
                
nfound::        push r0     ; carregar apontador 
		push.n # 4  ; anterior = inicio + 4 bytes  
                add 
		ld []
		pop  r0
		br ciclo_proc 
				                      
                
fim_vocab::  	push lstack ; deitar fora valores
                pop 
                push lstack 
                pop 
                push lstack 
                pop  ; 
                call erro
                ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; 
;  Fim trabalho 2 de 2004 
; 
; 
;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; prompt =
;
str_prompt: .byte '\n',"?>"

prompt::   push.l #str_prompt       ; ( -- )
           push.n #3
           call type
           ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                
interp::   call prompt               ; ( -- )
           push.l #inputbuf               ; interpretador
           push.b #80
           call readstring                 ; ler uma linha max 80 caracteres
           push.b #'\n'
           emit
           push.l #inputbuf
           xcg
           call parse                      ; fazer o parsing
           br interp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; 
; Exemplos de coisas que o interpretador faz:
; 
;   2 2 + print 
;   18  binary  print
;   hex 44 decimal print 
;   hex 1B  decimal 10 - binary print
;
;
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
inicio:: 	push.l #rstack-8  ; 
         	pop la            ; 
         	push.l #vstack-8  ;  Inicializacao das Stacks 
         	pop sa




           ;
		 call interp
         halt
        .end              ;


