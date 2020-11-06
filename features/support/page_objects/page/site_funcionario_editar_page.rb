# encoding: utf-8
# language:pt

class EditEmployeesPage < SitePrism::Page
    
    element :input_office, '#inputCargo'
    element :input_admission, '#inputAdmissao'

    def edit_fill_form_employes(edit_office, edit_admission)
        input_office.set(edit_office)
        input_admission.set(edit_admission)
    end
    
end