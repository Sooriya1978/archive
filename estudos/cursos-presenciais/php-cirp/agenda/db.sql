create USER agenda WITH PASSWORD 'agenda';

CREATE DATABASE agenda WITH OWNER=agenda template=template0 encoding='UTF8';

\c agenda;

CREATE TABLE usuarios(
  usuario VARCHAR(10) PRIMARY KEY NOT NULL,
  senha VARCHAR(10) NOT NULL 
);

CREATE TABLE agenda(
  codigo SERIAL PRIMARY KEY NOT NULL,
  nome VARCHAR(50) NOT NULL,
  fone VARCHAR(30) NOT NULL 
);

INSERT INTO usuarios(usuario,senha) VALUES ('admin','admin123');

