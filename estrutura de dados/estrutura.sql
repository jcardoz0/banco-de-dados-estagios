-- Criação do banco de dados
CREATE DATABASE faculdadeJJ;
USE faculdadeJJ;

-- 1. Tabela ALUNOS
CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome CHAR(20),
    data_nacimento CHAR(20),
    telefone CHAR(20),
    sexo CHAR(1),
    RG CHAR(20),
    email CHAR(50),
    uf char(2)
);
 -- 2 tabela funcionarios
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento VARCHAR(50),
    sexo CHAR(2),
    data_admissao VARCHAR(50),
    RG CHAR(20),
    salario FLOAT,
    depto CHAR(50),
    cargo VARCHAR(25),
    telefone CHAR(20),
    email VARCHAR(100)
);

-- 3. Tabela NOTAS
CREATE TABLE notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    nota FLOAT,
    id_aluno INT,
    id_funcionario INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

-- 4. Tabela Cursos 
CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    horario CHAR(20),
    data_inicio VARCHAR(50),
    data_termino VARCHAR(50),
    tempo_duracao VARCHAR(50),
    mensalidade char (20),
    id_funcionario int, -- add
	foreign key (id_funcionario) references funcionarios(id_funcionario)
);

-- 5 x'tabela salas
CREATE TABLE salas (
    id_sala INT PRIMARY KEY AUTO_INCREMENT,
    numero_sala INT,
    bloco CHAR(20),
    id_funcionario INT,  -- Refere-se ao responsável pela sala (ex: professor)
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
); 
	
-- 6. Tabela MATRICULAS
CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    data_matricula VARCHAR(50),
    turno VARCHAR(10),
    id_curso INT,
    id_aluno INT,
    id_sala int,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_sala) REFERENCES salas(id_sala)
);

-- 7 tabela fornecedores
create table fornecedores(
	id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor char(50),
	nome_empresa char(30),
    nome_produto varchar(50),
    telefone char(30),
    email char(50),
    UF char(2),
    CNPJ varchar(30)
);

-- 8. Tabela Coordenacao 
CREATE TABLE coordenacao (
    id_coordenacao INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    id_sala int,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
	FOREIGN KEY (id_sala) REFERENCES salas(id_sala)
);

-- 9. Tabela Estagio
CREATE TABLE estagios (
    id_estagio INT PRIMARY KEY AUTO_INCREMENT,
    salario FLOAT,
    data_inicio char(20),
    data_fim char(20),
    status VARCHAR(50),
    id_aluno INT,
    id_funcionario INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

-- 10. Tabela Carta_recomendacao
CREATE TABLE carta_recomendacao (
    id_carta_recomendacao INT PRIMARY KEY AUTO_INCREMENT,
    conteudo varchar(150),
    data_emissao char(20),
    empresa_destino VARCHAR(100),
    id_estagio INT,
    id_aluno INT,
    FOREIGN KEY (id_estagio) REFERENCES estagios(id_estagio),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

-- 11 tabela historicos
CREATE TABLE historicos (
    id_historico INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE,
    media_final FLOAT,
   observacoes VARCHAR(150),
    id_aluno INT,
    id_matricula INT,
    id_estagio INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula),
    FOREIGN KEY (id_estagio) REFERENCES estagios(id_estagio)
);

-- 12 tabela encaminhamentos
CREATE TABLE encaminhamentos (
    id_encaminhamento INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_fornecedor INT,
    data_encaminhamento DATE,
    tipo_encaminhamento VARCHAR(50), 
    status VARCHAR(50),             
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);
-- 13 tabela aulas
  CREATE TABLE aulas (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    id_curso INT,
    id_sala INT, 
    horario CHAR(20),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_sala) REFERENCES salas(id_sala)
);

