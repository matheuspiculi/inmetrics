# language:pt

Dado('que estou listando os usuários {string}') do |url|
  @response = @consult_user_api.consult_all(url)
end

Então("o response do serviço da consulta deverá ser {int}") do |code|
  expect(@consult_user_api.response_code).to eq code
end

E("deverá retornar a quantidade de usuários cadastrados") do
  log("Quantidade de usuários cadastrados: " + @response.size.to_s)
end

Dado('o empregado {string}') do |nrempregado|
  @emp = nrempregado
end

Quando('realizo a consulta {string}') do |url|
  @response = @consult_user_api.consult_empregado(url,@emp)
end

E('deverão retornar as informações do mesmo') do
  expect(@response.parsed_response['empregadoId']).to eq 2541
  expect(@response.parsed_response['nome']).to eq "Valentina"
  expect(@response.parsed_response['sexo']).to eq "f"
  expect(@response.parsed_response['cpf']).to eq "803.483.786-53"
  expect(@response.parsed_response['cargo']).to eq "Executive"
  expect(@response.parsed_response['admissao']).to eq "04/11/2020"
  expect(@response.parsed_response['salario']).to eq "1.000,00"
  expect(@response.parsed_response['comissao']).to eq "3.000,00"
  expect(@response.parsed_response['tipoContratacao']).to eq "clt"
end

E("o schema do json ser igual ao template {string}") do |templatejson|
  JSON::Validator.validate!("#{Dir.pwd}/features/support/api/schemas_model/#{templatejson}.json", @response.body)
end

E("ser retornado a mensagem {string}") do |msg|
  expect(@response.parsed_response).to eq msg
end

Dado('as credenciais invalidas') do
end