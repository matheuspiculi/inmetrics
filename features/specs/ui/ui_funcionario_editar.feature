# language: pt

@desafio
@ui_editar_funcionario

Funcionalidade: [ UI ] Editar cadastro do funcionário
  Eu como usuário do sistema
  Quero realizar edição cadastro do funcionário
  Para poder ter controle e manutenção do mesmo

  @ui_editar_funcionario_parcial_sucesso_painel
  Cenário: Realizar edição parcial do usuário e validar via painel
    Dado que esteja na página de empregados
    Quando pesquisar pelo usuário cadastrado
    E clicar no ícone de edição do primeiro usuário encontrado
    Quando alterar as seguintes informações de cargo "EDITPAINEL" e admissão "31/12/2020" 
    E enviar as informações
    Então deverá retornar uma mensagem de sucesso "SUCESSO! Informações atualizadas com sucesso"
    E as alterações deverão ter sido modificadas via painel

  @ui_editar_funcionario_parcial_sucesso_individual
  Cenário: Realizar edição parcial do usuário e validar via botao editar
    Dado que esteja na página de empregados
    Quando pesquisar pelo usuário cadastrado
    E clicar no ícone de edição do primeiro usuário encontrado
    Quando alterar as seguintes informações de cargo "EDITEDITAR" e admissão "24/03/2020" 
    E enviar as informações
    Então deverá retornar uma mensagem de sucesso "SUCESSO! Informações atualizadas com sucesso"
    E as alterações deverão ter sido modificadas via editar

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
    Então deverá retornar uma mensagem de erro "ERRO! Ops.. Não conseguimos atualizar as informações"