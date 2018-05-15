*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${URL}       http://automationpractice.com

*** Keywords ***
Abrir navegador
    Open Browser    about:blank  ${BROWSER}

Fechar navegador
    Close Browser

Acessar a página home do site
    Go to             http://automationpractice.com
    Title should be   My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    name=search_query   ${PRODUTO}

Clicar no botão pesquisar
    Click Element   name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be              xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

Selecionar a categoria "${CATEGORIA}"
    Mouse Over                          xpath=//*[@id="block_top_menu"]//a[@class="sf-with-ul"][@title="${CATEGORIA}"]
    Wait Until Element Is Visible       css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a

Clicar na subcategoria "${SUBCATEGORIA}"
    Page Should Contain Link            css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a
    Click Link                          css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a

Conferir se a página contendo produtos da subcategoria "${SUBCATEGORIA}" foi exibida
    Title Should Be                     Summer Dresses - My Store
    Element Text Should Be              xpath=//*[@id="center_column"]//span[contains(text(),"${SUBCATEGORIA}")][@class='category-name']    ${SUBCATEGORIA}
    Element Should Contain              xpath=//*[@id="center_column"]//span[@class='cat-name']       SUMMER DRESSES   
