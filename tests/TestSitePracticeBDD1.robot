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

