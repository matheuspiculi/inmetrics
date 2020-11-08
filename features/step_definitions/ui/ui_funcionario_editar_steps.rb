# language: pt

Quando('pesquiso pelo usuário {string} para realizar a alteração') do |name|
  @edit_employee = name
  @home.search_name_employee(@edit_employee)
end

E('clico no ícone de edição do primeiro usuário encontrado') do
  @home.click_edit_employee
end

Quando('clicar no ícone de edição do primeiro usuário encontrado') do
  @employees.click_edit_employee
end

Quando('alterar as seguintes informações de cargo {string} e admissão {string}') do |office, admission|
  @edit_office = office
  @edit_admission = admission
  @edit_employees.edit_fill_form_employes(@edit_office, @edit_admission)
end

Entao('as alterações deverão ter sido modificadas via painel') do
  steps %{
    Quando pesquisar pelo usuário cadastrado
  }
  expect(@employees.value_table[0].text).to eql(@userdel['last_id_user_api']['nome'])
  expect(@employees.value_table[1].text).to eql(@userdel['last_id_user_api']['cpf'])
  expect(@employees.value_table[2].text).to eql(@common.change_sexo_frontend(@userdel['last_id_user_api']['sexo']))
  expect(@employees.value_table[3].text).to eql(@edit_office)
  expect(@employees.value_table[4].text).to eql(@edit_admission)
end

Entao('as alterações deverão ter sido modificadas via editar') do
  steps %{
    E clico no ícone de edição do primeiro usuário encontrado
  }
  expect(@edit_employees.text_cargo).to eql(@edit_office)
  expect(@edit_employees.text_admissao).to eql(@edit_admission)
end
