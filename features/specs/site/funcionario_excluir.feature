# encoding: utf-8
# language:pt

@desafio
@ui_excluir_funcionario

Funcionalidade: Excluir cadastro do funcionário
  Eu como usuário do sistema
  Quero realizar exclusão do cadastro do funcionário
  Para poder ter controle e manutenção do mesmo

  @ui_excluir_funcionario_sucesso
  Cenário: Realizar exclusão do usuário
    Dado que esteja na página de empregados
    Quando pesquisar pelo usuário cadastrado
    E clicar no ícone de exclusão do primeiro usuário encontrado
    Então deverá retornar a mensagem de sucesso de exclusão "SUCESSO! Funcionário removido com sucesso"
    E não ser mais exibido na pesquisa