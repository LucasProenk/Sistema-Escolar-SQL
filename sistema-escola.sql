--------------Instrutor
CREATE TABLE INSTRUTOR
(
	IDInst VARCHAR2(10) PRIMARY KEY,
	Nome VARCHAR2(60) NOT NULL,
	Telefone VARCHAR2(15),
	DtAdm DATE,
	Salario DECIMAL(10,2)
);
--------------Curso
CREATE TABLE CURSO 
( 
IDCurso VARCHAR2(10) PRIMARY KEY,
Nome VARCHAR2(50) NOT NULL,
Carga_Horaria INT,
PreCo DECIMAL(10,2),
Pre_requisito VARCHAR2(50)
);
---------------Turma
CREATE TABLE TURMA
(
	IDTurma VARCHAR2(10) PRIMARY KEY,
	Sala VARCHAR2(20),
	IDInst VARCHAR2(10),
	IDCurso VARCHAR2 (10),
	CONSTRAINT FK_INST FOREIGN KEY (IDInst) REFERENCES INSTRUTOR(IDInst),
	CONSTRAINT FK_KEY FOREIGN KEY (IDCurso) REFERENCES CURSO(IDCurso)
);
----------------Aluno
CREATE TABLE ALUNO 
(
	Matric VARCHAR2(10) PRIMARY KEY,
	Nome VARCHAR2(60) NOT NULL,
	Telefone VARCHAR2(15),
	Endereco VARCHAR2(100),
	UF CHAR(2)
);
-----------------HISTORICO
CREATE TABLE HISTORICO
(
	IDTurma VARCHAR2(10),
	Matric VARCHAR2(10),
	Nota DECIMAL(4,2),
	CONSTRAINT PK_HIST PRIMARY KEY (IDTurma, Matric),
	CONSTRAINT FK_TURMA_H FOREIGN KEY (IDTurma) REFERENCES TURMA(IDTurma),
	CONSTRAINT FK_ALUNO_H FOREIGN KEY (Matric) REFERENCES ALUNO(Matric)
);





----------------Exercício para fazer com a minha tabela


----------------Exercício 6 Apague a tabela ALUNO, apagando também, todas as suas restrições. Em seguida,
crie-a novamente apenas com os campos, sem definir restrições.
DROP TABLE ALUNO CASCADE CONSTRAINTS;
--
CREATE TABLE ALUNO (
    Matric VARCHAR2(10),
    Nome VARCHAR2(60),
    Telefone VARCHAR2(15),
    Endereco VARCHAR2(100),
    UF CHAR(2)
);
----------------Exercício 7 Insira todas as restrições necessárias na tabela ALUNO.
ALTER TABLE ALUNO ADD CONSTRAINT PK_ALUNO PRIMARY KEY (Matric);
ALTER TABLE ALUNO MODIFY Nome NOT NULL;

----------------Exercício 9 Altere a tabela INSTRUTOR modificando a coluna NOME para 60 caracteres.
ALTER TABLE INSTRUTOR MODIFY Nome VARCHAR2(60);




----------------INSERTS PARA ADD NO CODICO

--INSTRUTOR
INSERT INTO INSTRUTOR (IDInst, Nome, Telefone, DtAdm, Salario) 
VALUES ('INST01', 'Ricardo Oliveira', '11988881111', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 6500.00);

INSERT INTO INSTRUTOR (IDInst, Nome, Telefone, DtAdm, Salario) 
VALUES ('INST02', 'Beatriz Souza', '11977772222', TO_DATE('2025-01-20', 'YYYY-MM-DD'), 5800.00);

INSERT INTO INSTRUTOR (IDInst, Nome, Telefone, DtAdm, Salario) 
VALUES ('INST03', 'Marcos Cavalcanti', '11966663333', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 7200.00);

--CURSO
INSERT INTO CURSO (IDCurso, Nome, Carga_Horaria, Preco, Pre_requisito) 
VALUES ('SQL_BAS', 'Fundamentos de SQL', 40, 350.00, 'Lógica de Programação');

INSERT INTO CURSO (IDCurso, Nome, Carga_Horaria, Preco, Pre_requisito) 
VALUES ('ALGO_01', 'Estrutura de Dados', 60, 420.00, 'C# ou Java');

--ALUNOS
INSERT INTO ALUNO (Matric, Nome, Telefone, Endereco, UF) 
VALUES ('MAT001', 'Lucas Silva', '11955554444', 'Rua das Palmeiras, 150', 'SP');

INSERT INTO ALUNO (Matric, Nome, Telefone, Endereco, UF) 
VALUES ('MAT003', 'Felipe Santos', '31933336666', 'Rua Bahia, 45', 'MG');

--TURMAS
-- Turma de SQL com o Prof. Ricardo
INSERT INTO TURMA (IDTurma, Sala, IDInst, IDCurso) 
VALUES ('T_SQL_2026', 'Lab 03', 'INST01', 'SQL_BAS');

-- Turma de Ciência da Computação com a Profa. Beatriz
INSERT INTO TURMA (IDTurma, Sala, IDInst, IDCurso) 
VALUES ('T_CS_2026', 'Auditório A', 'INST02', 'CS_INT');

--HISTORICO
-- Lucas (MAT001) fez SQL e tirou 8.5
INSERT INTO HISTORICO (IDTurma, Matric, Nota) 
VALUES ('T_SQL_2026', 'MAT001', 8.5);

-- Juliana (MAT002) fez Ciência da Comp e tirou 9.0
INSERT INTO HISTORICO (IDTurma, Matric, Nota) 
VALUES ('T_CS_2026', 'MAT002', 9.0);

