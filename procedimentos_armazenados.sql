-- Procedimento para verificar quantos telefones a solicitante 'Adagilza Nonato Feitor' tem

CREATE OR REPLACE FUNCTION getQuantidadeTelefones(VARCHAR) RETURNS INTEGER
AS
$$
	DECLARE
		nome_solicitante ALIAS FOR $1;
		total INTEGER;
	BEGIN
		SELECT INTO total COUNT(*) FROM telefone_solicitante AS t 
		INNER JOIN solicitante AS s ON t.id_solicitante = s.id AND s.nome = nome_solicitante;
		
		RETURN total;
	END
$$ LANGUAGE PLPGSQL

SELECT getquantidadetelefones('Adagilza Nonato Feitor');


-- Procedimento que informa o nome do(s) solicitante(s) que fez o número máximo de reclamações

CREATE OR REPLACE FUNCTION getMaiorSolicitante() RETURNS VARCHAR
AS
$$
	DECLARE
		nome_solicitante VARCHAR;
	BEGIN
	
		SELECT INTO nome_solicitante s.nome FROM solicitante AS s 
		WHERE s.id = (SELECT id_solicitante FROM reclamacao group BY id_solicitante ORDER BY COUNT(*) DESC LIMIT 1);

		RETURN nome_solicitante;
	END
$$ LANGUAGE PLPGSQL

select getmaiorsolicitante();


-- Procedimento que verifica se o solicitante possui email

CREATE OR REPLACE FUNCTION temEmail(INTEGER) RETURNS VARCHAR
AS
$$
	DECLARE
		solicitante_id ALIAS FOR $1;
		email_solicitante VARCHAR;
	BEGIN
		SELECT INTO email_solicitante s.email FROM solicitante AS s WHERE s.id = solicitante_id;	
		
		IF email_solicitante IS NULL THEN RETURN 'NÂO POSSUI EMAIL'; END IF;
		IF email_solicitante IS NOT NULL THEN RETURN 'POSSUI EMAIL'; END IF;		
	END
$$ LANGUAGE PLPGSQL

select tememail(5);
select tememail(6);

