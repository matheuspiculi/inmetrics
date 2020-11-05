# encoding: utf-8
# language:pt

Quando('preencher o usuário e senha') do
    user_login = load_data_test['user_login']
    @login.login_user(user_login)
end

Quando('clicar em entre') do
    @login.click_enter
end
  
Então('deverá redirecionar para a página de empregados') do
    expect(@employees.table_employees).to be_truthy
end

Dado('que esteja na página de login acessando pelo link do cabeçalho') do
    @login.home
    @login.click_link_login_header
    expect(@login.title_page.text).to eql("Login")
end

Quando('preencher o nome com um usuário inválido e senha correta') do
    user_login = load_data_test['username_invalid']
    @login.login_user(user_login)
end
  
Então('deverá retornar a mensagem {string}') do |message|
    expect(@login.message_alert.text).to include(message)
end

Quando('preencher o usuário e a senha incorreta') do
    user_login = load_data_test['password_invalid']
    @login.login_user(user_login)
end