BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'CONTATO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_CONTATO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'ENDERECO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_ENDERECO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'CERTIFICADO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_CERTIFICADO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'INSIGNIA';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_INSIGNIA';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'LISTA_OPCOES';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'PROVA_QUESTAO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'QUESTAO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;



BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_QUESTAO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_PROVA_QUESTAO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'LISTA_RESPOSTAS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;


BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'PROVA';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_PROVA';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'USUARIO_INSIGNIA';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'USUARIO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_USUARIO';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ' || 'RANKING';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || 'SEQ_RANKING';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;




CREATE TABLE RANKING (
    ID_RANKING NUMBER(38,0),
    TITULO VARCHAR2(50) UNIQUE NOT NULL,
    IMAGEM_URL VARCHAR2(500) UNIQUE NOT NULL,
    DESCRICAO VARCHAR2(500) UNIQUE NOT NULL,
    PONTUACAO_NECESSARIA NUMBER(38,0) NOT NULL UNIQUE,
    STATUS NUMBER(1,0) NOT NULL CHECK (status IN (0,1)),
    PRIMARY KEY (ID_RANKING)
);

CREATE SEQUENCE SEQ_RANKING
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE USUARIO (
    id_usuario NUMBER(38,0) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    senha VARCHAR2(100) NOT NULL,
    nome VARCHAR2(50),
    tipo_usuario NUMBER(1,0) NOT NULL CHECK (tipo_usuario IN (0,1,2)),
    cpf VARCHAR2(11) UNIQUE,
    sobrenome VARCHAR2(50),
    data_nascimento DATE,
    pontuacao NUMBER(5,0),
    moedas NUMBER(38,0),
    ELO NUMBER (2,0),
    PONTUACAO_PROXIMO_ELO NUMBER (38,0),
    cnpj VARCHAR2(14) UNIQUE,
    tipo_empresa NUMBER (1,0) CHECK (tipo_empresa BETWEEN 0 AND 3),
    status NUMBER (1,0) NOT NULL CHECK (status IN (0,1)),
    id_ranking NUMBER(38,0),
    id_contato NUMBER(38,0),
    id_endereco NUMBER(38,0),
    CONSTRAINT  FK_RANKING_USUARIO FOREIGN KEY (ID_RANKING) REFERENCES RANKING (id_ranking),
    PRIMARY KEY ( id_usuario )
);

CREATE SEQUENCE SEQ_USUARIO
    START WITH     1
    INCREMENT BY   1
    NOCACHE
    NOCYCLE;


CREATE TABLE CONTATO (
    id_contato NUMBER(38,0) NOT NULL,
    descricao VARCHAR2(200),
    telefone VARCHAR2(14) UNIQUE,
    tipo_contato NUMBER(1) NOT NULL CHECK (tipo_contato IN (0,1,2)),
    id_usuario NUMBER(38,0),
    PRIMARY KEY ( id_contato ),
    CONSTRAINT FK_CONTATO_USUARIO FOREIGN KEY ( id_usuario ) REFERENCES USUARIO ( id_usuario )
);


CREATE SEQUENCE SEQ_CONTATO
    START WITH     1
    INCREMENT BY   1
    NOCACHE
    NOCYCLE;


CREATE TABLE ENDERECO (
    id_endereco NUMBER(38,0) NOT NULL,
    logradouro VARCHAR2(250) NOT NULL,
    numero NUMBER(10) NOT NULL,
    complemento VARCHAR2(250) NOT NULL,
    cep VARCHAR2(8) NOT NULL,
    cidade VARCHAR2(50) NOT NULL,
    estado VARCHAR2(50) NOT NULL,
    pais VARCHAR2(50) NOT NULL,
    tipo_endereco NUMBER(1,0) NOT NULL CHECK (tipo_endereco IN (0, 1)),
    id_usuario NUMBER(38,0),
    PRIMARY KEY ( id_endereco ),
    CONSTRAINT FK_ENDERECO_USUARIO FOREIGN KEY ( id_usuario ) REFERENCES USUARIO ( id_usuario )
);


CREATE SEQUENCE SEQ_ENDERECO
    START WITH     1
    INCREMENT BY   1
    NOCACHE
    NOCYCLE;


