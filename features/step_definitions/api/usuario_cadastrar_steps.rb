# encoding: utf-8
# language:pt

Dado("que possuo um usuário para cadastro") do
    @new_user_api.data_new_user
end

Quando("enviar a solicitação post para o endereço {string}") do |url|
    @response = @new_user_api.post_data(url)
end

Então("o retorno do serviço deverá ser {string}") do |code|
    expect(@new_user_api.response_code(@response)).to eq code
end

Então("o response deverá possuir os campos corretamente") do
    #@new_user_api.validarJsonTemplate("api_cadastrar_usuario_sucesso",@response)
end

Dado("que esteja enviando os dados {string} {string} {string} {string} {string} {string} {string} {int} {string}") do |admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao|
    @new_user_api.data_new_user_invalid(admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao)
end

Então("a mensagem deverá ser {string}") do |message|
    expect(@response[0]).to eq message
end

