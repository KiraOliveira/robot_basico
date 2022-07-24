*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${BROWSER}    chrome
${URL}        http://automationpractice.com
${timeout}    10


*** Keywords ***
### Setup e Teardown
Abrir navegador
    Open Browser    about:blank    ${BROWSER}


Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar a página home do site
    Go To              http://automationpractice.com
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text    name=search_query    ${PRODUTO}

Clicar no botão pesquisar
    Click Element    name=submit_search

Passar o mouse por cima da categoria "${PRODUTO}" no meu principal superior de categorias
    Wait Until Element Is Visible    xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']    timeout=${timeout}
    Title Should Be                  My Store
    Mouse over                       xpath=//*[@id="block_top_menu"]/ul/li[1]//*[@title='Women'][@class='sf-with-ul']

Clicar na sub categoria "${SUB_PRODUTO}"
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a    timeout=${timeout}
    Scroll Element Into View         xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a    
    Click Element                    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar no botão "${BOTÃO}" do produto
    Wait Until Element Is Visible    css=#center_column > h1 > span.heading-counter                                                        timeout=${timeout}
    Title Should Be                  Search - My Store
    Mouse Over                       xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']
    Scroll Element Into View         xpath=//*[@id="center_column"]//a[@title='Add to cart'] 
    Double Click Element             xpath=//*[@id="center_column"]//a[@title='Add to cart']                                               

Clicar no botão "${CONT_COMPRA}"
    Wait Until Element Is Visible    xpath=//*[@id="layer_cart"]/div[1]/div[1]                                                             timeout=${timeout}
    Scroll Element Into View         css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a
    Double Click Element             xpath=//*[@id="layer_cart"]//*[@title='Proceed to checkout'] 

Clicar no ícone carrinho de compras no menu superior direito


Clicar no botão superior direito "${ACESSO}"
    Wait Until Element Is Visible    xpath=//*[@id="header_logo"]//*[@src='http://automationpractice.com/img/logo.jpg']    timeout=${timeout}
    Title Should Be                  My Store
    Click Link                       xpath=//*[@id="header"]//a[@title='Log in to your customer account']
    Page Should Contain              xpath=//*[contains(text(), 'Resource Limit Is Reached')]

Inserir um e-mail válido
    Input Text    css=#email_create    gislaine28@exemplo.com


Clique no botão "${CRIAR_CONTA}"
    Click Button    css=#SubmitCreate

Preencher os campos obrigatórios
                         Wait Until Element Is Visible    css=#noSlide > h1                                     timeout=${timeout}
                         Wait Until Element Is Visible    css=#account-creation_form > div:nth-child(1) > h3    timeout=${timeout}
                         Click Element                    css=#id_gender2
                         Input Text                       id=customer_firstname                                 Kira
                         Input Text                       id=customer_lastname                                  Oliveira
                         Input Text                       id=email                                              gislaine28@exemplo.com
                         Input Text                       id=passwd                                             1234
                         Scroll Element Into View         xpath=//*[@id="days"][@class='form-control']          
                         Click Element                    xpath=//*[@id="uniform-days"]//*[@value="18"] 
#Set Focus To Element    id=uniform-days
                         Click Element                    css=#newsletter
                         Input Text                       id=company                                            KOW
                         Input Text                       id=address1                                           Rua Laura 15
                         Input Text                       id=city                                               Curitiba
                         Set Focus To Element             id=id_state
                         Input Text                       id=postcode                                           00000-000
#                        Scroll Element Into View         xpath=//*[@id="id_country"][@class='form-control']
                         Set Focus To Element             id=id_country
                         Input Text                       id=other                                              Teste
                         Input Text                       id=phone_mobile                                       99999-9999



Clicar em "${REGISTRAR}" para finalizar o cadastro
    Click Button    css=#submitAccount

### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    css=#center_column > h1                                                                               timeout=${timeout}
    Title Should Be                  Search - My Store
    Element Should Be Visible        css=#center_column > h1 > span.heading-counter                                                        
    Page Should Contain Image        xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']    
    Page Should Contain Link         xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUTO}")]              


Conferir mensagem de erro "${MENSAGEM_ALERTA}"
     Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    timeout=${timeout}
#    Element Text Should Be           xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}    
     Title Should Be                  Search - My Store
     Element Should Be Visible        css=#center_column > h1
     Element Should Be Visible        css=#center_column > h1 > span
     Page Should Contain Element      xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    

###Descobrir o que deu errado nesse.
#    Element Text Should Be    //*[@id="center_column"]/p[@class='alert alert-warning'][contains(text(), "${MENSAGEM_ALERTA}")] 





