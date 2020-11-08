# language: pt
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

Quando('preencher os dados corretamente') do
  @employeenew = load_data_test('ui')
  @employee = { nome: Faker::Name.name, cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true), cargo: @employeenew[$tagscenario.to_s]['cargo'], salario: @employeenew[$tagscenario.to_s]['salario'], admissao: @employeenew[$tagscenario.to_s]['admissao'], sexo: @employeenew[$tagscenario.to_s]['sexo'], tipo_contratacao: @employeenew[$tagscenario.to_s]['tipo_contratacao'] }
  @new_employees.fill_form_employee(@employee)
end

Quando('preencher o cpf de forma inválida sendo {string}') do |invalidcpf|
  @new_employees.fill_cpf_field(invalidcpf)
end

Quando('preencher o cargo de forma inválida sendo {string}') do |invalidoffice|
  @new_employees.fill_invalidoffice(invalidoffice)
end

Quando('enviar as informações') do
  @new_employees.click_btn_form
end

Entao('deverá retornar uma mensagem de sucesso {string}') do |message|
  expect(@new_employees.text_msg_success).to include(message)
end

E('exibir as informações corretamente no painel') do
  @employees.search_name_employee(@employee[:nome])
  expect(@employees.value_table[0].text).to eql(@employee[:nome])
  expect(@employees.value_table[1].text).to eql(@employee[:cpf])
  expect(@employees.value_table[2].text).to eql(@employee[:sexo])
  expect(@employees.value_table[3].text).to eql(@employee[:cargo])
  expect(@employees.value_table[4].text).to eql(@employee[:admissao])
end

Entao('deverá retornar uma mensagem de erro como alerta {string}') do |message|
  expect(page.driver.browser.switch_to.alert.text).to eq(message)
  page.driver.browser.switch_to.alert.accept
end

Entao('deverá retornar uma mensagem de erro {string}') do |message|
  expect(@new_employees.text_msg_error).to eq(message)
end
