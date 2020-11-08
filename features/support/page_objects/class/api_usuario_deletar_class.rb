# language: pt
class DeleteUserApi
  def delete_user(url, emp)
    @response = HTTParty.put(
      "#{$baseurl_api}#{url}/#{emp}",
      basic_auth: {
        username: dadosyaml['deleteuser']['username_api'],
        password: dadosyaml['deleteuser']['password_api']
      },
      headers: {
        'Content-Type' => 'application/json'
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
