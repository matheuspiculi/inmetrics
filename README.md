# InMetrics


# Índice

- Pré-requisitos
- Configuração do Ambiente
- Configurando o projeto
- Executando os testes
- Jenkins

# Pré-Requisitos

- Ruby Install [Version 2.5.7 with MSYS2]

> - Windows: https://www.ruby-lang.org/pt/downloads/

- CMDER Install

> - Windows: https://cmder.net/

# Configuração do Ambiente

## Ruby
- Windows: https://medium.com/qaninja/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95

## CMDER
- Windows: https://blog.especializati.com.br/utilizando-o-cmder-no-windows/

# Configurando o projeto

1. Acessar o diretório C:\ pelo CMDER

> cd C:\

2. Clone o repositório do gitlab pelo CMDER

> git clone git@github.com:matheuspiculi/inmetrics.git

3. Acessar o diretório clonado do projeto pelo CMDER

> cd C:\inmetrics

4. Instale as dependências pelo CMDER

> gem uninstall -aIx

> gem install bundler

> bundle install

# Executando os testes

1. Para executar todo o projeto 

> cucumber --profile default --tag @desafio

2. Para executar somente uma feature, por exemplo:

> cucumber --profile default --tag @ui_painel_funcionario

3. Para executar somente um cenário de teste, por exemplo:

> cucumber --profile default --tag @ui_painel_funcionario_colunastabela

# Jenkins

> O Jenkins atualmente está configurado para executar todo o projeto 2x ao dia sendo 09:00 e as 18:00 de segunda-feira a sexta-feira