

-- =====================================================
-- SEED - Sistema financeiro
-- Pré-requisito: DDL já executado
-- =====================================================

BEGIN;

-- Permite rodar o seed mais de uma vez
TRUNCATE TABLE transacao, orcamento, investimento, emprestimo,
               ativo_financeiro, conta, usuario, banco CASCADE;

-- ---------- BANCO ----------
INSERT INTO banco (id, nome, cnpj, data_fundacao) VALUES
(1, 'Banco do Brasil', '00.000.000/0001-91', '1808-10-12'),
(2, 'Bradesco',        '60.746.948/0001-12', '1943-03-10'),
(3, 'Caixa Econômica Federal', '00.360.305/0001-04', '1861-01-12'),
(4, 'Nubank',          '18.236.120/0001-58', '2013-05-06'),
(5, 'Banco Inter',     '00.416.968/0001-01', '1994-10-01'),
(6, 'Banco Digital Exemplo', '11.111.111/0001-11', '2020-02-15'); -- sem contas (caso de borda)

-- ---------- USUARIO ----------
INSERT INTO usuario (id, nome, telefone, email, cpf, data_nascimento) VALUES
(1, 'Ana Souza',        '(11) 91234-5678', 'ana.souza@email.com',     '111.111.111-11', '1992-04-10'),
(2, 'Carlos Lima',      '(21) 99876-5432', 'carlos.lima@email.com',   '222.222.222-22', '1985-09-23'),
(3, 'Beatriz Fernandes','(31) 98765-4321', 'bia.fernandes@email.com', '333.333.333-33', '1998-01-30'),
(4, 'Diego Martins',    '(41) 97654-3210', 'diego.martins@email.com', '444.444.444-44', '1979-12-05'),
(5, 'Fernanda Rocha',   '(51) 96543-2109', 'fernanda.rocha@email.com','555.555.555-55', '1990-07-18'),
(6, 'Gustavo Pereira',  '(61) 95432-1098', 'gustavo.pereira@email.com','666.666.666-66','2001-03-12'),
(7, 'Helena Costa',     '(71) 94321-0987', 'helena.costa@email.com',  '777.777.777-77', '1988-11-02'),
(8, 'Igor Almeida',     '(81) 93210-9876', 'igor.almeida@email.com',  '888.888.888-88', '1995-06-25'); -- sem conta (caso de borda)

-- ---------- CONTA ----------
INSERT INTO conta (id, id_usuario, id_banco, tipo, numero_conta, numero_agencia, codigo_seguranca) VALUES
(1,  1, 1, 'CORRENTE',  '12345-6', '0001', '123'),
(2,  1, 4, 'CORRENTE',  '23456-7', '0001', '234'),
(3,  2, 2, 'POUPANCA',  '34567-8', '0123', '345'),
(4,  2, 3, 'CORRENTE',  '45678-9', '0456', '456'),
(5,  3, 1, 'CORRENTE',  '56789-0', '0001', '567'),
(6,  3, 5, 'INVESTIMENTO','67890-1','0001','678'),
(7,  4, 4, 'CORRENTE',  '78901-2', '0001', '789'),
(8,  5, 2, 'CORRENTE',  '89012-3', '0123', '890'),
(9,  5, 3, 'POUPANCA',  '90123-4', '0456', '901'),
(10, 6, 1, 'CORRENTE',  '01234-5', '0002', '012'),
(11, 7, 5, 'CORRENTE',  '11223-3', '0001', '135'),
(12, 7, 4, 'POUPANCA',  '22334-4', '0001', '246');

-- ---------- ATIVO_FINANCEIRO ----------
-- 1 a 7: investimentos | 8 a 12: empréstimos | 13 a 17: orçamentos
INSERT INTO ativo_financeiro (id, id_conta, tipo_ativo, data_criacao) VALUES
(1,  1,  'INVESTIMENTO', '2024-12-01'),
(2,  2,  'INVESTIMENTO', '2024-12-15'),
(3,  3,  'INVESTIMENTO', '2025-01-10'),
(4,  5,  'INVESTIMENTO', '2024-11-20'),
(5,  6,  'INVESTIMENTO', '2025-01-05'),
(6,  8,  'INVESTIMENTO', '2024-10-01'),
(7,  10, 'INVESTIMENTO', '2025-01-25'),
(8,  1,  'EMPRESTIMO',   '2024-12-20'),
(9,  4,  'EMPRESTIMO',   '2024-12-10'),
(10, 7,  'EMPRESTIMO',   '2025-01-15'),
(11, 9,  'EMPRESTIMO',   '2024-11-30'),
(12, 11, 'EMPRESTIMO',   '2025-02-01'),
(13, 1,  'ORCAMENTO',    '2025-01-01'),
(14, 3,  'ORCAMENTO',    '2025-01-01'),
(15, 5,  'ORCAMENTO',    '2025-02-01'),
(16, 8,  'ORCAMENTO',    '2025-02-15'),
(17, 12, 'ORCAMENTO',    '2025-03-01');

