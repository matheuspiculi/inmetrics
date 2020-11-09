# language: pt

class EditEmployeesPage < SitePrism::Page
  element :input_name, '#inputNome'
  element :input_cpf, '#cpf'
  element :input_sexo, '#slctSexo'
  element :input_admission, '#inputAdmissao'
  element :input_office, '#inputCargo'
  element :input_salario, '#dinheiro'
  element :option_clt, '.radio-button'
  element :input_clt, '.radio-button #clt'
  element :input_pj, '.radio-button #pj'

  def edit_fill_form_employes(edit_office, edit_admission)
    input_office.set(edit_office)
    input_admission.set(edit_admission)
  end

  def text_nome
    input_name.value
  end

  def text_cpf
    input_cpf.value
  end

  def text_sexo
    input_sexo.value
  end

  def text_admissao
    input_admission.value
  end

  def text_cargo
    input_office.value
  end

  def text_salario
    input_salario.value
  end

  def select_clt
    input_clt.checked?
  end

  def select_pj
    input_pj.checked?
  end
end