CREATE TABLE CERTIFICADO (
    id_certificado NUMBER(38,0) NOT NULL,
    trilha NUMBER(2,0) NOT NULL CHECK (trilha BETWEEN 0 AND 10),
    dificuldade NUMBER(1,0) NOT NULL CHECK (dificuldade IN (1,2,3)),
    conclusao DATE NOT NULL,
    id_usuario NUMBER(38,0) NOT NULL,
    PRIMARY KEY ( id_certificado ),
    CONSTRAINT FK_CERTIFICADO_USUARIO FOREIGN KEY ( id_usuario ) REFERENCES USUARIO ( id_usuario )
);

CREATE SEQUENCE SEQ_CERTIFICADO
    START WITH     1
    INCREMENT BY   1
    NOCACHE
    NOCYCLE;


CREATE TABLE QUESTAO (
    ID_QUESTAO NUMBER,
    PERGUNTA VARCHAR2(255) UNIQUE NOT NULL,
    OPCAO_CORRETA VARCHAR2(255) NOT NULL,
    PONTOS NUMBER NOT NULL,
    TRILHA NUMBER(3,0) NOT NULL CHECK (trilha BETWEEN 0 AND 10),
    DIFICULDADE NUMBER(1,0) CHECK (DIFICULDADE BETWEEN 0 AND 2),
    STATUS NUMBER(1,0) CHECK (STATUS IN (0, 1)),
    PRIMARY KEY (ID_QUESTAO)
);

CREATE TABLE LISTA_OPCOES (
    ID_QUESTAO INTEGER,
    OPCOES VARCHAR2(255),
    PRIMARY KEY (ID_QUESTAO, OPCOES),
    FOREIGN KEY (ID_QUESTAO) REFERENCES QUESTAO(ID_QUESTAO)
);

CREATE SEQUENCE SEQ_QUESTAO
    START WITH     1
    INCREMENT BY   1
    NOCACHE
    NOCYCLE;

CREATE TABLE PROVA (
    ID_PROVA NUMBER(38,0) PRIMARY KEY,
    ID_USUARIO NUMBER(38,0),
    HORA_INICIO TIMESTAMP,
    HORA_FINAL TIMESTAMP,
    TEMPO_LIMITE NUMBER,
    PONTOS NUMBER,
    TOTAL_ACERTOS NUMBER,
    TOTAL_QUESTOES NUMBER,
    STATUS NUMBER CHECK (STATUS IN (0,1)),
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (id_usuario)
);

CREATE SEQUENCE SEQ_PROVA
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE PROVA_QUESTAO (
    ID_PROVA NUMBER(38, 0),
    ID_QUESTAO NUMBER(38, 0),
    PRIMARY KEY (ID_PROVA, ID_QUESTAO),
    FOREIGN KEY (ID_PROVA) REFERENCES PROVA (ID_PROVA),
    FOREIGN KEY (ID_QUESTAO) REFERENCES QUESTAO (ID_QUESTAO)
);

CREATE TABLE LISTA_RESPOSTAS (
    ID_PROVA NUMBER(38,0),
    RESPOSTA VARCHAR2(255),
    FOREIGN KEY (ID_PROVA) REFERENCES PROVA (ID_PROVA)
);

CREATE SEQUENCE SEQ_PROVA_QUESTAO
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE INSIGNIA (
    ID_INSIGNIA NUMBER(38,0),
    imagem_url VARCHAR2(500) NOT NULL UNIQUE,
    titulo VARCHAR2(255) NOT NULL UNIQUE,
    descricao VARCHAR2(255) NOT NULL UNIQUE,
    TAG VARCHAR2(255) NOT NULL UNIQUE,
    STATUS NUMBER(1,0) NOT NULL CHECK (status IN (0,1)),
    PRIMARY KEY (ID_INSIGNIA)
);

CREATE SEQUENCE SEQ_INSIGNIA
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE USUARIO_INSIGNIA (
    ID_USUARIO NUMBER(38,0),
    ID_INSIGNIA NUMBER(38,0),
    PRIMARY KEY (ID_USUARIO, ID_INSIGNIA),
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
    FOREIGN KEY (ID_INSIGNIA) REFERENCES INSIGNIA (ID_INSIGNIA)
);

