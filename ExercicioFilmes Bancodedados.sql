CREATE TABLE ENDERECO (
    COD_END INT NOT NULL,
    LOGRADOURO VARCHAR(40),
    TIPO_LOG VARCHAR(40),
    COMPLEMENTO VARCHAR(20),
    CIDADE VARCHAR(60),
    UF CHAR(1),
    CEP CHAR(8),
    NUMERO VARCHAR(10),
    BAIRRO VARCHAR(60),
    PRIMARY KEY (COD_END)
);

CREATE TABLE PROFISSAO (
    COD_PROF INT NOT NULL,
    NOME VARCHAR(60),
    PRIMARY KEY (COD_PROF)
);

CREATE TABLE CLIENTE (
    COD_CLI INT NOT NULL,
    CPF CHAR(11),
    NOME VARCHAR(60),
    TELEFONE VARCHAR(10),
    COD_PROF INT,
    PRIMARY KEY (COD_CLI),
    FOREIGN KEY (COD_PROF) REFERENCES PROFISSAO(COD_PROF)
);

CREATE TABLE DEPENDENTE (
    COD_CLI INT NOT NULL,
    COD_DEP INT NOT NULL,
    PARENTESCO VARCHAR(20),
    PRIMARY KEY (COD_CLI, COD_DEP),
    FOREIGN KEY (COD_CLI) REFERENCES CLIENTE(COD_CLI)
);

CREATE TABLE CLI_ENDERECO (
    COD_END INT NOT NULL,
    COD_CLI INT NOT NULL,
    PRIMARY KEY (COD_END, COD_CLI),
    FOREIGN KEY (COD_END) REFERENCES ENDERECO(COD_END),
    FOREIGN KEY (COD_CLI) REFERENCES CLIENTE(COD_CLI)
);

CREATE TABLE CATEGORIA (
    COD_CAT INT NOT NULL,
    NOME VARCHAR(60),
    VALOR NUMERIC(15, 2),
    PRIMARY KEY (COD_CAT)
);

CREATE TABLE GENERO (
    COD_GEN INT NOT NULL,
    NOME VARCHAR(60),
    PRIMARY KEY (COD_GEN)
);

CREATE TABLE FILMES (
    COD_FILME INT NOT NULL,
    TITULO_ORIGINAL VARCHAR(100),
    TITULO VARCHAR(100),
    QUANTIDADE INT,
    COD_CAT INT,
    COD_GEN INT,
    PRIMARY KEY (COD_FILME),
    FOREIGN KEY (COD_CAT) REFERENCES CATEGORIA(COD_CAT),
    FOREIGN KEY (COD_GEN) REFERENCES GENERO(COD_GEN)
);

CREATE TABLE ATOR (
    COD_ATOR INT NOT NULL,
    NOME VARCHAR(60),
    PRIMARY KEY (COD_ATOR)
);

CREATE TABLE FILME_ATOR (
    COD_ATOR INT NOT NULL,
    COD_FILME INT NOT NULL,
    DIRETOR CHAR(1),
    PRIMARY KEY (COD_ATOR, COD_FILME),
    FOREIGN KEY (COD_ATOR) REFERENCES ATOR(COD_ATOR),
    FOREIGN KEY (COD_FILME) REFERENCES FILMES(COD_FILME)
);

CREATE TABLE LOCACAO (
    COD_LOC INT NOT NULL,
    DATA_LOC DATE,
    DESCONTO NUMERIC(15, 2),
    MULTA NUMERIC(15, 2),
    SUB_TOTAL NUMERIC(15, 2),
    COD_CLI INT NOT NULL,
    PRIMARY KEY (COD_LOC),
    FOREIGN KEY (COD_CLI) REFERENCES CLIENTE(COD_CLI)
);

CREATE TABLE LOCACAO_FILME (
    COD_LOC INT NOT NULL,
    COD_FILME INT NOT NULL,
    NUM_DIAS INT,
    DATA_DEVOL DATE,
    PRIMARY KEY (COD_LOC, COD_FILME),
    FOREIGN KEY (COD_LOC) REFERENCES LOCACAO(COD_LOC),
    FOREIGN KEY (COD_FILME) REFERENCES FILMES(COD_FILME)
);

INSERT INTO PROFISSAO (COD_PROF, NOME) VALUES
(1, 'Engenheiro'),
(2, 'Médico'),
(3, 'Advogado'),
(4, 'Professor'),
(5, 'Programador'),
(6, 'Designer'),
(7, 'Arquiteto'),
(8, 'Enfermeiro'),
(9, 'Jornalista'),
(10, 'Farmacêutico');

INSERT INTO CLIENTE (COD_CLI, CPF, NOME, TELEFONE, COD_PROF) VALUES
(1, '12345678901', 'João Silva', '1234567890', 1),
(2, '23456789012', 'Maria Oliveira', '2345678901', 2),
(3, '34567890123', 'Pedro Santos', '3456789012', 3),
(4, '45678901234', 'Ana Souza', '4567890123', 4),
(5, '56789012345', 'Paulo Lima', '5678901234', 5),
(6, '67890123456', 'Clara Almeida', '6789012345', 6),
(7, '78901234567', 'Lucas Pereira', '7890123456', 7),
(8, '89012345678', 'Juliana Rocha', '8901234567', 8),
(9, '90123456789', 'Carlos Costa', '9012345678', 9),
(10, '01234567890', 'Fernanda Moreira', '0123456789', 10);

