-- ============================================================================
-- PROJETO: Análise Comparativa de Tarifas de Transporte Publico
-- ARQUIVO: queries.sql (Consultas Analíticas e Regras de Negocio)
-- ============================================================================

USE analise_tarifas;

-- ============================================================================
-- SECTION 1: ANÁLISES DA TRABALHADORA CLT
-- ============================================================================

-- 1.1 Total gasto por modalidade de pagamento na Segunda-feira (Dia padrão)
-- Total diário com Comum
SELECT sum(valor) as total_dinheiro
FROM registro_deslocamento
WHERE dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Dinheiro';

-- Total diário com comum
SELECT sum(valor) as total_comum
FROM registro_deslocamento
WHERE dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Comum';

-- Total diário com VT
SELECT sum(valor) as total_vt
FROM registro_deslocamento
WHERE dia_semana = 'Segunda-feira' AND tipo_pagamento = 'VT';

-- Mostra o total diário das três modalidades de pagamento
SELECT tipo_pagamento, SUM(valor) as gasto_total
FROM registro_deslocamento
GROUP BY tipo_pagamento
ORDER BY gasto_total;

-- Mostra o valor total mensal de cada modalidade
SELECT tipo_pagamento, SUM(valor) * 21 as valor_mensal
FROM registro_deslocamento
GROUP BY tipo_pagamento
ORDER BY valor_mensal DESC;


-- ============================================================================
-- SECTION 2: ANÁLISES DA TRABALHADORA AUTÔNOMA
-- ============================================================================

-- 2.1 Custo total diário por Rotina (A vs B) e tipo de pagamento
-- Total diário com Dinheiro
SELECT dia_semana as rotina_dia, SUM(valor) as custo_diario_dinheiro
FROM registro_deslocamento_autonoma
WHERE tipo_pagamento = 'Dinheiro'
GROUP BY dia_semana;

--Total diário com Comum
SELECT dia_semana as rotina_dia, SUM(valor) as custo_diario_dinheiro
FROM registro_deslocamento_autonoma
WHERE tipo_pagamento = 'Comum'
GROUP BY dia_semana;

-- 2.2 Custo total SEMANAL por modalidade de pagamento
-- (Rotina A se repete 3x/semana: Seg, Qua, Sex | Rotina B repete 2x/semana: Ter, Qui)
-- Total SEMANAL com Dinheiro
SELECT 
    SUM(CASE 
            WHEN dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Dinheiro' THEN valor * 3
            WHEN dia_semana = 'Terça-feira' AND tipo_pagamento = 'Dinheiro' THEN valor * 2
            ELSE 0
		END
    ) as gasto_semanal_total
FROM registro_deslocamento_autonoma;

-- Total SEMANAL com Comum
SELECT 
    SUM(CASE 
            WHEN dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Comum' THEN valor * 3
            WHEN dia_semana = 'Terça-feira' AND tipo_pagamento = 'Comum' THEN valor * 2
            ELSE 0
		END
    ) as gasto_semanal_total
FROM registro_deslocamento_autonoma;

-- 2.3 Estimativa de Custo MENSAL isolado por modalidade (Considerando 4 semanas)
-- Total MENSAL com Dinheiro
SELECT 
    SUM(CASE 
            WHEN dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Dinheiro' THEN valor * 3 * 4
            WHEN dia_semana = 'Terça-feira' AND tipo_pagamento = 'Dinheiro' THEN valor * 2 * 4
            ELSE 0
        END
    ) AS estimativa_gasto_mensal
FROM registro_deslocamento_autonoma;

-- Total MENSAL com Comum
SELECT 
    SUM(CASE 
            WHEN dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Comum' THEN valor * 3 * 4
            WHEN dia_semana = 'Terça-feira' AND tipo_pagamento = 'Comum' THEN valor * 2 * 4
            ELSE 0
        END
    ) AS estimativa_gasto_mensal
FROM registro_deslocamento_autonoma;

-- 2.4 COMPARATIVO CONSOLIDADO MENSAL: Dinheiro vs. Bilhete Comum
-- Agrupa as ponderações de frequência diária para gerar o comparativo final em 1 única tabela
-- Comparação do custo mensal com dinheiro e do custo mensal com Comum
SELECT tipo_pagamento, sum(CASE 
            WHEN dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Comum' THEN valor * 3 * 4
            WHEN dia_semana = 'Terça-feira' AND tipo_pagamento = 'Comum' THEN valor * 2 * 4
			WHEN dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Dinheiro' THEN valor * 3 * 4
            WHEN dia_semana = 'Terça-feira' AND tipo_pagamento = 'Dinheiro' THEN valor * 2 * 4
            ELSE 0
        END) as total_mensal
FROM registro_deslocamento_autonoma
GROUP BY tipo_pagamento
ORDER BY total_mensal DESC;
