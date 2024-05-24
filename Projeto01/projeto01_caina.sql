-- Criando a tabela alunos

CREATE TABLE alunos (
    cpf int primary key,
	nome varchar (50) not null,
	idade int,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(20)
)

---Alterar a quantidade de caracteres na coluna cpf
ALTER TABLE alunos ALTER COLUMN cpf TYPE VARCHAR (15) 

---Criar tabela telefones
CREATE TABLE telefones (
	cpf varchar(15) REFERENCES alunos,
	ddd int,
	numero int
)
--Adicionar codigo do país na tabela telefone
ALTER TABLE telefones ADD cod_pais INT

---Criar tabela emails
CREATE TABLE emails(
	cpf varchar(15) REFERENCES alunos,
	email varchar(64),
	dominio varchar(20)
)

---apagar tabela emails 
DROP TABLE emails CASCADE

---Alterar as caracteres da coluna email da tabela emails 
ALTER TABLE emails ALTER COLUMN email TYPE VARCHAR (64)

---criar tabela departamento
CREATE TABLE departamentos(
	id_dpto SERIAL PRIMARY KEY,
	sigla_dpto VARCHAR (4),
	nome_dpto VARCHAR (10)
)

----Criar tabela Cursos
CREATE TABLE cursos(
	id_curso SERIAL PRIMARY KEY,
	nome_curso VARCHAR (10),
	id_dpto SERIAL REFERENCES departamentos
)

---Alterar caracteres da culana nome_curso da tabela cursos 
ALTER TABLE cursos ALTER COLUMN nome_curso TYPE VARCHAR (50)

---Selecionar tudo da tabela cursos pra ver como ficou 
SELECT * FROM cursos

---Apagar tabela cursos, para modificação 
DROP TABLE cursos CASCADE


---Criar tabela matricula 
CREATE TABLE matricula (
	ra SERIAL PRIMARY KEY,
	cpf VARCHAR (15) REFERENCES alunos,
	status VARCHAR (10),
	id_curso INT REFERENCES cursos 
)


---Criar tabela disciplinas
CREATE TABLE disciplinas(
	id_disciplina SERIAL PRIMARY KEY,
	nome_disciplina VARCHAR (50),
	optativa BOOLEAN 
)
---Apagar tabela disciplinas, para modificaçáo 
DROP TABLE disciplinas CASCADE


---Criar tabela entidade cursos_disciplinas
CREATE TABLE cursos_disciplinas(
	id_curso int,
	CONSTRAINT fk_id_curso FOREIGN KEY (id_curso) 
	REFERENCES cursos (id_curso),
	id_disciplina int,
	CONSTRAINT fk_id_disciplina 
	FOREIGN KEY (id_disciplina) 
	REFERENCES disciplinas (id_disciplina)
)

---Apagar tabela, para modificação
DROP TABLE cursos_disciplinas CASCADE

---Selecionar a tabela toda para ver como ficou 
SELECT * FROM cursos_disciplinas


---Criar tabela entidade matriculas_disciplinas
CREATE TABLE matriculas_disciplinas(
	id_disciplina int,
	CONSTRAINT id_disciplina FOREIGN KEY (id_disciplina) 
	REFERENCES disciplinas (id_disciplina),
	ra serial,
	CONSTRAINT ra FOREIGN KEY (ra) 
	REFERENCES matricula (ra)
)

---Apagar tabela, para modificações 
DROP TABLE matriculas_disciplinas CASCADE

--DML

