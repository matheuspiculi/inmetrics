# encoding: utf-8
# language:pt

Dado('que esteja na página de login do site') do
    @login.home
    expect(page).to have_current_path("http://www.inmrobo.tk/accounts/login/")
    expect(@login.title_page.text).to eql("Login")
end

Dado('que esteja na página de login acessando pelo link do cabeçalho') do
    @login.home
    @login.click_link_login_header
    expect(page).to have_current_path("http://www.inmrobo.tk/accounts/login/")
    expect(@login.title_page.text).to eql("Login")
end

Quando('preencher o usuário e senha') do
    @dataui = load_data_test("ui")
    @login.login_user(@dataui['user_login'])
end

Quando('preencher o nome com um usuário inválido e senha correta') do
    @dataui = load_data_test("ui")
    @login.login_user(@dataui['username_invalid'])
end

Quando('preencher o usuário e a senha incorreta') do
    @dataui = load_data_test("ui")
    @login.login_user(@dataui['password_invalid'])
end

Quando('preencher o nome com um usuário nao preenchido e senha correta') do
    @dataui = load_data_test("ui")
    @login.login_user(@dataui['username_blank'])
    expect(@login.getclassUsernameField).to eq "wrap-input100 validate-input"
end

Quando('preencher o nome com um usuário preenchido e senha nao preenchida') do
    @dataui = load_data_test("ui")
    @login.login_user(@dataui['password_blank'])
    expect(@login.getclassPasswordField).to eq "wrap-input100 validate-input"
end

Quando('clicar em entre') do
    @login.click_enter
    @login.findbtnSair
    expect(page).to have_current_path("http://www.inmrobo.tk/empregados/")
end
  
Então('deverá redirecionar para a página de empregados') do
    expect(@employees.table_employees).to be_truthy
end

Então('deverá retornar a mensagem {string}') do |message|
    expect(@login.message_alert.text).to include(message)
end

Então('deverá indicar que o campo usuario é obrigatorio') do
    expect(@login.getclassUsernameField).to eq "wrap-input100 validate-input alert-validate"
end

Então('deverá indicar que o campo senha é obrigatorio') do
    expect(@login.getclassPasswordField).to eq "wrap-input100 validate-input alert-validate"
end