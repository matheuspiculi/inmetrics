# language:pt

@desafio
@ui_editar_funcionario

Funcionalidade: [ UI ] Editar cadastro do funcionário
  Eu como usuário do sistema
  Quero realizar edição cadastro do funcionário
  Para poder ter controle e manutenção do mesmo

  @ui_editar_funcionario_sucesso
  Cenário: Realizar edição do usuário
    Dado que esteja na página de empregados
    Quando pesquisar pelo usuário cadastrado
    E clicar no ícone de edição do primeiro usuário encontrado
    Quando alterar as seguintes informações de cargo "QANEWEDIT" e admissão "20/09/2020" 
    E enviar as informações
    Então deverá retornar uma mensagem de sucesso "SUCESSO! Informações atualizadas com sucesso"
    E as alterações deverão ter sido modificadas

  @ui_editar_funcionario_sucesso_cpfinvalido
  Cenário: Validar a mensagem de erro sobre CPF inválido
    Dado que esteja na página de empregados
    Quando pesquisar pelo usuário cadastrado
    E clicar no ícone de edição do primeiro usuário encontrado
    E preencher o cpf de forma inválida sendo "999.999.999-99"
    E enviar as informações
    Então deverá retornar uma mensagem de erro como alerta "CPF Invalido!"
  
  @ui_editar_funcionario_sucesso_cargoerrado
  Cenário: Validar a mensagem de erro sobre cargo inválido
    Dado que esteja na página de empregados
    Quando pesquisar pelo usuário cadastrado
    E clicar no ícone de edição do primeiro usuário encontrado
    E preencher o cargo de forma inválida sendo "qa@"
    E enviar as informações
    Então deverá retornar uma mensagem de erro "ERRO! Ops.. Não conseguimos atualizar as informações\\n×"