-- inserindo dados na tabela aluno
INSERT INTO alunos (nome, data_nacimento, telefone, sexo, RG, email, UF) VALUES
('Lucas Almeida', '2001-04-15', '(11) 91234-5678', 'M', '894561237', 'lucas.almeida@email.com', 'SP'),
('Mariana Costa', '2002-06-20', '(21) 98765-4321', 'F', '437892145', 'mariana.costa@email.com', 'RJ'),
('Pedro Henrique', '2000-11-10', '(31) 99876-5432', 'M', '219874563', 'pedro.henrique@email.com', 'MG'),
('Ana Paula', '2003-01-05', '(41) 91122-3344', 'F', '548712369', 'ana.paula@email.com', 'PR'),
('Gabriel Souza', '2001-09-30', '(51) 92233-4455', 'M', '367459821', 'gabriel.souza@email.com', 'RS'),
('Larissa Martins', '2002-03-12', '(61) 93344-5566', 'F', '795146238', 'larissa.martins@email.com', 'DF'),
('Thiago Oliveira', '2000-07-28', '(71) 94455-6677', 'M', '614823975', 'thiago.oliveira@email.com', 'BA'),
('Juliana Pereira', '2003-10-22', '(81) 95566-7788', 'F', '238974561', 'juliana.pereira@email.com', 'PE'),
('Rafael Lima', '2002-12-17', '(91) 96677-8899', 'M', '749582136', 'rafael.lima@email.com', 'PA'),
('Isabela Fernandes', '2001-02-08', '(85) 97788-9900', 'F', '185632974', 'isabela.fernandes@email.com', 'CE'),
('Bruno Cardoso', '2002-05-11', '(62) 98123-4567', 'M', '123456781', 'bruno.cardoso@email.com', 'GO'),
('Camila Ribeiro', '2001-08-19', '(31) 98876-5432', 'F', '234567892', 'camila.ribeiro@email.com', 'MG'),
('Eduardo Menezes', '2003-02-07', '(92) 98765-1234', 'M', '345678903', 'eduardo.menezes@email.com', 'AM'),
('Fernanda Luz', '2000-07-14', '(47) 99876-5432', 'F', '456789014', 'fernanda.luz@email.com', 'SC'),
('Gustavo Nogueira', '2001-11-22', '(67) 99123-4567', 'M', '567890125', 'gustavo.nogueira@email.com', 'MS'),
('Helena Rocha', '2002-09-30', '(95) 98765-4321', 'F', '678901236', 'helena.rocha@email.com', 'RR'),
('Igor Batista', '2003-04-16', '(73) 99234-5678', 'M', '789012347', 'igor.batista@email.com', 'BA'),
('Jéssica Almeida', '2000-03-12', '(84) 99789-1234', 'F', '890123458', 'jessica.almeida@email.com', 'RN'),
('Kaique Duarte', '2001-12-25', '(63) 99678-5432', 'M', '901234569', 'kaique.duarte@email.com', 'TO'),
('Letícia Farias', '2002-10-08', '(83) 99345-6789', 'F', '012345670', 'leticia.farias@email.com', 'PB'),
('Marcelo Sampaio', '2003-01-20', '(82) 99888-7777', 'M', '345672189', 'marcelo.sampaio@email.com', 'AL'),
('Nathalia Rocha', '2001-04-03', '(69) 99777-8888', 'F', '823491237', 'nathalia.rocha@email.com', 'RO'),
('Otávio Ramos', '2002-06-17', '(96) 98555-2222', 'M', '763298312', 'otavio.ramos@email.com', 'AP'),
('Paula Marques', '2000-08-29', '(62) 98444-3333', 'F', '583291346', 'paula.marques@email.com', 'GO'),
('Quirino Ferreira', '2001-10-11', '(79) 98666-1111', 'M', '634812398', 'quirino.ferreira@email.com', 'SE'),
('Renata Barros', '2002-12-06', '(65) 98111-9999', 'F', '129348712', 'renata.barros@email.com', 'MT'),
('Samuel Pires', '2003-03-14', '(68) 99444-2222', 'M', '312847189', 'samuel.pires@email.com', 'AC'),
('Tatiane Leal', '2000-09-18', '(98) 99111-7777', 'F', '789456123', 'tatiane.leal@email.com', 'MA'),
('Ubirajara Monteiro', '2001-06-23', '(66) 99333-5555', 'M', '987654321', 'ubirajara.monteiro@email.com', 'MT'),
('Viviane Silveira', '2002-11-09', '(77) 99222-6666', 'F', '876543219', 'viviane.silveira@email.com', 'BA'),
('Wesley Santos', '2003-02-28', '(86) 99700-1111', 'M', '765432198', 'wesley.santos@email.com', 'PI'),
('Xuxa Andrade', '2000-01-03', '(85) 99600-2222', 'F', '654321987', 'xuxa.andrade@email.com', 'CE'),
('Yuri Borges', '2001-05-12', '(61) 98123-0001', 'M', '543219876', 'yuri.borges@email.com', 'DF'),
('Zuleica Matos', '2002-07-07', '(11) 99234-0002', 'F', '432198765', 'zuleica.matos@email.com', 'SP'),
('Arthur Lopes', '2003-08-21', '(21) 99345-0003', 'M', '321987654', 'arthur.lopes@email.com', 'RJ'),
('Beatriz Ferreira', '2000-10-16', '(31) 99456-0004', 'F', '219876543', 'beatriz.ferreira@email.com', 'MG'),
('Caio Mendes', '2001-03-30', '(51) 99567-0005', 'M', '198765432', 'caio.mendes@email.com', 'RS'),
('Daniele Souza', '2002-06-05', '(41) 99678-0006', 'F', '987654321', 'daniele.souza@email.com', 'PR'),
('Elias Nascimento', '2003-11-13', '(91) 99789-0007', 'M', '876543210', 'elias.nascimento@email.com', 'PA'),
('Fabiana Castro', '2000-04-09', '(81) 99890-0008', 'F', '765432109', 'fabiana.castro@email.com', 'PE'),
('Guilherme Teixeira', '2001-09-01', '(71) 99901-0009', 'M', '654321098', 'guilherme.teixeira@email.com', 'BA'),
('Heloísa Melo', '2002-02-11', '(31) 98112-0010', 'F', '543210987', 'heloisa.melo@email.com', 'MG'),
('Ivan Couto', '2003-12-19', '(24) 98223-0011', 'M', '432109876', 'ivan.couto@email.com', 'RJ'),
('Júlia Barreto', '2001-07-26', '(27) 98334-0012', 'F', '321098765', 'julia.barreto@email.com', 'ES'),
('Kevin Vasconcelos', '2000-06-17', '(19) 98445-0013', 'M', '210987654', 'kevin.vasconcelos@email.com', 'SP'),
('Laura Ribeiro', '2002-05-08', '(11) 98556-0014', 'F', '109876543', 'laura.ribeiro@email.com', 'SP'),
('Matheus Tavares', '2001-01-29', '(48) 98667-0015', 'M', '998877665', 'matheus.tavares@email.com', 'SC'),
('Natália Amorim', '2003-10-04', '(34) 98778-0016', 'F', '887766554', 'natalia.amorim@email.com', 'MG'),
('Otto Vasques', '2002-08-15', '(44) 98889-0017', 'M', '776655443', 'otto.vasques@email.com', 'PR'),
('Patrícia Lima', '2000-12-25', '(16) 98990-0018', 'F', '665544332', 'patricia.lima@email.com', 'SP');

