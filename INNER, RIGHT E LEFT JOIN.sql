create database dbteste;
use dbteste;
create table tabelab(nome varchar(50));
create table tabelac(nome varchar(50));

INSERT INTO tabelab VALUES("Fernanda");
INSERT INTO tabelab VALUES("Josefa");
INSERT INTO tabelab VALUES("Luiz");
INSERT INTO tabelab VALUES("Fernando");

INSERT INTO tabelac VALUES("Carlos");
INSERT INTO tabelac VALUES("Manoel");
INSERT INTO tabelac VALUES("Luiz");
INSERT INTO tabelac VALUES("Fernando");

SELECT b.nome, c.nome FROM tabelab as b INNER JOIN tabelac as c on b.nome = c.nome;
/* Seleciona termos em igualdade dentro das duas tabelas */
SELECT b.nome, c.nome FROM tabelab as b LEFT JOIN tabelac as c on b.nome = c.nome;
/* Seleciona termos da esquerda + os termos coincidentes  */
SELECT b.nome, c.nome FROM tabelab as b RIGHT JOIN tabelac as c on b.nome = c.nome;
/* Seleciona termos da direito + os termos coincidentes  */