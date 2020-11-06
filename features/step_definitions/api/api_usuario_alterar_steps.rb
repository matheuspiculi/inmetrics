# encoding: utf-8
# language:pt
  
Dado('esteja informando os dados {string} {string} {string} {string} {string} {string} {string} {string} {string}') do |admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao|
    @update_user_api.data_user_invalid(admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao)  
end

E("a mensagem de alteração deverá ser {string}") do |message|
    expect(@update_user_api.response_data).to include message
end

Dado('que esteja consultando um usuário para altera-lo') do
    @update_user_api.consult_last_register_user
end
  
Dado('informe novos dados para modificação') do
    @update_user_api.data_user
end
  
Quando('enviar a solicitação para o serviço {string}') do |url|
    @update_user_api.put_user(url)
end
  
Então('deverá retornar o response {int}') do |code|
    expect(@update_user_api.response_code).to eq code 
end
   
Então('deverá retornar a mensagem de alteração {string}') do |message|
    expect(@update_user_api.response_data).to include message
end
