USE farmacia_koru;

-- ATUALIZAÇÕES (UPDATE)

-- 1. Atualizar telefone de um paciente
UPDATE PACIENTE 
SET telefone = '(11) 94444-8888' 
WHERE id_paciente = 1;

-- 2. Atualizar status de uma prescrição para finalizada
UPDATE PRESCRICAO 
SET status = 'Finalizada' 
WHERE id_prescricao = 1 
AND id_paciente = 1;

-- 3. Atualizar quantidade em estoque após dispensação
UPDATE LOTE 
SET quantidade = quantidade - 30 
WHERE id_lote = 1;

-- 4. Atualizar gravidade de uma alergia após reavaliação
UPDATE ALERGIA 
SET gravidade = 'Moderada', 
    descricao = 'Edema facial e urticária - reavaliado' 
WHERE id_alergia = 1;

-- 5. Atualizar especialidade de um profissional
UPDATE PROFISSIONAL 
SET especialidade = 'Cardiologia e Hipertensão' 
WHERE id_profissional = 1;

-- 6. Atualizar observações em uma dispensação
UPDATE DISPENSACAO 
SET observacoes = 'Paciente orientado sobre administração e possíveis efeitos colaterais' 
WHERE id_dispensacao = 2;

-- EXCLUSÕES (DELETE)

-- 1. Excluir uma dispensação específica (simulação de cancelamento)
DELETE FROM DISPENSACAO 
WHERE id_dispensacao = 5 
AND id_farmaceutico = 4;

-- 2. Excluir uma alergia registrada erroneamente
DELETE FROM ALERGIA 
WHERE id_paciente = 4 
AND id_medicamento = 2;

-- 3. Excluir uma interação medicamentosa duplicada
DELETE FROM INTERACAO 
WHERE id_interacao = 4 
AND nivel_risco = 'Baixo';

-- 4. Excluir um lote vencido (após transferência para tabela de histórico)
DELETE FROM LOTE 
WHERE data_validade < CURDATE();

-- 5. Excluir uma prescrição suspensa há mais de 1 ano
DELETE FROM PRESCRICAO 
WHERE status = 'Suspensa' 
AND data_prescricao < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 6. Excluir um item de prescrição não utilizado
DELETE FROM ITEM_PRESCRICAO 
WHERE id_prescricao = 4 
AND id_medicamento = 1;