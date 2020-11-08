# language:pt

class EditEmployeesPage < SitePrism::Page
  element :input_office, '#inputCargo'
  element :input_admission, '#inputAdmissao'

  def edit_fill_form_employes(edit_office, edit_admission)
    input_office.set(edit_office)
    input_admission.set(edit_admission)
  end

  def get_text_cargo
    input_office.value
  end

  def get_text_admissao
    input_office.value
  end
end