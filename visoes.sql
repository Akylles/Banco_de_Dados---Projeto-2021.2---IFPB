/*
	1. Visão que une a data da reclamação, o assunto, sua respectiva resposta e a data da resposta
*/

CREATE VIEW reclamacao_resposta AS
SELECT rec."data" AS "Data da Reclamação", rec.assunto AS "Assunto",
resp.conteudo AS "Resposta", resp."data" AS "Data da Resposta"
FROM reclamacao AS rec
INNER JOIN resposta AS resp
ON rec.id = resp.id_reclamacao;

-- testando a visao

select * from reclamacao_resposta;



/*
    2. Visão que une a pessoa jurídica com o nome da pessoa que lhe representa
*/

CREATE VIEW representante_empresa AS
SELECT 
p.cnpj AS "CNPJ",
p.nome_fantasia AS "Nome Fantasia", 
p.razao_social AS "Razão Social", 
s.nome AS "Nome Representante"
FROM pessoajuridica AS p
INNER JOIN solicitante AS s
ON s.id = p.id_solicitante;

-- testando a visão

select * from representante_empresa;



/*
	3. Visão que lista as reclamações autorizadas e nao autorizadas e quem foi o ouvidor responsável pelo parecer
*/

CREATE VIEW reclamacao_autorizada AS
SELECT 
CASE
WHEN a.sim_ou_nao = true THEN 'Sim'
WHEN a.sim_ou_nao = false THEN 'Não'
END
AS "Reclamação Autorizada?", 
r.assunto AS "Reclamação", 
s.nome AS "Ouvidor Responsável"
FROM autorizacao_reclamacao AS a
INNER JOIN reclamacao AS r
ON r.id = a.id_reclamacao
INNER JOIN ouvidor AS o
ON o.id = a.id_ouvidor
INNER JOIN servidor s
ON s.matricula = o.matricula_servidor;

-- testando a visão

select * from reclamacao_autorizada;
