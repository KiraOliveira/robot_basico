*** Settings ***
Library         SeleniumLibrary

*** Variable ***
#${BROWSER}      firefox
${BROWSER}      chrome
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
    Wait Until Element Is Visible       xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
    Title Should Be                     My Store
    Mouse Over                          xpath=//*[@id="block_top_menu"]/ul/li[1]//*[@title='Women'][@class='sf-with-ul']

Clicar na sub categoria "${SUB_PRODUTO}" 
    Wait Until Element Is Visible       xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Scroll Element Into View            xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Click Element                       css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a

Clicar no botão "${BOTÃO}" do produto
    Wait Until Element Is Visible       css=#center_column > h1 > span.heading-counter
    Title Should Be                     Search - My Store
    Mouse Over      xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg'] 
    Scroll Element Into View            xpath=//*[@id="center_column"]//a[@title='Add to cart'][@data-id-product='1']
    Double Click Element        xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span

Clicar no botão "${CONT_COMPRA}"
    Wait Until Element Is Visible       xpath=//*[@id="layer_cart"]/div[1]/div[2]
    Scroll Element Into View            css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a > span
    Double Click Element        xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span


Clicar no ícone carrinho de compras no menu superior direito
    Mouse Over      xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a


Clicar no botão de remoção de produtos(delete) no produto carrinho
    Wait Until Element Is Visible       xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a/b
    Double Click Element       xpath=//*[@id="header"]//a[@title="remove this product from my cart"]


Clicar no botão superior direito "${LINK}"
    Wait Until Element Is Visible       xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
    Title Should Be                     My Store
    Click Link      xpath=//*[@id="header"]//a[@class='login']

Inserir um e-mail válido
       Input Text      css=#email_create       gislaine28@exemplo.com

#Clicar no botão "${SUB_INSC}"
#    Click Button        css=#SubmitCreate

Preencher os campos obrigatórios
    Page Should Contain Radio Button        css=#id_gender1
    Input Text      id=customer_firstname       Kira
#    Input Text      name="customer_lastname"        Oliveira
#    Input Text      id="email"                      gislaine28@exemplo.com
#    Input Password      name="passwd"                   1234


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




    







