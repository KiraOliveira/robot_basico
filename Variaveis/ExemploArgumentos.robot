*** Settings ***
Documentation       Exemplo de uso de variáveis como argumentos em Keywords

*** Variable ***
&{PESSOA}           nome=May Fernandes          email=mayfernandes@exemplo.com.br         idade=28            sexo=feminino
&{PESSOA_1}         nome=Kira                   email=kira@exemplo.com.br                 idade=32            sexo=feminino


*** Test Case ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

Caso de teste de exemplo 02
    Uma Keyword qualquer 02    



*** Keywords ***
Uma keyword qualquer 01
    Uma subkeyword com argumentos       ${PESSOA.nome}      ${PESSOA.email}
    ${MENSAGEM_ALERTA}      Uma subkeyword com retorno      ${PESSOA.nome}      ${PESSOA.idade}
    Log                     ${MENSAGEM_ALERTA}


Uma keyword qualquer 02
    Uma subkeyword com argumentos 02      ${PESSOA_1.nome}     ${PESSOA_1.idade}
    ${MENSAGEM_ALERTA}      Uma subkeyword com retorno 02     ${PESSOA_1.nome}     ${PESSOA_1.idade}
    Log                     ${MENSAGEM_ALERTA}    




Uma subkeyword com argumentos
    [Arguments]         ${NOME_USUARIO}     ${EMAIL_USUARIO}
    Log                 Nome Usuário: ${NOME_USUARIO}
    Log                 Email: ${EMAIL_USUARIO}
    


Uma subkeyword com argumentos 02
    [Arguments]         ${NOME_USUARIO}     ${IDADE_USUARIO}
    Log                 Nome Usuário: ${NOME_USUARIO}
    Log                 Idade: ${IDADE_USUARIO}


Uma subkeyword com retorno
    [Arguments]         ${NOME_USUARIO}     ${IDADE_USUARIO}
    ${MENSAGEM}         Set Variable If     ${IDADE_USUARIO}<18     Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!
    [Return]            ${MENSAGEM}                     


Uma subkeyword com retorno 02
    [Arguments]         ${NOME_USUARIO}     ${IDADE_USUARIO}
    ${MENSAGEM}         Set Variable If     ${IDADE_USUARIO}>18     Autorizado! O usuário ${NOME_USUARIO} é maior de idade!    
    [Return]            ${MENSAGEM}