INSERT INTO servidor
VALUES
('2008-1', 'Ronaldo da Silva Bezerra', 'ronaldo.silva@perfeitura.gov.com'),
('2007-2', 'Severino de Assis Nogueira', 'severino.assis@perfeitura.gov.com'),
('2012-3', 'Maria Josefa de Lima', 'maze.lima@perfeitura.gov.com'),
('2009-4', 'Francica Gonçalvez Martins', 'francisca.martin@perfeitura.gov.com'),
('2020-5', 'Zacarias Alexandre da Fonseca', 'zaca.fonseca@perfeitura.gov.com'),
('2022-6', 'Nilda Cunha de Oliveira', 'nilda.cunha@perfeitura.gov.com'),
('2005-7', 'Damião Leite de Sousa', 'damiao.leite@perfeitura.gov.com'),
('2021-8', 'Virgulino Ferreira da Conceição', 'virgulino.ferreira@perfeitura.gov.com'),
('2016-9', 'Geraldo Santos Bandeira', 'geraldo.santos@perfeitura.gov.com'),
('2011-10', 'Maria da Conceição Taveres', 'maria.tavares@perfeitura.gov.com');

INSERT INTO ouvidor(ABO, matricula_servidor)
VALUES
('111.111-1', '2008-1'),
('222.222-2', '2007-2'),
('333.333-3', '2012-3'),
('444.444-4', '2009-4'),
('555.555-5', '2020-5');

INSERT INTO escrivao(inicio_contrato, fim_contrato, matricula_servidor)
VALUES
('25-04-1980', '12-09-1999', '2022-6'),
('01-02-1993', '07-10-2001', '2005-7'),
('11-06-2004', '12-12-2010', '2021-8'),
('31-03-2013', '23-08-2017', '2016-9'),
('28-11-2019', '30-01-2022', '2011-10');

INSERT INTO solicitante(nome, email)
VALUES
('José Herculano da Silveira', 'jose.herculano@hotmail.com'),
('Maria do Rosário Gonçalves Pereira', 'maria.rosario@gmail.com'),
('Vicente Carmo Pinto', 'vicente.pinto@bol.com'),
('Raquel Nogueira Queiros', 'raquel.nogueira@yahoo.com'),
('Isadora Bezerra Messias', NULL),
('Gonçalo do Amarante Gouveia', 'gonçalo.amarante@gmail.com'),
('Adagilza Nonato Feitor', 'adalgiza.feitor@hotmail'),
('Expedito Conrado Honorato', NULL),
('Valmir Feitosa Cartaxo', NULL),
('Felismina Leite Grangeiro', 'felismina.grangeiro@gmail.com');

INSERT INTO telefone_solicitante(telefone, id_solicitante)
VALUES
('9316-1278', 1),
('3578-1284', 2),
('9217-7812', 3),
('8720-5621', 4),
('9915-3389', 5),
('8811-1100', 1),
('9178-1246', 1),
('8889-9755', 1),
('3531-2970', 1),
('9800-1212', 3),
('8743-6789', 3),
('3538-1299', 4),
('9999-1233', 6),
('8823-1098', 7),
('9333-6463', 7),
('8888-8888', 8),
('3124-8923', 9),
('9765-4321', 10),
('3456-957', 10),
('8720-2691', 10);

INSERT INTO endereco_solicitante(cidade, estado, rua, bairro, pais, numero_casa, id_solicitante)
VALUES
('Umari', 'Ceara', 'Manoel Alves', 'Alto Pontes', 'Brasil', 317, 1),
('Cajazeiras', 'Paraiba', 'Dom Zacarias', 'IPEP', 'Brasil', 220, 1),
('Bogotá', 'Distrito Federal', 'Hasta la Victoria', 'Estudiantes', 'Bolívia', 12, 2),
('Caicó', 'Rio Grande do Norte', 'Avenidade Gonçalves Dias', 'Operário', 'Brasil', NULL, 3),
('Olinda', 'Pernambuco', ' Viela Cristiano Coelho', 'Jardim das Flores', 'Brasil', 500, 3),
('Cajazeiras', 'Paraíba', 'Matias Rolim', 'Centro', 'Brasil', 733, 4),
('Cajazeiras', 'Paraíba', 'Monsenhor Gaulberto', 'Asa', 'Brasil', NULL, 4),
('Marizópolis', 'Paraíba', 'Coronel Zé Vieira', 'Centro', 'Brasil', 4525, 5);

INSERT INTO pessoafisica(CPF, naturalidade, id_solicitante)
VALUES
('100.722.335-45', 'São José de Piranhas - PB', 1),
('120.871.729-60', 'Antenor Navarro - PB', 2),
('246.912.244-19', 'Ouro Branco - CE', 3),
('201.128.794-30', 'Codó - MA', 4),
('300.100.200-80', 'Cajazeiras - PB', 5);

