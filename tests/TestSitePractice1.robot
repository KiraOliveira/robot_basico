*** Settings ***
Resource            ../resource/Resource1.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador   


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

*** Keywords ***
