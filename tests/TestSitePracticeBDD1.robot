*** Settings ***
Resource            ../resource/ResourceBDD.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador   


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
    Quando passe o mouse por cima da categoria "Women" no meu principal superior de categorias
    Então clique na sub categoria "Summer Dresses"


Caso de Teste 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    Então clique no botão "Add to cart" do produto 
    Então clique no botão "Proceed to checkout"


#Caso de Teste 05: Remover Produtos
#    Dado que estou na página home do site
#    Clicar no ícone carrinho de compras no menu superior direito
#    clicar no botão de remoção de produtos(delete) no produto carrinho


Caso de Teste 06: Adicionar Cliente
    Dado que estou na página home do site
    Quando clicar no botão superior direito "Sign in"
    Quando Insere um e-mail válido
    Quando clique no botão "Create na account"
    Quando Preencher os campos obrigatórios
    Então clique em "Registrar" para finalizar o cadastro
            


    

