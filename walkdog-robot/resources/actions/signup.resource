*** Settings ***
Documentation    Ações, steps e elementos da funcionalidade de cadastro

Library    Browser
*** Keywords ***
Go to sigup page
    Click    css=a[href="/signup"]

    Wait For Elements State    form h1    visible    500
    Get Text    form h1    equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${dog_walker}   
    Fill Text    css=input[name=name]    ${dog_walker}[name]
    Fill Text    css=input[name=email]    ${dog_walker}[email]
    Fill Text    css=input[name=cpf]    ${dog_walker}[cpf]
    Fill Text    css=input[name=cep]    ${dog_walker}[cep]

    Click        css=input[type=button][value$=CEP]

    Get Property    css=input[name=addressStreet]    value    equal    ${dog_walker}[addressStreet]
    Get Property    css=input[name=addressDistrict]    value    equal    ${dog_walker}[ddressDistrict]
    Get Property    css=input[name=addressCityUf]    value    equal    ${dog_walker}[addressCityUf]

    Fill Text    css=input[name=addressNumber]    ${dog_walker}[num]
    Fill Text    css=input[name=addressDetails]    ${dog_walker}[complemento]

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/eu.jpeg

Addtional Service
    [Arguments]    ${additional_service}

    Click    xpath=//span[text()="${additional_service}"]/..
 

Submit signup form
    Click    css=.button-register

Popup should be
    [Arguments]     ${textoEsperado}
    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text        css=.swal2-html-container    equal        ${textoEsperado}

    Sleep    60

Alert should be
    [Arguments]     ${textoEsperado}
    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text        css=.swal2-html-container    equal        ${textoEsperado}

    Sleep    60

