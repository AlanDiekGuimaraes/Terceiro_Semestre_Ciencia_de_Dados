CREATE DATABASE Loja;
USE Loja;

-- No modelo OLAP so dados são organizados em:
-- Fatos (Valores Numericos) e Dimensões (Categorias para analise)
CREATE TABLE Dim_Categoria (
	CategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50)
);

-- Criar tabela de fatos
CREATE TABLE Fato_Vendas(
	VendaID INT PRIMARY KEY AUTO_INCREMENT,
    CategoriaID INT,
    Receita DECIMAL(10,2),
    Custo DECIMAL(10,2),
    Quantidade_Vendida INT,
    Data_Venda DATE,
    FOREIGN KEY (CategoriaID) REFERENCES Dim_Categoria(CategoriaID)
);

INSERT INTO Dim_Categoria (Nome) VALUES
('Eletrônicos'), ('Móveis'), ('Roupas'), ('Alimentos'), ('Brinquedos'), ('Automóveis');

INSERT INTO Fato_Vendas (CategoriaID, Receita, Custo, Quantidade_Vendida, Data_Venda) VALUES
(1, 10000, 6000, 50, '2024-03-01'),
(2, 5000, 3000, 30, '2024-03-02'),
(3, 7000, 4000, 40, '2024-03-03'),
(4, 3000, 2000, 20, '2024-03-04'),
(5, 4000, 2500, 25, '2024-03-05'),
(6, 12000, 8000, 60, '2024-03-06');

SELECT c.Nome AS Categoria, v.Receita, v.Quantidade_Vendida
FROM Fato_Vendas v
JOIN Dim_Categoria c ON v.CategoriaID = c.CategoriaID;


-- Na linguagem MDX
-- SELECT
-- [Dim_Categoria].[Nome].MEMBERS OS ROWS,
-- [Measures].[Receitas] ON COLUMNS
-- FROM [Cubo_Vendas]

-- Criando uma consulta personalizada
SELECT c.Nome AS Categoria,
	v.Receita,
    v.Custo,
    (v.Receita - v.Custo) AS Lucro_Liquido
FROM Fato_Vendas v
JOIN Dim_Categoria c ON v.CategoriaID = c.CategoriaID;

-- Criando uma consulta personalizada com MDX
-- MDX
-- WITH MEMBER [Measures].[Lucro_Liquido] AS ([Measures].[Receita] - [Measures].[Custo])
-- SELECT 
-- [Dim_Categoria].[Nome].MEMBERS OS ROWS,
-- [Measures].[Lucro_Liquido] ON COLUMNS
-- FROM [Cubo_Vendas]

-- Criando uma consulta personalizada ordenada pelo lucro liquido
SELECT c.Nome AS Categoria,
	v.Receita,
    v.Custo,
    (v.Receita - v.Custo) AS Lucro_Liquido
FROM Fato_Vendas v
JOIN Dim_Categoria c ON v.CategoriaID = c.CategoriaID
ORDER BY Lucro_Liquido DESC;

-- Criando uma consulta personalizada com MDX ordenada
-- MDX INTAUM
-- SELECT
-- ORDER([Dim_Categoria].[Nome].MEMBERS, [Measures].[Lucro_Liquido], DESC) OS ROWS,
-- [Measures].[Lucro_Liquido] ON COLUMNS
-- FROM [Cubo_Vendas]



