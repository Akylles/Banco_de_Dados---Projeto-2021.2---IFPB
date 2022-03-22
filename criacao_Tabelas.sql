CREATE TABLE Servidor(
	matricula VARCHAR(20) PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email_institucional VARCHAR(100) NOT NULL
);

CREATE TABLE Ouvidor(
	id SERIAL PRIMARY KEY,
	ABO VARCHAR(50) UNIQUE,
	matricula_servidor VARCHAR(20),
	FOREIGN KEY (matricula_servidor) REFERENCES Servidor(matricula)
);

CREATE TABLE Escrivao(
	id SERIAL PRIMARY KEY,
	inicio_contrato Date NOT NULL,
	fim_contrato Date NOT NULL,
	matricula_servidor VARCHAR(20),
	FOREIGN KEY (matricula_servidor) REFERENCES Servidor(matricula)
);

CREATE TABLE Solicitante(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(100)
);

CREATE TABLE Telefone_Solicitante(
	id SERIAL PRIMARY KEY,
	telefone VARCHAR(20) NOT NULL,
	id_solicitante INT,
	FOREIGN KEY (id_solicitante) REFERENCES Solicitante(id)
);

CREATE TABLE Endereco_Solicitante(
	id SERIAL PRIMARY KEY,
	cidade VARCHAR(100) NOT NULL,
	estado VARCHAR(50) NOT NULL,
	rua VARCHAR(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	pais VARCHAR(50) NOT NULL,
	numero_casa INT CHECK (numero_casa > 0),
	id_solicitante INT,
	FOREIGN KEY (id_solicitante) REFERENCES Solicitante(id)
);

CREATE TABLE PessoaFisica(
	id SERIAL PRIMARY KEY,
	CPF VARCHAR(20) UNIQUE,
	naturalidade VARCHAR(50),
	id_solicitante INT,
	FOREIGN KEY (id_solicitante) REFERENCES Solicitante(id)	
);

CREATE TABLE PessoaJuridica(
	id SERIAL PRIMARY KEY,
	CNPJ VARCHAR(20) UNIQUE NOT NULL,
	nome_fantasia VARCHAR(255),
	razao_social VARCHAR(255),
	id_solicitante INT,
	FOREIGN KEY (id_solicitante) REFERENCES Solicitante(id)		
);

CREATE TABLE Reclamacao(
	id SERIAL PRIMARY KEY,
	data Date NOT NULL,
	assunto TEXT NOT NULL,
	id_escrivao INT,
	id_solicitante INT,
	FOREIGN KEY (id_solicitante) REFERENCES Solicitante(id),			
	FOREIGN KEY (id_escrivao) REFERENCES Escrivao(id)
);

CREATE TABLE Autorizacao_Reclamacao(
	id SERIAL PRIMARY KEY,
	sim_ou_nao BOOLEAN NOT NULL,
	id_reclamacao INT,
	id_ouvidor INT,
	FOREIGN KEY (id_reclamacao) REFERENCES Reclamacao(id),			
	FOREIGN KEY (id_ouvidor) REFERENCES Ouvidor(id)
);

CREATE TABLE Secretaria(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	setor VARCHAR(100)
);

CREATE TABLE Encaminhamento_Reclamacao(
	id SERIAL PRIMARY KEY,
	id_secretaria INT,
	id_reclamacao INT,
	id_ouvidor INT,
	
	FOREIGN KEY (id_secretaria) REFERENCES Secretaria(id),
	FOREIGN KEY (id_reclamacao) REFERENCES Reclamacao(id),			
	FOREIGN KEY (id_ouvidor) REFERENCES Ouvidor(id)
);

CREATE TABLE Resposta(
	id SERIAL PRIMARY KEY,
	data DATE NOT NULL,
	conteudo TEXT NOT NULL,
	id_secretaria INT,
	id_reclamacao INT,

	FOREIGN KEY (id_secretaria) REFERENCES Secretaria(id),
	FOREIGN KEY (id_reclamacao) REFERENCES Reclamacao(id)			
	
);
