# encoding: utf-8
# language:pt

@desafio
@funcionario

Funcionalidade: Cadastro de funcionário
  Eu como usuário do sistema
  Quero realizar cadastro do funcionário
  Para poder ter controle e manutenção do mesmo

  @cadastrar_funcionario
  Esquema do Cenário: Realizar cadastro de um funcionário com sucesso
    Dado que esteja na página de empregados
    Quando clicar em novo funcionário
    E preencher os dados <nome>, <cpf>, <cargo>, <salario>, <admissao>, <sexo>, <tipo_contratacao>
    E enviar as informações
    Então deverá retornar uma mensagem de sucesso "SUCESSO! Usuário cadastrado com sucesso"

    Exemplos:
      | nome             | cpf            | cargo | salario | admissao   | sexo      | tipo_contratacao |
      | Matheus Piculi   | 440.356.978-18 | QA    | 9854    | 05/11/2020 | Masculino | CLT              |