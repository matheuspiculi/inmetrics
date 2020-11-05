# encoding: utf-8
# language:pt

Quando('clicar no ícone de exclusão do primeiro usuário encontrado') do
    @employees.delete_user
end
  
Então('deverá retornar a mensagem de sucesso de exclusão {string}') do |message|
    expect(@delete_employees.message_success.text).to include message
end
