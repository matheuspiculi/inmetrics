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
    element :message_error, '.alert.alert-danger'

    def fill_form_employee(employee)
        fill_name_field(employee[:nome]) 
        fill_office_field(employee[:cargo])
        fill_cpf_field(employee[:cpf])
        fill_money_field(employee[:salario])
        fill_genre_field(employee[:sexo])
        fill_clt_field(employee[:tipo_contratacao])
        fill_admission_field(employee[:admissao])
    end

    def fill_invalidoffice(invalidoffice)
        fill_name_field(Faker::Name.name_with_middle) 
        fill_office_field(invalidoffice)
        fill_cpf_field("440.356.978-18")
        fill_money_field("5.000,00")
        fill_genre_field("Masculino")
        fill_clt_field("CLT")
        fill_admission_field("06/11/2020")
    end

    def fill_name_field(param)
        input_name.set(param)
    end

    def fill_admission_field(param)
        input_admission.set(param)
    end

    def fill_clt_field(param)
        option_clt.choose(param)
    end

    def fill_genre_field(param)
        select_genre.select(param)
    end

    def fill_money_field(param)
        input_money.set(param)
    end

    def fill_cpf_field(param)
        input_cpf.set(param)
    end

    def fill_office_field(param)
        input_office.set(param)
    end

    def click_btn_form
        btn_send.click
    end

    def getTextMsgSucess
        message_success.text
    end

    def getTextMsgError
        message_error.text
    end
end
  