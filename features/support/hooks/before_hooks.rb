Before do |scenario|
  # pages_ui
  @login = LoginPage.new
  @register = RegisterPage.new
  @employees = EmployeesPage.new
  @panel_employees = PanelEmployeesPage.new
  @new_employees = NewEmployeesPage.new
  @delete_employees = DeleteEmployeesPage.new
  @edit_employees = EditEmployeesPage.new

  # pages_api
  @new_user_api = NewUserApi.new
  @update_user_api = UpdateUserApi.new
  @consult_user_api = ConsultUserApi.new

  # tag_scenario
  $tagscenario = get_tag_scenario(scenario.source_tag_names)
end

Before('@ui_excluir_funcionario_sucesso') do
  @new_user_api.data_new_user
  @new_user_api.post_data('empregado/cadastrar')
  @new_user_api.record_user_response
  sleep 5
end

Before('@ui_editar_funcionario_sucesso') do
  @new_user_api.data_new_user
  @new_user_api.post_data('empregado/cadastrar')
  @new_user_api.record_user_response
  sleep 5
end

Before('@api_alterar_usuario_401') do
  @new_user_api.data_new_user
  @new_user_api.post_data('empregado/cadastrar')
  @new_user_api.record_user_response
  sleep 5
end

Before('@api_alterar_usuario_404') do
  @new_user_api.data_new_user
  @new_user_api.post_data('empregado/cadastrar')
  @new_user_api.record_user_response
  sleep 5
end

Before('@api_alterar_usuario_405') do
  @new_user_api.data_new_user
  @new_user_api.post_data('empregado/cadastrar')
  @new_user_api.record_user_response
  sleep 5
end