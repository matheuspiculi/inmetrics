# language: pt

Quando('verifico as colunas da tabela de funcionarios') do
  expect(@employees.count_colunas_tabela).to eq 6
end

Entao('deverá ser exibidas as colunas {string}, {string}, {string}, {string}, {string} e {string}') do |col_nome, col_cpf, col_sexo, col_cargo, col_admissao, col_manter|
  name_colunms = @employees.names_colunas_tabela
  expect(name_colunms[0].text).to eq col_nome
  expect(name_colunms[1].text).to eq col_cpf
  expect(name_colunms[2].text).to eq col_sexo
  expect(name_colunms[3].text).to eq col_cargo
  expect(name_colunms[4].text).to eq col_admissao
  expect(name_colunms[5].text).to eq col_manter
end
