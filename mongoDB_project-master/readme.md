# EsteticaDB

Projeto de MongoDB desenvolvido para a Disciplina de GDI, do Centro de Informática - UFPE, no semestre 2022.2
A equipe é formada por:

- [Ícaro Nunes](https://github.com/Icaro-Nunes)
- [Eliab Bernardino](https://github.com/eliab2107)
- [Tomás Nascimento](https://github.com/tnpb-1st)
- [João Victor de Melo](https://github.com/Joyvixtor)
- [Marcelo Santana](https://github.com/marcsantana)

O projeto foi desenvolvido em MongoDB e conta com três coleções, sendo elas:

## Serviços
Listamos os serviços principais que encontramos no mundo estético. Cada serviço contém:
- Nome (string)
- Código (number/integer)
- Descrição (string)
- Custo mínimo (number/float)
- Categoria (string)

## Profissionais
Listamos os profissionais que trabalham nessa área de estética. Cada profissional tem:
- CPF (string)
- Nome (string)
- Data de Nascimento (date)
- Formação (lista de objetos)
- Função (string)
- Profissional_faz (lista de findOne)

Esse último atributo serve para vincularmos um (ou mais) serviços a um profissional. Tal vínculo é feito usando-se o método findOne, onde passamos como parâmetro algum código de serviço e ele fica atrelado ao documento (profissional) em questão.

## Salões
Listamos alguns salões da Região Metropolitana de Recife. Cada salão tem:
- CNPJ (string)
- Nome (string)
- Local (string)
- Telefone (string)
- Avaliação (number/float)
- Dias de funcionamento (lista de string)
- Redes sociais (objeto)
- Funcionários (lista de findOne)

 Tal qual o atributo profissional_faz da coleção anterior, o atributo Funcionários é preenchido através do método findOne, passando como parâmetro um CPF de algum profissional.
