CREATE TABLE Categoria (
    id_categoria serial PRIMARY KEY,
    nome varchar(100),
    marca varchar(100),
    produtos varchar(100)
);

CREATE TABLE Transportadora (
    id_transportadora serial PRIMARY KEY,
    email varchar(50),
    telefone1 varchar(9),
    telefone2 varchar(9)
);

CREATE TABLE Produto (
    id_produto serial PRIMARY KEY,
    nome varchar(50),
    preco float,
    estoque int,
    marca varchar(25),
    id_categoria int REFERENCES Categoria(id_categoria),
    id_transportadora int REFERENCES Transportadora(id_transportadora)
);

CREATE TABLE Fornecedor (
    id_fornecedor serial PRIMARY KEY,
    nome varchar(50),
    estado varchar(25),
    cidade varchar(25),
    bairro varchar(25),
    rua varchar(25),
    numero int,
    id_produto int REFERENCES Produto(id_produto)
);

CREATE TABLE Cliente (
    id_cliente serial PRIMARY KEY,
    nome varchar(50),
    email varchar(50),
    cpf varchar(11),
    telefone1 varchar(9),
    telefone2 varchar(9),
    estado varchar(25),
    cidade varchar(25),
    bairro varchar(25),
    rua varchar(50),
    numero int
);

CREATE TABLE Pagamento_pedido (
    pagamento_id serial PRIMARY KEY,
    tipo int,
    data_pedido date,
    qtd_pedido int,
    total int,
    rua varchar(50),
    estado varchar(25),
    bairro varchar(50),
    cidade varchar(50),
    id_cliente int REFERENCES Cliente(id_cliente)
);

CREATE TABLE Avaliacao (
    id_avaliacao serial PRIMARY KEY,
    pontuacao float,
    comentario varchar(50),
    id_produto int REFERENCES Produto(id_produto)
	
);

CREATE TABLE avaliacao_cliente (
    id_avaliacao int REFERENCES Avaliacao(id_avaliacao),
    id_cliente int REFERENCES Cliente(id_cliente),
    PRIMARY KEY(id_avaliacao, id_cliente)
);

CREATE TABLE Notificacao (
    id_notificacao serial PRIMARY KEY,
    mensagem varchar(255),
    lida DATE NULL
);

CREATE TABLE Receber (
    id_notificacao int PRIMARY KEY,
    id_cliente int REFERENCES Cliente(id_cliente)
);

CREATE TABLE Estoque (
    estoque_id serial PRIMARY KEY,
    quantidade int,
    data_atualizacao date,
    idProduto int REFERENCES Produto(id_produto)
);

CREATE TABLE Registros (
    estoque_id int REFERENCES Estoque(estoque_id),
    idProduto int REFERENCES Produto(id_produto),
    PRIMARY KEY(estoque_id, idProduto)
);

-- Inserir dados --

INSERT INTO Categoria (nome, marca, produtos) VALUES
('Smartphones', 'Samsung', 'Galaxy S21, Galaxy A52, Galaxy Note 20, Galaxy Z Fold 3, Galaxy Buds Pro'),
('Laptops', 'Dell', 'XPS 13, Inspiron 15, Alienware m15, Latitude 14, G3 15'),
('TVs', 'LG', 'OLED C1, NanoCell 85, UN7300, OLED GX, 4K UHD 70');

SELECT * FROM Categoria;

INSERT INTO Transportadora (email, telefone1, telefone2) VALUES
('transportadoraXLM@gmail.com', '998510789', '987654328'),
('alphaTransportes@gmail.com', '994528235', '914525960'),
('Beicolatransportadora@gmail.com', '996584772', '991673891');

SELECT * FROM Transportadora;

INSERT INTO Produto (nome, preco, estoque, marca, id_categoria, id_transportadora) VALUES
('Galaxy S21', 1170.00, 50, 'Samsung', 1, 1),
('XPS 13', 1299.99, 30, 'Dell', 2, 2),
('OLED C1', 1499.99, 20, 'LG', 3, 3);

SELECT * FROM Produto;

