DROP TABLE product1;

DROP TABLE client CASCADE;

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29);


---------------------------------------------------------------------
 --             Comandos DQL (Data Query Language)                 --
---------------------------------------------------------------------

--> Vizualizando a tabela de clientes ou produtos
SELECT*FROM clients
SELECT*FROM products

--> Selecionando colulas específicas
SELECT firstname,lastname FROM clients
SELECT productname,price,discount,price*discount AS "desconto em reais" FROM products
SELECT brand FROM products

--> Selecionar valores sem repetição
SELECT DISTINCT  brand FROM products

---> Calculadora
SELECT 6/2 
--> Funções
SELECT random()

-------------------------------------------------------------------------
-------> SELECT com clausula WHERE <----------------
---- Operadores de compração >,<,>=,=<,=,<> ou -----

--> Exibir produtos com valor acima de 100 reais
SELECT productname,price FROM products
WHERE price>=100

------> Operadores Lógicos: AND,OR e NOT<---------------------------

---> Produtos entre 100 e 800 reais
SELECT productname,price FROM products
WHERE price >=100 AND price<=800
--> Alternativa
SELECT productname,price FROM products
WHERE price BETWEEN 100 AND 800

---> Produtos cujo preço esteja abaixo de 100 e acima de 800
SELECT productname,price FROM products
WHERE price<=100 OR price>=800
---------------------------------------------------------------------

-- COUNT -- contar --
--> Quantos produtos foram vendidos no total?
SELECT COUNT (idproduct) FROM products

-- Função AVG(média) --
SELECT AVG (price) FROM products

-- Função MAX(máximo) --
SELECT MAX (price) FROM products
-- Função MIN(minímo) --
SELECT MIN (price) FROM products

-- Função SUM(soma) --
SELECT SUM (price) FROM products

-- Função ORDER BY / DESC --
SELECT * FROM products
ORDER BY firstname DESC -- decrescente



---------------------------------------------------------------------




-----> DESAFIO: exibir nome do produto, preço e preço do desconto <-------
SELECT productname,price,discount, price - price*discount AS "preço com desconto" FROM products

-----> DESAFIO: Listar todos produtos da marca bell <----------------------
SELECT productname,brand FROM products
WHERE brand = 'dell'

-----> DESAFIO: Listar todos os produtos comprados por João <--------
SELECT productname, brand FROM products
WHERE idclient = '2'
---Alternativa-----       
SELECT idclient FROM clients
WHERE firstname = 'Joao'

SELECT productname FROM products
WHERE idclient = (SELECT idclient FROM clients
                  WHERE firstname = 'Joao')

-----> DESAFIO: Listar todos os clientes com Id par <----------------
SELECT idclient, firstname FROM clients
WHERE idclient%2=0

-----> DESAFIO: Exercícios <---------------------------------------------

-- 1. Quantos produtos da marca dell foram vendidos?
SELECT COUNT (idproduct) FROM products
WHERE brand = 'dell'


-- 2. Quantos produtos João comprou?
SELECT COUNT (productname) FROM products
WHERE idclient = '2'


-- 3. Qual o preço médio dos produtos da dell?
SELECT AVG (price) FROM products
WHERE brand = 'dell'


-- 4. Qual o produto mais caro vendido?
SELECT productname,price FROM products
WHERE price  = (SELECT MAX (price) FROM products)


-- 5. Qual o produto mais barato vendido?
SELECT productname,price FROM products
WHERE price  = (SELECT MIN (price) FROM products)


-- 6. Qual o valor total de equipamentos dell vendidos?
SELECT SUM (price) FROM products
WHERE brand = 'dell'


-- 7. Quanto Rodrigo já gastou no eCommerce?
SELECT SUM (price) FROM products
WHERE idclient = '1'


-- 8. Exiba todos os produtos da catergoria eletronicos ordenados do mais barato para o mais caro.
SELECT * FROM products
WHERE category = 'eletronicos'
ORDER BY price 


-- 9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.
SELECT productname, price FROM products
WHERE idclient = '1'
ORDER BY price DESC

--**********--
--         Preparação         --
--**********--

-- Adicionar produtos que não foram comprados5
INSERT INTO products (productname,brand,category,discount,price) VALUES
('impressora','hp','eletronicos',0.12,489.9),
('luminaria','ge','eletronicos',0.5,46.80),
('drone','dji','eletronico',0.12,9856.0)

SELECT * FROM products

-- Cross join --
SELECT * FROM clients,products
SELECT * FROM products,clients
SELECT * FROM clients CROSS JOIN products

-- Inner Join (relaciona por PK/FK) --
SELECT clients.firstName,productname FROM clients INNER JOIN products
ON clients.idclient = products.idclient
WHERE firstname='Rodrigo' OR firstname='rodrigo' --> TESTE

SELECT * FROM clients INNER JOIN products USING (idclient)

SELECT * FROM clients NATURAL INNER JOIN products
t)
SELECT clients.firstname, products.productname FROM clients INNER JOIN products USING (idclien

SELECT clients.firstname, products.productname 
FROM clients LEFT JOIN products USING (idclient)
																					   

SELECT clients.firstname, products.products
--1:
SELECT products.productname, clients.firstname 
FROM clients INNER JOIN products USING (idclient)
WHERE category = 'eletronicos'

--2:
SELECT products.productname, clients.firstname 
FROM clients FULL JOIN products USING (idclient)
WHERE idproduct IS NULL

--3:
SELECT products.productname, clients.firstname 
FROM clients FULL JOIN products USING (idclient)
WHERE idclient IS NULL

--4:
SELECT clients.firstame, products.productname
FROM clients IER JOIN products USING (idclient)
WHERE clients.firstname = 'Rodrigo'																					   
																					   
--5
SELECT clients.firstname, products.productname, products.brand
FROM clients INNER JOIN products USING (idclient)																					   
WHERE client.firstname IS NULL												
																					   
FROM products FULL JOIN clients USING (idclient)

-------------------->  1RN // 2RN  <--------------------