---Povoando tabela alunos com dados solicitados 
INSERT INTO alunos(cpf, nome, idade,  rua, numero, bairro, cidade, estado, cep, pais)
VALUES
(123456789, 'Maria Fernanda', 19, 'Av. Brasil', '1000', 'Liberdade', 'São Paulo', 'SP', 1502000, 'Brasil'),
(234567890, 'Carlos Eduardo', 21, 'Rua dos Bobos', '0', 'Centro', 'Belo Horizonte', 'MG', 30120120, 'Brasil'),
(345678901, 'Ana Carolina', 20, 'Rua das Palmeiras', '450', 'Jardim', 'Curitiba', 'PR', 8035050, 'Brasil'),
(456789012, 'Lucas Martins', 18, 'Av. das Nações', '890', 'Industrial', 'Porto Alegre', 'RS', 90200200, 'Brasil'),
(567890123, 'Juliana Ribeiro', 22, 'Av. Sete de Setembro', '1234', 'Vila Nova', 'Recife', 'PE', 50030010, 'Brasil'),
(678901234, 'Ricardo Almeida', 24, 'Rua do Sol', '321', 'Solar', 'Manaus', 'AM', 69010060, 'Brasil'),
(789012345, 'Fernando Dias', 23, 'Rua Azul', '789', 'Céu Azul', 'Salvador', 'BA', 4100000, 'Brasil'),
(890123456, 'Patricia Nobre', 25, 'Rua do Mercado', '555', 'Comércio', 'Fortaleza', 'CE', 60010010, 'Brasil'),
(901234567, 'Sergio Moura', 30, 'Av. do Estado', '201', 'Estadual', 'Campo Grande', 'MS', 7902000, 'Brasil'),
(102345678, 'Tânia Gomes', 28, 'Rua Nova', '22', 'Novo Horizonte', 'Rio de Janeiro', 'RJ', 20040030, 'Brasil');


---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM alunos 

---Completando tabela departamentos com dados solicitados
INSERT INTO departamentos (sigla_dpto,nome_dpto)
VALUES 
	('SAUD', 'SAUDE'),
	('TECN', 'TECNOLOGIA'),
	('ENGE', 'ENGENHARIA'),
	('HUMA', 'HUMANAS')
	
---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM departamentos


---Completando tabela cursos com os dados solicitados 
INSERT INTO cursos (nome_curso, id_dpto) VALUES
('Medicina', 1),
('Enfermagem', 1),
('Nutrição', 1),
('Ciência da Computação', 2),
('Engenharia de Software', 2),
('Inteligência Artificial', 2),
('Engenharia Civil', 3),
('Engenharia Elétrica', 3),
('Engenharia Mecânica', 3),
('Psicologia', 4),
('História', 4),
('Sociologia', 4);

---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM cursos

---Completando tabela matricula com dados solicitados 
INSERT INTO matricula (cpf,status,id_curso) VALUES
(123456789,'ativo', 1),
(234567890, 'inativo', 1),
(345678901, 'formado',3),
(456789012, 'ativo',5), 
(567890123, 'inativo',5),
(678901234, 'formado',7),
(789012345, 'ativo',12),
(890123456, 'formado',7),
(901234567, 'inativo',10),
(678901234, 'formado',10),
(789012345, 'ativo',11), 
(890123456, 'formado',2),
(901234567, 'inativo',4)

---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM matricula

---Completando tabela telefones com dados solicitados 
INSERT INTO telefones (cpf,ddd, numero, cod_pais)
VALUES
    (123456789,11, 987654321, 11),
	(234567890,21, 123456789, 22),
	(345678901,31, 234567890, 33),
	(456789012,41, 345678901, 44),
	(567890123,51, 456789012, 55),
	(678901234,61, 567890123, 66),
	(789012345,71, 678901234, 77),
	(890123456,81, 789012345, 88),
	(901234567,91, 890123456, 99),
	(102345678,19, 901234567, 89);
	
---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM telefones

---Apagar tabela telefones, para adicionar cod_pais
DROP TABLE telefones CASCADE


---Completando tabela emails com dados solicitados 
INSERT INTO emails (cpf, email, dominio)
VALUES
    (123456789,'maria.silva@example.com', 'example.com'),
	(234567890,'carlos.costa@domain.org', 'domain.org'),
	(345678901,'ana.lopes@anothermail.com', 'anothermail.com'),
	(456789012,'lucas.santos@site.net', 'site.net'),
	(567890123,'juliana.machado@web.com', 'web.com'),
	(678901234,'ricardo.ribeiro@internet.org', 'internet.org'),
	(789012345,'fernando.soares@mydomain.com', 'mydomain.com'),
	(890123456,'patricia.nunes@service.com', 'service.com'),
	(901234567,'sergio.ferreira@contact.net', 'contact.net'),
	(102345678,'tania.oliveira@home.org', 'home.org');
	
---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM emails


-- Disciplinas para o departamento de SAÚDE
INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
('Anatomia Humana', false),
('Fisiologia', false),
('Bioquímica', true),
('Microbiologia', true);

