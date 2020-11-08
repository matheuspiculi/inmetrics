# language:pt

class ConsultUserApi
  def consult_all(url)
    dadosyaml = load_data_test('api')
    @response = HTTParty.get(
      "#{$baseurl_api}#{url}",
      basic_auth: {
        username: dadosyaml[$tagscenario.to_s]['username_api'],
        password: dadosyaml[$tagscenario.to_s]['password_api']
      },
      headers: {
        "Content-Type" => 'application/json'
      }
    )
  end

  def consult_empregado(url,emp)
    dadosyaml = load_data_test('api')
    @response = HTTParty.get(
      "#{$baseurl_api}#{url}/#{emp}",
      basic_auth: {
        username: dadosyaml[$tagscenario.to_s]['username_api'],
        password: dadosyaml[$tagscenario.to_s]['password_api']
      },
      headers: {
        "Content-Type" => 'application/json'
      }
    )
  end

  def response_code
    @response.code
  end

  def response_data
    @response
  end
end