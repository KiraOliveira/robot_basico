*** Settings ***
Documentation       Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Library             RequestsLibrary
Library             Collections


*** Variables ***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}      ID=15
...             Title=Book 15
...             PageCount=1500

##{"id": 0,"title": "string","description": "string","pageCount": 0,"excerpt": "string","publishDate":"2021-06-03T22:52:07.664Z"}

&{BOOK_0}       ID=0
...             Title=String
...             Description=String
...             PageCount=0
...             Excerpt=String
...             PublishDate=2021-06-03T22:52:07.664Z


*** Keywords ***
###SETUP E TEARDOWNS
Conectar a minha API
    Create Session      fakeAPI     ${URL_API}
#    ${HEADERS}      Create Dictionary       content-type=application/json
#    Set Suite Variable      ${HEADERS}

### AÇÕES
Requisitar todos os livros
    ${RESPOSTA}     Get On Session      fakeAPI     Books
    Log             ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"        
    ${RESPOSTA}     Get On Session      fakeAPI      Books/${ID_LIVRO}
    Log             ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Cadastrar um novo livro
    ${HEADERS}      Create Dictionary       content-type=application/json
    ${RESPOSTA}     Post On Session     fakeAPI     Books
    ...                            data={"id": 0,"title": "string","description": "string","pageCount": 0,"excerpt": "string","publishDate":"2021-06-03T22:52:07.664Z"}
    ...                            headers=${HEADERS}
    Log     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Alterar o livro "${ID_LIVRO}"
    ${HEADERS}      Create Dictionary       content-type=application/json
    ${RESPOSTA}     Put On Session      fakeAPI     Books/${ID_LIVRO}
    ...                           data={"id": 170,"title": "Monitor","description": "Teste","pageCount": 0,"excerpt": "string","publishDate":"2021-06-03T22:52:07.664Z"}
    ...                           headers=${HEADERS}
    Log     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Deletar o livro "${ID_LIVRO}"
    ${HEADERS}      Create Dictionary       content-type=application/json
    ${RESPOSTA}     Delete On Session       fakeAPI     Books/${ID_LIVRO}
    ...                              headers=${HEADERS}
    Log     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

### CONFERÊNCIAS
Conferir o status code
    [Arguments]     ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.status_code}     ${STATUSCODE_DESEJADO}


Conferir o reason
    [Arguments]     ${REASON_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.reason}          ${REASON_DESEJADO}


Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be        ${RESPOSTA.json()}      ${  QTDE_LIVROS}


Conferir se retorna dos dados corretos do livro 15
    Dictionary Should Contain Item      ${RESPOSTA.json()}      ID              ${BOOK_15.ID}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      Title           ${BOOK_15.Title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      PageCount       ${BOOK_15.PageCount}
    Should Not Be Empty     ${RESPOSTA.json()["Description"]}
    Should Not Be Empty     ${RESPOSTA.json()["Excerpt"]}
    Should Not Be Empty     ${RESPOSTA.json()["PublishDate"]}



Conferir se retorna todos os dados cadastrados para o novo livro 0
    Dictionary Should Contain Item      ${RESPOSTA.json()}      ID              ${BOOK_0.ID}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      Title           ${BOOK_0.Title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      PageCount       ${BOOK_0.PageCount}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      Description     ${BOOK_0.Description}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      Excerpt         ${BOOK_0.Excerpt}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      PublishDate     ${BOOK_0.PublishDate}




#    Should Not Be Empty     ${RESPOSTA.json()["Description"]}
#    Should Not Be Empty     ${RESPOSTA.json()["Excerpt"]}
#    Should Not Be Empty     ${RESPOSTA.json()["PublishDate"]}





