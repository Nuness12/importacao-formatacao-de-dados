-- Tabela original
SELECT * FROM Cliente
GO
-- Tabela estado
-- Criação 
CREATE TABLE UF (
UF char(2) NOT NULL,
DDD numeric NOT NULL
);
GO
-- Inserção dos dados
INSERT INTO UF (UF, DDD)
VALUES
  ('DF', 61),
  ('GO', 62),
  ('GO', 64),
  ('MT', 65),
  ('MT', 66),
  ('MS', 67),
  ('AL', 82),
  ('BA', 71),
  ('BA', 73),
  ('BA', 74),
  ('BA', 75),
  ('BA', 77),
  ('CE', 85),
  ('CE', 88),
  ('MA', 98),
  ('MA', 99),
  ('PB', 83),
  ('PE', 81),
  ('PE', 87),
  ('PI', 86),
  ('PI', 89),
  ('RN', 84),
  ('SE', 79),
  ('AC', 68),
  ('AP', 96),
  ('AM', 92),
  ('AM', 97),
  ('PA', 91),
  ('PA', 93),
  ('PA', 94),
  ('RO', 69),
  ('RR', 95),
  ('TO', 63),
  ('ES', 27),
  ('ES', 28),
  ('MG', 31),
  ('MG', 32),
  ('MG', 33),
  ('MG', 34),
  ('MG', 35),
  ('MG', 37),
  ('MG', 38),
  ('RJ', 21),
  ('RJ', 22),
  ('RJ', 24),
  ('SP', 11),
  ('SP', 12),
  ('SP', 13),
  ('SP', 14),
  ('SP', 15),
  ('SP', 16),
  ('SP', 17),
  ('SP', 18),
  ('SP', 19),
  ('PR', 41),
  ('PR', 42),
  ('PR', 43),
  ('PR', 44),
  ('PR', 45),
  ('PR', 46),
  ('RS', 51),
  ('RS', 53),
  ('RS', 54),
  ('RS', 55),
  ('SC', 47),
  ('SC', 48),
  ('SC', 49);
GO

-- Criação da tabela Cliente Erro
SELECT top 0 * INTO ClienteErro FROM Cliente
GO
-- Inserção de dados
insert into ClienteErro select * from Cliente 
where (cpf = 0 or pessoa ='0' or telefone = 0) AND (pessoa like 'robo%')
GO

-- Criação da tabela enriquecida
create table Tab_enriquecida (
	id int
	, dataC date
	, hora nvarchar(100)
	, nome nvarchar(100)
	, cpf bigint
	, telefone bigint
	, UF char(2)
);
GO

select * from cliente
-- Inserção dos dados
select id
	, cast(c.data as varchar(10)) + ' ' + cast(c.hora as varchar(8)) as data_hora
	, c.pessoa
	, concat(substring(replace(cpf, ' ', ''), 1, 3)
		, '.', substring(replace(cpf, ' ', ''),4,3)
		, '.',substring(replace(cpf, ' ', ''),7,3)
		, '-',substring(replace(cpf, ' ', ''),10,2)) as cpf_formatado
	, u.ddd
	, substring(cast(c.telefone as varchar), 3, len(cast(c.telefone as varchar))) as telefone_formatado 
	, u.uf
from cliente as c
	inner join UF as u on cast(substring(cast(c.telefone as varchar), 1,2) as char(2)) = cast(u.ddd as char(2))