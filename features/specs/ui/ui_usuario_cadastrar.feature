# language: pt

@desafio
@ui_cadastrar_usuario

Funcionalidade: [ UI ] Cadastrar Usuário
  Eu como usuário
  Quero realizar um cadastro
  Para poder acessar o site

  @verificar_link_cadastro_pelo_modal_login
  Cenário: Verificar redirecionamento do "cadastre-se" pelo modal de login 
    Dado que esteja na página de login do site
    Quando clicar em cadastre-se no modal de login
    Então deverá redirecionar para a página de cadastro
    E deverá retornar um modal de cadastro 

  @verificar_link_cadastro_pelo_cabecalho
  Cenário: Verificar redirecionamento do "cadastre-se" pelo cabeçalho do site
    Dado que esteja na página de login do site
    Quando clicar em cadastre-se no cabeçalho
    Então deverá redirecionar para a página de cadastro
    E deverá retornar um modal de cadastro 

  @verificar_link_login_pelo_modal
  Cenário: Verificar redirecionamento do "login" pelo modal de cadastro
    Dado que esteja na página de login do site
    Quando clicar em cadastre-se no modal de login
    E clicar em login no modal
    Então deverá ser redirecionado para o login
    E deverá retornar um modal de login

  @ui_cadastrar_usuario_sucesso
  Cenário: Cadastrar usuário com sucesso 
    Dado que esteja na página de login do site
    Quando clicar em cadastre-se no modal de login
    E preencher o cadastro 
    Então deverá ser redirecionado para o login

  @ui_cadastrar_usuario_campos_vazios
  Cenário: Verificar cadastro com campos vazios
    Dado que esteja no modal de login de cadastro
    Quando clicar em cadastre-se no modal de login
    E clicar em cadastrar deixando os campos vazios
    Então deverão retornar alertas de campo obrigatório

  @ui_cadastrar_usuario_senhas_diferentes
  Cenário: Verificar cadastro com repetição de senha incorreta
    Dado que esteja no modal de login de cadastro
    Quando clicar em cadastre-se no modal de login
    E preencher um nome
    E preencher a senha "123456"
    E confirmar a senha "654321"
    E realizar o cadastro
    Então deverá retornar uma mensagem de erro do usuario "Senhas não combinam"

  @ui_cadastrar_usuario_invalido
  Cenário: Realizar cadastro com usuário já existente
    Dado que esteja no modal de login de cadastro
    Quando clicar em cadastre-se no modal de login
    E preencher o nome "testeautomacao"
    Então deverá retornar uma mensagem "Usuário já cadastrado"