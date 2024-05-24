CREATE TABLE curso (
id_curso SERIAL PRIMARY KEY,
	prof_responsavel varchar(50),)

INSERT INTO curso (prof_responsavel) 
VALUES
    ('Prof. Joyce'),
    ('Prof. Paulo'),
    ('Prof. Chico'),
    ('Prof. Toledo'),
    ('Prof. Carlão'),
    ('Prof. Nath'),
    ('Prof. Daniel'),
    ('Prof. Tatiane'),
    ('Prof. Rufino'),
    ('Prof. Keile');
	
	SELECT * FROM curso
	
CREATE TABLE aluno (
	id_aluno SERIAL PRIMARY KEY,
	cpf bigint,
	nome_aluno varchar(200),
	data_nascimento DATE

)

INSERT INTO aluno (cpf, nome_aluno, data_nascimento) 
VALUES
    (12345678901, 'Julia de Lima', '2006-02-21'),
    (23456789012, 'Julia Gubany', '2006-01-09'),
    (34567890123, 'João Gabriel', '2005-11-07'),
    (45678901234, 'Matheus Barbosa', '2006-02-21'),
    (56789012345, 'Valentina Leite', '2005-11-29'),
    (67890123456, 'João Pedro', '2006-12-01'),
    (78901234567, 'Pedro Andreoli', '2005-11-30'),
    (89012345678, 'Lindsey Cardoso', '2005-11-27'),
    (90123456789, 'Carolina Lisboa', '2005-12-15'),
    (11223344556, 'Luan Santana', '1991-03-13');
	
	SELECT * FROM aluno
	

CREATE TABLE turma (
	id_curso int,
	FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
	id_aluno int,
	FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno),
	id_turma SERIAL PRIMARY KEY
	
)

SELECT * FROM turma
