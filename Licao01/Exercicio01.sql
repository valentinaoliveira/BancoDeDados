CREATE TABLE livros (
	isbn SERIAL PRIMARY KEY,
	titulo varchar(60),
	editora varchar(50),
	ano DATE
)

INSERT INTO livros ( titulo, editora, ano) 
VALUES
    ( 'Tudo o que eu sei sobre o amor', 'Intrínseca', '2022/07/01'),
    ( 'Eu e Esse meu Coração', 'Jangada', '2018/10/02'),
    ( 'Imperfeitos', 'Faro Editorial', '2022/03/10'),
    ( 'O pequeno príncipe - Edição de luxo almofadada', 'Editora Garnier', '2023/09/15'),
    ( 'Uma família feliz', 'Companhia das Letras', '2024/03/13'),
    ( 'A hora da estrela: edição comemorativa', 'Rocco', '2020/11/16'),
    ( 'O menino do pijama listrado', 'Seguinte', '2007/10/11'),
    ( 'Coleção Especial Sherlock Holmes -Box com 6 livros', 'Principis', '2021/03/29'),
    ( 'Revolução dos bichos', 'Companhia das Letras', '2007/01/10'),
    ( 'A mandíbula de Caim', 'Intrínseca', '2022/12/01');

DROP TABLE livros_autores CASCADE


SELECT * FROM LIVROS

CREATE TABLE autores (
	id_autor SERIAL PRIMARY KEY,
	nome_autor varchar(100)
)

INSERT INTO autores (nome_autor) 
VALUES
    ('Dolly Alderton'),
    ('C. C. Hunter'),
    ('Christina Lauren'),
    ('Antoine de Saint-Exupéry'),
    ('Raphael Montes'),
    ('Clarice Lispector'),
    ('Jonh Boyne'),
    ('Arthur Conan Doyle'),
    ('George Orwell'),
    ('Edward Powys Mathers');

SELECT * FROM autores

CREATE TABLE livros_autores (
	isbn SERIAL,
	FOREIGN KEY (isbn) REFERENCES livros (isbn),
	id_autor SERIAL,
	FOREIGN KEY (id_autor) REFERENCES autores (id_autor)
)

SELECT * FROM livros_autores

SELECT * FROM livros,autores

SELECT * FROM autores CROSS JOIN livros

SELECT * FROM autores INNER JOIN livros USING (isbn)

SELECT autores.nome_autor,livros.titulo
FROM (autores NATURAL INNER JOIN livros_autores)
FULL JOIN livros using (isbn)


--Exercicio01
SELECT titulo, nome_autor 
FROM livros INNER JOIN autores
ON livros.isbn = autores.id_autor

--Exercicio02






