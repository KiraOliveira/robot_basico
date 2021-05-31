*** Settings ***
Library         SeleniumLibrary

*** Variable ***
${BROWSER}      chrome
${URL}          http://automationpractice.com



*** Keywords ***
### Setup e Teardown 
Abrir navegador
    Open Browser        ${URL}      ${BROWSER}


Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar a página home do site        
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text      id=search_query_top     ${PRODUTO}

Clicar no botão pesquisar
    Click Button        name=submit_search


### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible           css=#center_column > h1
    Title Should Be                         Search - My Store
    Element Should Be Visible               css=#center_column > h1 > span.heading-counter
    Page Should Contain Image               xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']      
    Page Should Contain Link                xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]  


Conferir mensagem de erro "No results were found your search "${PRODUTO}""    
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Element Should Be Visible           css=#center_column > h1 > span
    Page Should Contain Element         xpath=//*[@id="center_column"]/p[@class='alert alert-warning']           