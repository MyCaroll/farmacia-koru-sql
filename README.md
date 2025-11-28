Sistema de Gestão - Farmácia Clínica Koru

Descrição do Projeto
Sistema de gestão para farmácia clínica especializada no acompanhamento farmacoterapêutico de pacientes com condições crônicas e tratamentos específicos.

Estrutura do Banco de Dados
9 Tabelas** normalizadas (1FN, 2FN, 3FN)
Relacionamentos** bem definidos com integridade referencial
Dados realistas** para testes e demonstração

Scripts Disponíveis

Criação das Tabelas
`01_criacao_tabelas.sql` - Estrutura completa do banco

Inserção de Dados  
`02_insercao_dados.sql` - Dados de exemplo para todas as tabelas

Consultas
`03_consultas.sql` - 5 consultas complexas com JOIN, WHERE, ORDER BY

Atualizações e Exclusões
`04_atualizacao_exclusao.sql` - Comandos UPDATE e DELETE

Script Completo
`05_completo.sql` - Todos os comandos em um único arquivo

Como Executar

Execute no MySQL Workbench ou VSCode:**
```sql
-- Executar na ordem:
SOURCE 01_criacao_tabelas.sql;
SOURCE 02_insercao_dados.sql;
SOURCE 03_consultas.sql;
SOURCE 04_atualizacao_exclusao.sql;