*** Settings ***
Resource         ../Config/settings.robot

*** Keywords ***
########################################################################

# Test Setup
Iniciar Sessão
    Open Browser                     browser=chrome
    Maximize Browser Window
    Esperar

# Test Teardown
Finalizar Sessão
    Capture page screenshot
    Close Browser

######################################################################

Validar elemento
    [Arguments]                              ${Element}          
    Wait Until Element Is Visible            ${Element}   
    Esperar
    Capture Page Screenshot

Esperar
    Sleep                                    5

Clicar no Elemento
    [Arguments]                              ${Element}
    Validar elemento                         ${Element}
    Click Element                            ${Element} 

Clicar no Botão
    [Arguments]                              ${Element} 
    Validar elemento                         ${Element}
    Click Button                             ${Element} 

Preencher Text
    [Arguments]                              ${Element}        ${Text}
    Clicar no Elemento                       ${Element} 
    Input Text                               ${Element}        ${Text}       

Validação de Elemento não encontrado na tela
    [Arguments]                             ${Element}           
    ${Status}             Run Keyword And Return Status            Validar elemento     ${Element}
    Pass Execution If    '${Status}' == 'False'                    Pass Execution

Validação de Elemento encontrado na tela
    [Arguments]                             ${Element}           
    ${Status}             Run Keyword And Return Status            Validar elemento     ${Element}
    Pass Execution If    '${Status}' == 'True'                    Pass Execution