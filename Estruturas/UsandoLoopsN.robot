*** Settings ***
Documentation           Vamos aprender a fazer LOOPS usando o Robot Framework!


*** Variables ***
### Indíce da lista            0      1        2       3        4
@{MINHA_LISTA_FRUTAS}        maça  abacaxi  banana  morango  laranja
@{MINHA_LISTA_NOMES}         Beto   Kira    Frajola   Sky     Lucky                   


*** Test Case ***
Teste de REPEAT KEYWORD=
    [Documentation]     Chama uma mesma keyword várias vezes
    Usando Repeat keyword


Teste de FOR do tipo IN RANGE=
    [Documentation]     Faz um loop dentro de um intervalo que você passar
    Usando FOR IN RANGE

Teste de for do tipo IN=
    [Documentation]     Faz um loop percorrendo a lista que você passar
    Usando FOR IN

 
Teste de FOR do tipo IN ENUMERATE=   
    [Documentation]     Faz um loop percorrendo a lista que você passar e percorre o indíce da lista
    Usando FOR IN ENUMERATE


Teste de sair do FOR= 
    [Documentation]     Você controla quando o FOR dese ser encerrar antes de terminar todos os LOOPS
    Usando FOR IN com EXIT FOR LOOP IF


*** Keywords ***
Usando Repeat keyword
    Log To Console      ${\n}
    Repeat Keyword      1x          Log To Console      Kira
    Repeat Keyword      2x          Log To Console      Frajola
    Repeat Keyword      1x          Log To Console      Beto
    Repeat Keyword      2x          Log To Console      Sky
    Repeat Keyword      1x          Log To Console      Lucky

Usando FOR IN RANGE
    Log To Console  ${\n}
    FOR  ${CONTADOR}  IN RANGE  0  5
        Log To Console  Minha posição agora é: ${CONTADOR}
        Log  Minha posição agora é: ${CONTADOR}
    END
    FOR  ${POSICAO}  IN RANGE  -1  9
        Log To Console  Minha posição atual é: ${POSICAO}
        Log  Minha posição atual é: ${POSICAO}
    END
    FOR  ${NUM}  IN RANGE  2  15
        Log To Console  Minha posição atual é: ${NUM}    
        Log  Minha letra atual é: ${NUM}
    END        


Usando FOR IN
    Log To Console  ${\n}
    FOR  ${FRUTAS}  IN  @{MINHA_LISTA_FRUTAS}
        Log To Console      Minha fruta é: ${FRUTAS}!
        No Operation
    END
    FOR  ${NOMES}  IN  @{MINHA_LISTA_NOMES}
        Log To Console      Meu nome é: ${NOMES}
    END             
    

Usando FOR IN ENUMERATE   
    Log To Console  ${\n}
    FOR  ${INDICE}      ${FRUTAS}  IN ENUMERATE  @{MINHA_LISTA_FRUTAS}
        Log To Console      Minha fruta é: ${INDICE} -->$ ${FRUTAS}!
    END    
    FOR  ${INDICE}      ${NOMES}  IN ENUMERATE   @{MINHA_LISTA_NOMES}
        Log To Console      Meu nome é: ${INDICE} ---> ${NOMES}!
        No Operation
    END  

Usando FOR IN com EXIT FOR LOOP IF
    Log To Console  ${\n}
    FOR  ${INDICE}      ${FRUTAS}  IN ENUMERATE  @{MINHA_LISTA_FRUTAS}
        Log To Console      Minha fruta é: ${INDICE}-->${FRUTAS}!
        Exit For Loop If    '${FRUTAS}' == 'banana'
    END
    FOR  ${INDICE}      ${NOMES}  IN ENUMERATE  @{MINHA_LISTA_NOMES}
        Log To Console      Meu nome é: ${INDICE} ---> ${NOMES}!
        Exit For Loop If    '${NOMES}' == 'Sky'     
    END