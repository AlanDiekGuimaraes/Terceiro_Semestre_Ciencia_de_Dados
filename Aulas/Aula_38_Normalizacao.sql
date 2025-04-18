-- clientesDROP DATABASE Normalizacao;
CREATE DATABASE Normalizacao;
USE Normalizacao;

CREATE TABLE Pedidos (
	Pedido_ID INT PRIMARY KEY,
    Cliente VARCHAR(100),
    Telefone VARCHAR(15),
    Produto VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL (10,2),
    Quantidade INT
);

INSERT INTO Pedidos VALUES
(1, 'Sandra', '9999-9999', 'Celular X', 'Eletrônicos', 2000, 1),
(2, 'Brenda', '9888-9888', 'Notebook Y', 'Eletrônicos', 3500, 1),
(3, 'Sandra', '9999-9999', 'TV Z', 'Eletrônicos', 2500, 1),
(4, 'Jessica', '9698-9999', 'Microondas X', 'Eletrodom.', 700, 1);

SELECT * FROM Pedidos;

DROP TABLE Pedidos;

CREATE TABLE Clientes(
	Cliente_ID INT PRIMARY KEY AUTO_INCREMENT, 
    Nome VARCHAR(100),
	Telefone VARCHAR(15)
);

INSERT INTO Clientes (Nome, Telefone) VALUES
('Sandra', '9999-9999'),
('Brenda', '9888-9888'),
('Jessica', '9698-9999');

CREATE TABLE Pedidos(
	Pedido_ID INT PRIMARY KEY,
    Cliente_ID INT,
    Produto VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL (10,2),
    Quantidade INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(Cliente_ID)
);

INSERT INTO Pedidos VALUES
(1, '1', 'Celular X', 'Eletrônicos', 2000, 1),
(2, '2', 'Notebook Y', 'Eletrônicos', 3500, 1),
(3, '1', 'TV Z', 'Eletrônicos', 2500, 1),
(4, '3', 'Microondas X', 'Eletrodom.', 700, 1);

SELECT * FROM Pedidos;

CREATE TABLE Produtos (
	Produto_ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL(10,2)
);

INSERT INTO Produtos (Nome, Categoria, Preco) VALUES
('Celular X', 'Eletrônicos', 2000),
('Notebook Y', 'Eletrônicos', 3500),
('TV Z', 'Eletrônicos', 2500),
('Microondas X', 'Eletrodom.', 700);

SELECT * FROM Pedidos;
SELECT * FROM Produtos;

ALTER TABLE Pedidos DROP COLUMN Categoria, DROP COLUMN Preco;
ALTER TABLE Pedidos ADD COLUMN Produto_ID INT;
ALTER TABLE Pedidos ADD FOREIGN KEY (Produto_ID) REFERENCES Produtos(Produto_ID);

UPDATE Pedidos p
JOIN Produtos pr ON p.Produto = pr.Nome
SET p.Produto_ID = pr.Produto_ID;

ALTER TABLE Pedidos DROP COLUMN Produto;

CREATE TABLE Categorias(
	Categoria_ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50)
);

INSERT INTO Categorias (Nome) VALUES
('Eletrônicos'), 
('Eletrodom.');

ALTER TABLE Produtos ADD COLUMN Categoria_ID INT;
ALTER TABLE Produtos ADD FOREIGN KEY (Categoria_ID) REFERENCES Categorias(Categoria_ID);

UPDATE Produtos p 
JOIN Categorias c ON p.Categoria = c.Nome
SET p.Categoria_ID = c.Categoria_ID;

ALTER TABLE Produtos DROP COLUMN Categoria;

CREATE TABLE Telefones_Clientes(
	CLiente_ID INT,
    Telefone VARCHAR(15),
    PRIMARY KEY (Cliente_ID, Telefone),
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(CLiente_ID)
);

INSERT INTO Telefones_Clientes (Cliente_ID, Telefone)
SELECT Cliente_ID, Telefone FROM Clientes;

ALTER TABLE Clientes DROP COLUMN Telefone;

INSERT IGNORE INTO Telefones_CLientes VALUES
(1, '9999-9999'),
(1, '8888-8888');

SELECT * FROM Telefones_Clientes;

CREATE TABLE Fornecedores(
	Fornecedor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50)
);


CREATE TABLE Fornecedor_Produtos (
	Fornecedor_ID INT,
    Produto_ID INT,
    PRIMARY KEY (Fornecedor_ID, Produto_ID),
    FOREIGN KEY (Fornecedor_ID) REFERENCES Fornecedores(Fornecedor_ID),
    FOREIGN KEY (Produto_ID) references Produtos(Produto_ID)
);

INSERT INTO Fornecedores (Nome) VALUES
('Fornecedor A'),
('Fornecedor B'),
('Fornecedor C');

INSERT INTO Fornecedor_Produtos VALUES
(1,1),
(1,2),
(2,3),
(3,4);

SELECT
	f.Nome AS Fornecedor,
    p.Nome AS Produto,
    p.Preco
FROM Fornecedor_Produtos fp
JOIN Fornecedores f ON fp.Fornecedor_ID = f.Fornecedor_ID
JOIN Produtos p ON fp.Produto_ID = p.Produto_ID;

select * from fornecedor_Produtos;


CREATE TABLE Historico_Precos(
	Produto_ID INT,
    Data_Alteracao DATE,
    Preco DECIMAL(10,2),
    PRIMARY KEY (Produto_ID, DATA_Alteracao),
    FOREIGN KEY (Produto_ID) REFERENCES Produtos(Produto_ID)
);

INSERT INTO Historico_Precos (Produto_ID, Data_Alteracao, Preco)
SELECT Produto_ID, CURRENT_DATE(), Preco FROM Produtos;

select * from Historico_Precos;

SELECT 
	p.Nome As Produto,
    hp.Data_Alteracao,
    hp.Preco
FROM Historico_precoscategoriascategoriascategoriasclientes hp
JOIN Produtos p ON hp.Produto_ID = p.Produto_ID;

CREATE TABLE Pedidos_Consoludados (
	Pedidos_ID INT 
);