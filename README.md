# InMetrics


# Índice

- Pré-requisitos
- Configuração do Ambiente
- Configurando o projeto


# Pré-Requisitos

- Ruby Install [Version 2.5.8 with MSYS2]

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

2. Clone o repositório do gitlab

> git clone git@github.com:matheuspiculi/inmetrics.git

3. Acessar o diretório clonado do projeto pelo CMDER

> cd C:\inmetrics

4. Instale as dependências via comandos

> gem uninstall -aIx

> gem install bundler

> bundle install