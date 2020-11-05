# encoding: utf-8
# language:pt

Quando('clicar em cadastre-se no modal de login') do
    @login.click_register
end
  
Então('deverá redirecionar para a página de cadastro') do
    @register.home
end
  
Então('deverá retornar um modal de cadastro') do
    expect(@register.title_page.text).to eql("Cadastre-se")
end

Quando('clicar em cadastre-se no cabeçalho') do
    @login.click_link_register_header
end

Dado('que esteja no modal de login de cadastro') do
    steps %{
        Dado que esteja na página de login do site
        Quando clicar em cadastre-se no modal de login
        Então deverá redirecionar para a página de cadastro
        E deverá retornar um modal de cadastro
    }
end
  
Quando('preencher o cadastro') do
    @register.fill_form_user
end
  
Então('deverá ser redirecionado para o login') do
    @login.home
    expect(@login.title_page.text).to eql("Login")
end

Quando('clicar em cadastrar deixando os campos vazios') do
    @register.click_btn_register
end
  
Então('deverão retornar alertas de campo obrigatório') do
    expect(@register.alert_message.first).to be_truthy
    expect(@register.alert_message[1]).to be_truthy
    expect(@register.alert_message.last).to be_truthy
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
  
Então('deverá retornar uma mensagem de erro {string}') do |message|
    expect(@register.error_message.text).to eql(message)
end

Dado('preencher o nome {string}') do |name_register|
    @register.fill_name_register(name_register)
end
  
Então('deverá retornar uma mensagem {string}') do |message|
    expect(@register.error_message_user.first.text).to eql(message)
end
