# encoding: utf-8
# language:pt

Quando('pesquiso pelo usuário {string} para realizar a alteração') do |name|
  @edit_employee = name  
  @home.search_name_employee(@edit_employee)
end

E("clico no ícone de edição do primeiro usuário encontrado") do
    @home.click_edit_employees    
end

Quando("altero as seguintes informações cargo {string} salario {string}") do |office, admission|
    @edit_office = office
    @edit_admission = admission
    @edit_employees.edit_fill_form_employes(@edit_office, @edit_admission)
end
  
Então('devo verificar se as informações do usuário {string} foram alteradas') do |user|
  @home.search_name_employee(user)
  expect(@home.value_table[3].text).to eql(@edit_office)
  expect(@home.value_table[4].text).to eql(@edit_admission)
end

Quando('pesquisar pelo usuário {string}') do |name|
  @edit_employee = name  
  @employees.search_name_employee(@edit_employee)
end

Quando('clicar no ícone de edição do primeiro usuário encontrado') do
  @employees.click_edit_employees
end

Quando('alterar as seguintes informações de cargo {string} e admissão {string}') do |office, admission|
  @edit_office = office
  @edit_admission = admission
  @edit_employees.edit_fill_form_employes(@edit_office, @edit_admission)
end

Então('as alterações deverão ter sido modificadas') do
  @employees.search_name_employee(@edit_employee)
  expect(@employees.value_table[3].text).to eql(@edit_office)
  expect(@employees.value_table[4].text).to eql(@edit_admission)
end