-- inserindo dados na tabela funcionarios
INSERT INTO funcionarios (nome, data_nascimento, sexo, data_admissao, RG, salario, depto, cargo, telefone, email)
VALUES
('Carlos Souza', '10/02/1985', 'M', '01/03/2010', '1122334455', 3500.00, 'Desenvolvimento de Software', 'professor', '(11) 98765-4321', 'carlos.souza@empresa.com'),
('Ana Pereira', '25/11/1990', 'F', '15/07/2015', '2233445566', 4000.00, 'Engenharia de Software', 'professor', '(21) 98765-1234', 'ana.pereira@empresa.com'),
('João Silva', '30/06/1982', 'M', '20/08/2013', '3344556677', 3800.00, 'Análise e Desenvolvimento de Sistemas', 'professor', '(31) 98765-5678', 'joao.silva@empresa.com'),
('Luciana Oliveira', '15/09/1980', 'F', '05/02/2010', '4455667788', 4200.00, 'Ciência da Computação', 'professor', '(41) 98765-8765', 'luciana.oliveira@empresa.com'),
('Ricardo Gomes', '22/03/1978', 'M', '12/10/2012', '5566778899', 4000.00, 'Sistemas de Informação', 'professor', '(51) 98765-2345', 'ricardo.gomes@empresa.com'),
('Marcos Fernandes', '12/04/1975', 'M', '10/01/2008', '6677889900', 6000.00, 'Administração Acadêmica', 'Coordenador Geral', '(61) 98765-3456', 'marcos.fernandes@empresa.com'),
('Fernanda Lima', '05/05/1988', 'F', '20/09/2016', '7788990011', 1800.00, 'Serviços Gerais', 'Auxiliar de Limpeza', '(71) 98765-4567', 'fernanda.lima@empresa.com'),
('Pedro Henrique', '18/12/1992', 'M', '01/03/2020', '8899001122', 2500.00, 'Manutenção Predial', 'Técnico de Manutenção', '(81) 98765-6543', 'pedro.henrique@empresa.com'),
('Renato Costa', '27/10/1980', 'M', '05/06/2011', '1011121314', 2200.00, 'Portaria', 'Porteiro', '(91) 98765-7890', 'renato.costa@empresa.com');


-- inserindo dados na tabela salas 
INSERT INTO salas (numero_sala, bloco, id_funcionario)
VALUES
(101, 'Bloco A', 1), 
(102, 'Bloco B', 2),  
(103, 'Bloco C', 3),
(104, 'Bloco D', 4), 
(105, 'Bloco E', 5); 

-- inserindo dados na tabela coordernacao
INSERT INTO coordenacao (id_funcionario, id_sala)
VALUES
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5);

	-- inserindo dados na tabela cursos
INSERT INTO cursos (nome, horario, data_inicio, mensalidade, data_termino, tempo_duracao, id_funcionario)
VALUES
('Desenvolvimento de Software', '08:00 - 10:00', '01/03/2025', 130.00, '01/07/2025', '4 anos', 1),
('Engenharia de Software', '10:00 - 12:00', '15/03/2025', 4.694, '15/03/2029', '4 anos', 2),
('Análise e Desenvolvimento de Sistemas', '08:00 - 12:00', '01/03/2025', 449.10, '01/08/2027', '2,5 anos', 3),
('Ciência da Computação', '13:00 - 17:00', '01/03/2025', 1.298, '01/03/2029', '4 anos', 4),
('Sistemas de Informação', '08:00 - 12:00', '01/03/2025', 844.00, '01/03/2028', '3 anos', 5);

-- inserindo dados na tabela aulas
INSERT INTO aulas (id_funcionario, id_curso, id_sala, horario)
VALUES
(1, 1, 1, '08:00'),
(2, 2, 2, '10:00'),
(3, 3, 3, '13:00'),
(4, 4, 4, '15:00'),
(5, 5, 5, '17:00');

-- inserindo dados na tabela fornecedores
INSERT INTO fornecedores (nome_fornecedor, nome_empresa, nome_produto, telefone, email, UF, CNPJ)
VALUES
('Maria Oliveira', 'Tech Supplies', 'Computador', '11-998877665', 'maria@tech.com', 'SP', '12.345.678/0001-90'),
('João Silva', 'SoftTech Solutions', 'Software Antivírus', '21-987654321', 'joao@softtech.com', 'RJ', '23.456.789/0001-01'),
('Carlos Santos', 'Inova Tecnologia', 'Monitor LED', '31-976543210', 'carlos@inovatec.com', 'MG', '34.567.890/0001-12'),
('Ana Costa', 'Global Electronics', 'Teclado Mecânico', '41-965432109', 'ana@globalel.com', 'PR', '45.678.901/0001-23'),
('Roberta Lima', 'MegaTech', 'Mouse Sem Fio', '51-954321098', 'roberta@megatech.com', 'RS', '56.789.012/0001-34'),
('Felipe Alves', 'SmartDevices', 'Celular Android', '61-943210987', 'felipe@smartdev.com', 'DF', '67.890.123/0001-45'),
('Juliana Pereira', 'ElectroParts', 'Placa Mãe', '71-932109876', 'juliana@electro.com', 'BA', '78.901.234/0001-56'),
('Eduardo Martins', 'TechPro', 'SSD 500GB', '81-921098765', 'eduardo@techpro.com', 'PE', '89.012.345/0001-67'),
('Patrícia Oliveira', 'SolutionsPro', 'Fonte de Alimentação', '91-910987654', 'patricia@solutpro.com', 'PA', '90.123.456/0001-78'),
('Ricardo Gomes', 'IT Innovations', 'Gabinete PC', '61-920876543', 'ricardo@itinnov.com', 'DF', '01.234.567/0001-89');

