-- Criar a tabela estado
CREATE TABLE estado (
  id_estado INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

-- Criar a tabela cliente
CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE,
  telefone VARCHAR(15)
);

-- Adicionar a coluna estado_id na tabela cliente
ALTER TABLE cliente
ADD COLUMN estado_id INT;

-- Criar a chave estrangeira estado_id na tabela cliente
ALTER TABLE cliente
ADD CONSTRAINT fk_cliente_estado
FOREIGN KEY (estado_id) REFERENCES estado (id_estado);

-- Inserir dados na tabela cliente
INSERT INTO cliente (id_cliente, nome, email, telefone, estado_id)
VALUES (1, 'João', 'joao@gmail.com', '11987654321', 1),
       (2, 'Maria', 'maria@hotmail.com', '11976543210', 2),
       (3, 'Pedro', 'pedro@yahoo.com', '11965432109', 3);

-- Recuperações simples com SELECT Statement
SELECT nome_da_coluna, ...
FROM nome_da_tabela;

-- Selecionar o nome e o email dos clientes
SELECT nome, email
FROM cliente;

-- Filtros com WHERE Statement
SELECT nome_da_coluna, ...
FROM nome_da_tabela
WHERE condicao;

-- Selecionar o nome e o email dos clientes que moram no estado 1
SELECT nome, email
FROM cliente
WHERE estado_id = 1;

-- Expressões para gerar atributos derivados
SELECT nome_da_coluna, ..., expressao AS nome_do_atributo
FROM nome_da_tabela;

-- Selecionar o nome e o primeiro caractere do email dos clientes
SELECT nome, SUBSTRING(email, 1, 1) AS inicial_email
FROM cliente;

-- Ordenações dos dados com ORDER BY
SELECT nome_da_coluna, ...
FROM nome_da_tabela
ORDER BY nome_da_coluna ASC|DESC, ...;

-- Selecionar o nome e o email dos clientes ordenados por nome em ordem alfabética
SELECT nome, email
FROM cliente
ORDER BY nome ASC;

-- Condições de filtros aos grupos – HAVING Statement
SELECT nome_da_coluna, ..., funcao_agregada(nome_da_coluna) AS nome_do_atributo
FROM nome_da_tabela
GROUP BY nome_da_coluna, ...
HAVING condicao;

-- Selecionar o estado e a média de telefone dos clientes por estado, filtrando apenas os estados que têm mais de um cliente
SELECT estado_id, AVG(telefone) AS media_telefone
FROM cliente
GROUP BY estado_id
HAVING COUNT(id_cliente) > 1;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT nome_da_coluna, ...
FROM nome_da_tabela_1 JOIN|INNER JOIN|LEFT JOIN|RIGHT JOIN|FULL JOIN nome_da_tabela_2
ON condicao_de_juncao;

-- Selecionar o nome do cliente e o nome do estado em que ele mora, usando uma junção interna entre as tabelas cliente e estado
SELECT c.nome AS nome_cliente, e.nome AS nome_estado
FROM cliente c INNER JOIN estado e
ON c.estado_id = e.id_estado;