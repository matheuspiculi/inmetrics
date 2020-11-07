# encoding: utf-8
# language:pt

@desafio
@ui_login

Funcionalidade: [ UI ] Login
  Eu como usuário do sistema
  Quero realizar login
  Para poder acessar as funcionalidades disponiveis

  @ui_login_sucesso
  Cenário: Realizar login com sucesso 
    Dado que esteja na página de login do site
    Quando preencher o usuário e senha 
    E clicar em entre
    Então deverá redirecionar para a página de empregados

  @ui_login_sucesso_cabecalho
  Cenário: Realizar login com sucesso pelo link do cabeçalho
    Dado que esteja na página de login acessando pelo link do cabeçalho
    Quando preencher o usuário e senha 
    E clicar em entre
    Então deverá redirecionar para a página de empregados

  @ui_login_usuario_invalido
  Cenário: Realizar login com usuário inválido
    Dado que esteja na página de login do site 
    Quando preencher o nome com um usuário inválido e senha correta
    E clicar em entre
    Então deverá retornar a mensagem "ERRO! Usuário ou Senha inválidos"

  @ui_login_senha_incorreta
  Cenário: Realizar login com senha incorreta
    Dado que esteja na página de login do site 
    Quando preencher o usuário e a senha incorreta
    E clicar em entre
    Então deverá retornar a mensagem "ERRO! Usuário ou Senha inválidos"

  @ui_login_usuario_naopreenchido
  Cenário: Realizar login com usuário nao preenchido
    Dado que esteja na página de login do site 
    Quando preencher o nome com um usuário nao preenchido e senha correta
    E clicar em entre
    Então deverá indicar que o campo usuario é obrigatorio
  
  @ui_login_senha_naopreenchido
  Cenário: Realizar login com usuário nao preenchido
    Dado que esteja na página de login do site 
    Quando preencher o nome com um usuário preenchido e senha nao preenchida
    E clicar em entre
    Então deverá indicar que o campo senha é obrigatorio