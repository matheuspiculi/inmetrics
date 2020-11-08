# language:pt

class EmployeesPage < SitePrism::Page
  element :table_employees, '#tabela'
  element :filter_table, '#tabela_filter input'
  element :message_edit, '.alert.alert-success.alert-dismissible'
  element :employee_head, 'a[href="/empregados/"]'
  elements :btn_delete, '#delete-btn'
  elements :btn_change, '.fa.fa-pencil'
  elements :value_table, '#tabela tr td'
  
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
  end

  def click_delete_employee
    btn_delete.first.click
  end

  def click_edit_employee
    btn_change.first.click
  end
end