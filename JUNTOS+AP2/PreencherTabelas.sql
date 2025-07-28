INSERT INTO Pessoa (nome, sobrenome, email, telefone, senha_hash, data_cadastro) VALUES
('Ana', 'Silva', 'ana.silva@email.com', '11987654321', 'hash123', '2024-01-15'),
('Bruno', 'Souza', 'bruno.souza@email.com', '11987654322', 'hash124', '2024-01-16'),
('Carla', 'Santos', 'carla.santos@email.com', '11987654323', 'hash125', '2024-01-17'),
('Daniel', 'Oliveira', 'daniel.o@email.com', '11987654324', 'hash126', '2024-01-18'),
('Eduarda', 'Costa', 'eduarda.c@email.com', '11987654325', 'hash127', '2024-01-19'),
('Felipe', 'Pereira', 'felipe.p@email.com', '11987654326', 'hash128', '2024-01-20'),
('Giovana', 'Almeida', 'giovana.a@email.com', '11987654327', 'hash129', '2024-01-21'),
('Henrique', 'Lima', 'henrique.l@email.com', '11987654328', 'hash130', '2024-01-22'),
('Isabela', 'Rocha', 'isabela.r@email.com', '11987654329', 'hash131', '2024-01-23'),
('Joao', 'Martins', 'joao.m@email.com', '11987654330', 'hash132', '2024-01-24');

INSERT INTO Pessoa (nome, sobrenome, email, telefone, senha_hash, data_cadastro) VALUES
('Dr. Pedro', 'Gomes', 'pedro.gomes@email.com', '21987654301', 'hash201', '2023-10-01'),
('Dra. Laura', 'Fernandes', 'laura.f@email.com', '21987654302', 'hash202', '2023-10-02'),
('Dr. Marcos', 'Rodrigues', 'marcos.r@email.com', '21987654303', 'hash203', '2023-10-03'),
('Dra. Sofia', 'Carvalho', 'sofia.c@email.com', '21987654304', 'hash204', '2023-10-04'),
('Dr. Lucas', 'Barbosa', 'lucas.b@email.com', '21987654305', 'hash205', '2023-10-05'),
('Dra. Camila', 'Freitas', 'camila.f@email.com', '21987654306', 'hash206', '2023-10-06'),
('Dr. Rafael', 'Dias', 'rafael.d@email.com', '21987654307', 'hash207', '2023-10-07'),
('Dra. Patricia', 'Nunes', 'patricia.n@email.com', '21987654308', 'hash208', '2023-10-08'),
('Dr. Gustavo', 'Ribeiro', 'gustavo.r@email.com', '21987654309', 'hash209', '2023-10-09'),
('Dra. Mariana', 'Costa', 'mariana.c@email.com', '21987654310', 'hash210', '2023-10-10');

INSERT INTO Usuario (id_usuario, data_nascimento, genero) VALUES
(1, '1990-05-20', 'Feminino'),
(2, '1988-11-12', 'Masculino'),
(3, '1995-03-01', 'Feminino'),
(4, '1985-07-25', 'Masculino'),
(5, '2000-01-01', 'Feminino'),
(6, '1992-09-10', 'Masculino'),
(7, '1998-04-15', 'Feminino'),
(8, '1980-06-30', 'Masculino'),
(9, '1993-12-05', 'Feminino'),
(10, '1987-02-18', 'Masculino');

INSERT INTO Psicologo (id_psicologo, crp, bio, especializacao, disponibilidade, status_verificacao) VALUES
(11, 'CRP/01-12345', 'Especialista em TCC', 'Terapia Cognitivo-Comportamental', 'Seg-Sex', 'Verificado'),
(12, 'CRP/01-12346', 'Foco em psicologia positiva', 'Psicologia Positiva', 'Ter-Qui', 'Verificado'),
(13, 'CRP/01-12347', 'Atendimento a adolescentes', 'Psicologia do Desenvolvimento', 'Seg-Qua-Sex', 'Verificado'),
(14, 'CRP/01-12348', 'Experiência em luto', 'Psicologia Humanista', 'Ter-Sex', 'Verificado'),
(15, 'CRP/01-12349', 'Terapia de casal', 'Terapia Familiar', 'Seg-Qui', 'Verificado'),
(16, 'CRP/01-12350', 'Psicologia organizacional', 'Psicologia Organizacional', 'Qua-Sex', 'Verificado'),
(17, 'CRP/01-12351', 'Atendimento infantil', 'Psicologia Infantil', 'Ter-Qui', 'Verificado'),
(18, 'CRP/01-12352', 'Especialista em ansiedade', 'Terapia Breve', 'Seg-Sex', 'Verificado'),
(19, 'CRP/01-12353', 'Foco em estresse', 'Mindfulness', 'Ter-Qui', 'Verificado'),
(20, 'CRP/01-12354', 'Terapia online', 'Psicologia Clínica', 'Seg-Qua-Sex', 'Verificado');

