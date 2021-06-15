*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador   


*** Variable ***
${URL}          http://automationpractice.com
${BROWSER}      chrome



### SETUP ele roda keyword antes da suite ou antes de um Teste
### TEARDOWN ele roda keywork depois de uma suite ou um teste


### Casos de Teste Exemplares - Gherkin BDD

*** Test Case ***
Cenário 01: Pesquisar Produto Existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado de busca

Cenário 02: Pesquisar Produto não Existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found your search "itemNãoExistente""


Caso de Teste 03: Listar Produtos
    Dado que estou na página home do site
    Quando passar o mouse por cima da categoria "Women" no meu principal superior de categorias
    Então clique na sub categoria "Summer Dresses"


Caso de Teste 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    Clicar no botão "Add to cart" do produto 
    
    Clicar no botão "Proceed to checkout"


#Caso de Teste 05: Remover Produtos
#    Dado que estou na página home do site
#    Clicar no ícone carrinho de compras no menu superior direito
#    clicar no botão de remoção de produtos(delete) no produto carrinho


Caso de Teste 06: Adicionar Cliente
    Dado que estou na página home do site
    Clicar no botão superior direito "Sign in"
    Inserir um e-mail válido
    Clique no botão "Create na account"
    Preencher os campos obrigatórios
    Clicar em "Registrar" para finalizar o cadastro       


*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site  

Quando eu pesquisar pelo produto "${PRODUTO}"  
    Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado de busca   
    Conferir se o produto "${PRODUTO}" foi listado no site


Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}" 
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"

