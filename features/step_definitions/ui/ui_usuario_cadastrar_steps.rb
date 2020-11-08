# language:pt

Dado('que esteja no modal de login de cadastro') do
  steps %{
    Dado que esteja na página de login do site
  }
end

Quando('clicar em cadastre-se no modal de login') do
  @login.click_register
end

Quando('clicar em cadastre-se no cabeçalho') do
  @login.click_link_register_header
end

Então('deverá redirecionar para a página de cadastro') do
  expect(page).to have_current_path("http://www.inmrobo.tk/accounts/signup/")
end
  
Então('deverá retornar um modal de cadastro') do
  expect(@register.title_page.text).to eql("Cadastre-se")
end

Quando('preencher o cadastro') do
  @register.fill_form_user
end

Quando('clicar em cadastrar deixando os campos vazios') do
  expect(@register.usarname_value).to eq ""
  expect(@register.password_value).to eq ""
  expect(@register.confirm_passaword_value).to eq ""
  @register.click_btn_register
end

Então('deverá ser redirecionado para o login') do
  expect(page).to have_current_path("http://www.inmrobo.tk/accounts/login/")
end

Então('deverá retornar um modal de login') do
  expect(@login.title_page.text).to eql("Login")
end

Então('deverão retornar alertas de campo obrigatório') do
  expect(@register.username_class).to eq "wrap-input100 validate-input alert-validate" 
  expect(@register.password_class).to eq "wrap-input100 validate-input alert-validate"
  expect(@register.confirm_password_class).to eq "wrap-input100 validate-input alert-validate"
end

Quando('preencher um nome') do
  @register.fill_name
end
  
Quando('preencher a senha {string}') do |password01|
  @register.fill_password(password01)
end
  
Quando('confirmar a senha {string}') do |password02|
  @register.fill_confirm_password(password02)
end

Quando('realizar o cadastro') do
  @register.click_btn_register
end

Quando('clicar em login no modal') do
    @register.click_btn_login
end
  
Então('deverá retornar uma mensagem de erro do usuario {string}') do |message|
  expect(@register.get_text_erro_message).to eql(message)
end

Dado('preencher o nome {string}') do |name_register|
  @register.fill_name_register(name_register)
end
  
Então('deverá retornar uma mensagem {string}') do |message|
  expect(@register.error_invalid_name).to eql(message)
end