INSERT INTO Fornecedor (nome, estado, cidade, bairro, rua, numero, id_produto) VALUES
('João', 'SP', 'São Paulo', 'Centro', 'Avenida Paulista', 253, 1),
('Paulo', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', 462, 2);

SELECT * FROM Fornecedor;

INSERT INTO Cliente (nome, email, cpf, telefone1, telefone2, estado, cidade, bairro, rua, numero) VALUES
('Wanderson', 'wandersoncs@gmail.com', '12345678901', '839407134', '834465790', 'PB', 'Sertãozinho', 'Centro', 'Rua da saudade', 456),
('Abdeel', 'abdeel.lucena@gmail.com', '98765432101', '999213241', '539038072', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', 789),
('Euller', 'joaoeuller@gmail.com', '56789012301', '553851144', '553445679', 'MG', 'Belo Horizonte', 'Savassi', 'Avenida Afonso Pena', 101),
('Dorneles', 'dornelesrico@gmail.com', '34567890101', '839926732', '839956832', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Largo Abelard Jacques Noronha', 202);

SELECT * FROM Cliente;

INSERT INTO Pagamento_pedido (tipo, data_pedido, qtd_pedido, total, rua, estado, bairro, cidade, id_cliente) VALUES
(1, '2023-11-30', 1, 1170.00, 'Rua da saudade', 'PB', 'Centro', 'Sertãozinho', 1),
(2, '2023-11-29', 2, 1599.99, 'Avenida Atlântica', 'RJ', 'Copacabana', 'Rio de Janeiro', 2),
(3, '2023-11-28', 1, 1499.97, 'Avenida Afonso Pena', 'MG', 'Savassi', 'Belo Horizonte', 3),
(2, '2023-11-27', 1, 1299.99, 'Largo Abelard Jacques Noronha', 'RS', 'Moinhos de Vento', 'Porto Alegre', 4);

SELECT * FROM Pagamento_pedido;

INSERT INTO Avaliacao (pontuacao, comentario, id_produto) VALUES
(4.5, 'Ótimo smartphone!', 1),
(5.0, 'Desempenho incrível!', 2),
(4.0, 'Qualidade da imagem excelente!', 3);

SELECT * FROM Avaliacao;

INSERT INTO avaliacao_cliente (id_avaliacao, id_cliente) VALUES
(1, 1),
(2, 2),
(3, 3);

SELECT * FROM avaliacao_cliente;

INSERT INTO Notificacao (mensagem, lida) VALUES
('Oferta especial: desconto em smartphones!', '2023-11-25'),
('Seu pedido foi enviado!', NULL),
('Novos produtos disponíveis. Confira!', '2023-11-28'),
('Atualização de estoque: produtos em falta', NULL),
('Receba notificações exclusivas assinando nosso boletim!', NULL);

SELECT * FROM Notificacao;

INSERT INTO Receber (id_notificacao, id_cliente) VALUES
(1, 1),
(2, 2),
(3, 3);

SELECT * FROM Receber;

INSERT INTO Estoque (quantidade, data_atualizacao, idProduto) VALUES
(100, '2023-11-30', 1),
(50, '2023-11-29', 2),
(30, '2023-11-28', 3);

SELECT * FROM Estoque;

INSERT INTO Registros (estoque_id, idProduto) VALUES
(1, 1),
(2, 2),
(3, 3);
 
SELECT * FROM Registros;

SELECT nome
FROM Produto
WHERE nome LIKE '%a%';

SELECT mensagem
FROM Notificacao
WHERE mensagem LIKE '%desconto%';

SELECT nome, preco
FROM Produto
ORDER BY nome ASC;

SELECT id_cliente, data_pedido
FROM Pagamento_pedido
ORDER BY data_pedido DESC;

SELECT marca, COUNT(id_produto) AS total_produtos
FROM Produto
GROUP BY marca;

SELECT id_cliente, MAX(total) AS maior_valor_pedido
FROM Pagamento_pedido
GROUP BY id_cliente;

SELECT * FROM Visao1;

CREATE VIEW Visao1 AS
SELECT id_cliente, nome, email
FROM Cliente;

SELECT * FROM Visao2;

CREATE VIEW Visao2 AS
SELECT id_produto, nome, preco
FROM Produto
WHERE preco > 1000;

SELECT * FROM Visao3;

CREATE VIEW Visao3 AS
SELECT id_avaliacao, pontuacao, id_produto
FROM Avaliacao;

-- Consultas
-- 1. Consultas envolvendo junções

SELECT Produto.nome AS nome_produto, Categoria.nome AS nome_categoria
FROM Produto
INNER JOIN Categoria ON Produto.id_categoria = Categoria.id_categoria;

SELECT Fornecedor.nome AS nome_fornecedor, Produto.nome AS nome_produto
FROM Fornecedor
INNER JOIN Produto ON Fornecedor.id_produto = Produto.id_produto;

-- 2. Consultas usando buscas por substrings (operador LIKE)
SELECT nome
FROM Produto
WHERE nome LIKE '%a%';

SELECT mensagem
FROM Notificacao
WHERE mensagem LIKE '%Oferta%';

-- 3. Consultas envolvendo ordenação
SELECT nome, preco
FROM Produto
ORDER BY preco DESC;

SELECT qtd_pedido, data_pedido
FROM Pagamento_pedido
ORDER BY data_pedido;

-- 4. Consultas usando agrupamento e funções agregadas
SELECT marca, AVG(preco) AS media_preco
FROM Produto
GROUP BY marca;

SELECT id_cliente, COUNT(id_avaliacao) AS total_avaliacao_cliente
FROM avaliacao_cliente
GROUP BY id_cliente;