-- inserindo dados na tabela notas
INSERT INTO notas (nota, id_aluno, id_funcionario)
VALUES
(8.5, 1, 1),
(7.0, 2, 1),
(6.8, 3, 1),
(9.2, 4, 1),
(5.5, 5, 1),
(7.8, 6, 1),
(6.0, 7, 1),
(8.0, 8, 1),
(7.3, 9, 1),
(9.0, 10, 1),
(9.0, 11, 2), 
(8.5, 12, 2),
(7.8, 13, 2),
(6.9, 14, 2),
(8.2, 15, 2),  
(7.3, 17, 2), 
(8.0, 18, 2),
(6.7, 19, 2),
(7.9, 20, 2),
(8.2, 21, 3),
(7.5, 22, 3),
(9.3, 23, 3), 
(6.8, 24, 3), 
(8.0, 25, 3), 
(7.1, 26, 3), 
(9.4, 27, 3), 
(6.5, 28, 3), 
(8.7, 29, 3), 
(7.9, 30, 3), 
(8.3, 31, 4), 
(7.4, 32, 4), 
(9.0, 33, 4), 
(6.7, 34, 4), 
(8.1, 35, 4), 
(7.9, 36, 4),  
(9.2, 37, 4), 
(6.6, 38, 4),  
(8.4, 39, 4),
(7.0, 40, 4),
(7.5, 41, 5),
(8.2, 42, 5),
(6.9, 43, 5),
(9.1, 44, 5),
(7.6, 45, 5),
(8.0, 46, 5),
(9.3, 47, 5),
(6.8, 48, 5),
(7.7, 49, 5),
(8.5, 50, 5);

-- inserindo dados na tabela estagios
INSERT INTO estagios (salario, data_inicio, data_fim, status, id_aluno, id_funcionario)
VALUES
(1200.00, '2025-01-15', '2025-07-15', 'Concluído', 1, 1),
(1300.00, '2025-02-01', '2025-08-01', 'Em andamento', 2, 2),
(1400.00, '2025-03-10', '2025-09-10', 'Cancelado', 3, 3),
(1500.00, '2025-04-05', '2025-10-05', 'Concluído', 4, 4),
(1600.00, '2025-05-20', '2025-11-20', 'Em análise', 5, 5),
(1700.00, '2025-06-01', '2025-12-01', 'Em andamento', 6, 1),
(1800.00, '2025-07-15', '2026-01-15', 'Concluído', 7, 2),
(1900.00, '2025-08-01', '2026-02-01', 'Contratado', 8, 3),
(2000.00, '2025-09-10', '2026-03-10', 'Em andamento', 9, 4),
(2100.00, '2025-10-15', '2026-04-15', 'Concluído', 10, 5),
(2200.00, '2025-11-01', '2026-05-01', 'Em análise', 11, 1),
(2300.00, '2025-12-01', '2026-06-01', 'Em andamento', 12, 2),
(2400.00, '2026-01-10', '2026-07-10', 'Cancelado', 13, 3),
(2500.00, '2026-02-01', '2026-08-01', 'Em análise', 14, 4),
(2600.00, '2026-03-01', '2026-09-01', 'Contratado', 15, 5),
(2700.00, '2026-04-01', '2026-10-01', 'Concluído', 16, 1),
(2800.00, '2026-05-01', '2026-11-01', 'Em andamento', 17, 2),
(2900.00, '2026-06-01', '2026-12-01', 'Cancelado', 18, 3),
(3000.00, '2026-07-01', '2027-01-01', 'Concluído', 19, 4),
(3100.00, '2026-08-01', '2027-02-01', 'Em análise', 20, 5),
(3200.00, '2026-09-01', '2027-03-01', 'Em andamento', 21, 1),
(3300.00, '2026-10-01', '2027-04-01', 'Concluído', 22, 2),
(3400.00, '2026-11-01', '2027-05-01', 'Contratado', 23, 3),
(3500.00, '2026-12-01', '2027-06-01', 'Em andamento', 24, 4),
(3600.00, '2027-01-01', '2027-07-01', 'Concluído', 25, 5),
(3700.00, '2027-02-01', '2027-08-01', 'Em análise', 26, 1),
(3800.00, '2027-03-01', '2027-09-01', 'Em andamento', 27, 2),
(3900.00, '2027-04-01', '2027-10-01', 'Cancelado', 28, 3),
(4000.00, '2027-05-01', '2027-11-01', 'Em análise', 29, 4),
(4100.00, '2027-06-01', '2027-12-01', 'Contratado', 30, 5),
(4200.00, '2027-07-01', '2028-01-01', 'Em andamento', 31, 1),
(4300.00, '2027-08-01', '2028-02-01', 'Concluído', 32, 2),
(4400.00, '2027-09-01', '2028-03-01', 'Em análise', 33, 3),
(4500.00, '2027-10-01', '2028-04-01', 'Cancelado', 34, 4),
(4600.00, '2027-11-01', '2028-05-01', 'Em andamento', 35, 5),
(4700.00, '2027-12-01', '2028-06-01', 'Concluído', 36, 1),
(4800.00, '2028-01-01', '2028-07-01', 'Em análise', 37, 2),
(4900.00, '2028-02-01', '2028-08-01', 'Em andamento', 38, 3),
(5000.00, '2028-03-01', '2028-09-01', 'Contratado', 39, 4),
(5100.00, '2028-04-01', '2028-10-01', 'Em análise', 40, 5),
(5200.00, '2028-05-01', '2028-11-01', 'Em andamento', 41, 1),
(5300.00, '2028-06-01', '2028-12-01', 'Concluído', 42, 2),
(5400.00, '2028-07-01', '2029-01-01', 'Cancelado', 43, 3),
(5500.00, '2028-08-01', '2029-02-01', 'Em análise', 44, 4),
(5600.00, '2028-09-01', '2029-03-01', 'Em andamento', 45, 5),
(5700.00, '2028-10-01', '2029-04-01', 'Concluído', 46, 1),
(5800.00, '2028-11-01', '2029-05-01', 'Em andamento', 47, 2),
(5900.00, '2028-12-01', '2029-06-01', 'Cancelado', 48, 3),
(6000.00, '2029-01-01', '2029-07-01', 'Contratado', 49, 4),
(6100.00, '2029-02-01', '2029-08-01', 'Em análise', 50, 5);

