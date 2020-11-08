Before do |scenario|
  # pages_ui
  @login = LoginPage.new
  @register = RegisterPage.new
  @employees = EmployeesPage.new
  @new_employees = NewEmployeesPage.new
  @delete_employees = DeleteEmployeesPage.new
  @edit_employees = EditEmployeesPage.new

  # pages_api
  @new_user_api = NewUserApi.new
  @update_user_api = UpdateUserApi.new
  @consult_user_api = ConsultUserApi.new
  @delete_user_api = DeleteUserApi.new

  # tag_scenario
  $tagscenario = tag_scenario(scenario.source_tag_names)
end

Before('@ui_excluir_funcionario_sucesso') do
  default_new_employee
end

Before('@ui_editar_funcionario_parcial_sucesso_painel') do
  default_new_employee
end

Before('@ui_editar_funcionario_parcial_sucesso_individual') do
  default_new_employee
end

Before('@api_alterar_usuario_401') do
  default_new_employee
end

Before('@api_alterar_usuario_404') do
  default_new_employee
end

Before('@api_alterar_usuario_405') do
  default_new_employee
end

Before('@api_alterar_usuario_informacoes_invalidas') do
  default_new_employee
end