INSERT INTO Encontro (titulo, descricao, tipo_encontro, data_hora, link, id_psicologo) VALUES
('Grupo de Apoio à Ansiedade', 'Discussão sobre técnicas de manejo de ansiedade.', 'Online', '2025-07-28 10:00:00', 'link_ansiedade_1', 11),
('Bem-Estar no Trabalho', 'Dicas para lidar com o estresse profissional.', 'Presencial', '2025-07-29 14:30:00', 'link_trabalho_1', 12),
('Resiliência e Superação', 'Compartilhando experiências de superação.', 'Online', '2025-07-30 18:00:00', 'link_resiliencia_1', 13),
('Mindfulness para Iniciantes', 'Primeiros passos na prática de mindfulness.', 'Online', '2025-07-31 09:00:00', 'link_mindfulness_1', 14),
('Gestão de Emoções', 'Workshop prático sobre controle emocional.', 'Presencial', '2025-08-01 16:00:00', 'link_emocoes_1', 15),
('Apoio ao Luto', 'Espaço seguro para quem está passando pelo luto.', 'Online', '2025-08-02 11:00:00', 'link_luto_1', 16),
('Parentalidade Consciente', 'Desafios e alegrias da criação de filhos.', 'Online', '2025-08-03 15:00:00', 'link_parentalidade_1', 17),
('Autoestima e Autoconfiança', 'Construindo uma imagem positiva de si.', 'Presencial', '2025-08-04 10:30:00', 'link_autoestima_1', 18),
('Superando a Procrastinação', 'Estratégias para aumentar a produtividade.', 'Online', '2025-08-05 19:00:00', 'link_procrastinacao_1', 19),
('Introdução à Terapia', 'Entendendo os benefícios da terapia.', 'Online', '2025-08-06 13:00:00', 'link_terapia_1', 20);

INSERT INTO Participa (id_encontro, id_usuario) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

INSERT INTO Atendimento (id_usuario, id_psicologo, tipo_atendimento, status, observacoes, avaliacao_usuario, feedback_usuario, data_hora_inicio, data_hora_fim) VALUES
(1, 11, 'Individual', 'Concluído', 'Sessão inicial, foco em ansiedade.', 5, 'Excelente atendimento, muito atencioso.', '2025-07-20 09:00:00', '2025-07-20 10:00:00'),
(2, 12, 'Individual', 'Concluído', 'Discussão sobre metas pessoais.', 4, 'Bom suporte, me ajudou a refletir.', '2025-07-21 11:00:00', '2025-07-21 12:00:00'),
(3, 13, 'Individual', 'Pendente', NULL, NULL, NULL, '2025-07-27 15:00:00', NULL),
(4, 14, 'Individual', 'Concluído', 'Sessão sobre estresse no trabalho.', 5, 'Muito profissional e empático.', '2025-07-22 10:00:00', '2025-07-22 11:00:00'),
(5, 15, 'Individual', 'Concluído', 'Primeira sessão sobre relacionamento.', 4, 'Boas orientações.', '2025-07-23 14:00:00', '2025-07-23 15:00:00'),
(6, 16, 'Individual', 'Concluído', 'Acompanhamento de luto.', 5, 'Me senti muito acolhido.', '2025-07-24 09:30:00', '2025-07-24 10:30:00'),
(7, 17, 'Individual', 'Pendente', NULL, NULL, NULL, '2025-07-28 16:00:00', NULL),
(8, 18, 'Individual', 'Concluído', 'Sessão sobre tomada de decisões.', 4, 'Me ajudou a clarear as ideias.', '2025-07-25 11:30:00', '2025-07-25 12:30:00'),
(9, 19, 'Individual', 'Concluído', 'Discussão sobre autoestima.', 5, 'Saí mais confiante da sessão.', '2025-07-26 10:00:00', '2025-07-26 11:00:00'),
(10, 20, 'Individual', 'Pendente', NULL, NULL, NULL, '2025-07-29 13:00:00', NULL);

