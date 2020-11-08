module CommonTools
  def load_data_test(param)
    YAML.load_file(File.join(Dir.pwd, "/features/support/data/#{param}_data.yaml"))
  end

  def tag_scenario(tags)
    variavel_temp = tags[2]
    tag = variavel_temp[/(?<=\@)(.*?)$/]
    return tag
  end

  def default_new_employee
    @new_user_api.data_newuser
    @new_user_api.post_data('empregado/cadastrar')
    @new_user_api.record_user_response
    sleep 2
  end

  def default_delete_employee(emp)
    @delete_user_api.delete_user('empregado/deletar', emp)
    expect(@delete_user_api.response_code).to eq 200
    sleep 2
  end

  def change_sexo_frontend(param)
    case param
    when 'm'
      newSexo = 'Masculino'
    when 'f'
      newSexo = 'Feminino'
    when 'i'
      newSexo = 'Indefinido'
    end
    return newSexo
  end
end
