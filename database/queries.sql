-- Soma o gasto total da Trabalhadora CLT com dinheiro nas segundas-feiras
-- (único dia utilizado, já que todos os dias da semana são iguais)
SELECT sum(valor) as total_dinheiro
FROM registro_deslocamento
WHERE dia_semana = 'Segunda-feira' AND tipo_pagamento = 'Dinheiro';

-- Mostra o total diário das três modalidades de pagamento
SELECT tipo_pagamento, SUM(valor) as gasto_total
FROM registro_deslocamento
GROUP BY tipo_pagamento
ORDER BY gasto_total;
