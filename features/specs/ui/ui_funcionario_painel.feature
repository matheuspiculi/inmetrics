# language: pt

@desafio
@ui_painel_funcionario

Funcionalidade: [ UI ] Painel Funcionarios
  Eu como usuário do sistema
  Quero verificar os dados de todos os meus funcionarios

  @ui_painel_funcionario_colunastabela
  Cenário: Validar as colunas de informações
    Dado que esteja na página de empregados
    Quando verifico as colunas da tabela de funcionarios
    Então deverá ser exibidas as colunas "Nome", "CPF", "Sexo", "Cargo", "Admissão" e "Manter"