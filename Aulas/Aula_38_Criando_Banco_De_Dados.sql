DROP DATABASE Normalizacao;
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