INSERT INTO pessoajuridica(CNPJ, nome_fantasia, razao_social, id_solicitante)
VALUES
('55.123.234/0001-22', 'Mercadinho Frei Damião', 'MFD LTDA', 6),
('33.111.212/0001-33', 'Empresa Contabilizei', 'Contabilizei Contabilidade LTDA', 7),
('11.333.124/0001-52', 'Petrobras', 'Petróleo Brasileiro S.A', 8),
('77.567.198/0001-66', 'Empresa Informática', 'EF Informática ME', 9),
('33.989.123/0001-77', 'Bar Fictício', 'Exemplo & Fictício Comércio de Bebidas EPP ', 10);

INSERT INTO reclamacao("data", assunto, id_escrivao, id_solicitante)
VALUES
('24-10-1994', 'A rua Francisco Matia Rolim precisa ser calçada', 1, 1),
('01-03-2000', 'Falta investir em mais segurança no bairro Jardim Oásis', 2, 2),
('12-09-2008', 'A Escola Vitória Régia está sem bebedouro', 3, 3),
('30-10-2014', 'Os alunos do sítio Azeveim estão sem transporte', 4, 4),
('25-12-2021', 'O Posto de Saúde do Sol Nascente precisa de vacinas da Pfizer', 5, 5),
('03-12-1983', 'A barragem do acúde de Boqueirão está prestes a romper', 1, 6),
('31-03-1995', 'Os salários dos funcionários terceirizados estão atrasados', 2, 7),
('21-02-2009', 'Há prevaricação na secretaria de cultura', 3, 8),
('19-07-2016', 'Faltam respiradores na UTI do Regional', 4, 9),
('17-01-2022', 'Muitos funcionários da prefeituram trabalham sem máscaras', 5, 10),
('16-04-1987', 'Denúncia de fraude na licitação do último FUMINC', 1, 1),
('14-12-1999', 'O esgoto da rua Expedito Alves da Silva estourou', 2, 3),
('01-01-2001', 'Falta iluminação adequada no Jardim Oásis', 2, 4),
('23-11-2006', 'O funcionário da prefeitura Fulano de Tal é inoperante', 3, 9),
('07-07-2016', 'O ônibus fretado para o congresso de empreendedores não chegou na hora combinada', 4, 9);

INSERT INTO autorizacao_reclamacao(sim_ou_nao, id_reclamacao, id_ouvidor)
VALUES
(true, 1, 1),
(false, 2, 2),
(true, 3, 3),
(true, 4, 4),
(true, 5, 5),
(true, 6, 1),
(true, 7, 2),
(true, 8, 3),
(true, 9, 4),
(false, 10, 5),
(true, 11, 1),
(false, 12, 2),
(false, 13, 3),
(false, 14, 4),
(true, 15, 5);

INSERT INTO secretaria(nome, setor)
VALUES
('Educação', 'Assistência Social'),
('Saúde', 'Assitência Social'),
('Finanças', 'Planejamento Orcamentário'),
('Controladoria', 'Planejamento Orcamentário'),
('Cultura', 'Atividades de Extensão'),
('Obras', 'Urbanismo');

INSERT INTO encaminhamento_reclamacao(id_secretaria, id_reclamacao, id_ouvidor)
VALUES
(6, 1, 1),
(1, 3, 2),
(1, 4, 3),
(2, 5, 4),
(6, 6, 5),
(3, 7, 1),
(5, 8, 2),
(2, 9, 3),
(5, 11, 4),
(4, 15, 5);

INSERT INTO resposta("data", conteudo, id_secretaria, id_reclamacao)
VALUES
('24-11-1994', 'Foi aberta uma licitação para calçar a rua o mais rápido possível', 6, 1),
('01-05-2009', 'Um novo bebedouro foi comprado. Chega em até 7 dias úteis', 1, 3),
('20-11-2015', 'Foi contratado há pouco um ônibus para o transporte dos alunos', 1, 4),
('01-01-2022', 'Um novo lote da vacina acabou de chegar na UBS', 2, 5),
('02-10-1984', 'Já fizemos o contato da equipe de engenharia para analisar o açude', 6, 6),
('07-05-1996', 'A empresa foi multada e sua licitacao cancelada. Os funcionários serao pagos', 3, 7),
('10-03-2009', 'A denúncia foi apurada e o servidor punido', 5, 8),
('20-08-2016', 'Novos repirados foram comprados e serão instalados em breve', 2, 9),
('13-11-1988', 'Uma nova empresa de licitação foi contratada', 5, 11),
('09-09-2017', 'O motorista foi advertido e punido adequadamente.', 4, 15);