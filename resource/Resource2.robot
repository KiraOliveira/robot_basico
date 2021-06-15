*** Settings ***
Library         SeleniumLibrary

*** Variable ***
${BROWSER}      chrome
${URL}          http://automationpractice.com



*** Keywords ***
### Setup e Teardown 
#Abrir navegador
#    Open Browser        ${URL}      ${BROWSER}


Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar a página home do site   
    Open Browser        ${URL}      ${BROWSER}

Conferir se a página home foi exibida
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text      name=search_query      ${PRODUTO}


Clicar no botão pesquisar
    Click Element       name=submit_search


Passar o mouse por cima da categoria "${PRODUTO}" no meu principal superior de categorias
    Wait Until Element Is Visible           xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
    Title Should Be                         My Store
    Mouse Over                              xpath=//*[@id="block_top_menu"]//a[@title='Women'][@class='sf-with-ul']

Clicar na sub categoria "${SUB_PRODUTO}"
    Wait Until Element Is Visible           xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a    
    Scroll Element Into View                xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Double Click Element                    css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a         


Clicar no botão "${COMPRA}" do produto 
    Wait Until Element Is Visible           css=#center_column > h1 > span.heading-counter
    Mouse over                              xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']
    Scroll Element Into View                xpath=//*[@id="center_column"]//a[@title='Add to cart']
    Double Click Element                    xpath=//*[@id="center_column"]//a[@title='Add to cart']


Clicar no botão "${CONT_COMPRA}"
    Wait Until Element Is Visible           xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2
    Scroll Element Into View                xpath=//*[@id="layer_cart"]//a[@title='Proceed to checkout']
    Double Click Element                    xpath=//*[@id="layer_cart"]//a[@title='Proceed to checkout']

Clicar no botão superior direito "${ACESSO}"
    Wait Until Element Is Visible       xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']
    Title Should Be                     My Store
    Click Link                          xpath=//*[@id="header"]//a[@title='Log in to your customer account']

Inserir um e-mail válido
    Wait Until Element Is Visible       css=#create-account_form > h3
    Input Text      id=email_create     gislaine28@exemplo.com


Clique no botão "${CRIADO}"
    Click Button        id=SubmitCreate

Preencher os campos obrigatórios
    Wait Until Element Is Visible       css=#noSlide > h1
    Title Should Be                     Login - My Store
    Wait Until Element Is Visible       css=#account-creation_form > div:nth-child(1) > h3
    Click Element                       css=#id_gender2
    Input Text      id=customer_firstname       Kira
    Input text      id=customer_lastname        Oliveira
    Input Text      id=email                    gislaine28@exemplo.com
    Input Text      id=passwd                   1234
    Click Element       css=#newsletter
    Click Element       css=#optin
    Input Text          id=company              Kow 
    Input Text          id=address1             Rua Laura 158
    Input text          id=city                 Curitiba
    Input Text          id=postcode             00000-000
#    List Selection Should Be        id=id_state     Florida    
    Input Text          id=other                Teste
    Input Text          id=phone_mobile         (041)99999-9999
    Input Text          id=alias                Opa



Clicar em "${REGISTRAR}" para finalizar o cadastro 
    Click Button        id=submitAccount



### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       css=#center_column > h1   
    Title Should Be                     Search - My Store
    Element Should Be Visible            css=#center_column > h1 > span.heading-counter
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem de erro "No results were found your search "${PRODUTO}""    
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Element Should Be Visible           css=#center_column > h1 > span
    Page Should Contain Element         xpath=//*[@id="center_column"]/p[@class='alert alert-warning']       
