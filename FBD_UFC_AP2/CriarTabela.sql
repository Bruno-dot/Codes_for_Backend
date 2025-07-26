CREATE TABLE VENDAS (
    registro_compra SERIAL PRIMARY KEY,
    produtos_vendidos TEXT NOT NULL,
    cpf_cliente TEXT,
    nome_cliente TEXT,
    valor NUMERIC(10, 2) NOT NULL,
    data_hora TIMESTAMP NOT NULL
);