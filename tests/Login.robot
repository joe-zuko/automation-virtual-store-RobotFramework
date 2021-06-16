*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/variables/users.robot
Resource            ../resources/variables/alertas.robot
Resource            ../resources/pages/login_page.robot
Test Setup          Abrir pagina login
Test Teardown       Fechar navegador


*** Test Case ***
Login
    [tags]      login
    login_page.Fazendo login com "${MY_USER}" e "${MY_PASS}"
    login_page.Devo ver a mensagem "${WELCOME}" na área logada 

Usuario Inexistente
    [tags]      wrong_user
    login_page.Fazendo login com "${WRONG_USER}" e "${MY_PASS}"
    login_page.Devo receber o alerta "${WRONG_USER_ALERT}" 

Usuario Email Inexistente
    [tags]      wrong_email_user
    login_page.Fazendo login com "${WRONG_USER_EMAIL}" e "${WRONG_PASS}"
    login_page.Devo receber o alerta "${WRONG_USER_ALERT_EMAIL}"

Senha Errada
    [tags]      wrong_pass
    login_page.Fazendo login com "${MY_USER}" e "${WRONG_PASS}"
    login_page.Devo receber o alerta "${MSG_WRONG_PASS}" 

Usuario Vazio
    [tags]      empty_user
    login_page.Fazendo login com "${EMPTY}" e "${WRONG_PASS}"
    login_page.Devo receber o alerta "${EMPTY_USER}" 

Email Vazio
    [tags]      empty_pass
    login_page.Fazendo login com "${MY_USER}" e "${EMPTY}"
    login_page.Devo receber o alerta "${EMPTY_EMAIL}" 



    