-- ---------- INVESTIMENTO ----------
INSERT INTO investimento (id, id_ativo_financeiro, tipo_investimento, valor_inicial_gasto, valor_mensal_investido, saldo, rentabilidade) VALUES
(1, 1, 'CDB',               5000.00,  500.00,  9200.50, 10.50),
(2, 2, 'Tesouro Selic',     3000.00,  300.00,  6100.00, 10.75),
(3, 3, 'Poupanca',          1000.00,  100.00,  2300.40,  6.17),
(4, 4, 'Acoes',             8000.00, 1000.00, 15400.00, 14.20),
(5, 5, 'Fundo Imobiliario', 4000.00,  400.00,  7300.00,  9.30),
(6, 6, 'LCI',              10000.00,    0.00, 11200.00,  9.80),
(7, 7, 'Tesouro IPCA',      2000.00,  200.00,  4100.00, 11.20);

-- ---------- EMPRESTIMO ----------
INSERT INTO emprestimo (id, id_ativo_financeiro, valor_total, status, numero_parcelas, taxa_juros) VALUES
(1, 8,  15000.00, 'ATIVO',     24, 1.89),
(2, 9,   5000.00, 'ATIVO',   12, 2.10),
(3, 10, 30000.00, 'ATIVO',     48, 1.55),
(4, 11,  8000.00, 'EM_ATRASO', 18, 2.50),
(5, 12,  2000.00, 'ATIVO',      6, 3.00);

-- ---------- ORCAMENTO ----------
INSERT INTO orcamento (id, id_ativo_financeiro, objetivo, valor_meta) VALUES
(1, 13, 'Viagem de fim de ano',   6000.00),
(2, 14, 'Reserva de emergencia', 20000.00),
(3, 15, 'Compra de notebook',     5000.00),
(4, 16, 'Reforma da casa',       25000.00),
(5, 17, 'Curso de ingles',        3000.00);

-- ---------- TRANSACAO ----------
INSERT INTO transacao (id, id_ativo_financeiro, valor, data, tipo_transacao) VALUES
-- investimentos
(1,  1,  500.00, '2025-01-05', 'APORTE'),
(2,  1,  500.00, '2025-02-05', 'APORTE'),
(3,  1,  500.00, '2025-03-05', 'APORTE'),
(4,  1,  120.50, '2025-03-31', 'RENDIMENTO'),
(5,  2,  300.00, '2025-01-10', 'APORTE'),
(6,  2,  300.00, '2025-02-10', 'APORTE'),
(7,  2,  300.00, '2025-03-10', 'APORTE'),
(8,  3,  100.00, '2025-02-15', 'APORTE'),
(9,  4, 1000.00, '2025-01-20', 'APORTE'),
(10, 4, 1000.00, '2025-02-20', 'APORTE'),
(11, 4, 2500.00, '2025-03-25', 'RESGATE'),
(12, 5,  400.00, '2025-02-08', 'APORTE'),
(13, 5,  400.00, '2025-03-08', 'APORTE'),
(14, 6, 1200.00, '2025-03-18', 'RENDIMENTO'),
(15, 7,  200.00, '2025-02-12', 'APORTE'),
-- pagamentos de parcelas de empréstimos
(16, 8,  720.00, '2025-01-15', 'PAGAMENTO_PARCELA'),
(17, 8,  720.00, '2025-02-15', 'PAGAMENTO_PARCELA'),
(18, 8,  720.00, '2025-03-15', 'PAGAMENTO_PARCELA'),
(19, 9,  450.00, '2025-01-20', 'PAGAMENTO_PARCELA'),
(20, 9,  450.00, '2025-02-20', 'PAGAMENTO_PARCELA'),
(21, 10, 800.00, '2025-02-25', 'PAGAMENTO_PARCELA'),
(22, 10, 800.00, '2025-03-25', 'PAGAMENTO_PARCELA'),
(23, 11, 520.00, '2025-01-30', 'PAGAMENTO_PARCELA'),
(24, 12, 350.00, '2025-03-05', 'PAGAMENTO_PARCELA'),
-- depósitos em metas de orçamento
(25, 13, 600.00,  '2025-01-12', 'DEPOSITO_META'),
(26, 13, 600.00,  '2025-02-12', 'DEPOSITO_META'),
(27, 14, 1000.00, '2025-02-28', 'DEPOSITO_META'),
(28, 15, 500.00,  '2025-03-03', 'DEPOSITO_META'),
(29, 16, 1500.00, '2025-03-22', 'DEPOSITO_META'),
(30, 17, 250.00,  '2025-03-14', 'DEPOSITO_META');

COMMIT;

-- ---------- CONFERÊNCIA ----------
SELECT 'banco' AS tabela, COUNT(*) FROM banco
UNION ALL SELECT 'usuario', COUNT(*) FROM usuario
UNION ALL SELECT 'conta', COUNT(*) FROM conta
UNION ALL SELECT 'ativo_financeiro', COUNT(*) FROM ativo_financeiro
UNION ALL SELECT 'investimento', COUNT(*) FROM investimento
UNION ALL SELECT 'emprestimo', COUNT(*) FROM emprestimo
UNION ALL SELECT 'orcamento', COUNT(*) FROM orcamento
UNION ALL SELECT 'transacao', COUNT(*) FROM transacao;