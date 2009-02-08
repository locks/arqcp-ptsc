
        .file "auxil.s"   ; Ficheiro com defini‡Æo de pseudo-instru‡äes
                          ;  apenas "entendidas" pelo emulador
                          ;
                          ; Estas instru‡äes nÆo existem no processador
                          ; real mas sƒo £teis no emulador.
                          ;
                          ; Usar apenas as documentadas.
                          ;
                          ;
                          ; Para as usar num programa devemos ter a linha
                          ;      .include "auxil.s"
                          ; nesse programa, antes de as usar

        .opt fill=0xea    ; dizer ao assemlbler para encher "os buracos"
                          ; com o opcode do nop

        .macro prof
        .opcode 0xf8
        .endm

        .macro setarg
        .opcode 0xf9
        .endm

        .macro setrom
        .opcode 0xfa
        .endm

        .macro keyq        ; ( -- flag )
        .opcode 0xfb       ;  Devolve 0 (zero) se nao houver nenhuma tecla
        .endm              ;  para ser lida ou -1 se existirem teclas para
                           ;  serem lidas
                           ;  keyq == key? == key question

        .macro key         ;   ( -- b )
        .opcode 0xfc       ;   Lˆ uma tecla da janela de terminal e deixa
        .endm              ;   na stack obyte correspondente
                           ;   ao respectivo c¢digo ASCII



        .macro emit        ;  ( b -- )
        .opcode 0xfd       ;  Imprime na janela de terminal o caracter cujo c¢digo
        .endm              ;  ASCII se encontra no topo da stack


        .macro halt        ;  P ra o Emulador
        .opcode 0xfe       ;
        .endm              ;

