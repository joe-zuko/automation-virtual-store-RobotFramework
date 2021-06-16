*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/variables/users.robot
Resource            ../resources/variables/alertas.robot
Resource            ../resources/pages/login_page.robot
Resource            ../resources/pages/cadastrar_produto_page.robot
Resource            ../resources/pages/cadastrar_pagina_page.robot
Test Setup          Abrir pagina login
Test Teardown       Fechar navegador



*** Test Case ***
Cadastro de Produto
    [tags]      cadastro_produto
    login_page.Fazendo login com "${ADM_USER}" e "${ADM_PASS}"
    cadastrar_produto_page.Vou Cadastrar Produtos: "one_piece"
    cadastrar_produto_page.Vou Cadastrar Produtos: "senhor_dos_aneis"
    cadastrar_produto_page.Vou Cadastrar Produtos: "transformers"

Cadastro Pagina
    [tags]      cadastro_pagina
    login_page.Fazendo login com "${ADM_USER}" e "${ADM_PASS}"
    cadastrar_pagina_page.Vou Cadastrar Paginas: "quem_somos"
    cadastrar_pagina_page.Vou Cadastrar Paginas: "nossa_historia"
    cadastrar_pagina_page.Vou Cadastrar Paginas: "contato"
 
    