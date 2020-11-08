# language: pt

@desafio
@api_alterar_usuario

Funcionalidade: [ API ] Alterar Usuário
  Eu como usuário
  Quero alterar o usuário
  Para que eu possa validar o serviço

  @api_alterar_usuario_sucesso
  Cenário: Alterar usuário com sucesso
    Dado que esteja consultando um usuário para altera-lo
    E informe novos dados para modificação
    Quando enviar a solicitação para o serviço "empregado/alterar"
    Então deverá retornar o response 200
    
  @api_alterar_usuario_informacoes_invalidas
  Esquema do Cenário: Realizar alteração com informações inválidas
    Dado que esteja consultando um usuário para altera-lo
    E esteja informando os dados "<admissao>" "<cargo>" "<comissao>" "<cpf>" "<nome>" "<salario>" "<sexo>" "<departamento>" "<tipocontratacao>"
    Quando enviar a solicitação para o serviço "empregado/alterar"
    Então deverá retornar a mensagem de alteração "<mensagem>"
    E deverá retornar o response 400

    Exemplos:
      | admissao    | cargo  | comissao   | cpf             | nome      | salario   | sexo  | departamento | tipocontratacao | mensagem                                            |
      | 007/02/2020 | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    2         | pj              | admissao: deve estar no padrão 31/12/2020           |
      |             | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    2         | pj              | admissao: must not be blank                         |
      | 07/02/2020  | qa1    | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    1         | pj              | cargo: não utilizar números ou caracteres especiais |    
      | 07/02/2020  | qa@    | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    1         | pj              | cargo: não utilizar números ou caracteres especiais | 
      | 07/02/2020  |        | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    1         | pj              | cargo: must not be blank                            |
      | 07/02/2020  | qa     | 200        | 021.346.190-07  | 8k        | 8.300,00  | m     |    3         | pj              | comissao: deve estar no padrão 1.000,00             |
      | 07/02/2020  | qa     |            | 021.346.190-07  | 8k        | 8.300,00  | m     |    3         | pj              | comissao: must not be blank                         |
      | 07/02/2020  | qa     | 250.00,00  | 8512.222.333-88 | 8k        | 8.300,00  | m     |    4         | pj              | cpf: deve estar no padrão 111.222.333-00            |
      | 07/02/2020  | qa     | 250.00,00  |                 | 8k        | 8.300,00  | m     |    4         | pj              | cpf: must not be blank                              |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    1         | pj              | nome: não utilizar números ou caracteres especiais  |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | @8k       | 8.300,00  | m     |    1         | pj              | nome: não utilizar números ou caracteres especiais  |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  |           | 8.300,00  | m     |    1         | pj              | nome: must not be blank                             |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 100       | m     |    1         | pj              | salario: deve estar no padrão 1.000,00              |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        |           | m     |    1         | pj              | salario: must not be blank                          |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | masc  |    1         | pj              | sexo: m, f ou i                                     |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  |       |    1         | pj              | sexo: must not be blank                             |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    0         | pj              | Departamento não cadastrado                         |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    null      | pj              | departamentoId: must not be null                    |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    1         | pessoa física   | tipoContratacao: pj ou clt                          |
      | 07/02/2020  | qa     | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    1         |                 | tipoContratacao: must not be blank                  |

  @api_alterar_usuario_401
  Cenário: Erro 401 - Unauthorized
    Dado as credenciais invalidas
    E que esteja consultando um usuário para altera-lo
    Quando realizo a consulta "/empregado/alterar"
    Então o retorno do serviço deverá ser 401

  @api_alterar_usuario_404
  Cenário: Erro 404 - Not Found
    Dado que esteja consultando um usuário para altera-lo
    Quando realizo a consulta "empregado/alterarr"
    Então o retorno do serviço deverá ser 404

  @api_alterar_usuario_400
  Cenário: Erro 400 - Undocumented
    Dado que esteja consultando um usuário para altera-lo
    E o empregado "58785545555554554"
    Quando realizo a consulta "empregado/alterar"
    Então o retorno do serviço deverá ser 400

  @api_alterar_usuario_405
  Cenário: Erro 405
    Dado que esteja consultando um usuário para altera-lo
    Quando realizo a consulta "empregado/alterar/s"
    Então o retorno do serviço deverá ser 405