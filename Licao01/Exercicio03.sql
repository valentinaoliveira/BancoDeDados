CREATE TABLE funcionarios (
	id_func SERIAL PRIMARY KEY,
	nome_func varchar(100),
	data_adm DATE

)

DROP TABLE funcionarios CASCADE

CREATE TABLE projetos (
	id_projetos SERIAL PRIMARY KEY,
	nome_projeto varchar(150),
	descricao text
)

DROP TABLE projetos CASCADE

CREATE TABLE func_proj (
	id_func int,
	CONSTRAINT fk_func FOREIGN KEY (id_func) REFERENCES funcionarios (id_func),
	id_projetos int,
	CONSTRAINT fk_projetos FOREIGN KEY (id_projetos) REFERENCES projetos (id_projetos)
)

DROP TABLE func_proj CASCADE 

INSERT INTO funcionarios (id_func, nome_func, data_adm) VALUES
(1, 'Julia Gubany', '2019-08-20'),
(2, 'João Gabriel', '2016-10-25'),
(3, 'Matheus Barbosa', '2018-02-05'),
(4, 'Valentina Leite', '2021-05-15'),
(5, 'João Pedro', '2015-02-10'),
(6, 'Pedro Andreoli', '2018-11-25'),
(7, 'Lindsey Cardoso', '2013-12-01'),
(8, 'Carolina Lisboa', '2020-09-19'),
(9, 'Luan Santana', '2017-11-29'),
(10, 'Julia Torres', '2019-08-27');

INSERT INTO Projetos (id_projetos, nome_projeto, descricao) VALUES

(1, 'Sistema de Gestão Escolar', 'Desenvolvimento de um sistema para gerenciar escolas, incluindo matrícula, turmas e notas.'),
(2, 'Aplicativo de Saúde', 'Criação de um aplicativo para monitoramento de saúde e fitness com integração a dispositivos wearables.'),
(3, 'Plataforma de E-commerce', 'Desenvolvimento de uma plataforma de e-commerce completa com suporte a múltiplos vendedores.'),
(4, 'Site de Rede Social', 'Construção de uma rede social com recursos de postagem, comentário e mensagem privada.'),
(5, 'Sistema de Reserva de Hotéis', 'Desenvolvimento de um sistema online para reservas de hotéis e resorts.'),
(6, 'Aplicativo de Entrega de Comida', 'Criação de um aplicativo para pedidos e entregas de comida de restaurantes locais.'),
(7, 'Ferramenta de Análise de Dados', 'Desenvolvimento de uma ferramenta para análise e visualização de grandes volumes de dados.'),
(8, 'Sistema de Atendimento ao Cliente', 'Construção de um sistema de gerenciamento de atendimento ao cliente com suporte a chat e tickets.'),
(9, 'Portal de Educação Online', 'Desenvolvimento de um portal para cursos online com vídeos, quizzes e certificações.'),
(10, 'Aplicativo de Gestão Financeira', 'Criação de um aplicativo para gerenciamento de finanças pessoais e planejamento de orçamento.');

INSERT INTO func_proj (id_func, id_projetos) VALUES
(1, 10),
(2, 9),
(3, 8),
(4, 7),
(5, 6),
(6, 5),
(7, 4),
(8, 3),
(9, 2),
(10, 1);

SELECT * FROM funcionarios

SELECT * FROM projetos
	
SELECT funcionarios.nome_func, projetos.nome_projeto
FROM (projetos NATURAL INNER JOIN funcionarios_projetos)
INNER JOIN funcionarios USING (id_func)
WHERE projetos.nome_projeto = 'aapm'
	id_projetos int,
	CONSTRAIN fk_proj FOREIGN KEY (i) REFERENCES projetos (id_projetos)
)

SELECT * FROM fucionarios_projetos

ALTER TABLE fucionario_projetos RENAME TO funcionarios_projetos