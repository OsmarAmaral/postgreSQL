CREATE TABLE tbUsuario (
  id_usuario INT PRIMARY KEY,
  nome_usuario VARCHAR(255) NOT NULL,
  email_usuario VARCHAR(255) NOT NULL UNIQUE,
  senha_usuario VARCHAR(255) NOT NULL,
  estado_usuario VARCHAR(2) NOT NULL
  );

INSERT INTO tbUsuario(id_usuario, nome_usuario, email_usuario, senha_usuario, estado_usuario)
VALUES (01, 'Osmar Araujo', 'osmar@gmail.com', 'secretPassword', 'MT'),
       (02, 'Leonardo Leite', 'leo@gmail.com', 'leagueOfLengends', 'MT'),
       (03, 'Iago Bortoluzzi', 'bortoluzzi@gmail.com', '#TADS2026', 'MT'),
       (04, 'Iago Folleto', 'folleto@gmail.com', 'uniaoBolicheClub', 'MT'),
       (05, 'Pedro Alvez', 'pedro@gmail.com', 'pedro@gmail.com', 'MT'),
       (06, 'Guilherme Simões', 'simoes@hotmail.com', '_maç0nico$', 'BH'),
       (07, 'João Vicent', 'cardoso@gmail.com', 'xbox2332', 'MT'),
       (08, 'João pedregozo', 'joao@correios.com','age_of_empires123',  'MT'),
       (09, 'Victor Generoso', 'victor@gmail.com', 'mainTristana', 'MT'),
       (10, 'Lucas Morais', 'morais@gmail.com', 'brownye', 'MT');
       