INSERT INTO Material_de_Apoio_Emocional (titulo, autor, data_publicacao, descricao, tipo_material, url_conteudo, conteudo_texto, palavras_chave) VALUES
('Artigo: Lidando com a Ansiedade', 'Dr. Pedro Gomes', '2024-05-01', 'Um guia completo para gerenciar a ansiedade no dia a dia.', 'Artigo', 'http://link.com/ansiedade', 'Conteúdo do artigo sobre ansiedade...', 'ansiedade, estresse, bem-estar'),
('Vídeo: Técnicas de Relaxamento', 'Dra. Laura Fernandes', '2024-05-10', 'Vídeo com exercícios práticos de relaxamento e respiração.', 'Vídeo', 'http://link.com/relaxamento', NULL, 'relaxamento, respiração, meditação'),
('Áudio: Meditação Guiada para Dormir', 'Dr. Marcos Rodrigues', '2024-05-15', 'Áudio de meditação para auxiliar no sono.', 'Áudio', 'http://link.com/dormir', NULL, 'sono, meditação, insônia'),
('Exercício: Diário de Gratidão', 'Dra. Sofia Carvalho', '2024-05-20', 'Um exercício para praticar a gratidão diariamente.', 'Exercício', NULL, 'Instruções para o diário de gratidão...', 'gratidão, felicidade, positivo'),
('Artigo: O Poder da Resiliência', 'Dr. Lucas Barbosa', '2024-06-01', 'Entenda como desenvolver a capacidade de se recuperar de adversidades.', 'Artigo', 'http://link.com/resiliencia', 'Conteúdo do artigo sobre resiliência...', 'resiliência, superação, força'),
('Vídeo: Comunicação Não-Violenta', 'Dra. Camila Freitas', '2024-06-05', 'Aprenda a se comunicar de forma mais eficaz e empática.', 'Vídeo', 'http://link.com/comunicacao', NULL, 'comunicação, empatia, relacionamento'),
('Áudio: Afirmações Positivas', 'Dr. Rafael Dias', '2024-06-10', 'Série de afirmações para fortalecer a autoestima.', 'Áudio', 'http://link.com/afirmacoes', NULL, 'autoestima, confiança, positivo'),
('Exercício: Planejamento Semanal', 'Dra. Patricia Nunes', '2024-06-15', 'Organize sua semana para reduzir o estresse e aumentar a produtividade.', 'Exercício', NULL, 'Instruções para o planejamento semanal...', 'produtividade, organização, estresse'),
('Artigo: Burnout e Como Evitar', 'Dr. Gustavo Ribeiro', '2024-06-20', 'Identifique os sinais de burnout e aprenda a preveni-lo.', 'Artigo', 'http://link.com/burnout', 'Conteúdo do artigo sobre burnout...', 'burnout, esgotamento, trabalho'),
('Vídeo: Introdução à TCC', 'Dra. Mariana Costa', '2024-06-25', 'Uma breve introdução à Terapia Cognitivo-Comportamental.', 'Vídeo', 'http://link.com/introducao_tcc', NULL, 'TCC, terapia, psicologia');

INSERT INTO Categoria_de_Material (nome_categoria) VALUES
('Ansiedade'),
('Estresse'),
('Relacionamentos'),
('Autoestima'),
('Depressão'),
('Luto'),
('Desenvolvimento Pessoal'),
('Mindfulness'),
('Produtividade'),
('Saúde Mental Geral');

INSERT INTO Material_Categoria (id_material, id_categoria) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 8),
(3, 7),
(4, 7),
(5, 7),
(6, 3),
(7, 4),
(8, 9);
