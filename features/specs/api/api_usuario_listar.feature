# encoding: utf-8
# language:pt

@desafio
@api_listar_usuario

Funcionalidade: [ API ] Listar usuários
  Eu como usuário
  Quero consultar os usuários cadastrados
  Para poder validar o serviço de busca

  @api_listar_usuario_todos
  Cenário: Listar todos os empregados
    Dado que estou listando os usuários "empregado/list_all"
    Então o response do serviço da consulta deverá ser 200
    E deverá retornar a quantidade de usuários cadastrados

  @api_listar_usuario_todos_401
  Cenário: Listar todos os empregados
    Dado as credenciais invalidas
    Quando realizo a consulta "empregado/list_all"
    Então o response do serviço da consulta deverá ser 401

  @api_listar_usuario_todos_404
  Cenário: Erro 404
    Quando realizo a consulta "empregado/list_all/a"
    Então o response do serviço da consulta deverá ser 404

  @api_listar_usuario_especifico
  Cenário: Buscar um empregado especifico
    Dado o empregado "2541"
    Quando realizo a consulta "empregado/list"
    Então o response do serviço da consulta deverá ser 202
    E deverão retornar as informações do mesmo
    E o schema do json ser igual ao template "api_listar_usuario_especifico"

  @api_listar_usuario_especifico_inexistente
  Cenário: Consultar um empregado inexistente
    Dado o empregado "9999999"
    Quando realizo a consulta "empregado/list"
    Então o response do serviço da consulta deverá ser 400
    E ser retornado a mensagem "Empregado não cadastrado"

  @api_listar_usuario_especifico_401
  Cenário: Erro 401
    Dado as credenciais invalidas
    E o empregado "2541"
    Quando realizo a consulta "empregado/list"
    Então o response do serviço da consulta deverá ser 400

  @api_listar_usuario_especifico_404
  Cenário: Erro 404
    Dado o empregado "2541"
    Quando realizo a consulta "empregado/lists"
    Então o response do serviço da consulta deverá ser 404