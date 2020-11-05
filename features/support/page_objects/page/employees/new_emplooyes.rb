# encoding: utf-8
# language:pt

class NewEmployeesPage < SitePrism::Page

    element :input_name, '#inputNome'
    element :input_cpf, '#cpf'
    element :input_office, '#inputCargo'
    element :input_money, '#dinheiro'
    element :option_clt, '.radio-button'
    element :select_genre, '#slctSexo'
    element :input_admission, '#inputAdmissao'
    element :btn_send, '.cadastrar-form-btn'
    element :message_success, '.alert.alert-success'

    def fill_form_employee(employee)
        input_name.set(employee[:nome]) 
        input_office.set(employee[:cargo])
        input_cpf.set(employee[:cpf])
        input_money.set(employee[:salario])
        select_genre.select(:Feminino)
        option_clt.choose(employee[:tipo_contratacao])
        input_admission.set(employee[:admissao])
    end

    def click_btn_form
        btn_send.click
    end
end
  