# encoding: utf-8
# language:pt

class EmployeesPage < SitePrism::Page
    element  :table_employees, '#tabela'
    element  :filter_table, '#tabela_filter input'
    element  :message_edit, '.alert.alert-success.alert-dismissible'
    elements :btn_delete, '#delete-btn'
    elements :btn_change, '.fa.fa-pencil'
    elements :value_table, '#tabela tr td'
    element :employee_head, 'a[href="/empregados/"]'

    def home
        visit "/empregados/"
    end

    def click_employee_head
        employee_head.click
    end

    def logout
        click_link 'Sair'
    end

    def click_new_employees
        click_link 'Novo Funcionário'
    end

    def search_name_employee(name)
        filter_table.set(name)
    end

    def delete_user
      btn_delete.first.click
    end

    def click_edit_employees
      btn_change.first.click
    end
end
  