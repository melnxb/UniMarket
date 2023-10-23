CREATE SCHEMA IF NOT EXISTS unimarket;
USE unimarket;

DROP TABLE IF EXISTS Administrador;
DROP TABLE IF EXISTS Imagens_Produtos;
DROP TABLE IF EXISTS Historico;
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Carrinho;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL unique,
    cpf VARCHAR(11) unique,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS Administrador (
    id_adm INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) unique NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(20),
    peso DECIMAL(10, 2),
    quantidade INT,
    descricao TEXT NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Imagens_Produtos (
    id_imagem INT PRIMARY KEY,
    id_produto INT,
    imagem BLOB, -- Você pode usar um tipo de dado apropriado para armazenar imagens, como BLOB
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
CREATE TABLE Carrinho (
    id_carrinho INT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    quantidade INT NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    id_carrinho INT,
    preco DECIMAL(10, 2) NOT NULL,
    metodo_de_pagamento VARCHAR(50) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_carrinho) REFERENCES Carrinho(id_carrinho)
);
CREATE TABLE Historico (
    id_historico INT PRIMARY KEY,
    id_cliente INT,
    id_pagamento INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_pagamento) REFERENCES Pagamento(id_pagamento)
);



