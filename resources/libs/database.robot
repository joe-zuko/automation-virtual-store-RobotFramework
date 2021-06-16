*** Settings ***
Library           DatabaseLibrary
Library           OperatingSystem

*** Variables ***

${DBHost}         mercador.4infoit.com.br
${DBName}         hg4in857_merc
${DBPass}         [s8@sSc86p
${DBPort}         3306
${DBUser}         hg4in857_merc


*** Keywords ***

Deletar BD
    [Arguments]           ${DEL_OBJ}
    Connect To Database   pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Execute SQL String    DELETE FROM `merc_posts` WHERE `post_title` = '${DEL_OBJ}';
    Disconnect From Database