INSERT INTO ENDERECO (COD_END, LOGRADOURO, TIPO_LOG, COMPLEMENTO, CIDADE, UF, CEP, NUMERO, BAIRRO) VALUES
(1, 'Rua das Flores', 'Rua', 'Apt 101', 'São Paulo', 'S', '12345678', '100', 'Jardins'),
(2, 'Avenida Paulista', 'Avenida', 'Sala 200', 'São Paulo', 'S', '23456789', '2000', 'Bela Vista'),
(3, 'Praça da Sé', 'Praça', 'Bloco A', 'São Paulo', 'S', '34567890', '10', 'Centro'),
(4, 'Rua Augusta', 'Rua', '', 'São Paulo', 'S', '45678901', '500', 'Consolação'),
(5, 'Rua Oscar Freire', 'Rua', 'Casa 1', 'São Paulo', 'S', '56789012', '300', 'Pinheiros'),
(6, 'Rua dos Bobos', 'Rua', '', 'São Paulo', 'S', '67890123', '0', 'Centro'),
(7, 'Avenida Brasil', 'Avenida', 'Apt 707', 'São Paulo', 'S', '78901234', '1000', 'Jardim América'),
(8, 'Rua 25 de Março', 'Rua', '', 'São Paulo', 'S', '89012345', '900', 'Centro'),
(9, 'Rua Vergueiro', 'Rua', 'Casa 2', 'São Paulo', 'S', '90123456', '1100', 'Vila Mariana'),
(10, 'Avenida Ipiranga', 'Avenida', '', 'São Paulo', 'S', '01234567', '1500', 'Centro');

INSERT INTO CLI_ENDERECO (COD_END, COD_CLI) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO DEPENDENTE (COD_CLI, COD_DEP, PARENTESCO) VALUES
(1, 1, 'Filho'),
(1, 2, 'Esposa'),
(2, 3, 'Marido'),
(2, 4, 'Filha'),
(3, 5, 'Filho'),
(3, 6, 'Esposa'),
(4, 7, 'Filha'),
(4, 8, 'Marido'),
(5, 9, 'Filho'),
(5, 10, 'Filha');

INSERT INTO CATEGORIA (COD_CAT, NOME, VALOR) VALUES
(1, 'Ficção Científica', 3.99),
(2, 'Ação', 4.99),
(3, 'Drama', 2.99),
(4, 'Comédia', 2.49),
(5, 'Suspense', 3.49),
(6, 'Aventura', 4.49),
(7, 'Biografia', 3.79),
(8, 'Histórico', 4.19),
(9, 'Animação', 2.99),
(10, 'Infantil', 2.59),
(11, 'Fantasia', 3.89),
(12, 'Romance', 2.79),
(13, 'Terror', 4.29);

INSERT INTO GENERO (COD_GEN, NOME) VALUES
(1, 'Ação'),
(2, 'Aventura'),
(3, 'Ficção Científica'),
(4, 'Drama'),
(5, 'Comédia'),
(6, 'Suspense'),
(7, 'Romance'),
(8, 'Histórico'),
(9, 'Animação'),
(10, 'Infantil');

INSERT INTO FILMES (COD_FILME, TITULO_ORIGINAL, TITULO, QUANTIDADE, COD_CAT, COD_GEN) VALUES
(1, 'Inception', 'A Origem', 5, 1, 1),
(2, 'The Matrix', 'Matrix', 3, 2, 2),
(3, 'Interstellar', 'Interestelar', 4, 1, 3),
(4, 'The Godfather', 'O Poderoso Chefão', 2, 3, 4),
(5, 'Pulp Fiction', 'Pulp Fiction', 3, 4, 5),
(6, 'The Dark Knight', 'O Cavaleiro das Trevas', 6, 5, 1),
(7, 'Fight Club', 'Clube da Luta', 4, 4, 6),
(8, 'Forrest Gump', 'Forrest Gump', 5, 6, 7),
(9, 'The Shawshank Redemption', 'Um Sonho de Liberdade', 3, 7, 8),
(10, 'Gladiator', 'Gladiador', 4, 8, 2),
(11, 'The Lion King', 'O Rei Leão', 5, 9, 9),
(12, 'Toy Story', 'Toy Story', 6, 10, 10),
(13, 'Avatar', 'Avatar', 4, 11, 3),
(14, 'Titanic', 'Titanic', 2, 12, 4),
(15, 'Jurassic Park', 'Jurassic Park', 5, 13, 5);

INSERT INTO ATOR (COD_ATOR, NOME) VALUES
(1, 'Leonardo DiCaprio'),
(2, 'Keanu Reeves'),
(3, 'Matthew McConaughey'),
(4, 'Marlon Brando'),
(5, 'John Travolta'),
(6, 'Christian Bale'),
(7, 'Brad Pitt'),
(8, 'Tom Hanks'),
(9, 'Morgan Freeman'),
(10, 'Russell Crowe'),
(11, 'James Earl Jones'),
(12, 'Tom Hanks'),
(13, 'Sam Worthington'),
(14, 'Kate Winslet'),
(15, 'Sam Neill');

INSERT INTO FILME_ATOR (COD_ATOR, COD_FILME, DIRETOR) VALUES
(1, 1, 'N'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 4, 'N'),
(5, 5, 'N'),
(6, 6, 'N'),
(7, 7, 'N'),
(8, 8, 'N'),
(9, 9, 'N'),
(10, 10, 'N'),
(11, 11, 'N'),
(12, 12, 'N'),
(13, 13, 'N'),
(14, 14, 'N'),
(15, 15, 'N');


