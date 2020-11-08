# language: pt
class EmployeesPage < SitePrism::Page
  element :table_employees, '#tabela'
  element :filter_table, '#tabela_filter input'
  element :message_edit, '.alert.alert-success.alert-dismissible'
  element :employee_head, 'a[href="/empregados/"]'
  element :table_info, '#tabela_info'
  elements :btn_delete, '#delete-btn'
  elements :btn_change, '.fa.fa-pencil'
  elements :value_table, '#tabela tr td'
  elements :colunasTabela, '#tabela > thead > tr > th'

  def home
    visit '/empregados/'
  end

  def click_employee_head
    employee_head.click
  end

  def click_new_employees
    click_link 'Novo Funcionário'
  end

  def search_name_employee(name)
    filter_table.set(name)
    sleep 1
  end

  def click_delete_employee
    btn_delete.first.click
  end

  def click_edit_employee
    btn_change.first.click
  end

  def table_qtd_filter
    table_info.text
  end

  def name_table_employee
    value_table[0].text
  end

  def count_colunas_tabela
    colunasTabela.count
  end

  def names_colunas_tabela
    page.all('#tabela > thead > tr > th')
  end

  def text_name

  end

  def text_cpf

  end

  def text_gender

  end

  def text_office

  end

  def text_admission

  end

  def text_money

  end
  
end
