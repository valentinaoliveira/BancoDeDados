CREATE TABLE pacientes (
	id_paciente SERIAL PRIMARY KEY,
	nome_paciente varchar(100),
	data_nasc DATE
)

INSERT INTO pacientes (nome_paciente, data_nasc) 
VALUES
    ('Julia de Lima', '2006-02-21'),
    ('João Gabriel', '2005-11-07'),
    ('Matheus Barbosa', '2006-02-21'),
    ('Carolina Lisboa', '2005-12-15'),
    ('Valentina Leite', '2005-11-29'),
    ('Pedro Andreoli', '2005-11-30'),
    ('João Pedro', '2006-12-01'),
    ('Catarina Leite', '2008-09-15'),
    ('Luan Santana', '1991-03-13'),
    ('Juliana Paiva', '1993-03-28');

SELECT * FROM pacientes

CREATE TABLE medicos (
	id_medico SERIAL PRIMARY KEY,
	nome_med varchar(100),
	especialidade varchar(50)
)

INSERT INTO medicos (nome_med, especialidade) 
VALUES
    ('Dra. Ana Maria', 'Clínica Geral'),
    ('Dr. William Boner', 'Cardiologia'),
    ('Dr. Justi Biber', 'Ortopedia'),
    ('Dra. Kendall Jenner', 'Pediatria'),
    ('Dr. Kanye West', 'Dermatologia'),
    ('Dra. Fatima Bernardes', 'Ginecologia'),
    ('Dr. Nicolas Prattes', 'Oncologia'),
    ('Dra. Anne Hathaway', 'Neurologia'),
    ('Dr.Adam Sandler', 'Psiquiatria'),
    ('Dr. Travis Scott', 'Endocrinologia');

SELECT * FROM medicos

CREATE TABLE registros (
	id_registro SERIAL PRIMARY KEY,
	id_paciente int,
	FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente),
	id_medico int,
	FOREIGN KEY (id_medico) REFERENCES medicos (id_medico),
	data_reg DATE
)

INSERT INTO registros (id_paciente, id_medico, data_reg) 
VALUES
    (1, 1, '2023-05-15'),
    (2, 2, '2022-11-10'),
    (3, 3, '2024-02-20'),
    (4, 4, '2023-09-05'),
    (5, 5, '2024-01-30'),
    (6, 6, '2023-07-18'),
    (7, 7, '2022-08-25'),
    (8, 8, '2024-03-10'),
    (9, 9, '2023-04-02'),
    (10, 10, '2022-12-12');

SELECT * FROM registros