# encoding: utf-8
# language:pt

class NewUserApi
    def data_new_user
        dadosyaml = load_data_test("api")
        @body = {
            "admissao": dadosyaml["#{$tagscenario}"]["admissao"],
            "cargo": dadosyaml["#{$tagscenario}"]["cargo"],
            "comissao": dadosyaml["#{$tagscenario}"]["comissao"],
            "cpf": dadosyaml["#{$tagscenario}"]["cpf"],
            "departamentoId": dadosyaml["#{$tagscenario}"]["departamentoId"],
            "nome": dadosyaml["#{$tagscenario}"]["nome"],
            "salario": dadosyaml["#{$tagscenario}"]["salario"],
            "sexo": dadosyaml["#{$tagscenario}"]["sexo"],
            "tipoContratacao": dadosyaml["#{$tagscenario}"]["tipoContratacao"]
        }.to_json
    end

    def data_new_user_invalid(admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao)
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

    def post_data(url)
        dadosyaml = load_data_test("api")
        @response = HTTParty.post(
            "#{$baseurl_api}#{url}",
            basic_auth: {
                username: dadosyaml["#{$tagscenario}"]["username_api"],
                password: dadosyaml["#{$tagscenario}"]["password_api"],
            },
            headers: { 
                "Content-Type" => 'application/json'
            },
            body: @body
        )
        return @response
    end

    def response_code(response)
        response.code.to_s
    end

    def validarJsonTemplate(templatejson,response)
        JSON::Validator.validate!("#{Dir.pwd}/features/support/api/schemas_model/#{templatejson}.json", response.body)
    end

    def record_user_response
        record_user_response = YAML.load(File.read(%-#{Dir.pwd}/features/support/data/test_data.yaml-))
        record_user_response["last_id_user_api"]["nome"] = @response['nome']
        record_user_response["last_id_user_api"]["cpf"] = @response['cpf']
        record_user_response["last_id_user_api"]["id"] = @response['empregadoId']

        File.open("#{Dir.pwd}/features/support/data/test_data.yaml", 'w') {
            |f| f.write record_user_response.to_yaml 
        }
    end
end
  