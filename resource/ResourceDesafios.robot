*** Settings ***
Library         SeleniumLibrary

*** Variable ***
${BROWSER}      firefox
${URL}          http://automationpractice.com



*** Keywords ***
### Setup e Teardown 
Abrir navegador
    Open Browser        about:blank      ${BROWSER}


Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar a página home do site        
    Go To       http://automationpractice.com
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text          name=search_query       ${PRODUTO}

Clicar no botão pesquisar
    Click Element       name=submit_search


Passar o mouse por cima da categoria "${PRODUTO}" no meu principal superior de categorias
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]//a[@title="Women"]
#    Mouse Over      ${PRODUTO}


Clicar na sub categoria "${SUB_PRODUTO}"
    Click Link       xpath=//*[@id="block_top_menu"]//a[@title="${SUB_PRODUTO}"]


Clicar no botão "${BOTÃO}" do produto
    Click Button        Add to cart 


Clicar no botão "Proceed to checkout"


Clicar no ícone carrinho de compras no menu superior direito
    Click Element       css=#header > div:nth-child(3) > div > div > div:nth-child(3) > div > a > b


Clicar no botão de remoção de produtos(delete) no produto carrinho



Clicar no botão superior direito "${LINK}"
    Clicar Button       css=#header > div.nav > div > div > nav > div.header_user_info > a

#    Inserir um e-mail válido
#    Clicar no botão "Create na account"
#    Preencher os campos obrigatórios
#    Clicar em "Registrar" para finalizar o cadastro


### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Element Should Be Visible           css=#center_column > h1 > span.heading-counter  
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']   
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUTO}")]  


Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
#    Element Text Should Be              xpath=//*[@id="center_column"]/p[@class='alert alert-warning']                ${MENSAGEM_ALERTA}       
    Title Should Be                     Search - My Store
    Element Should Be Visible           css=#center_column > h1
    Element Should Be Visible           css=#center_column > h1 > span
    Page Should Contain Element         xpath=//*[@id="center_column"]/p[@class='alert alert-warning']  

###Descobrir o que deu errado nesse.    
#    Element Text Should Be                //*[@id="center_column"]/p[@class='alert alert-warning'][contains(text(), "${MENSAGEM_ALERTA}")] 




    







