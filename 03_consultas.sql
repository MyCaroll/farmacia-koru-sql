USE farmacia_koru;

-- CONSULTA 1: Pacientes com prescrições ativas e seus medicamentos
SELECT 
    p.nome AS paciente,
    pr.nome AS profissional,
    m.nome AS medicamento,
    ip.posologia,
    pres.data_prescricao
FROM PACIENTE p
JOIN PRESCRICAO pres ON p.id_paciente = pres.id_paciente
JOIN PROFISSIONAL pr ON pres.id_medico = pr.id_profissional
JOIN ITEM_PRESCRICAO ip ON pres.id_prescricao = ip.id_prescricao
JOIN MEDICAMENTO m ON ip.id_medicamento = m.id_medicamento
WHERE pres.status = 'Ativa'
ORDER BY p.nome, pres.data_prescricao;

-- CONSULTA 2: Estoque de medicamentos controlados com validade próxima
SELECT 
    m.nome AS medicamento,
    m.controle_especial,
    l.numero_lote,
    l.data_validade,
    l.quantidade,
    DATEDIFF(l.data_validade, CURDATE()) AS dias_para_vencer
FROM MEDICAMENTO m
JOIN LOTE l ON m.id_medicamento = l.id_medicamento
WHERE m.controle_especial = 'Sim'
    AND l.data_validade BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY l.data_validade;

-- CONSULTA 3: Interações medicamentosas de alto risco
SELECT 
    m1.nome AS medicamento1,
    m2.nome AS medicamento2,
    i.nivel_risco,
    i.descricao,
    i.recomendacoes
FROM INTERACAO i
JOIN MEDICAMENTO m1 ON i.id_medicamento1 = m1.id_medicamento
JOIN MEDICAMENTO m2 ON i.id_medicamento2 = m2.id_medicamento
WHERE i.nivel_risco IN ('Alto', 'Contraindicado')
ORDER BY i.nivel_risco DESC;

-- CONSULTA 4: Histórico de dispensações por farmacêutico
SELECT 
    pf.nome AS farmaceutico,
    m.nome AS medicamento,
    COUNT(d.id_dispensacao) AS total_dispensacoes,
    SUM(d.quantidade_dispensada) AS total_unidades
FROM DISPENSACAO d
JOIN PROFISSIONAL pf ON d.id_farmaceutico = pf.id_profissional
JOIN ITEM_PRESCRICAO ip ON d.id_item = ip.id_item
JOIN MEDICAMENTO m ON ip.id_medicamento = m.id_medicamento
WHERE pf.tipo = 'Farmacêutico'
GROUP BY pf.nome, m.nome
ORDER BY total_dispensacoes DESC;

-- CONSULTA 5: Pacientes com alergias graves a medicamentos
SELECT 
    p.nome AS paciente,
    m.nome AS medicamento_alergico,
    a.descricao AS reacao,
    a.gravidade,
    a.data_registro
FROM PACIENTE p
JOIN ALERGIA a ON p.id_paciente = a.id_paciente
JOIN MEDICAMENTO m ON a.id_medicamento = m.id_medicamento
WHERE a.gravidade = 'Grave'
ORDER BY a.data_registro DESC;