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


#Passar o mouse por cima da categoria "${PRODUTO}" no meu principal superior de categorias
#    Wait Until Element Is Visible       xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
#    Title Should Be                     My Store
#    Scroll Element Into View            //*[@id="block_top_menu"]/ul/li[1]//*[@title='Women'][@class='sf-with-ul']
#    Mouse Over      xpath=//*[@id="block_top_menu"]/ul/li[1]//*[@title='Women'][@class='sf-with-ul']


#Clicar na sub categoria "${SUB_PRODUTO}" 
#    Scroll Element Into View        xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
#    Wait Until Element Is Enabled       xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
#    Scroll Element Into View        xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
#    Click Element       css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a


Passar o mouse por cima da categoria "${PRODUTO}" no meu principal superior de categorias
    Wait Until Element Is Visible       xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
    Title Should Be                     My Store
#    Scroll Element Into View            //*[@id="block_top_menu"]/ul/li[1]//*[@title='Women'][@class='sf-with-ul']
    Mouse Over      xpath=//*[@id="block_top_menu"]/ul/li[1]//*[@title='Women'][@class='sf-with-ul']


Clicar na sub categoria "${SUB_PRODUTO}" 
    Wait Until Element Is Visible       xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Wait Until Element Contains     ${PRODUTO}      ${SUB_PRODUTO}
    Scroll Element Into View        xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
#    Wait Until Element Is Enabled       xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
#    Scroll Element Into View        xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Click Element       css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a









Clicar no botão "${BOTÃO}" do produto
    Wait Until Element Is Visible       css=#center_column > h1 > span.heading-counter
    Title Should Be                     Search - My Store
    Element Should Be Enabled       //*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg'] 
    Scroll Element Into View        xpath=//*[@id="center_column"]//*[@title='Add to cart']
    Click Button        "Add to cart"


Clicar no botão "Proceed to checkout"


Clicar no ícone carrinho de compras no menu superior direito
    Click Element       css=#header > div:nth-child(3) > div > div > div:nth-child(3) > div > a > b


Clicar no botão de remoção de produtos(delete) no produto carrinho



Clicar no botão superior direito "${LINK}"
    Wait Until Element Is Visible       xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
    Title Should Be                     My Store
    Click Link      xpath=//*[@id="header"]//a[@class='login']

Inserir um e-mail válido
       Input Text      css=#email_create       gislaine28@exemplo.com

Clicar no botão "${SUB}"
    Click Button        css=#SubmitCreate

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




    







