# language: pt

Quando('pesquisar pelo usuário cadastrado') do
  @userdel = @common.load_data_test('api')
  @employees.search_name_employee(@userdel['last_id_user_api']['nome'])
  sleep 1
  expect(@employees.table_qtd_filter).to include 'Mostrando os registros de 1 a 1 de um total de 1 (filtrado de um total de'
  expect(@employees.name_table_employee).to eq @userdel['last_id_user_api']['nome']
end

Quando('clicar no ícone de exclusão do primeiro usuário encontrado') do
  @employees.click_delete_employee
end

Entao('deverá retornar a mensagem de sucesso de exclusão {string}') do |message|
  expect(@delete_employees.text_msg_success).to include message
end

E('não ser mais exibido na pesquisa') do
  @employees.click_employee_head
  @employees.search_name_employee(@userdel['last_id_user_api']['nome'])
  expect(@delete_employees.text_msg_not_available).to eq 'Nenhum registro encontrado'
end
