-- Criação da tabela registro de deslocamento para a Trabalhadora CLT
CREATE TABLE registro_deslocamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(20),
    tipo_transporte VARCHAR(20), -- 'Ônibus', 'Trem/Metrô'
    sentido VARCHAR(10),           -- 'Ida', 'Volta'
    tipo_pagamento VARCHAR(20),    -- 'Dinheiro', 'Comum', 'VT'
    valor DECIMAL(5, 2)
);

-- Inserção dos valores diários de descolamento e suas diferentes modalidades da Trabalhadora CLT
INSERT INTO registro_deslocamento (dia_semana, tipo_transporte, sentido, tipo_pagamento, valor) VALUES
-- Trajeto em Dinheiro
('Segunda-feira', 'Ônibus', 'Ida', 'Dinheiro', 6.30),
('Segunda-feira', 'Ônibus', 'Volta', 'Dinheiro', 6.30),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'Dinheiro', 5.40),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'Dinheiro', 5.40),
-- Trajeto em VT
('Segunda-feira', 'Ônibus', 'Ida','VT', 6.30),
('Segunda-feira', 'Ônibus', 'Volta', 'VT', 4.80),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'VT', 4.42),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'VT', 5.92),
-- Trajeto com Comum
('Segunda-feira', 'Ônibus', 'Ida','Comum', 6.30),
('Segunda-feira', 'Ônibus', 'Volta', 'Comum', 4.80),
('Segunda-feira', 'Trem/Metrô', 'Ida', 'Comum', 3.90),
('Segunda-feira', 'Trem/Metrô', 'Volta', 'Comum', 5.40);
