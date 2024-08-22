-- SQLite
-- Exemplo de Criação das Tabelas
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preço DECIMAL(10, 2),
    Quantidade_Estoque INT
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Data DATE,
    ID_Cliente INT,
    Status VARCHAR(20),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Item_Pedido (
    ID_Item_Pedido INT PRIMARY KEY,
    ID_Pedido INT,
    ID_Produto INT,
    Quantidade INT,
    Preço_Unitário DECIMAL(10, 2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

CREATE TABLE Feedback (
    ID_Feedback INT PRIMARY KEY,
    ID_Cliente INT,
    Data DATE,
    Comentário TEXT,
    Avaliação INT CHECK (Avaliação BETWEEN 1 AND 5),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    Nome_Usuario VARCHAR(100),
    Senha VARCHAR(100),
    Tipo_Usuario VARCHAR(20)
);


-- Exemplo de Inserção de Dados
-- Inserir Clientes
INSERT INTO Cliente (ID_Cliente, Nome, Email, Telefone) VALUES
(1, 'João da Silva', 'joao.silva@email.com', '987654321'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', '912345678');

-- Inserir Produtos
INSERT INTO Produto (ID_Produto, Nome, Preço, Quantidade_Estoque) VALUES
(1, 'Arroz', 10.00, 50),
(2, 'Feijão', 7.50, 30);

-- Inserir Pedidos
INSERT INTO Pedido (ID_Pedido, Data, ID_Cliente, Status) VALUES
(1, '2024-08-14', 1, 'Pendente'),
(2, '2024-08-14', 2, 'Concluído');

-- Inserir Itens de Pedido
INSERT INTO Item_Pedido (ID_Item_Pedido, ID_Pedido, ID_Produto, Quantidade, Preço_Unitário) VALUES
(1, 1, 1, 2, 10.00),
(2, 1, 2, 1, 7.50),
(3, 2, 1, 1, 10.00);

-- Inserir Feedbacks
INSERT INTO Feedback (ID_Feedback, ID_Cliente, Data, Comentário, Avaliação) VALUES
(1, 1, '2024-08-14', 'Ótimo atendimento!', 5),
(2, 2, '2024-08-14', 'Bom produto, mas a entrega demorou.', 3);

-- Inserir Usuários
INSERT INTO Usuario (ID_Usuario, Nome_Usuario, Senha, Tipo_Usuario) VALUES
(1, 'usuario1', 'senha1', 'Cliente'),
(2, 'admin', 'admin123', 'Administrador');

-- Consultas SQL
-- Consultar os produtos de um pedido específico
SELECT p.Nome, ip.Quantidade, ip.Preço_Unitário
FROM Item_Pedido ip
JOIN Produto p ON ip.ID_Produto = p.ID_Produto
WHERE ip.ID_Pedido = 1;

-- Consultar o total gasto por um cliente
SELECT c.Nome, SUM(ip.Quantidade * ip.Preço_Unitário) AS Total_Gasto
FROM Pedido p
JOIN Item_Pedido ip ON p.ID_Pedido = ip.ID_Pedido
JOIN Cliente c ON p.ID_Cliente = c.ID_Cliente
WHERE c.ID_Cliente = 1
GROUP BY c.Nome;

-- Consultar os feedbacks de um cliente específico
SELECT f.Data, f.Comentário, f.Avaliação
FROM Feedback f
JOIN Cliente c ON f.ID_Cliente = c.ID_Cliente
WHERE c.ID_Cliente = 1;