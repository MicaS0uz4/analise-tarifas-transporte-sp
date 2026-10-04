-- ============================================================================
-- PROJETO: Análise Comparativa de Tarifas de Transporte Publico
-- ARQUIVO: schema.sql (Estrutura do Banco e Carga Inicial de Dados)
-- ============================================================================

CREATE DATABASE IF NOT EXISTS analise_tarifas;
USE analise_tarifas;

-- ----------------------------------------------------------------------------
-- 1. TRABALHADORA CLT
-- ----------------------------------------------------------------------------
-- Criação da tabela registro de deslocamento para a Trabalhadora CLT
CREATE TABLE registro_deslocamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(20) NOT NULL,
    tipo_transporte VARCHAR(20) NOT NULL, -- 'Ônibus', 'Trem/Metrô'
    sentido VARCHAR(10) NOT NULL,          -- 'Ida', 'Volta'
    tipo_pagamento VARCHAR(20) NOT NULL,   -- 'Dinheiro', 'Comum', 'VT'
    valor DECIMAL(5, 2) NOT NULL
);

-- Inserção dos valores diários de descolamento e suas diferentes modalidades da Trabalhadora CLT
INSERT INTO registro_deslocamento (dia_semana, tipo_transporte, sentido, tipo_pagamento, valor) VALUES
-- Trajeto em Dinheiro
('Segunda-feira', 'Ônibus', 'Ida', 'Dinheiro', 6.30),
('Segunda-feira', 'Ônibus', 'Volta', 'Dinheiro', 6.30),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'Dinheiro', 5.40),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'Dinheiro', 5.40),

-- Trajeto em Vale-Transporte (VT)
('Segunda-feira', 'Ônibus', 'Ida', 'VT', 6.30),
('Segunda-feira', 'Ônibus', 'Volta', 'VT', 4.80),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'VT', 4.42),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'VT', 5.92),

-- Trajeto em Cartão Comum
('Segunda-feira', 'Ônibus', 'Ida', 'Comum', 6.30),
('Segunda-feira', 'Ônibus', 'Volta', 'Comum', 4.80),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'Comum', 3.90),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'Comum', 5.40);


-- ----------------------------------------------------------------------------
-- 2. TRABALHADORA AUTÔNOMA
-- ----------------------------------------------------------------------------
-- Criação da tabela de registros para a Trabalhadora Autônoma
CREATE TABLE registro_deslocamento_autonoma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(20) NOT NULL,
    tipo_transporte VARCHAR(50) NOT NULL, 
    sentido VARCHAR(10) NOT NULL,           
    tipo_pagamento VARCHAR(20) NOT NULL,    
    valor DECIMAL(5, 2) NOT NULL
);

-- Inserção das duas rotinas da Trabalhadora Autônoma
INSERT INTO registro_deslocamento_autonoma (dia_semana, tipo_transporte, sentido, tipo_pagamento, valor) VALUES
-- ROTINA A: Segunda, Quarta e Sexta (Base: 'Segunda-feira')
-- Opção em Dinheiro
('Segunda-feira', 'Ônibus (Intermunicipal)', 'Ida', 'Dinheiro', 6.30),
('Segunda-feira', 'Ônibus (SPTrans)', 'Ida', 'Dinheiro', 5.30),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'Dinheiro', 5.40),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'Dinheiro', 5.40),
('Segunda-feira', 'Ônibus (SPTrans)', 'Volta', 'Dinheiro', 5.30),
('Segunda-feira', 'Ônibus (Intermunicipal)', 'Volta', 'Dinheiro', 6.30),

-- Opção em Cartão Comum
('Segunda-feira', 'Ônibus (Intermunicipal)', 'Ida', 'Comum', 6.30),
('Segunda-feira', 'Ônibus (SPTrans)', 'Ida', 'Comum', 5.30),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'Comum', 3.90),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'Comum', 5.40),
('Segunda-feira', 'Ônibus (Intermunicipal)', 'Volta', 'Comum', 4.80),
('Segunda-feira', 'Ônibus (SPTrans)', 'Volta', 'Comum', 5.30),

-- ROTINA B: Terça e Quinta (Base: 'Terça-feira' - Rota mais curta)
-- Opção em Dinheiro
('Terça-feira', 'Ônibus (Intermunicipal)', 'Ida', 'Dinheiro', 6.30),
('Terça-feira', 'Trem/Metrô', 'Ida', 'Dinheiro', 5.40),
('Terça-feira', 'Trem/Metrô', 'Volta', 'Dinheiro', 5.40),
('Terça-feira', 'Ônibus (Intermunicipal)', 'Volta', 'Dinheiro', 6.30),

-- Opção em Cartão Comum
('Terça-feira', 'Ônibus (Intermunicipal)', 'Ida', 'Comum', 6.30),
('Terça-feira', 'Trem/Metrô', 'Ida', 'Comum', 3.90),
('Terça-feira', 'Trem/Metrô', 'Volta', 'Comum', 5.40),
('Terça-feira', 'Ônibus (Intermunicipal)', 'Volta', 'Comum', 4.80);
