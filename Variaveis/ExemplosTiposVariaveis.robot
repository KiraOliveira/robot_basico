*** Settings ***
Documentation       Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS


*** Variable ***

#Simples
${GLOBAL_SIMPLES}          Vamos ver os tipos de variáveis no robot!

#Tipo Lista
@{FRUTAS}           morango     banana      maça        uva     abacaxi

#Tipo Dicionário
&{PESSOA}           nome=May Fernandes          email=mayfernandes@exemplo.com.br          idade=28            sexo=feminino


*** Test Case ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01


*** Keywords ***
Uma keyword qualquer 01
    #Simples
    Log     ${GLOBAL_SIMPLES}

    #Lista
    Log     Tem que ser maça: ${FRUTAS[2]} e Essa tem que ser morango: ${FRUTAS[0]}
    Log     Tem que ser banana: ${FRUTAS[1]} e Essa tem que ser uva: ${FRUTAS[3]}
    Log     Tem que ser morango: ${FRUTAS[0]}
    Log     Não é abacaxi: ${FRUTAS[3]} e sim Uva ${FRUTAS[3]}

    #Dicionário
    Log     Nome: ${PESSOA.nome} e email: ${PESSOA.email}    
    Log     Idade: ${PESSOA.idade}
    Log     Sexo: ${PESSOA.sexo} e nome: ${PESSOA.nome}