-- inserindo dados na tabela matriculas
INSERT INTO matriculas (data_matricula, turno, id_curso, id_aluno)
VALUES
('15/01/2025', 'Manhã', 1, 1),  
('18/01/2025', 'Manhã', 1, 2),
('20/01/2025', 'Manhã', 1, 3),
('25/01/2025', 'Manhã', 1, 4),
('28/01/2025', 'Manhã', 1, 5),
('01/02/2025', 'Manhã', 1, 6),
('04/02/2025', 'Manhã', 1, 7),
('06/02/2025', 'Manhã', 1, 8),
('09/02/2025', 'Manhã', 1, 9),
('12/02/2025', 'Manhã', 1, 10),
('17/01/2025', 'Tarde', 2, 11),
('20/01/2025', 'Tarde', 2, 12),
('23/01/2025', 'Tarde', 2, 13),
('26/01/2025', 'Tarde', 2, 14),
('29/01/2025', 'Tarde', 2, 15),
('02/02/2025', 'Tarde', 2, 16),
('05/02/2025', 'Tarde', 2, 17),
('08/02/2025', 'Tarde', 2, 18),
('11/02/2025', 'Tarde', 2, 19),
('14/02/2025', 'Tarde', 2, 20),
('19/01/2025', 'Noite', 3, 21),
('22/01/2025', 'Noite', 3, 22),
('25/01/2025', 'Noite', 3, 23),
('28/01/2025', 'Noite', 3, 24),
('31/01/2025', 'Noite', 3, 25),
('03/02/2025', 'Noite', 3, 26),
('06/02/2025', 'Noite', 3, 27),
('09/02/2025', 'Noite', 3, 28),
('12/02/2025', 'Noite', 3, 29),
('15/02/2025', 'Noite', 3, 30),
('16/01/2025', 'Manhã', 4, 31),
('18/01/2025', 'Manhã', 4, 32),
('21/01/2025', 'Manhã', 4, 33),
('24/01/2025', 'Manhã', 4, 34),
('27/01/2025', 'Manhã', 4, 35),
('30/01/2025', 'Manhã', 4, 36),
('02/02/2025', 'Manhã', 4, 37),
('05/02/2025', 'Manhã', 4, 38),
('08/02/2025', 'Manhã', 4, 39),
('11/02/2025', 'Manhã', 4, 40),
('13/01/2025', 'Tarde', 5, 41),
('16/01/2025', 'Tarde', 5, 42),
('19/01/2025', 'Tarde', 5, 43),
('22/01/2025', 'Tarde', 5, 44),
('25/01/2025', 'Tarde', 5, 45),
('28/01/2025', 'Tarde', 5, 46),
('31/01/2025', 'Tarde', 5, 47),
('03/02/2025', 'Tarde', 5, 48),
('06/02/2025', 'Tarde', 5, 49),
('09/02/2025', 'Tarde', 5, 50);

