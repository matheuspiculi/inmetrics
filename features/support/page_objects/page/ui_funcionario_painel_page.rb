# language: pt

class PanelEmployeesPage < SitePrism::Page
  elements :colunasTabela, '#tabela > thead > tr > th'

  def count_colunas_tabela
    colunasTabela.count
  end

  def names_colunas_tabela
    page.all('#tabela > thead > tr > th')
  end
end
