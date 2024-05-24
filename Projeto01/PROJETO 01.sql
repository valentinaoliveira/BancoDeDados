--Criar tabela de endereço
CREATE TABLE endereço(
	id_endereço SERIAL PRIMARY KEY,
	rua VARCHAR(60),
	numero VARCHAR (4),
	bairro VARCHAR (60),
	cidade VARCHAR (60))
	
--Colocar as informações na tabela
INSERT INTO endereço(rua,numero,bairro, cidade)
VALUES
	('Alice da Silva Cossi', '89', 'Jardim Campos do Conde II', 'Sorocaba'),
	('Alice Manrique Gabriel', '90', 'Horto Florestal', 'Sorocaba'),
	('Alice Rodrigues Moreira', '100', 'Vila Mineirão', 'Sorocaba'),
	('Barão de Cotegipe', '87', 'Vila Leão', 'Sorocaba'),
	('Caetano Bernardi', '75', 'Jardim Zulmira', 'Sorocaba'),
	('Donato Fittipaldi', '21', 'Jardim São Guilherme', 'Sorocaba')
	
	--Excluir tabela endereço, pois mudei o número de caracteres
	DROP TABLE endereço CASCADE
	
	--Mostrar tabela feita
	SELECT *  FROM endereço
	
	--Apagar tabela endereço para mudar o cep para id ao ínves de primary key
	-- E apagar estado, país 
	DROP TABLE endereço CASCADE
	
--Criar tabela de contato
CREATE TABLE contato(
	id_contato SERIAL PRIMARY KEY,
	telefone VARCHAR (10),
	celular VARCHAR (11),
	email VARCHAR (256))
	
--Informações na tabela
INSERT INTO contato(telefone, celular, email)
VALUES 
	('1532272537', '15992739191', 'vah.oliver.dpm@gmail.com'),
	('1934567424', '15991480509', 'leite.olivera@gmail.com'),
	('1834357680', '14998213404', 'oleitemat@gmail.com'),
	('1239212031', '12993827130', 'limatorres@gmail.com')
	
--Mostrar tabela
SELECT * FROM contato


CREATE TABLE aluno(
	RA SERIAL PRIMARY KEY,
	nome VARCHAR (20),
	CPF VARCHAR (11),
	idade VARCHAR (2),
	id_endereço 
	contato )