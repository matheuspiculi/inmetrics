# encoding: utf-8
# language:pt

@desafio
@login

Funcionalidade: Login
  Eu como usuário do sistema
  Quero realizar login
  Para poder acessar as funcionalidades disponiveis

  @login_sucesso
  Cenário: Realizar login com sucesso 
    Dado que esteja na página de login do site
    Quando preencher o usuário e senha 
    E clicar em entre
    Então deverá redirecionar para a página de empregados

  @login_sucesso_cabecalho
  Cenário: Realizar login com sucesso pelo link do cabeçalho
    Dado que esteja na página de login acessando pelo link do cabeçalho
    Quando preencher o usuário e senha 
    E clicar em entre
    Então deverá redirecionar para a página de empregados

  @login_usuario_invalido
  Cenário: Realizar login com usuário inválido
    Dado que esteja na página de login do site 
    Quando preencher o nome com um usuário inválido e senha correta
    E clicar em entre
    Então deverá retornar a mensagem "ERRO! Usuário ou Senha inválidos"

  @login_senha_incorreta
  Cenário: Realizar login com senha incorreta
    Dado que esteja na página de login do site 
    Quando preencher o usuário e a senha incorreta
    E clicar em entre
    Então deverá retornar a mensagem "ERRO! Usuário ou Senha inválidos"