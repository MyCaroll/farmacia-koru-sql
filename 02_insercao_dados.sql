USE farmacia_koru;

-- Inserindo Pacientes
INSERT INTO PACIENTE (nome, data_nascimento, cpf, telefone) VALUES
('Maria Silva Oliveira', '1985-03-15', '123.456.789-00', '(11) 99999-1111'),
('João Santos Pereira', '1978-07-22', '234.567.890-11', '(11) 98888-2222'),
('Ana Costa Rodrigues', '1992-11-30', '345.678.901-22', '(11) 97777-3333'),
('Pedro Almeida Souza', '1965-05-18', '456.789.012-33', '(11) 96666-4444'),
('Carla Mendes Lima', '1988-09-25', '567.890.123-44', '(11) 95555-5555');

-- Inserindo Profissionais
INSERT INTO PROFISSIONAL (nome, tipo, crm_crf, especialidade) VALUES
('Dr. Roberto Andrade', 'Médico', 'CRM-SP 123456', 'Cardiologia'),
('Dra. Fernanda Torres', 'Médico', 'CRM-SP 234567', 'Oncologia'),
('Farmac. Juliana Santos', 'Farmacêutico', 'CRF-SP 98765', 'Farmácia Clínica'),
('Farmac. Carlos Mendes', 'Farmacêutico', 'CRF-SP 87654', 'Oncologia'),
('Dr. Marcelo Rocha', 'Médico', 'CRM-SP 345678', 'Clínica Geral');

-- Inserindo Medicamentos
INSERT INTO MEDICAMENTO (nome, principio_ativo, forma_farmaceutica, dosagem, controle_especial) VALUES
('Losartana Potássica', 'Losartana', 'Comprimido', '50mg', 'Não'),
('Sinvastatina', 'Sinvastatina', 'Comprimido', '20mg', 'Não'),
('Warfarina Sódica', 'Varfarina', 'Comprimido', '5mg', 'Sim'),
('Morfina', 'Morfina', 'Solução Oral', '10mg/mL', 'Sim'),
('Insulina NPH', 'Insulina Humana', 'Solução Injetável', '100UI/mL', 'Sim'),
('Omeprazol', 'Omeprazol', 'Cápsula', '20mg', 'Não'),
('Metformina', 'Metformina', 'Comprimido', '850mg', 'Não');

-- Inserindo Lotes
INSERT INTO LOTE (id_medicamento, numero_lote, data_validade, quantidade, data_recebimento) VALUES
(1, 'LOT2024001', '2025-06-30', 500, '2024-01-15'),
(1, 'LOT2024002', '2025-08-15', 300, '2024-02-20'),
(2, 'LOT2024003', '2025-12-31', 800, '2024-01-10'),
(3, 'LOT2024004', '2024-11-30', 150, '2024-03-01'),
(4, 'LOT2024005', '2024-09-15', 50, '2024-02-28'),
(5, 'LOT2024006', '2024-10-20', 200, '2024-03-05');

-- Inserindo Prescrições
INSERT INTO PRESCRICAO (id_paciente, id_medico, data_prescricao, diagnostico, status) VALUES
(1, 1, '2024-03-20', 'Hipertensão arterial estágio 1', 'Ativa'),
(2, 2, '2024-03-18', 'Trombose venosa profunda', 'Ativa'),
(3, 5, '2024-03-15', 'Diabetes Mellitus tipo 2', 'Ativa'),
(1, 1, '2024-02-10', 'Controle pressórico', 'Finalizada'),
(4, 3, '2024-03-22', 'Dor crônica oncológica', 'Ativa');

-- Inserindo Itens de Prescrição
INSERT INTO ITEM_PRESCRICAO (id_prescricao, id_medicamento, posologia, duracao_tratamento) VALUES
(1, 1, '1 comprimido ao dia', 30),
(1, 6, '1 cápsula pela manhã', 30),
(2, 3, '1 comprimido ao dia - realizar INR semanal', 90),
(3, 5, '25 UI pela manhã e 15 UI à noite', 60),
(3, 7, '1 comprimido 2x ao dia', 60),
(4, 1, '1 comprimido ao dia', 30),
(5, 4, '2mL de 6/6 horas', 15);

-- Inserindo Dispensações
INSERT INTO DISPENSACAO (id_item, id_lote, id_farmaceutico, data_dispensacao, quantidade_dispensada, observacoes) VALUES
(1, 1, 3, '2024-03-20 14:30:00', 30, 'Paciente orientado sobre horário de administração'),
(2, 3, 3, '2024-03-20 14:35:00', 30, 'Tomar em jejum'),
(3, 4, 4, '2024-03-18 10:15:00', 30, 'Alertar sobre interações alimentares'),
(4, 6, 4, '2024-03-15 16:20:00', 1, 'Orientações sobre técnica de aplicação'),
(5, 3, 3, '2024-03-15 16:25:00', 60, 'Tomar durante as refeições');

-- Inserindo Alergias
INSERT INTO ALERGIA (id_paciente, id_medicamento, descricao, data_registro, gravidade) VALUES
(2, 6, 'Edema de lábios e urticária', '2023-11-10', 'Moderada'),
(4, 2, 'Rash cutâneo generalizado', '2024-01-15', 'Leve'),
(1, 4, 'Dificuldade respiratória', '2023-12-05', 'Grave');

-- Inserindo Interações
INSERT INTO INTERACAO (id_medicamento1, id_medicamento2, nivel_risco, descricao, recomendacoes) VALUES
(3, 2, 'Alto', 'Aumento do risco de sangramento', 'Monitorar INR rigorosamente'),
(3, 4, 'Contraindicado', 'Risco de depressão respiratória grave', 'Evitar associação'),
(1, 7, 'Moderado', 'Potencialização de efeitos hipotensores', 'Monitorar pressão arterial'),
(5, 2, 'Baixo', 'Interação de baixo significado clínico', 'Manusear com cuidado');