-- Disciplinas para o departamento de TECNOLOGIA
INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
('Programação I', false),
('Banco de Dados', false),
('Algoritmos Avançados', true),
('Inteligência Artificial', true);

-- Disciplinas para o departamento de ENGENHARIA
INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
('Cálculo I', false),
('Mecânica dos Fluidos', false),
('Eletromagnetismo', true),
('Estruturas Metálicas', true);

-- Disciplinas para o departamento de HUMANAS
INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
('Filosofia', false),
('História Antiga', false),
('Sociologia Contemporânea', true),
('Psicologia Social', true);

---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM disciplinas

---Completar tabela entidade cursos_disciplinas com dados solicitados
INSERT INTO cursos_disciplinas (id_disciplina,id_curso)VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(2,5),
	(2,6),
	(2,7),
	(2,8),
	(3,9),
	(3,10),
	(3,11),
	(3,12),
	(4,13),
	(4,14),
	(4,15),
	(4,16);
	
---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM cursos_disciplinas

---Completar a tabela entidade matricular_disciplinas com dados solicitados 
INSERT INTO matriculas_disciplinas (id_disciplina, ra) VALUES
    (1, 66),
    (2, 67),
    (3, 68),
    (4, 69),
    (5, 70),
    (6, 71),
    (7, 72),
    (8, 73),
    (9, 74),
    (10, 75),
    (11, 76),
    (12, 77),
    (13, 78);

---Selecionar tudo da tabela para ver como ficou preenchida
SELECT * FROM matriculas_disciplinas	
	
-----EXERCÍCIOS-----
--1 RA OU NOME, TRAZER TODOS OS DADOS
SELECT * FROM alunos
WHERE nome = 'Maria Fernanda'

SELECT * FROM (matricula INNER JOIN alunos USING (cpf))
              INNER JOIN telefones USING (cpf)
WHERE ra='1' or nome='Maria Fernanda'

--2 NOME DO DEPARTAMENTO, TRAZER TODOS OS CURSOS ASSOCIADOS A ELE
SELECT departamentos.nome_dpto, cursos.nome_curso FROM departamentos
NATURAL INNER JOIN cursos WHERE nome_dpto = 'ENGENHARIA'


--3 NOME DA DISCIPLINA, TRAZER QUAL/QUAIS CURSOS PERTENCEM
SELECT * FROM (disciplinas NATURAL INNER JOIN cursos_disciplinas 
			   NATURAL INNER JOIN cursos)
WHERE nome_disciplina = 'Bioquímica'


-- 04 COM O CPF, EXIBIR QUAIS CURSOS PERTENCEM
SELECT nome, nome_disciplina FROM ((alunos NATURAL INNER JOIN matricula)
			   NATURAL INNER JOIN matriculas_disciplinas)
			   NATURAL INNER JOIN disciplinas
WHERE cpf = '123456789'


--05 FILTRAR TODOS ALUNOS EM UM DETER. CURSO 
SELECT * FROM cursos 
NATURAL INNER JOIN matricula

DROP TABLE matricula CASCADE 
-- 06 FILTRA MATRICULA EM DISCIPLINA 
SELECT * FROM ((alunos NATURAL INNER JOIN matricula)
			  NATURAL INNER JOIN matriculas_disciplinas)
			  NATURAL INNER JOIN disciplinas
WHERE nome_disciplina = 'Filosofia'

-- 07 FORMADOS 
SELECT alunos.nome, matricula.status FROM matricula 
NATURAL INNER JOIN alunos WHERE status = 'formado'

-- 08 ATIVOS 
SELECT alunos.nome, matricula.status FROM matricula 
NATURAL INNER JOIN alunos WHERE status = 'ativo'

-- 09 ATIVOS POR CURSO 
SELECT nome_curso, COUNT (nome) FROM 
((alunos NATURAL INNER JOIN matricula)
			   NATURAL INNER JOIN cursos) 
WHERE status = 'ativo'
GROUP BY nome_curso

-- 10 ATIVOS POR DISCIPLINA 
SELECT nome_disciplina, COUNT (nome) FROM 
((alunos NATURAL INNER JOIN matricula)
 NATURAL INNER JOIN matriculas_disciplinas)
			   NATURAL INNER JOIN disciplinas 
WHERE status = 'ativo'
GROUP BY nome_disciplina