# language: pt

@desafio
@ui_cadastrar_funcionario

Funcionalidade: [ UI ] Cadastro de funcionário
  Eu como usuário do sistema
  Quero realizar cadastro do funcionário
  Para poder ter controle e manutenção do mesmo

  @ui_cadastrar_funcionario_sucesso
  Cenário: Realizar cadastro de um funcionário com sucesso
    Dado que esteja na página de empregados
    Quando clicar em novo funcionário
    E preencher os dados corretamente
    E enviar as informações
    Então deverá retornar uma mensagem de sucesso "SUCESSO! Usuário cadastrado com sucesso"
    E exibir as informações corretamente no painel

  @ui_cadastrar_funcionario_cpfinvalido
  Cenário: Validar a mensagem de erro sobre CPF inválido
    Dado que esteja na página de empregados
    Quando clicar em novo funcionário
    E preencher o cpf de forma inválida sendo "999.999.999-99"
    E enviar as informações
    Então deverá retornar uma mensagem de erro como alerta "CPF Invalido!"
  
  @ui_cadastrar_funcionario_cargoerrado
  Cenário: Validar a mensagem de erro sobre cargo inválido
    Dado que esteja na página de empregados
    Quando clicar em novo funcionário
    E preencher o cargo de forma inválida sendo "qa@"
    E enviar as informações
    Então deverá retornar uma mensagem de erro "ERRO! Ops.. Tivemos um erro ao tentar cadastrar o funcionário"