-- inserindo dados na tabela historicos
INSERT INTO historicos (data_emissao, media_final, observacoes, id_aluno, id_matricula, id_estagio)
VALUES
('2025-07-01', 8.5, 'Aprovado com excelente desempenho', 1, 1, 1),
('2025-08-15', 7.2, 'Aprovado, mas com necessidade de melhorias em algumas matérias', 2, 2, 2),
('2025-09-10', 6.9, 'Aprovado com dificuldades em algumas disciplinas', 3, 3, 3),
('2025-10-05', 9.0, 'Aprovado com excelente desempenho', 4, 4, 4),
('2025-11-20', 8.0, 'Aprovado, sem dificuldades significativas', 5, 5, 5),
('2025-12-01', 7.8, 'Aprovado, mas com observações em algumas áreas de conhecimento', 6, 6, 6),
('2026-01-15', 8.7, 'Aprovado com bons resultados nas avaliações', 7, 7, 7),
('2026-02-01', 9.2, 'Aprovado com desempenho excelente e participação ativa', 8, 8, 8),
('2026-03-01', 6.5, 'Aprovado com dificuldades em determinadas áreas', 9, 9, 9),
('2026-04-10', 7.0, 'reprovado com muita dificuldade em todos as materias', 10, 10, 10),
('2026-05-01', 8.0, 'Aprovado com bom desempenho geral', 11, 11, 11),
('2026-06-01', 7.5, 'Aprovado, mas com necessidade de melhorar na parte teórica', 12, 12, 12),
('2026-07-01', 6.8, 'Aprovado com dificuldades nas avaliações práticas', 13, 13, 13),
('2026-08-01', 8.9, 'Aprovado com desempenho excelente, destaque em várias áreas', 14, 14, 14),
('2026-09-01', 7.0, 'Aprovado com dificuldades significativas em algumas disciplinas', 15, 15, 15),
('2026-10-01', 8.3, 'Aprovado com bom aproveitamento, porém com margens para melhoria', 16, 16, 16),
('2026-11-01', 9.1, 'Aprovado com desempenho excelente, superando as expectativas', 17, 17, 17),
('2026-12-01', 8.2, 'Aprovado com bom desempenho, precisa melhorar a comunicação', 18, 18, 18),
('2027-01-01', 6.7, 'Aprovado, mas com dificuldades em temas avançados', 19, 19, 19),
('2027-02-01', 6.4, 'reprovado, desempenho médio em todas as áreas', 20, 20, 20),
('2027-03-01', 9.0, 'Aprovado com alto desempenho, bom trabalho em equipe', 21, 21, 21),
('2027-04-01', 7.1, 'Aprovado, mas precisa melhorar a organização e pontualidade', 22, 22, 22),
('2027-05-01', 8.5, 'Aprovado com bom desempenho geral, com destaque em gestão de projetos', 23, 23, 23),
('2027-06-01', 9.3, 'Aprovado com excelente desempenho, sempre proativo e participativo', 24, 24, 24),
('2027-07-01', 8.4, 'Aprovado, bom desempenho, mas precisa trabalhar melhor a prática', 25, 25, 25),
('2027-08-01', 7.6, 'Aprovado com dificuldades na parte prática, mas bom desempenho teórico', 26, 26, 26),
('2027-09-01', 6.9, 'Aprovado, mas com performance inconsistente nas avaliações', 27, 27, 27),
('2027-10-01', 8.0, 'Aprovado, desempenho bom, mas com espaço para melhorar nas interações em equipe', 28, 28, 28),
('2027-11-01', 9.0, 'Aprovado, desempenho excelente, demonstrou grande envolvimento no estágio', 29, 29, 29),
('2027-12-01', 4.6, 'reprovado com mau desempenho nas provas práticas e teóricas', 30, 30, 30),
('2028-01-01', 7.4, 'Aprovado, mas apresentou dificuldades nas disciplinas mais técnicas', 31, 31, 31),
('2028-02-01', 8.2, 'Aprovado, com desempenho satisfatório em todas as áreas', 32, 32, 32),
('2028-03-01', 7.0, 'Aprovado, mas com dificuldades no desenvolvimento de projetos', 33, 33, 33),
('2028-04-01', 8.5, 'Aprovado, demonstrou grande melhora no segundo semestre', 34, 34, 34),
('2028-05-01', 9.0, 'Aprovado com excelente desempenho e participação ativa em todas as atividades', 35, 35, 35),
('2028-06-01', 8.7, 'Aprovado, bom desempenho em provas, precisa melhorar o trabalho em grupo', 36, 36, 36),
('2028-07-01', 6.8, 'Aprovado, mas teve desempenho inconsistente ao longo do semestre', 37, 37, 37),
('2028-08-01', 8.1, 'Aprovado, bom desempenho nas provas, mas com algumas falhas em atividades práticas', 38, 38, 38),
('2028-09-01', 7.9, 'Aprovado, apresentou boa evolução nas últimas semanas do estágio', 39, 39, 39),
('2028-10-01', 6.4, 'reprovado, com mal desempenho no geral e mau relacionamento com a equipe', 40, 40, 40),
('2028-11-01', 9.0, 'Aprovado, excelente desempenho, fez contribuições valiosas no estágio', 41, 41, 41),
('2028-12-01', 8.2, 'Aprovado, boa performance, mas poderia ter se dedicado mais na parte prática', 42, 42, 42),
('2029-01-01', 7.5, 'Aprovado, mas com desempenho abaixo da média nas provas', 43, 43, 43),
('2029-02-01', 8.3, 'Aprovado, com bom desempenho em provas, precisando melhorar em atividades de grupo', 44, 44, 44),
('2029-03-01', 6.6, 'Aprovado, mas apresentou dificuldades com projetos mais complexos', 45, 45, 45),
('2029-04-01', 9.2, 'Aprovado com excelente desempenho nas avaliações finais', 46, 46, 46),
('2029-05-01', 7.8, 'Aprovado, mas com dificuldade nas atividades práticas', 47, 47, 47),
('2029-06-01', 8.0, 'Aprovado, mas com mais desenvolvimento necessário nas tarefas em grupo', 48, 48, 48),
('2029-07-01', 8.6, 'Aprovado, com bom desempenho nas avaliações e ótima colaboração no estágio', 49, 49, 49),
('2029-08-01', 5.2, 'reprovado, desempenho baixo nas provas e com dificuldades na comunicação em grupo', 50, 50, 50);

