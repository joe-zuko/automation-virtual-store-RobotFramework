*** Settings ***
Library    SeleniumLibrary
Variables  ../support/produtos.yml
Resource   ../libs/database.robot



*** Variables ***
${FILES}                        ../support/cover/
${BOTAO_PRODUTO}                id:menu-posts-product
${BOTAO_CADASTRAR_PRODUTO}      css:a[href='post-new.php?post_type=product']
${TITULO}                       css:input#title
${DESCRICAO}                    id:content_ifr
${DESCRICAO_TEXTO}              id:tinymce
${PRECO}                        css:input#_regular_price
${PRECO_PROMOCAO}               css:input#_sale_price
${SKU_BOTAO}                    css:a[href='#inventory_product_data']
${SKU}                          css:input#_sku
${DESCRICAO_RAPIDA}             id:excerpt_ifr
${DESCRICAO_RAPIDA_TEXTO}       id:tinymce
${ETIQUETA_BOX}                 css:input#new-tag-product_tag
${BOTAO_CAPA}                   id:set-post-thumbnail
${ABA_UPLOAD}                   menu-item-upload
${BOTAO_UPLOAD}                 css:.button-hero 
${BOTAO_ADD_FOTO}               css:.media-toolbar-primary
${PUBLICAR}                     publish
${CAPA}                         id:input#title
${BOTAO_LISTA_PRODUTOS}         id:#menu-posts-product
${SUCESSO}                      css:.notice-success p
 

*** Keywords ***

Entrando na pagina de cadastro
    
    Wait Until Element Is Visible    ${BOTAO_PRODUTO}
    Mouse Over                       ${BOTAO_PRODUTO}
    Click Element                    ${BOTAO_CADASTRAR_PRODUTO}


Vou Cadastrar Produtos: "${PRODUTO}"
    
    Deletar BD                                  ${${PRODUTO}.titulo}

    Wait Until Element Is Visible               ${TITULO}
    Entrando na pagina de cadastro

  
    FOR             ${CATEGORIA}        IN      @{${PRODUTO}.categoria}
        Click Element    xpath://label[contains(text(),'${CATEGORIA}')]      
    END

    Input Text      ${TITULO}                   ${${PRODUTO}.titulo}

    Select Frame    ${DESCRICAO}
    Input Text      ${DESCRICAO_TEXTO}          ${${PRODUTO}.descricao}
    Unselect Frame

    Input Text      ${PRECO}                    ${${PRODUTO}.preco}

    Input Text      ${PRECO_PROMOCAO}           ${${PRODUTO}.preco_promocao}

    Click Element   ${SKU_BOTAO}
    Input Text      ${SKU}                      ${${PRODUTO}.referencia}                
   
    Select Frame    ${DESCRICAO_RAPIDA} 
    Input Text      ${DESCRICAO_RAPIDA_TEXTO}   ${${PRODUTO}.descricao_rapida}
    Unselect Frame
   
     
    FOR                 ${CATEGORIA}    IN      @{${PRODUTO}.etiqueta}
        Input Text      ${ETIQUETA_BOX}         ${CATEGORIA}        
        Press Keys                              ${ETIQUETA_BOX}      ENTER           
    END

    Execute JavaScript                          document.querySelector('#${PUBLICAR}').click();

    Wait Until Element Is Visible               ${SUCESSO}
    Element Text Should Be      ${SUCESSO}      ${MSG_PRODUTO_PUBLICADO}     
