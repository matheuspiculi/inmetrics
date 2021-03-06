# language: pt
Dado('que possuo um usuário para cadastro') do
  @new_user_api.data_newuser
end

Quando('enviar a solicitação post para o endereço {string}') do |url|
  @response = @new_user_api.post_data(url)
end

Entao('o retorno do serviço deverá ser {int}') do |code|
  expect(@new_user_api.response_code).to eq code
end

Dado('que esteja enviando os dados {string} {string} {string} {string} {string} {string} {string} {int} {string}') do |admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao|
  user_new = { admissao: admissao, cargo: cargo, comissao: comissao, cpf: cpf, nome: nome, salario: salario, sexo: sexo, departamento: departamento, tipocontratacao: tipocontratacao }
  @new_user_api.data_newuser_invalid(user_new)
end

Entao('a mensagem deverá ser {string}') do |message|
  expect(@new_user_api.response_data).to include message
end

E('também deverá salvar suas informações para realizar consultas futuras') do
  @new_user_api.record_user_response
end
