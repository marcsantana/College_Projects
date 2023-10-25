-- The most basic commands are distributed in the other files, this file contains the queries



-- SELECT-FROM-WHERE
SELECT * FROM Evento WHERE LOCALIZACAO = 'São Paulo';
--------------------



-- BETWEEN
SELECT * FROM Evento WHERE DATA_INICIO BETWEEN '01-Jan-1950' AND '01-Jan-2000';
--------------------



-- IN
--Selects all songs that were composed by female composers - 'Ana Beatriz' and 'Francisca Silva's CPFs
SELECT * FROM MUSICA WHERE CPF_COMPOSITOR IN ('65924587136', '48759659899');
--------------------



-- LIKE
--Selects all songs that contain the substring 'Kiss' in its title
SELECT * FROM MUSICA WHERE NOME_MUSICA LIKE '%Kiss%';
--------------------



-- IS NULL, LEFT JOIN
--Selects all users that have no compositions
SELECT USUARIO.*
    FROM USUARIO
    LEFT JOIN COMPOSITOR ON USUARIO.CPF = COMPOSITOR.CPF_COMPOSITOR
	LEFT JOIN MUSICA ON COMPOSITOR.CPF_COMPOSITOR = MUSICA.CPF_COMPOSITOR
WHERE
    NOME_MUSICA IS NULL;
--------------------



-- INNER JOIN
--Selects all users that are registered as composers
SELECT USUARIO.*
    FROM USUARIO
    INNER JOIN COMPOSITOR ON USUARIO.CPF = COMPOSITOR.CPF_COMPOSITOR;
--------------------

-- MAX
-- Select composers with most compositions
SELECT U.Nome, COUNT(*) AS "QTDE_MUSICAS"
    FROM Musica M
    INNER JOIN Usuario U ON U.CPF = M.CPF_COMPOSITOR
    GROUP BY (U.Nome)
    HAVING COUNT(*) = (
        SELECT MAX(COUNT(*)) FROM Musica
        GROUP BY (CPF_Compositor)
    );

-- MIN
-- Select composers with less compositions
SELECT U.Nome, COUNT(*) AS "QTDE_MUSICAS"
    FROM Musica M
    INNER JOIN Usuario U ON U.CPF = M.CPF_COMPOSITOR
    GROUP BY (U.Nome)
    HAVING COUNT(*) = (
        SELECT MIN(COUNT(*)) FROM Musica
        GROUP BY (CPF_Compositor)
    );


-- ORDER BY
-- Selects all users and order them by their age
SELECT * 
    FROM USUARIO
    ORDER BY IDADE;
--------------------


-- MIN
-- Selects all users that have the minimum age (the age is limited to 18)
SELECT nome, idade 
    FROM USUARIO
    WHERE idade = (SELECT MIN(idade) FROM Usuario);
--------------------


-- MAX
-- Selects all users that have the biggest age in the database
SELECT nome, idade
    FROM USUARIO
    WHERE idade = (SELECT MAX(idade) FROM Usuario);
-----------------------------


-- AVG
-- Gets the average age of the users table, and this result is round;
SELECT ROUND(AVG(IDADE)) AS AVERAGE_AGE
    FROM USUARIO;


-- GROUP BY
-- Groups the age of the users table; i.e if two users have the same age, the specific COUNT(*) line for this age would be 2;
SELECT idade, COUNT(*) AS Qtd_Usuarios
    FROM USUARIO
    GROUP BY idade;
------------------------


-- HAVING, COUNT
-- Groups the songs by their 'genero', but only the songs that have the 'MPB' genero;
SELECT genero, COUNT(*) AS Qtd_Musica_Genero
	FROM MUSICA
	GROUP BY genero
	HAVING genero LIKE 'MPB';
------------------------------------

-- SUBCONSULTA COM IN, SUBCONSULTA COM OPERADOR RELACIONAL
-- Selects all PATROCINADOR that have published after '01-Jul-2022'
SELECT * FROM PATROCINADOR
WHERE CPF_PATROCINADOR IN (SELECT CPF_PATROCINADOR FROM PUBLICAR WHERE DATA_PUBLICACAO > '01-Jul-2022');
-------------------------

-- SUBCONSULTA COM ANY
-- Selects all USUARIO that has some follower
SELECT * FROM USUARIO WHERE CPF = ANY(SELECT CPF_SEGUIDO FROM SEGUIR);
-------------------------


-- SUBCONSULTA COM ALL
-- Selects all CPF_USUARIO of all USERS that attended to all EVENTO before '01-Jan-1980'
SELECT CPF_USUARIO FROM COMPARECER
WHERE ID_EVENTO = ALL(
    SELECT c.ID_EVENTO FROM COMPARECER c JOIN EVENTO e ON c.ID_EVENTO = e.ID_EVENTO WHERE DATA_INICIO < '01-Jan-1980'
);
-------------------------


-- UNION
-- Selects all CPF that belong to users that have 
--   -attended to all EVENTO before '01-Jan-1980'; or
--   -IDADE > 30
SELECT CPF_USUARIO AS CPF FROM COMPARECER WHERE ID_EVENTO = ALL(SELECT c.ID_EVENTO FROM COMPARECER c JOIN EVENTO e ON c.ID_EVENTO = e.ID_EVENTO WHERE DATA_INICIO < '01-Jan-1980') UNION SELECT CPF FROM USUARIO WHERE IDADE > 30;
--------------------------

-- CREATE VIEW
-- Creates a view to store the current_date minus the date of an event, querying events that happened before 2000
CREATE VIEW TEMPO_DESDE_EVENTOS_ANTIGOS AS SELECT TRUNC(CURRENT_DATE - DATA_INICIO, 0) AS DIAS_DESDE_EVENTO, EVENTO.* FROM EVENTO WHERE DATA_INICIO < '01-Jan-2000';
SELECT * FROM TEMPO_DESDE_EVENTOS_ANTIGOS;
--------------------------

-- CREATE PROCEDURE
-- Procedure to insert Values into the Evento table;
CREATE OR REPLACE PROCEDURE inserir_Evento (
    v_idEven Evento.id_evento%TYPE,
    v_Local Evento.localizacao%TYPE,
    v_dataInicio Evento.data_inicio%TYPE,
    v_dataFim Evento.data_fim%TYPE,
    v_nome Evento.nome%TYPE
) IS
BEGIN
    INSERT INTO Evento VALUES (v_idEven,v_Local,v_dataInicio,v_dataFim,v_nome);
END inserir_Evento;
