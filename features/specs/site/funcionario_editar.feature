# encoding: utf-8
# language:pt

@desafio
@funcionario

Funcionalidade: Editar cadastro do funcionário
  Eu como usuário do sistema
  Quero realizar edição cadastro do funcionário
  Para poder ter controle e manutenção do mesmo

  @editar_funcionario
  Cenário: Realizar edição do usuário
    Dado que esteja na página de empregados
    Quando pesquisar pelo usuário "Nathália" 
    E clicar no ícone de edição do primeiro usuário encontrado
    Quando alterar as seguintes informações de cargo "Desenvolvedora" e admissão "20/09/2020" 
    E enviar as informações
    Então deverá retornar uma mensagem de sucesso "SUCESSO! Informações atualizadas com sucesso"
    E as alterações deverão ter sido modificadas
