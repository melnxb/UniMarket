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
    Nome VARCHAR(255) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL unique,
    CPF VARCHAR(11) unique,
	Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS Administrador (
    id_adm INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    CPF VARCHAR(11) unique NOT NULL,
	Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Produtos (
    id_produto INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Tamanho VARCHAR(20) NOT NULL,
    Peso DECIMAL(10, 2) NOT NULL,
    Quantidade INT NOT NULL,
    Descricao TEXT,
	Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Imagens_Produtos (
    id_imagem INT PRIMARY KEY,
    id_produto INT,
    Imagem BLOB, -- Você pode usar um tipo de dado apropriado para armazenar imagens, como BLOB
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
CREATE TABLE Carrinho (
    id_carrinho INT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    Quantidade INT NOT NULL,
	Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    id_carrinho INT,
    Preco DECIMAL(10, 2) NOT NULL,
    Metodo_de_pagamento VARCHAR(50) NOT NULL,
	Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_carrinho) REFERENCES Carrinho(id_carrinho)
);
CREATE TABLE Historico (
    id_historico INT PRIMARY KEY,
    id_cliente INT,
    id_pagamento INT,
    Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_pagamento) REFERENCES Pagamento(id_pagamento)
);



