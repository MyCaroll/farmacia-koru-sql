-- Criação do Banco de Dados Farmácia Koru
CREATE DATABASE IF NOT EXISTS farmacia_koru;
USE farmacia_koru;

-- Tabela PACIENTE
CREATE TABLE PACIENTE (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela PROFISSIONAL
CREATE TABLE PROFISSIONAL (
    id_profissional INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('Médico', 'Farmacêutico') NOT NULL,
    crm_crf VARCHAR(20) NOT NULL UNIQUE,
    especialidade VARCHAR(50)
);

-- Tabela MEDICAMENTO
CREATE TABLE MEDICAMENTO (
    id_medicamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    principio_ativo VARCHAR(100) NOT NULL,
    forma_farmaceutica VARCHAR(50),
    dosagem VARCHAR(50),
    controle_especial ENUM('Sim', 'Não') DEFAULT 'Não'
);

-- Tabela PRESCRICAO
CREATE TABLE PRESCRICAO (
    id_prescricao INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data_prescricao DATE NOT NULL,
    diagnostico TEXT,
    status ENUM('Ativa', 'Suspensa', 'Finalizada') DEFAULT 'Ativa',
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES PROFISSIONAL(id_profissional)
);

-- Tabela ITEM_PRESCRICAO
CREATE TABLE ITEM_PRESCRICAO (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_prescricao INT NOT NULL,
    id_medicamento INT NOT NULL,
    posologia VARCHAR(200) NOT NULL,
    duracao_tratamento INT, -- dias
    FOREIGN KEY (id_prescricao) REFERENCES PRESCRICAO(id_prescricao),
    FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
);

-- Tabela LOTE
CREATE TABLE LOTE (
    id_lote INT PRIMARY KEY AUTO_INCREMENT,
    id_medicamento INT NOT NULL,
    numero_lote VARCHAR(50) NOT NULL,
    data_validade DATE NOT NULL,
    quantidade INT NOT NULL,
    data_recebimento DATE,
    FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
);

-- Tabela DISPENSACAO
CREATE TABLE DISPENSACAO (
    id_dispensacao INT PRIMARY KEY AUTO_INCREMENT,
    id_item INT NOT NULL UNIQUE,
    id_lote INT NOT NULL,
    id_farmaceutico INT NOT NULL,
    data_dispensacao DATETIME NOT NULL,
    quantidade_dispensada INT NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (id_item) REFERENCES ITEM_PRESCRICAO(id_item),
    FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote),
    FOREIGN KEY (id_farmaceutico) REFERENCES PROFISSIONAL(id_profissional)
);

-- Tabela ALERGIA
CREATE TABLE ALERGIA (
    id_alergia INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medicamento INT NOT NULL,
    descricao VARCHAR(200),
    data_registro DATE NOT NULL,
    gravidade ENUM('Leve', 'Moderada', 'Grave'),
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id_paciente),
    FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
);

-- Tabela INTERACAO
CREATE TABLE INTERACAO (
    id_interacao INT PRIMARY KEY AUTO_INCREMENT,
    id_medicamento1 INT NOT NULL,
    id_medicamento2 INT NOT NULL,
    nivel_risco ENUM('Baixo', 'Moderado', 'Alto', 'Contraindicado'),
    descricao TEXT,
    recomendacoes TEXT,
    FOREIGN KEY (id_medicamento1) REFERENCES MEDICAMENTO(id_medicamento),
    FOREIGN KEY (id_medicamento2) REFERENCES MEDICAMENTO(id_medicamento)
);