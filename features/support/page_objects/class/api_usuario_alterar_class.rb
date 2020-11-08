# language: pt

class UpdateUserApi
  def consult_last_register_user
    record_user_response = load_data_test('api')
    @last_user = record_user_response['last_id_user_api']['id']
  end

  def data_user
    dadosyaml = load_data_test('api')
    @body = {
      "admissao": dadosyaml[$tagscenario.to_s]['admissao'],
      "cargo": dadosyaml[$tagscenario.to_s]['cargo'],
      "comissao": dadosyaml[$tagscenario.to_s]['comissao'],
      "cpf": Faker::IDNumber.brazilian_citizen_number(formatted: true),
      "departamentoId": dadosyaml[$tagscenario.to_s]['departamentoId'],
      "nome": Faker::Name.name,
      "salario": dadosyaml[$tagscenario.to_s]['salario'],
      "sexo": dadosyaml[$tagscenario.to_s]['sexo'],
      "tipoContratacao": dadosyaml[$tagscenario.to_s]['tipoContratacao']
    }.to_json
  end

  def data_user_invalid(user_change)
    @body = {
      "admissao": user_change[:admissao],
      "cargo": user_change[:cargo],
      "comissao": user_change[:comissao],
      "cpf": user_change[:cpf],
      "departamentoId": user_change[:departamento],
      "nome": user_change[:nome],
      "salario": user_change[:salario],
      "sexo": user_change[:sexo],
      "tipoContratacao": user_change[:tipocontratacao]
    }.to_json
  end

  def put_user(url)
    dadosyaml = load_data_test('api')
    @response = HTTParty.put(
      "#{$baseurl_api}#{url}/#{@last_user}",
      basic_auth: {
        username: dadosyaml[$tagscenario.to_s]['username_api'],
        password: dadosyaml[$tagscenario.to_s]['password_api']
      },
      headers: {
        'Content-Type' => 'application/json'
      },
      body: @body
    )
    return @response
  end

  def response_code
    @response.code
  end

  def response_data
    @response
  end
end
