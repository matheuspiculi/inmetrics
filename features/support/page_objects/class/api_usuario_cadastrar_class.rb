# language:pt

class NewUserApi
  def data_new_user
    dadosyaml = load_data_test('api')
    @body = {
      "admissao": dadosyaml[$tagscenario.to_s]['admissao'],
      "cargo": dadosyaml[$tagscenario.to_s]['cargo'],
      "comissao": dadosyaml[$tagscenario.to_s]['comissao'],
      "cpf": Faker::IDNumber.brazilian_citizen_number(formatted: true),
      "departamentoId": dadosyaml[$tagscenario.to_s]['departamentoId'],
      "nome": Faker::Name.name_with_middle,
      "salario": dadosyaml[$tagscenario.to_s]['salario'],
      "sexo": dadosyaml[$tagscenario.to_s]['sexo'],
      "tipoContratacao": dadosyaml[$tagscenario.to_s]['tipoContratacao']
    }.to_json
  end

  def data_new_user_invalid(user_new)
    @body = {
      "admissao": user_new[:admissao],
      "cargo": user_new[:cargo],
      "comissao": user_new[:comissao],
      "cpf": user_new[:cpf],
      "departamentoId": user_new[:departamento],
      "nome": user_new[:nome],
      "salario": user_new[:salario],
      "sexo": user_new[:sexo],
      "tipoContratacao": user_new[:tipocontratacao]
    }.to_json
  end

  def post_data(url)
    dadosyaml = load_data_test('api')
    @response = HTTParty.post(
      "#{$baseurl_api}#{url}",
      basic_auth: {
        username: dadosyaml[$tagscenario.to_s]['username_api'],
        password: dadosyaml[$tagscenario.to_s]['password_api']
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

  def record_user_response
    puts @response
    puts @response['nome'].class
    record_user_response = YAML.load_file(File.join(Dir.pwd, "/features/support/data/api_data.yaml"))
    record_user_response['last_id_user_api']['nome'] = @response['nome']
    record_user_response['last_id_user_api']['cpf'] = @response['cpf']
    record_user_response['last_id_user_api']['id'] = @response['empregadoId']

    File.open("#{Dir.pwd}/features/support/data/api_data.yaml", 'w') {
      |f| f.write record_user_response.to_yaml
    }
  end
end