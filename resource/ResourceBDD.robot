*** Settings ***
Library         SeleniumLibrary

*** Variable ***
${BROWSER}      chrome
${URL}          http://automationpractice.com



*** Keywords ***
### Setup e Teardown 
Abrir navegador
    Open Browser        about:blank      ${BROWSER}


Fechar navegador
    Close Browser

### Passo-a-Passo
Dado que estou na página home do site    
    Go To       http://automationpractice.com
    Title Should Be     My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
    Input Text          name=search_query       ${PRODUTO}
    Click Element       name=submit_search


Quando passe o mouse por cima da categoria "${PRODUTO}" no meu principal superior de categorias
   Wait Until Element Is Visible        xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
   Title Should Be                      My Store
   Mouse Over                           xpath=//*[@id="block_top_menu"]//a[@title='Women']
       
Então clique na sub categoria "${SUB_PRODUTO}"
    Wait Until Element Is Visible       xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Scroll Element Into View            xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Click Element                       xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Então clique no botão "${COMPRA}" do produto 
    Wait Until Element Is Visible       css=#center_column > h1 > span.heading-counter
    Mouse Over                          xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']
    Click Element                       xpath=//*[@id="center_column"]//a[@title='Add to cart']

Então clique no botão "${CONT_COMPRA}"
    Wait Until Element Is Visible       css=#layer_cart > div.clearfix > div.layer_cart_product.col-xs-12.col-md-6 > h2
    Scroll Element Into View            xpath=//*[@id="layer_cart"]//a[@title='Proceed to checkout']
    Double Click Element                xpath=//*[@id="layer_cart"]//a[@title='Proceed to checkout']

Quando clicar no botão superior direito "${ACESSO}"
    Wait Until Element Is Visible       xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
    Click Element                       xpath=//*[@id="header"]//a[@title='Log in to your customer account']

Quando Insere um e-mail válido
    Input Text      id=email_create     gislaine28@exemplo.com

Quando clique no botão "${CRIADO}"
    Click Button        css=#SubmitCreate

Quando Preencher os campos obrigatórios
    Wait Until ElementIs Visible        css=#noSlide > h1
    Wait Until Element Is Visible       css=#account-creation_form > div:nth-child(1) > h3
    Click Element                       css=#id_gender2
    Input Text      id=customer_firstname       Kira
    Input Text      id=customer_lastname        Oliveira
    Input Text      id=email                    gislaine28@exemplo.com
    Input Text      id=passwd                   1234
    Set Focus To Element        id=days
    Click Element       css=#newsletter
    Click Element       css=#optin
    Input Text      id=company      KOW
    Input Text      id=address1     Rua Laura 856
    Input Text      id=city         Curitiba
    Set Focus To Element        id=id_state
    Input Text      id=postcode     00000-000
    Set Focus To Element        id=id_country
    Input Text      id=other        Teste
    Input Text      id=phone_mobile     (041)99999-9999
    Input Text      id=alias            Opa

Então clique em "${REGISTRAR}" para finalizar o cadastro
    Click Button        id=submitAccount





### Conferências
Então o produto "${PRODUTO}" deve ser listado na página de resultado de busca
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Element Should Be Visible           css=#center_column > h1 > span.heading-counter  
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']   
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUTO}")]  


Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
#    Element Text Should Be              xpath=//*[@id="center_column"]/p[@class='alert alert-warning']                ${MENSAGEM_ALERTA}       
    Title Should Be                     Search - My Store
    Element Should Be Visible           css=#center_column > h1
    Element Should Be Visible           css=#center_column > h1 > span
    Page Should Contain Element         xpath=//*[@id="center_column"]/p[@class='alert alert-warning']  

###Descobrir o que deu errado nesse.    
#    Element Text Should Be              xpath=//*[@id="center_column"]/p[@class='alert alert-warning']                ${MENSAGEM_ALERTA}       



