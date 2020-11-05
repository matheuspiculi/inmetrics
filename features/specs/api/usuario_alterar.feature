# encoding: utf-8
# language:pt

@desafio
@api

Funcionalidade: Alterar Usuário
  Eu como usuário
  Quero alterar o usuário
  Para que eu possa validar o serviço

  @api_alterar_usuario_sucesso
  Cenário: Alterar usuário com sucesso
    Dado que esteja consultando um usuário para altera-lo
    E informe novos dados para modificação
    Quando enviar a solicitação para o serviço "empregado/alterar"
    Então deverá retornar o response 202
    
  @api_alterar_usuario_sucesso_informacoes_invalidas
  Esquema do Cenário: Realizar alteração com informações inválidas
    Dado que esteja consultando um usuário para altera-lo
    E esteja informando os dados "<admissao>" "<cargo>" "<comissao>" "<cpf>" "<nome>" "<salario>" "<sexo>" <departamento> "<tipocontratacao>"
    Quando enviar a solicitação para o serviço "empregado/alterar"
    Então deverá retornar a mensagem de alteração "<mensagem>"
    E deverá retornar o response 400

    Exemplos:
      | admissao    | cargo         | comissao   | cpf             | nome      | salario   | sexo  | departamento | tipocontratacao | mensagem                                            |
      | 004/02/2020 | analista      | 250.00,00  | 021.346.190-07  | joao      | 4.100,00  | m     |    2         | pj              | admissao: deve estar no padrão 31/12/2020           |
      |             | analista      | 250.00,00  | 021.346.190-07  | joao      | 4.100,00  | m     |    2         | pj              | admissao: must not be blank                         |
      | 04/02/2020  | 1analista     | 250.00,00  | 021.346.190-07  | paula     | 5.200,00  | m     |    1         | pj              | cargo: não utilizar números ou caracteres especiais |    
      | 05/02/2020  | desenvolvedor | 200        | 021.346.190-07  | maria     | 6.300,00  | m     |    3         | pj              | comissao: deve estar no padrão 1.000,00             |
      | 06/02/2020  | testado       | 250.00,00  | 8512.222.333-88 | jose      | 7.400,00  | m     |    4         | pj              | cpf: deve estar no padrão 111.222.333-00            |
      | 07/02/2020  | qa            | 250.00,00  | 021.346.190-07  | 8k        | 8.300,00  | m     |    1         | pj              | nome: não utilizar números ou caracteres especiais  |
      | 08/02/2020  | qa            | 250.00,00  | 021.346.190-07  | julio     | 100       | m     |    1         | pj              | salario: deve estar no padrão 1.000,00              |
      | 09/02/2020  | analista      | 250.00,00  | 021.346.190-07  | joao      | 9.240,00  | masc  |    1         | pj              | sexo: m, f ou i                                     |
      | 10/02/2020  | qa            | 250.00,00  | 021.346.190-07  | paulo     | 10.340,00 | m     |    0         | pj              | Departamento não cadastrado                         |
      | 11/02/2020  | gerente qa    | 250.00,00  | 021.346.190-07  | luis      | 4.200,00  | m     |    1         | pessoa física   | tipoContratacao: pj ou clt                          |

  @api_alterar_usuario_sucesso_401
  Cenário: Erro 401
    Dado as credenciais invalidas
    E que esteja consultando um usuário para altera-lo
    Quando realizo a consulta "empregado/alterar"
    Então o retorno do serviço deverá ser "401"

  @api_alterar_usuario_sucesso_404
  Cenário: Erro 404
    Dado que esteja consultando um usuário para altera-lo
    Quando realizo a consulta "empregado/alterarr"
    Então o retorno do serviço deverá ser "40"

  @api_alterar_usuario_sucesso_405
  Cenário: Erro 405
    Dado que esteja consultando um usuário para altera-lo
    Quando realizo a consulta "empregado/alterar/s"
    Então o retorno do serviço deverá ser "405"