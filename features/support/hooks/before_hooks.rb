Before do |scenario|
    Capybara.page.current_window.resize_to(1360, 1000)

    #pages_ui
    @login = LoginPage.new
    @register = RegisterPage.new
    @employees = EmployeesPage.new
    @new_employees = NewEmployeesPage.new
    @delete_employees = DeleteEmployeesPage.new
    @edit_employees = EditEmployeesPage.new

    #pages_api
    @new_user_api = NewUserApi.new
    @update_user_api = UpdateUserApi.new
    @consult_user_api = ConsultUserApi.new

    #tag scenario
    $tagscenario = getTagScenario(scenario.source_tag_names)
end

Before('@ui_excluir_funcionario') do
    @new_user_api.data_new_user
    @new_user_api.post_data("empregado/cadastrar")
    @new_user_api.record_user_response
    sleep 5
end

Before('@ui_editar_funcionario') do
    @new_user_api.data_new_user
    @new_user_api.post_data("empregado/cadastrar")
    @new_user_api.record_user_response
    sleep 5
end