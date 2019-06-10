create database DbFacul;
use DbFacul;
create table instrutores(id int(11) primary key auto_increment not null, nome varchar(50), email varchar(50), valor_hora int(10), certificados varchar(255));
create table cursos(id int(10) primary key auto_increment not null, nome varchar(50), requisito varchar(255), carga_horaria smallint(5), preco double);
create table turmas(id int(10) primary key auto_increment not null, data_inicio date, data_final date, carga_horaria smallint(5));
create table matriculas(id int(10) primary key auto_increment not null, data_matricula date);
create table alunos(id int(11) primary key auto_increment not null, cpf char(11), nome varchar(50), email varchar(50), fone char(14), data_nascimento date);
alter table turmas add column instrutores_id int(11); 
alter table turmas add constraint turmas_FKIndex1 foreign key (instrutores_id) references instrutores(id);
alter table turmas add column cursos_id int(10);
alter table turmas add constraint turmas_FKIndex2 foreign key (cursos_id) references cursos(id);
alter table matriculas add column turmas_id int(10); 
alter table matriculas add constraint matriculas_FKIndex1 foreign key (turmas_id) references turmas(id);
alter table matriculas add column alunos_id int(11);
alter table matriculas add constraint matriculas_FKIndex2 foreign key (alunos_id) references alunos(id);
INSERT INTO instrutores(nome,email,valor_hora,certificados) VALUES("RONALDO", "ronaldo_cnb@gmail.com", 2, "CORINTHIANS E CNB");
INSERT INTO instrutores(nome,email,valor_hora,certificados) VALUES("GIOVANNI", "gratieri_gi@gmail.com", 3, "SISTEMAS DE INFORMAÇÃO FSA");
INSERT INTO cursos(nome,requisito,carga_horaria,preco) VALUES("SISTEMAS", "ENSINO MÉDIO COMPLETO", 20, 3000);
INSERT INTO cursos(nome,requisito,carga_horaria,preco) VALUES("MATEMÁTICA", "ENSINO MÉDIO COMPLETO", 20, 1000);
INSERT INTO turmas(instrutores_id,cursos_id,data_inicio,data_final, carga_horaria) VALUES(2, 1, 10/02/2020, 31/12/2024 , 30);
INSERT INTO turmas(instrutores_id,cursos_id,data_inicio,data_final, carga_horaria) VALUES(1, 2, 10/02/2020, 31/12/2023 , 50);
INSERT INTO alunos(cpf,nome,email,fone,data_nascimento) VALUES(98887342958, "GIOVANNI", "gi_gratieri@gmail.com", 40028922 , 15/08/1998 );
INSERT INTO alunos(cpf,nome,email,fone,data_nascimento) VALUES(98837362958, "INGRID", "INGRID_SAMANTHA@gmail.com", 45026922 , 17/10/1995 );
INSERT INTO matriculas(turmas_id,alunos_id,data_matricula) VALUES(1, 1, 03/11/2019);
INSERT INTO matriculas(turmas_id,alunos_id,data_matricula) VALUES(2, 2, 04/11/2019);

SELECT b.nome, c.nome FROM instrutores as b INNER JOIN alunos as c on b.nome = c.nome;
SELECT b.nome, c.nome FROM instrutores as b LEFT JOIN alunos as c on b.nome = c.nome;
SELECT b.nome, c.nome FROM instrutores as b RIGHT JOIN alunos as c on b.nome = c.nome;

select * from matriculas;

/* PROCEDURE ALUNOS */
DELIMITER $$
CREATE PROCEDURE selecionar_alunos (IN quantidade int)
BEGIN
SELECT * FROM alunos LIMIT quantidade;
END $$
DELIMITER ; 

CALL selecionar_alunos(2); 

DELIMITER $$
CREATE PROCEDURE Verificar_Quantidade_Alunos(OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade FROM alunos;
END $$
DELIMITER ; 

CALL Verificar_Quantidade_Alunos(@total);
SELECT @total;

/* PROCEDURE INTRUTORES */
DELIMITER $$
CREATE PROCEDURE incluir_instrutor (IN snome varchar(50), semail varchar(50), svalor_hora int(10), scertificados varchar(255))
BEGIN
INSERT INTO instrutores(nome, email, valor_hora, certificados) VALUES (snome, semail, svalor_hora, scertificados);
END $$
DELIMITER ; 

CALL incluir_instrutor("THIAGO CHAMAM", "THICHAMAM@gmail.com", 13, "Harvard e Toronto"); 


/* PROCEDURE MATRICULAS */
DELIMITER $$
CREATE PROCEDURE alterar_matricula (IN sid int, sdata_matricula date)
BEGIN
update matriculas
set 
data_matricula = sdata_matricula where id= sid;
END $$
DELIMITER ; 

CALL alterar_matricula(1, 20191006); 


/* PROCEDURE TURMAS */
DELIMITER $$
CREATE PROCEDURE selecionar_turmas (IN quantidade int)
BEGIN
SELECT * FROM turmas LIMIT quantidade;
END $$
DELIMITER ; 

CALL selecionar_turmas(2); 

DELIMITER $$
CREATE PROCEDURE Verificar_Quantidade_turmas(OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade FROM turmas;
END $$
DELIMITER ; 

CALL Verificar_Quantidade_turmas(@total);
SELECT @total;

/* PROCEDURE CURSOS */
DELIMITER $$
CREATE PROCEDURE incluir_cursos (IN snome varchar(50), srequisito varchar(255), scarga_horaria smallint(5), spreco double)
BEGIN
INSERT INTO cursos(nome, requisito , carga_horaria ,preco) VALUES (snome, srequisito, scarga_horaria, spreco);
END $$
DELIMITER ; 

CALL incluir_cursos("HISTÓRIA", "ENSINO MÉDIO", 20, 400); 
