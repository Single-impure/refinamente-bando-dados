CREATE TABLE clientes (
    id_cliente      INT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL,
    idade           INT CHECK (idade >= 18),
    status          VARCHAR(10) DEFAULT 'ativo'
                    CHECK (status IN ('ativo', 'inativo'))
);

CREATE TABLE pedidos (
    id_pedido       INT PRIMARY KEY,
    id_cliente      INT NOT NULL,
    valor_total     DECIMAL(10,2) NOT NULL CHECK (valor_total > 0),
    status_pedido   VARCHAR(15) DEFAULT 'pendente'
                    CHECK (status_pedido IN ('pendente', 'pago', 'enviado', 'cancelado')),
    data_pedido     DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE sqlite_sequence(name,seq);
