# encoding: utf-8
# language:pt

Dado('que esteja na página de empregados') do
    steps %{
        Dado que esteja na página de login do site
        Quando preencher o usuário e senha 
        E clicar em entre
        Então deverá redirecionar para a página de empregados
    }
end
  
Quando('clicar em novo funcionário') do
    @employees.click_new_employees
end

Quando('preencher os dados {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |nome, cpf, cargo, salario, admissao, sexo, tipo_contratacao|
    employee = { nome: nome, cpf: cpf, cargo: cargo, salario: salario, admissao: admissao, sexo: sexo, tipo_contratacao: tipo_contratacao }
    @new_employees.fill_form_employee(employee)
end
  
Quando('enviar as informações') do
    @new_employees.click_btn_form
end

Então('deverá retornar uma mensagem de sucesso {string}') do |message|
    expect(@new_employees.message_success.text).to include(message)
end
