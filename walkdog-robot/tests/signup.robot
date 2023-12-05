*** Settings ***

Documentation       Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Finish Session

*** Test Cases ***

Deve poder cadastrar um novo dog walker

    ${dog_walker}        Create Dictionary        
    ...    name = Maysa Marques    
    ...    email = maysa@gmail.com
    ...    cpf = 49551514858        
    ...    cep = 13506650        
    ...    num=894        complemento= kit 17        
    ...    addressStreet = Avenida 36 A        ddressDistrict = Vila Alemã        ddressCityUf= Rio Claro/SP

    Go to sigup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve poder cadastrar um novo dog walker se o CPF for invaldio
    [Tags]    cpf_inv

    ${dog_walker}        Create Dictionary        
    ...    name = Maysa Marques    
    ...    email = maysa@gmail.com
    ...    cpf = 495515148588      
    ...    cep = 13506650        
    ...    num=894        complemento= kit 17        
    ...    addressStreet = Avenida 36 A        ddressDistrict = Vila Alemã        ddressCityUf= Rio Claro/SP

    Go to sigup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido
    

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    care

    ${dog_walker}        Create Dictionary        
    ...    name = Maysa Marques    
    ...    email = maysa@gmail.com
    ...    cpf = 49551514858        
    ...    cep = 13506650        
    ...    num=894        complemento= kit 17        
    ...    addressStreet = Avenida 36 A        ddressDistrict = Vila Alemã        ddressCityUf= Rio Claro/SP
  

    Go to sigup page
    Fill signup form    ${dog_walker}
    Addtional Service    Cuidar
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.
 
Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]    care

    ${dog_walker}        Create Dictionary        
    ...    name = Maysa Marques    
    ...    email = maysa@gmail.com
    ...    cpf = 49551514858        
    ...    cep = 13506650        
    ...    num=894        complemento= kit 17        
    ...    addressStreet = Avenida 36 A        ddressDistrict = Vila Alemã        ddressCityUf= Rio Claro/SP
    ...    additional_servise= Adestrar

    Go to sigup page
    Fill signup form    ${dog_walker}
    Addtional Service    Adestrar
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.
 