CREATE TABLE VS_13_EQUIPE_9.ESCOLA (
  id_escola NUMBER(38,0) NOT NULL,
  nome VARCHAR2(250) NOT NULL,
  tipo CHAR(7) NOT NULL CHECK (tipo IN ('PUBLICA', 'PRIVADA')),
  cnpj VARCHAR2(14) NOT NULL UNIQUE,
  PRIMARY KEY (id_escola)
);

INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola Davi Canabarro', 'PRIVADA', 12345678901234);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Esola Estacio', 'PUBLICA', 11236589871236);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola Educação', 'PUBLICA', 98756987456932);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola Manoel Garcia', 'PUBLICA', 98745632589874);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola São José', 'PRIVADA', 99987986932156);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola Ensinando', 'PRIVADA', 98789878523654);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola Aprendendo mais', 'PUBLICA', 32659878596321);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola Garcia Oliveira', 'PRIVADA', 98789875987458);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola João Alves', 'PRIVADA', 99653698569875);
INSERT INTO VS_13_EQUIPE_9.ESCOLA (nome, tipo, cnpj)VALUES ('Escola do Bom Fim', 'PUBLICA', 99874589651523);


CREATE TABLE VS_13_EQUIPE_9.MATEMATICA (
  id_matematica NUMBER(38,0) NOT NULL,
  pergunta VARCHAR2(4000) UNIQUE NOT NULL,
  pontos NUMBER(1,0), NOT NULL, CHECK(pontos IN (1,3,5))
  opcao_correta CHAR(1), NOT NULL
  dificuldade VARCHAR2(20), NOT NULL, CHECK (dificuldade IN ('FACIL', 'MEDIO', 'DIFICIL'))
  PRIMARY KEY (id_matematica)
);


INSERT INTO VS_13_EQUIPE_9.MATEMATICA (1, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (2, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (3, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (4, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (5, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (6, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (7, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (8, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (9, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.MATEMATICA (10, 3, B, DIFICIL)
VALUES ('', 1, ' 'FACIL);

CREATE TABLE VS_13_EQUIPE_9.PORTUGUES (
  id_portugues NUMBER(38,0) NOT NULL,
  pergunta VARCHAR2(4000) UNIQUE NOT NULL,
  pontos NUMBER(1,0), NOT NULL, CHECK(pontos IN (1,3,5))
  opcao_correta CHAR(1), NOT NULL
  dificuldade VARCHAR2(20), NOT NULL, CHECK (dificuldade IN ('FACIL', 'MEDIO', 'DIFICIL'))
  PRIMARY KEY (id_portugues)
);

INSERT INTO VS_13_EQUIPE_9.PORTUGUES (1, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (2, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (3, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (4, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (5, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (6, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (7, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (8, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (9, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.PORTUGUES (10, 3, B, DIFICIL)
VALUES ('', 1, ' 'FACIL);

CREATE TABLE VS_13_EQUIPE_9.SOFT_SKILLS (
  id_soft_skills NUMBER(38,0) NOT NULL,
  pergunta VARCHAR2(4000) UNIQUE NOT NULL,
  pontos NUMBER(1,0), NOT NULL, CHECK(pontos IN (1,3,5))
  opcao_correta CHAR(1), NOT NULL
  dificuldade VARCHAR2(20), NOT NULL, CHECK (dificuldade IN ('FACIL', 'MEDIO', 'DIFICIL'))
  PRIMARY KEY (id_soft_skills)
);

INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (1, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (2, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (3, 1, A, FACIL)
VALUES ('', 1, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (4, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (5, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (6, 2, B, MEDIO)
VALUES ('', 2, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (7, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (8, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (9, 3, B, DIFICIL)
VALUES ('', 3, ' 'FACIL);
INSERT INTO VS_13_EQUIPE_9.SOFT_SKILLS (10, 3, B, DIFICIL)
VALUES ('', 1, ' 'FACIL);
