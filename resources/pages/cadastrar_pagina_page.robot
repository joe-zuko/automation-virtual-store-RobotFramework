*** Settings ***
Library    SeleniumLibrary
Variables  ../support/paginas.yml
Resource   ../libs/database.robot



*** Variables ***
${BOTAO_PAGINA}                 id:menu-pages
${BOTAO_CADASTRAR_PAGINA}       css:a[href='post-new.php?post_type=page']
${TITULO}                       css:input#title
${DESCRICAO}                    id:content_ifr
${DESCRICAO_TEXTO}              id:tinymce
${PUBLICAR}                     publish
${CAPA}                         id:input#title
${BOTAO_LISTA_PRODUTOS}         id:#menu-posts-product
${SUCESSO}                      css:.notice-success p


*** Keywords ***

Entrando na pagina de cadastro de paginas
    
    Wait Until Element Is Visible    ${BOTAO_PAGINA} 
    Mouse Over                       ${BOTAO_PAGINA}
    Click Element                    ${BOTAO_CADASTRAR_PAGINA}


Vou Cadastrar Paginas: "${PAGINA}"
    
    Deletar BD                                  ${${PAGINA}.titulo}

    Wait Until Element Is Visible               ${TITULO}
    Entrando na pagina de cadastro de paginas


    Input Text      ${TITULO}                   ${${PAGINA}.titulo}

    Select Frame    ${DESCRICAO}
    Input Text      ${DESCRICAO_TEXTO}          ${${PAGINA}.descricao}
    Unselect Frame

    Execute JavaScript                          document.querySelector('#${PUBLICAR}').click();

    Wait Until Element Is Visible               ${SUCESSO} 
    Element Text Should Be      ${SUCESSO}      ${MSG_PAGINA_PUBLICADO}     

 
 