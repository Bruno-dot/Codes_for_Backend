CREATE TABLE Pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    senha_hash VARCHAR(255) NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    data_nascimento DATE,
    genero VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Pessoa(id_pessoa)
);

CREATE TABLE Psicologo (
    id_psicologo INT PRIMARY KEY,
    crp VARCHAR(50) UNIQUE NOT NULL,
    bio TEXT,
    especializacao VARCHAR(255),
    disponibilidade VARCHAR(255),
    status_verificacao VARCHAR(50),
    FOREIGN KEY (id_psicologo) REFERENCES Pessoa(id_pessoa)
);

CREATE TABLE Encontro (
    id_encontro SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    tipo_encontro VARCHAR(100),
    data_hora TIMESTAMP NOT NULL,
    link VARCHAR(255),
    id_psicologo INT NOT NULL,
    FOREIGN KEY (id_psicologo) REFERENCES Psicologo(id_psicologo)
);

CREATE TABLE Participa (
    id_encontro INT NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_encontro, id_usuario),
    FOREIGN KEY (id_encontro) REFERENCES Encontro(id_encontro),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Atendimento (
    id_atendimento SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_psicologo INT NOT NULL,
    tipo_atendimento VARCHAR(100),
    status VARCHAR(50),
    observacoes TEXT,
    avaliacao_usuario INT,
    feedback_usuario TEXT,
    data_hora_inicio TIMESTAMP NOT NULL,
    data_hora_fim TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_psicologo) REFERENCES Psicologo(id_psicologo)
);

CREATE TABLE Material_de_Apoio_Emocional (
    id_material SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    data_publicacao DATE,
    descricao TEXT,
    tipo_material VARCHAR(100),
    url_conteudo VARCHAR(255),
    conteudo_texto TEXT,
    palavras_chave TEXT
);

CREATE TABLE Categoria_de_Material (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Material_Categoria (
    id_material INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_material, id_categoria),
    FOREIGN KEY (id_material) REFERENCES Material_de_Apoio_Emocional(id_material),
    FOREIGN KEY (id_categoria) REFERENCES Categoria_de_Material(id_categoria)
);
