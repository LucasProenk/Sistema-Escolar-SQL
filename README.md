# Sistema de Gestão de Cursos de Informática

Este repositório contém a modelagem e implementação do banco de dados para o controle interno de uma escola municipal de informática. O projeto foi desenvolvido como parte da disciplina de **Banco de Dados**, sob orientação da **Profa. Ana Leda**.

---

##  Visão Geral do Projeto

O sistema foi concebido para gerir o cadastro de alunos, cursos, instrutores e o desempenho académico (notas). A estrutura garante a **integridade referencial** e a eficiência na alocação de instrutores e turmas.

### Principais Funcionalidades:
* Controlo de admissão e salários de instrutores.
* Gestão de pré-requisitos e carga horária de cursos.
* Rastreamento de matrículas e histórico de notas dos alunos.
* Automação de restrições (Constraints) para garantir dados consistentes.

---

##  Tecnologias e Conceitos Aplicados

* **Linguagem:** SQL (Oracle / PL-SQL)
* **Tipos de Dados:** `VARCHAR2`, `NUMBER`, `DATE`, `CHAR`.
* **Destaque Técnico:** Implementação de **Chaves Compostas** na tabela de Histórico e gestão de **Constraints** via `ALTER TABLE`.

---

##  Modelo Relacional (Lógico)

O banco de dados segue a estrutura definida abaixo:

| Tabela | Chave Primária (PK) | Chaves Estrangeiras (FK) |
| :--- | :--- | :--- |
| **INSTRUTOR** | `IDInst` | - |
| **CURSO** | `IDCurso` | - |
| **ALUNO** | `Matric` | - |
| **TURMA** | `IDTurma` | `IDInst`, `IDCurso` |
| **HISTORICO** | `IDTurma`, `Matric` | `IDTurma`, `Matric` |



---

## Ordem de Execução

Devido às dependências de chaves estrangeiras, os scripts devem ser executados na seguinte ordem lógica:

1.  **Tabelas Independentes:** `INSTRUTOR`, `CURSO`, `ALUNO`.
2.  **Tabela de Associação:** `TURMA` (Depende de Instrutor e Curso).
3.  **Tabela de Relacionamento N:N:** `HISTORICO` (Depende de Turma e Aluno).
