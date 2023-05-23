# importacao-formatacao-de-dados

# SOBRE O PROJETO
Este é um projeto de Desenvolvimento de banco de dados, realizado na faculdade. Ele irá abordar:

°Uma empresa possui um processo de carga diária de dados que recebe de seu cliente. Ela deve importar um arquivo (Cliente.CSV) para o banco de dados mantendo os dados originais sem alterar até a próxima carga, onde outros processos irão realizar DROP do objeto, assim caso surja algum problema na carga, conseguirão analisar o que ocorreu.

No processo de carga, há uma etapa de validação dos dados recebidos, onde através de algumas regras, irá localizar dados inválidos e copiá-los para uma tabela de erros que será mantida até a próxima carga, onde outros processos realizarão um TRUNCATE no objeto. Da mesma forma que o objeto anterior, caso surja algum problema na carga, conseguirão analisar o que ocorreu.

Uma tabela irá manter o histórico de 90 dias de cargas e deverá conter os dados validados, tratados, formatados e enriquecidos com informações de UF, baseados no DDD do telefone. Esta tabela precisa ter estrutura mínima (menores tipos de dados possíveis), pois conterá um grande volume de informação

Para construir uma tabela enriquecida, precisaremos desenvolver uma última tabela que conterá UF e seus devidos DDDs associados, de forma que no processo de validação, conseguiremos identificar qual a UF de cada registro.

# Tecnologias utilizadas
Linguagem SQL SERVER

# Como executar
Por se tratar de um arquivo microsoft sql server irá precisar abrir a ferramenta SSMS (Microsoft SQL management Studio). Após isso precisara importar a base de dados Cliente.CSV e executar a consulta.

# Autor do projeto

Gabriel Garcia 

https://www.linkedin.com/in/gabrielgarciadba/