-- inserindo dados na tabela carta_recomendacao
INSERT INTO carta_recomendacao (conteudo, data_emissao, empresa_destino, id_estagio, id_aluno) VALUES
('Aluno apresentou excelente desempenho técnico em desenvolvimento de software.', '2025-01-15', 'CodeWave Solutions', 1, 1),
('Demonstra habilidades excepcionais em programação e trabalho em equipe.', '2025-02-10', 'CloudBridge Tech', 2, 2),
('Sempre pontual e comprometido, com domínio em tecnologias web modernas.', '2025-02-20', 'DevCore Systems', 3, 3),
('Superou expectativas ao liderar parte do projeto de integração de APIs.', '2025-03-05', 'NextLevel Software', 4, 4),
('Aluno destacou-se pelo raciocínio lógico e uso eficaz de metodologias ágeis.', '2025-03-18', 'ByteWorks Digital', 5, 5),
('Recomendamos fortemente o aluno para futuras oportunidades em TI.', '2025-04-01', 'Infinity Code Labs', 6, 6),
('Mostrou excelente capacidade de adaptação em ambientes com microserviços.', '2025-04-12', 'NetPrime Solutions', 7, 7),
('Contribuiu significativamente no desenvolvimento de aplicações mobile.', '2025-04-25', 'SoftEdge Technologies', 8, 8),
('Aluno com perfil inovador, domínio de bancos de dados e ótima comunicação.', '2025-05-05', 'Quantum IT Group', 9, 9),
('Demonstrou maturidade profissional em projetos de segurança da informação.', '2025-05-15', 'SecureNet Corp.', 10, 10),
('Aluno demonstrou excelente habilidade com algoritmos e estruturas de dados.', '2024-02-14', 'LogicMind Tech', 11, 11),
('Participou de projeto de automação que otimizou tempo da equipe em 30%.', '2024-03-03', 'AutoFlow Technologies', 12, 12),
('Mostrou domínio em desenvolvimento fullstack com JavaScript.', '2024-01-28', 'StackWay Solutions', 13, 13),
('Trabalhou na integração de sistemas legados com novas APIs.', '2024-06-19', 'LegacyBridge', 14, 14),
('Aluno proativo, aprendeu rapidamente novas bibliotecas e frameworks.', '2024-07-05', 'CodeLeap TI', 15, 15),
('Contribuiu significativamente na revisão de código e boas práticas.', '2024-09-11', 'DevReview Systems', 16, 16),
('Desenvolveu scripts que automatizaram rotinas críticas.', '2024-08-22', 'Scriptify Labs', 17, 17),
('Aluno mostrou ótimo raciocínio lógico e autonomia em tarefas complexas.', '2024-10-30', 'LogicNest Solutions', 18, 18),
('Responsável por melhorias em segurança de aplicações web.', '2024-12-05', 'SafeLayer Security', 19, 19),
('Participou do desenvolvimento de painéis de BI interativos.', '2025-01-09', 'InsightWave Analytics', 20, 20),
('Aluno com excelente organização e atenção a detalhes.', '2025-01-25', 'PixelLogic Tech', 21, 21),
('Destacou-se na equipe de desenvolvimento ágil usando Kanban.', '2025-02-05', 'AgileStack Solutions', 22, 22),
('Teve papel fundamental na criação de microserviços REST.', '2025-02-18', 'MicroTech Labs', 23, 23),
('Mostrou grande interesse em engenharia de software.', '2025-03-02', 'CodeFlow Engineering', 24, 24),
('Aluno com forte capacidade de aprendizado em ambientes de pressão.', '2025-03-12', 'BrightWare Systems', 25, 25),
('Contribuiu para a modelagem de banco de dados relacional.', '2025-03-20', 'DataCore Solutions', 26, 26),
('Responsável por testes automatizados com cobertura ampla.', '2025-04-03', 'AutoTest Digital', 27, 27),
('Aluno com excelente comunicação e colaboração com o time.', '2025-04-15', 'TeamCode Systems', 28, 28),
('Trabalhou com tecnologias modernas como Docker e Kubernetes.', '2025-04-28', 'ContainerLogic', 29, 29),
('Aluno envolvido em projeto de migração para nuvem AWS.', '2025-05-08', 'CloudSphere Tech', 30, 30),
('Estagiário com perfil analítico e raciocínio rápido.', '2025-05-18', 'ThinkData Solutions', 31, 31),
('Desenvolveu melhorias em usabilidade de aplicações internas.', '2024-11-11', 'UXNova', 32, 32),
('Trabalhou na manutenção de aplicações Java com Spring Boot.', '2024-10-20', 'SpringWave Inc.', 33, 33),
('Aluno com ótimo desempenho em ambientes colaborativos remotos.', '2024-09-27', 'RemoteCode Labs', 34, 34),
('Participou da criação de sistemas internos baseados em PHP.', '2024-08-19', 'WebStruct TI', 35, 35),
('Mostrou domínio de controle de versão com Git e GitLab.', '2024-07-23', 'VersionSync', 36, 36),
('Aluno foi responsável por documentar processos técnicos importantes.', '2024-06-15', 'TechDocs Solutions', 37, 37),
('Destacou-se no desenvolvimento mobile com Flutter.', '2024-05-20', 'AppForge TI', 38, 38),
('Participou de hackathon interno e criou uma solução premiada.', '2024-04-10', 'HackInnovate', 39, 39),
('Aluno contribuiu para arquitetura de APIs escaláveis.', '2024-03-21', 'ScaleNet Systems', 40, 40),
('Demonstrou domínio em análise de requisitos e testes funcionais.', '2024-02-28', 'QAPro Tech', 41, 41),
('Aluno apresentou iniciativa e autonomia em projetos complexos.', '2024-01-09', 'SelfCode TI', 42, 42),
('Auxiliou na criação de interface responsiva com boas práticas de UI/UX.', '2024-12-20', 'FrontEndWise', 43, 43),
('Participou ativamente da resolução de bugs críticos em produção.', '2024-11-04', 'BugFix Labs', 44, 44),
('Estagiário com perfil técnico sólido e pensamento lógico.', '2024-10-12', 'SysLogix', 45, 45),
('Aluno ajudou a melhorar a performance de consultas SQL complexas.', '2024-09-02', 'QueryForce Solutions', 46, 46),
('Envolvido em testes de stress e segurança da aplicação.', '2024-08-14', 'StressTest Corp.', 47, 47),
('Aluno atuou em ambiente DevOps com CI/CD e pipelines.', '2024-07-06', 'DeployReady', 48, 48),
('Criou documentação para APIs REST e processos internos.', '2024-06-08', 'DocuAPI Tech', 49, 49),
('Aluno demonstrou maturidade e forte capacidade de adaptação.', '2024-05-01', 'NextLogic Systems', 50, 50);

