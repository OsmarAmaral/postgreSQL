CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome_produto TEXT,
    descricao TEXT,
    preco DECIMAL,
    quantidade_estoque INT
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome_cliente TEXT,
    email TEXT,
    telefone TEXT,
    endereco TEXT
);

CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,  
    id_cliente INT,
    data_venda DATE,
    total DECIMAL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_venda (
    id_item SERIAL PRIMARY KEY,  
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) 
);

CREATE TABLE funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome_funcionario TEXT,
    cargo TEXT,
    salario DECIMAL,
    data_admissao DATE
);

CREATE TABLE caixas (
    id_caixa SERIAL PRIMARY KEY,
    id_funcionario INT,
    data_abertura DATE,
    data_fechamento DATE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

INSERT INTO produtos (nome_produto, descricao, preco, quantidade_estoque) VALUES
('Camiseta', 'Camiseta de algodão', 29.90, 100),
('Calça Jeans', 'Calça jeans masculina', 89.90, 50),
('Tênis Esportivo', 'Tênis para corrida', 199.90, 30),
('Relógio', 'Relógio digital', 149.90, 20);

INSERT INTO clientes (nome_cliente, email, telefone, endereco) VALUES
('João Silva', 'joao.silva@example.com', '11987654321', 'Rua A, 123'),
('Maria Oliveira', 'maria.oliveira@example.com', '11912345678', 'Avenida B, 456'),
('Carlos Santos', 'carlos.santos@example.com', '11876543210', 'Praça C, 789'),
('Ana Costa', 'ana.costa@example.com', '11765432109', 'Rua D, 101');

INSERT INTO vendas (id_cliente, data_venda, total) VALUES
(1, '2023-10-01', 59.80), 
(2, '2023-10-02', 199.90), 
(1, '2023-10-03', 29.90),  
(3, '2023-10-04', 89.90);  

INSERT INTO funcionarios (nome_funcionario, cargo, salario, data_admissao) VALUES
('Pedro Almeida', 'Vendedor', 2500.00, '2022-01-15'),
('Lucia Ferreira', 'Gerente', 4000.00, '2021-06-10'),
('Roberto Lima', 'Caixa', 2000.00, '2023-03-01'),
('Fernanda Souza', 'Estoquista', 2200.00, '2022-11-20');

INSERT INTO caixas (id_funcionario, data_abertura, data_fechamento) VALUES
(1, '2023-10-01', '2023-10-01'), 
(2, '2023-10-02', '2023-10-02'), 
(3, '2023-10-03', NULL),           
(4, '2023-10-04', NULL);    

SELECT nome_produto, preco
FROM produtos;

SELECT nome_cliente
FROM clientes
WHERE nome_cliente LIKE '%Silva%';

SELECT SUM(total)
FROM vendas;

SELECT nome_cliente, total
FROM clientes, vendas
WHERE clientes.id_cliente = vendas.id_cliente;

SELECT nome_produto, quantidade_estoque, preco
FROM produtos
WHERE id_produto = 1;

INSERT INTO produtos(nome_produto, descricao, preco, quantidade_estoque)
VALUES ('Mochila', 'Mochila de Viagem', 149.90, 25);

INSERT INTO vendas (data_venda, total)
VALUES ('2024-11-22', 89.90);

SELECT nome_produto, quantidade_estoque
FROM produtos
WHERE quantidade_estoque > 20;

SELECT nome_cliente, total
FROM clientes, vendas
WHERE clientes.id_cliente = vendas.id_cliente;

SELECT nome_produto
FROM produtos
WHERE preco > 100.00;

SELECT nome_cliente, nome_produto
FROM vendas, clientes, produtos, itens_venda
WHERE data_venda BETWEEN '2023-10-01' and '2023-10-03' and
clientes.id_cliente = vendas.id_cliente and
vendas.id_venda = itens_venda.id_venda and 
produtos.id_produto = itens_venda.id_produto;
