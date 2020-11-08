
# language:pt

Quando('verifico as colunas da tabela de funcionarios') do
  expect(@panel_employees.count_colunas_tabela).to eq 6
  nameColunms = @panel_employees.names_colunas_tabela
end
  
Então('deverá ser exibidas as colunas {string}, {string}, {string}, {string}, {string} e {string}') do |colNome,colCPF,colSexo,colCargo,colAdmissao,colManter|
  expect(nameColunms[0].text).to eq colNome
  expect(nameColunms[1].text).to eq colCPF
  expect(nameColunms[2].text).to eq colSexo
  expect(nameColunms[3].text).to eq colCargo
  expect(nameColunms[4].text).to eq colAdmissao
  expect(nameColunms[5].text).to eq colManter
end