-- inserindo dados na tabela encaminhamentos
INSERT INTO encaminhamentos (id_aluno, id_fornecedor, data_encaminhamento, tipo_encaminhamento, status) VALUES
(1, 1, '2025-03-15', 'Estágio', 'Encaminhado'),
(2, 3, '2025-03-20', 'Emprego', 'Em análise'),
(3, 2, '2025-03-22', 'Estágio', 'Contratado'),
(4, 4, '2025-03-25', 'Projeto', 'Encaminhado'),
(5, 1, '2025-04-01', 'Emprego', 'Contratado'),
(6, 2, '2025-04-10', 'Estágio', 'Em análise'),
(7, 5, '2025-04-15', 'Projeto', 'Encaminhado'),
(8, 3, '2025-04-18', 'Emprego', 'Encaminhado'),
(9, 4, '2025-04-25', 'Estágio', 'Contratado'),
(10, 5, '2025-05-05', 'Projeto', 'Em análise'),
(11, 1, '2025-05-08', 'Estágio', 'Encaminhado'),
(12, 2, '2025-05-09', 'Emprego', 'Contratado'),
(13, 3, '2025-05-10', 'Projeto', 'Encaminhado'),
(14, 4, '2025-05-11', 'Trainee', 'Em análise'),
(15, 5, '2025-05-12', 'Capacitação em Cloud', 'Encaminhado'),
(16, 1, '2025-05-13', 'Hackathon', 'Encaminhado'),
(17, 2, '2025-05-14', 'Residência Técnica', 'Em análise'),
(18, 3, '2025-05-15', 'Estágio', 'Encaminhado'),
(19, 4, '2025-05-16', 'Emprego', 'Contratado'),
(20, 5, '2025-05-17', 'Projeto', 'Encaminhado'),
(21, 1, '2025-05-18', 'Estágio', 'Em análise'),
(22, 2, '2025-05-19', 'Trainee', 'Encaminhado'),
(23, 3, '2025-05-20', 'Bootcamp de Programação', 'Contratado'),
(24, 4, '2025-05-21', 'Capacitação em DevOps', 'Encaminhado'),
(25, 5, '2025-05-22', 'Mentoria em TI', 'Encaminhado'),
(26, 1, '2025-05-23', 'Projeto', 'Em análise'),
(27, 2, '2025-05-24', 'Estágio', 'Contratado'),
(28, 3, '2025-05-25', 'Emprego', 'Encaminhado'),
(29, 4, '2025-05-26', 'Hackathon', 'Encaminhado'),
(30, 5, '2025-05-27', 'Residência em Desenvolvimento', 'Em análise'),
(31, 1, '2025-05-28', 'Estágio', 'Contratado'),
(32, 2, '2025-05-29', 'Capacitação em Segurança', 'Encaminhado'),
(33, 3, '2025-05-30', 'Emprego', 'Em análise'),
(34, 4, '2025-06-01', 'Projeto', 'Encaminhado'),
(35, 5, '2025-06-02', 'Trainee', 'Encaminhado'),
(36, 1, '2025-06-03', 'Estágio', 'Em análise'),
(37, 2, '2025-06-04', 'Capacitação em Dados', 'Contratado'),
(38, 3, '2025-06-05', 'Bootcamp de Backend', 'Encaminhado'),
(39, 4, '2025-06-06', 'Hackathon', 'Encaminhado'),
(40, 5, '2025-06-07', 'Projeto', 'Encaminhado'),
(41, 1, '2025-06-08', 'Residência em TI', 'Encaminhado'),
(42, 2, '2025-06-09', 'Estágio', 'Contratado'),
(43, 3, '2025-06-10', 'Mentoria em Desenvolvimento', 'Encaminhado'),
(44, 4, '2025-06-11', 'Emprego', 'Em análise'),
(45, 5, '2025-06-12', 'Capacitação em Testes', 'Encaminhado'),
(46, 1, '2025-06-13', 'Estágio', 'Contratado'),
(47, 2, '2025-06-14', 'Projeto', 'Encaminhado'),
(48, 3, '2025-06-15', 'Bootcamp de Fullstack', 'Encaminhado'),
(49, 4, '2025-06-16', 'Emprego', 'Encaminhado'),
(50, 5, '2025-06-17', 'Hackathon', 'Em análise');