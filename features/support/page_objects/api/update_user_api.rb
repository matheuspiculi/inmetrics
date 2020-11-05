# encoding: utf-8
# language:pt

class UpdateUserApi
    def consult_last_register_user
        record_user_response = load_data_test("api")
        @last_user = record_user_response['last_id_user_api']['id']
    end

    def data_user
        dadosyaml = load_data_test("api")
        @body = {
            "admissao": dadosyaml["#{$tagscenario}"]["admissao"],
            "cargo": dadosyaml["#{$tagscenario}"]["cargo"],
            "comissao": dadosyaml["#{$tagscenario}"]["comissao"],
            "cpf": Faker::IDNumber.brazilian_citizen_number(formatted: true),
            "departamentoId": dadosyaml["#{$tagscenario}"]["departamentoId"],
            "nome": Faker::Name.name,
            "salario": dadosyaml["#{$tagscenario}"]["salario"],
            "sexo": dadosyaml["#{$tagscenario}"]["sexo"],
            "tipoContratacao": dadosyaml["#{$tagscenario}"]["tipoContratacao"]
        }.to_json
    end

    def data_user_invalid(admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao)
        @body = {
            "admissao": admissao,
            "cargo": cargo,
            "comissao": comissao,
            "cpf": cpf,
            "departamentoId": departamento,
            "nome": nome,
            "salario": salario,
            "sexo": sexo,
            "tipoContratacao": tipocontratacao
        }.to_json
    end

    def put_user(url)
        dadosyaml = load_data_test("api")
        @response = HTTParty.put(
            "#{$baseurl_api}#{url}/#{@last_user}",
            basic_auth: {
                username: dadosyaml["#{$tagscenario}"]["username_api"],
                password: dadosyaml["#{$tagscenario}"]["password_api"],
            },
            headers: { 
                "Content-Type" => 'application/json'
            },
            body: @body
        )
    end

    def response_code
        @response.code
    end

    def response_data
        @response
    end
end