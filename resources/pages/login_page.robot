*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${EMAIL_FIELD}          id:user_login
${PASS_FIELD}           id:user_pass
${BOTAO_ENTRAR}         css:button[name='login']
${WELCOME_FIELD}        css:h1.entry-title
${ALERTA_FALHOU}        id:login_error
${SENHA_VAZIA}          id:auth-password-missing-alert


*** Keywords ***

#Login
Fazendo login com "${USER}" e "${PASS}"

    Wait Until Element Is Visible    ${EMAIL_FIELD}

    Input Text                       ${EMAIL_FIELD}    ${USER}       
    Input Text                       ${PASS_FIELD}     ${PASS}    

    Press Keys                       ${PASS_FIELD}     ENTER





#Alerta Password Errado
Devo receber o alerta "${MSG}" 

    Wait Until Element Is Visible    ${ALERTA_FALHOU}  

    ${RESULT}=               Get WebElement                     ${ALERTA_FALHOU} 

    Should Be Equal          ${RESULT.text}                     ${MSG}




#Bem vindo area logada
Devo ver a mensagem "${WELCOME}" na área logada

    Wait Until Element Is Visible    ${WELCOME_FIELD}  

    ${RESULT}=               Get WebElement                     ${WELCOME_FIELD}   

    Should Be Equal          ${RESULT.text}                     ${WELCOME}