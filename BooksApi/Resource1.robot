*** Settings ***
Documentation           Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library                 RequestsLibrary
Library                 Collections



*** Variable ***
${URL_API}          https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}          ID=15
...                 Title=Book 15
...                 PageCount= 1500

*** Keywords ***
### SETUP E TEARDOWNS
Conectar a minha API
    Create Session      fakeAPI         ${URL_API}
    ${HEADERS}      Create Dictionary       content-type=application/json
    Set Suite Variable      ${HEADERS}


### AÇÕES
Requisitar todos os livros
    ${RESPOSTA}         Get On Session     fakeAPI         Books
    Log                 ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}         Get On Session      fakeAPI        Books/${ID_LIVRO}
    Log                 ${RESPOSTA.text}    
    Set Test Variable       ${RESPOSTA}

Cadastrar um novo livro
    ${RESPOSTA}     Post On Session     fakeAPI         Books
    ...                            data={"id": 12,"title": "string","description": "string","pageCount": 0,"excerpt": "string","publishDate":"2021-06-03T22:52:07.664Z"}
    ...                            headers=${HEADERS}
    Log     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}

Alterar o livro "${ID_LIVRO}"
    ${RESPOSTA}     Put On Session      fakeAPI     Books/${ID_LIVRO}
    ...                           data={"id": 150,"title": "Novo","description": "Kira","pageCount": 0,"excerpt": "string","publishDate":"2021-06-03T22:52:07.664Z"}     
    ...                           headers=${HEADERS}
    Log     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}   


Deletar o livro "${ID_LIVRO}"
    ${RESPOSTA}     Delete On Session        fakeAPI     Books/${ID_LIVRO}
    ...                             headers=${HEADERS}
    Log     ${RESPOSTA.text}
    Set Test Variable       ${RESPOSTA}


### CONFERÊNCIAS
Conferir o status code
    [ARGUMENTS]     ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings       ${RESPOSTA.status_code}     ${STATUSCODE_DESEJADO}
    
Conferir o reason
    [ARGUMENTS]     ${REASON_DESEJADO}
    Should Be Equal As Strings       ${RESPOSTA.reason}          ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be        ${RESPOSTA.json()}      ${QTDE_LIVROS}


Conferir o headers
    [ARGUMENTS]     ${HEADERS_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.headers}         ${HEADERS_DESEJADO}

### Descobrir como funciona o DICTIONARY
#Conferir se retorna todos os dados corretos do livro 15  
#    Dictionary Should Contain Key       ${RESPOSTA.json()}      ID              ${BOOK_15.ID}
#    Dictionary Should Contain Item      ${RESPOSTA.json()}      Title           ${BOOK_15.Title}
#    Dictionary Should Contain Item      ${RESPOSTA.json()}      Description     ${BOOK_15.Description}
#    Dictionary Should Contain Item      ${RESPOSTA.json()}      PageCount       ${BOOK_15.PageCount}
#    Dictionary Should Contain Item      ${RESPOSTA.json()}      Excerpt         ${BOOK_15.Excerpt}
#    Dictionary Should Contain Item      ${RESPOSTA.json()}      PublishDate     ${BOOK_15.PublishDate}


    Should Not Be Empty     ${RESPOSTA.json()["Description"]}
    Should Not Be Empty     ${RESPOSTA.json()["Excerpt"]}
    Should Not Be Empty     ${RESPOSTA.json()["PublishDate"]}



Conferir se retorna todos os dados corretos do livro 15  
    Dictionary Should Contain Value      ${RESPOSTA.json()}         ${BOOK_15.ID}
    Dictionary Should Contain Value      ${RESPOSTA.json()}         ${BOOK_15.Title}
    Dictionary Should Contain Value      ${RESPOSTA.json()}         ${BOOK_15.Description}
    Dictionary Should Contain Value      ${RESPOSTA.json()}         ${BOOK_15.PageCount}
    Dictionary Should Contain Value      ${RESPOSTA.json()}         ${BOOK_15.Excerpt}
    Dictionary Should Contain Value      ${RESPOSTA.json()}         ${BOOK_15.PublishDate}


    


    
             



  
    