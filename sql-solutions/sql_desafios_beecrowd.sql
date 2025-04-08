2744 - Senhas

SELECT 
  id,
  password,
  MD5(password) AS MD5
FROM 
  account;



2743 - Quantidade de Caracteres

SELECT 
  name,
  LENGTH(name) AS length
FROM 
  people
ORDER BY 
  length DESC;



2742 - O Multiverso de Richard

SELECT 
  l.name,
  ROUND(l.omega * 1.618, 3) AS "Fator N"
FROM 
  life_registry l
JOIN 
  dimensions d ON l.dimensions_id = d.id
WHERE 
  l.name LIKE 'Richard%' AND
  d.name IN ('C774', 'C875')
ORDER BY 
  l.omega;



2740 - Liga

SELECT 'Podium: ' || team AS name
FROM league
WHERE position <= 3

UNION ALL

SELECT 'Demoted: ' || team AS name
FROM league
WHERE position >= 14;



2739 - Dia de Pagamento

SELECT 
  name,
  EXTRACT(DAY FROM payday)::int AS day
FROM 
  loan;



2738 - Concurso

SELECT 
  c.name,
  ROUND((s.math * 2 + s.specific * 3 + s.project_plan * 5) / 10.0, 2) AS avg
FROM 
  candidate c
JOIN 
  score s ON c.id = s.candidate_id
ORDER BY 
  avg DESC;



2737 - Advogados

SELECT name, customers_number
FROM (
  SELECT name, customers_number, 1 AS ordem
  FROM lawyers
  WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)
  
  UNION ALL

  SELECT name, customers_number, 2 AS ordem
  FROM lawyers
  WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers)

  UNION ALL

  SELECT 'Average', CAST(AVG(customers_number) AS INTEGER), 3 AS ordem
  FROM lawyers
) AS resultados
ORDER BY ordem;



2625 - Máscara de CPF

SELECT 
  SUBSTRING(cpf FROM 1 FOR 3) || '.' ||
  SUBSTRING(cpf FROM 4 FOR 3) || '.' ||
  SUBSTRING(cpf FROM 7 FOR 3) || '-' ||
  SUBSTRING(cpf FROM 10 FOR 2) AS CPF
FROM natural_person;



2624 - Quantidades de Cidades por Clientes

SELECT COUNT(DISTINCT city) AS count
FROM customers;



2623 - Categorias com Vários Produtos

SELECT p.name, c.name
FROM products p
JOIN categories c ON p.id_categories = c.id
WHERE p.amount > 100
  AND p.id_categories IN (1, 2, 3, 6, 9)
ORDER BY p.id_categories;


2622 - Pessoas Jurídicas

SELECT c.name
FROM customers c
INNER JOIN legal_person lp
ON c.id = lp.id_customers;



2615 - Expandindo o Negocio

SELECT DISTINCT city
FROM customers;



2614 - Locações de Setembro

SELECT 
    customers.name, 
    rentals.rentals_date
FROM 
    rentals
JOIN 
    customers ON rentals.id_customers = customers.id
WHERE 
    rentals.rentals_date BETWEEN '2016-09-01' AND '2016-09-30';



2613 - Filmes em Promoção

SELECT 
    movies.id, 
    movies.name
FROM 
    movies
JOIN 
    prices ON movies.id_prices = prices.id
WHERE 
    prices.value < 2.00;



2610 - Valor Médio dos Produtos

SELECT 
    ROUND(AVG(price), 2) AS price
FROM 
    products;



2609 - Produtos por Categorias

SELECT 
    categories.name AS name,
    SUM(products.amount) AS sum
FROM 
    products
JOIN 
    categories ON products.id_categories = categories.id
GROUP BY 
    categories.name
ORDER BY 
    categories.name;



2608 - Maior e Menor Preço

SELECT 
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM products;


2741 - Notas dos Alunos

SELECT CONCAT('Approved: ', name) AS name, grade
FROM students
WHERE grade >= 7
ORDER BY grade DESC;



2616 - Nenhuma Locação

SELECT c.id, c.name
FROM customers c
LEFT JOIN locations l ON c.id = l.id_customers
WHERE l.id_customers IS NULL
ORDER BY c.id;



2617 - Fornecedor Ajax SA

SELECT p.name AS product_name, prov.name AS provider_name
FROM products p
JOIN providers prov ON p.id_providers = prov.id
WHERE prov.name = 'Ajax SA';



2618 - Produtos Importados

SELECT p.name AS product_name, prov.name AS provider_name, c.name AS category_name
FROM products p
JOIN providers prov ON p.id_providers = prov.id
JOIN categories c ON p.id_categories = c.id
WHERE prov.name = 'Sansul SA' AND c.name = 'Imported';



2602 - Select Básico

SELECT name 
FROM customers 
WHERE state = 'RS';


2619 - Super Luxo

SELECT p.name AS product_name, prov.name AS provider_name, p.price
FROM products p
JOIN providers prov ON p.id_providers = prov.id
JOIN categories c ON p.id_categories = c.id
WHERE p.price > 1000 AND c.name = 'Super Luxury';




2620 - Pedidos no Primeiro Semestre

SELECT c.name, o.id AS order_id
FROM customers c
JOIN orders o ON c.id = o.id_customers
WHERE o.orders_date BETWEEN '2016-01-01' AND '2016-06-30';



2621 - Quantidades Entre 10 e 20

SELECT p.name
FROM products p
JOIN providers prov ON p.id_providers = prov.id
WHERE p.amount BETWEEN 10 AND 20
AND prov.name LIKE 'P%';



2607 - Cidades em Ordem Alfabética

SELECT DISTINCT city
FROM providers
ORDER BY city ASC;



2606 - Categorias

SELECT p.id, p.name
FROM products p
JOIN categories c ON p.id_categories = c.id
WHERE c.name LIKE 'super%';



2605 - Representantes Executivos

SELECT p.name AS product_name, prov.name AS provider_name
FROM products p
JOIN providers prov ON p.id_providers = prov.id
WHERE p.id_categories = 6;




2604 - Menores que 10 ou Maiores que 100

SELECT id, name
FROM products
WHERE price < 10 OR price > 100;



2603 - Endereço dos Clientes

-- Selecionar o nome e a rua dos clientes que moram em Porto Alegre
SELECT name, street 
FROM customers 
WHERE city = 'Porto Alegre';

