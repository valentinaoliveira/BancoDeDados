CREATE TABLE funcionarios (
	id_func SERIAL PRIMARY KEY,
	nome_func varchar(100),
	data_adm DATE

)

CREATE TABLE projetos (
	id_projetos SERIAL PRIMARY KEY,
	nome_projeto varchar(150),
	descricao text

)

CREATE TABLE func_proj (
	id_func int,
	CONSTRAINT fk_func FOREIGN KEY (id_func) REFERENCES funcionarios (id_func),
	id_projetos int,
	CONSTRAINT fk_projetos FOREIGN KEY (id_projetos) REFERENCES projetos (id_projetos)
)

INSERT INTO funcionarios (id_func, nome_func, data_adm) VALUES
(1, 'Ana', '2019-08-20'),
(2, 'Bernardo', '2016-10-18'),
(3, 'Carlos', '2018-02-17'),
(4, 'Diego', '2021-05-16'),
(5, 'Everaldo', '2015-02-03'),
(6, 'Fernanda', '2018-11-12'),
(7, 'Gabriel', '2013-12-02'),
(8, 'Helen', '2020-09-12'),
(9, 'Iago', '2017-11-17'),
(10, 'Julio', '2019-08-06');

INSERT INTO projetos (id_projetos, nome_projeto, descricao) VALUES

(1, 'SecureNet', ' Desenvolvimento de um sistema de segurança de rede abrangente, incluindo firewall, detecção de intrusão e prevenção de ameaças, para proteger a infraestrutura de TI contra ataques cibernéticos.'),
(2, 'DataGuard', 'Implementação de um sistema de backup e recuperação de dados automatizado e altamente confiável, garantindo a integridade e disponibilidade dos dados críticos da empresa em caso de falhas ou desastres.'),
(3, 'CloudScape', 'Migração da infraestrutura local para uma arquitetura de nuvem híbrida, aproveitando os benefícios da escalabilidade, flexibilidade e redundância oferecidos pela computação em nuvem.'),
(4, 'SmartOffice', 'Implementação de uma solução de Internet das Coisas (IoT) para otimizar o uso de recursos em escritórios, incluindo controle de iluminação, gerenciamento de energia e monitoramento de ocupação de salas.'),
(5, 'AgileDevOps', 'Adoção de práticas ágeis e metodologias DevOps para melhorar a colaboração entre equipes de desenvolvimento e operações, acelerando o ciclo de desenvolvimento de software e aumentando a qualidade das entregas.'),
(6, 'Virtualize', 'Virtualização de servidores e desktops para consolidar recursos de hardware, reduzir custos operacionais e simplificar a administração de sistemas em ambientes de TI.'),
(7, 'MobileFirst', ' Desenvolvimento de uma estratégia centrada em dispositivos móveis para oferecer aos clientes uma experiência otimizada em plataformas móveis, incluindo aplicativos nativos e sites responsivos.'),
(8, 'AI-Driven Insights', 'Implementação de soluções baseadas em inteligência artificial e análise de dados para extrair insights valiosos a partir de grandes conjuntos de dados, impulsionando a tomada de decisões informadas na empresa.'),
(9, 'NetworkOptimize', 'Avaliação e otimização da infraestrutura de rede existente para melhorar a largura de banda, a confiabilidade e o desempenho, garantindo uma conectividade estável e rápida para todos os usuários e sistemas.'),
(10, 'CyberAwareness Training', 'Desenvolvimento e implementação de programas de treinamento em segurança cibernética para conscientizar os funcionários sobre práticas seguras de uso da tecnologia, reduzindo o risco de violações de segurança causadas por erros humanos.');

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
	id_projeto int,
	CONSTRAIN fk_proj FOREIGN KEY (i) REFERENCES projetos (id_projetos)
)

SELECT * FROM fucionarios_projetos

ALTER TABLE fucionario_projetos RENAME TO funcionarios_projetos