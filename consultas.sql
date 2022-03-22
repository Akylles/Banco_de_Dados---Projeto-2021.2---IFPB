/*
1. Duas consultas envolvendo junções
*/

-- Descobrir os telefones da solicitante Felismina Leite Grangeiro. Exibir telefone e nome.

SELECT t.telefone, s.nome FROM telefone_solicitante AS t
INNER JOIN solicitante AS s
ON s.nome = 'Felismina Leite Grangeiro' AND s.id = t.id_solicitante;

-- Descobrir o nome do escrivão de matrícula 2005-7. Exibir nome e matrícula

SELECT s.nome, s.matricula FROM servidor AS s
INNER JOIN escrivao AS e
ON s.matricula = '2005-7' AND s.matricula = e.matricula_servidor;

/*
2. Duas consultas envolvendo comparações com valores nulos
*/

-- Exibindo os endereços cujas casas são sem número

SELECT * FROM endereco_solicitante WHERE numero_casa IS NULL;

-- Exibindo os solicitantes que não possuem email

SELECT * FROM solicitante WHERE email IS NULL;

/*
3. Duas consultas usando buscas por substrings
*/

-- Buscar o nome dos solicitantes que possuem telefone fixo, ou seja, cujo número começa com 3. Exibir telefone e nome.

SELECT t.telefone, s.nome FROM telefone_solicitante AS t
INNER JOIN solicitante AS s
ON t.telefone LIKE '3%' AND s.id = t.id_solicitante;

-- Recuperar a cidade e o estado de naturalidade da pessoa fisica cujo CPF é 246.912.244-19

SELECT SUBSTRING(naturalidade FROM 1 FOR 12) AS "Cidade", 
SUBSTRING(naturalidade FROM 15 FOR 17) AS "UF"
FROM pessoafisica WHERE cpf = '246.912.244-19';

/*
4. Duas consultas envolvendo ordenação
*/

-- Ordenar as reclamações das mais recentes para as mais antigas

SELECT * FROM reclamacao AS r ORDER BY r."data" DESC;

-- Ordenar os solicitantes pelos nomes em ordem alfabética

SELECT * FROM solicitante ORDER BY nome;

/*
5. Duas consultas aninhadas
*/

-- Exibir a(s) resposta(s) à(s) reclamação(ões) feita(s) no dia '03-12-1983'. Exibir data da resposta e o conteúdo

SELECT r."data" AS "Data da Resposta", r.conteudo AS "Conteúdo da Resposta" FROM resposta AS r 
WHERE r.id_reclamacao = (SELECT r.id FROM reclamacao AS r WHERE r."data" = '03-12-1983');

-- Mostrar o nome da secretaria para a qual foi encaminhada a reclamacao de id 5 encaminhada pelo ouvidor de matricula 2020-5

SELECT s.nome FROM secretaria AS s 
WHERE s.id = (SELECT e.id_secretaria FROM encaminhamento_reclamacao AS e 
WHERE e.id_reclamacao = 5 AND  
e.id_ouvidor IN (SELECT o.id FROM ouvidor AS o WHERE o.matricula_servidor = '2009-4'));


/*
6. Duas consultas aninhadas correlacionadas
*/

-- O(s) ABO(s) do(s) ouvidore(s) que NAO negaram em momento algum uma autorização de reclamação

SELECT o.abo FROM ouvidor AS o
WHERE NOT EXISTS
(SELECT FROM autorizacao_reclamacao AS a WHERE o.id = a.id_ouvidor AND a.sim_ou_nao = false);

-- O nome dos servidores que são escrivãos

SELECT s.nome FROM servidor AS s
WHERE EXISTS
(SELECT * FROM escrivao AS e WHERE s.matricula = e.matricula_servidor);


/*
7. Duas consultas usando operações de conjunto
*/

-- Unir os telefones de 'Vicente Carmo Pinto' e 'Felismina Leite Grangeiro' numa única consulta

SELECT t.telefone FROM solicitante AS s
INNER JOIN telefone_solicitante as t
ON s.id = t.id_solicitante AND s.nome = 'Vicente Carmo Pinto'
UNION
SELECT t.telefone FROM solicitante AS s
INNER JOIN telefone_solicitante as t
ON s.id = t.id_solicitante AND s.nome = 'Felismina Leite Grangeiro';

-- Mostrar apenas os solicitantes que tem email

SELECT * FROM solicitante
EXCEPT
SELECT * FROM solicitante WHERE email IS NULL;


/*
8. Duas consultas usando funções agregadas
*/

-- Quantos telefones o solicitante de id = 1 tem

SELECT COUNT(*) FROM telefone_solicitante AS t WHERE t.id_solicitante = 1;

-- Qual o endereço que possui a casa com o maior número

SELECT MAX(e.numero_casa) FROM endereco_solicitante AS e 
WHERE e.numero_casa IS NOT NULL;


/*
9. Duas consultas usando agrupamento, dentre as quais pelo menos uma deve usar filtragem de grupo;
*/

-- Listar os ids dos escrivão que digitalizaram mais de duas reclamações agrupadas pelo id dos escrivões

SELECT 
r.id_escrivao AS "Id do Escrivão", 
COUNT(r.id_escrivao) AS "Quantidade de Reclamações Digitalizadas"
FROM reclamacao AS r
GROUP BY r.id_escrivao 
HAVING COUNT(r.id_escrivao) > 2;

-- Mostrando o id da secretaria e sua respectiva quantidade de respostas relacionadas a ela

SELECT r.id_secretaria, COUNT(*) AS num_respostas
FROM resposta AS r
GROUP BY r.id_secretaria 
HAVING COUNT(*) > 1;
