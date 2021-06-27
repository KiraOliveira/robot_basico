*** Settings ***
Resource         ../resource/Resource1.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador               


### SETUP ele roda keyword antes da suite ou antes de um Teste
### TEARDOWN ele roda keywork depois de uma suite ou um teste


### Casos de Teste Exemplares - Procedural

*** Test Case ***
Caso de Teste 01: Pesquisar Produto Existente
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de Pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site


Caso de Teste 02: Pesquisar Produto não Existente
    Acessar a página home do site
    Digitar o nome do produto "itemNãoExistente" no campo de Pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found your search "itemNãoExistente""


Caso de Teste 03: Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no meu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"


Caso de Teste 04: Adicionar Produtos no Carrinho
    Acessar a página home do site
    Digitar o nome do produto "t-shirt" no campo de Pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to cart" do produto 
    Clicar no botão "Proceed to checkout"


#Caso de Teste 05: Remover Produtos
#    Acessar a página home do site
#    Clicar no ícone carrinho de compras no menu superior direito
#    clicar no botão de remoção de produtos(delete) no produto carrinho


Caso de Teste 06: Adicionar Cliente
    Acessar a página home do site
    Clicar no botão superior direito "Sign in"
    Inserir um e-mail válido
    Clique no botão "Create na account"
    Preencher os campos obrigatórios
    Clicar em "Registrar" para finalizar o cadastro    

*** Keywords ***
