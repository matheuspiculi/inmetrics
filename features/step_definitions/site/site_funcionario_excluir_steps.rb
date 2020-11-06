# encoding: utf-8
# language:pt

Quando('pesquisar pelo usuário cadastrado') do
    @userdel = load_data_test("api")
    @employees.search_name_employee(@userdel['last_id_user_api']['nome'])
end

Quando('clicar no ícone de exclusão do primeiro usuário encontrado') do
    @employees.click_delete_employee
end
  
Então('deverá retornar a mensagem de sucesso de exclusão {string}') do |message|
    expect(@delete_employees.getTextMsgSucess).to include message
end

E('não ser mais exibido na pesquisa') do
    @employees.click_employee_head
    @employees.search_name_employee(@userdel['last_id_user_api']['nome'])
    expect(@delete_employees.getTextMsgNotAvailable).to eq "Nenhum registro encontrado"
end