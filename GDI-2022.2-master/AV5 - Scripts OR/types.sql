/* 
      Usuário:
            - o atributo Endereço será limitado para 2: um endereço residencial e um endereço comercial. Usaremos VARRAY(2) para esse atributo.
            - o atributo Telefone será do tipo NESTED TABLE.

            
      Patrocinador, Músico e Compositor:
            - serão herança de Usuário (uso do comando UNDER)

      

*/

/* 
      Criação dos tipos
*/

-- Criação do tipo telefone
CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
      numero VARCHAR2(10),
      rua VARCHAR2(200),
      cidade VARCHAR2(40),
      estado VARCHAR2(2),
      CEP VARCHAR2(8),
      pais VARCHAR2(30)
);
/

-- Alter type para modificar o tamanho do atributo Estado, para inserção do nome completo do estado ao invés da UF
ALTER TYPE tp_endereco MODIFY ATTRIBUTE estado VARCHAR2(40) CASCADE;
/

-- Criação do VARRAY tp_enderecos de tamanho 2, usando o tipo tp_endereco
CREATE OR REPLACE TYPE v_enderecos AS VARRAY(2) OF tp_endereco;
/


-- Criação do tipo telefone
CREATE OR REPLACE TYPE tp_fone AS OBJECT (
      numero VARCHAR2(12)
);
/

-- Criação do tipo NESTED TABLE do tipo tp_fone
CREATE TYPE tp_nt_fone AS TABLE OF tp_fone;
/

-- Criação do tipo usuário
CREATE OR REPLACE TYPE tp_usuario AS OBJECT (
      nome VARCHAR2(100),
      idade NUMBER,
      cpf VARCHAR2(11),
      lista_enderecos v_enderecos,
      lista_fones tp_nt_fone,

      NOT INSTANTIABLE MEMBER PROCEDURE exibirInfoProfissional(SELF tp_usuario),
      FINAL MEMBER PROCEDURE exibirDetalhes (SELF tp_usuario),
      MAP MEMBER FUNCTION ordemAlfabetica RETURN VARCHAR2
) NOT FINAL NOT INSTANTIABLE;
/

-- Criação do body do tp_usuario
CREATE OR REPLACE TYPE BODY tp_usuario AS

-- Esse procedure vai exibir nome, idade e cpf de um usuário específico
      FINAL MEMBER PROCEDURE exibirDetalhes (SELF tp_usuario) IS 
      BEGIN
            DBMS_OUTPUT.PUT_LINE('Nome: '|| nome);
            DBMS_OUTPUT.PUT_LINE('Idade: '|| idade);
            DBMS_OUTPUT.PUT_LINE('CPF: '|| cpf);
      END;

      MAP MEMBER FUNCTION ordemAlfabetica RETURN VARCHAR2 IS
      BEGIN
            RETURN nome;
      END;
END;
/

-- Criação da tabela tb_usuario do tipo de objeto tp_usuario
CREATE TABLE tb_usuario OF tp_usuario (
      cpf PRIMARY KEY,
      
      CHECK (idade >= 18)    

) NESTED TABLE lista_fones STORE AS tb_lista_fones;
/

-- Esse procedure foi criado para chamar o método acima, a partir de um cpf dado como parâmetro. Dará erro se o cpf não existir na tabela tb_usuario
CREATE OR REPLACE PROCEDURE showDetails (v_cpf VARCHAR2) 
IS
      usuarioToShow tp_usuario;
BEGIN
      SELECT VALUE(u) INTO usuarioToShow FROM tb_usuario u WHERE u.cpf = v_cpf;
      usuarioToShow.exibirDetalhes();
END;
/



-- Criação do subtipo usuário comum
CREATE OR REPLACE TYPE tp_usuario_comum UNDER TP_USUARIO (
      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_usuario_comum)
) FINAL;
/

-- Criação do corpo do tp_usuario_comum
CREATE OR REPLACE TYPE BODY tp_usuario_comum AS
      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_usuario_comum) IS
      BEGIN
            SELF.exibirDetalhes();
            DBMS_OUTPUT.PUT_LINE('Sem ocupação relevante');
      END;
END;
/


-- Criação do subtipo Compositor
CREATE TYPE tp_compositor UNDER tp_usuario (
      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_compositor)
) FINAL;
/

CREATE OR REPLACE TYPE BODY tp_compositor AS
      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_compositor) IS
      BEGIN
            SELF.exibirDetalhes();
            DBMS_OUTPUT.PUT_LINE('Ocupação: Compositor');
      END;
END;
/

-- Criação do subtipo Músico
CREATE OR REPLACE TYPE tp_musico UNDER tp_usuario (
      nome_artistico VARCHAR2(100),

      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_musico),
      OVERRIDING MAP MEMBER FUNCTION ordemAlfabetica RETURN VARCHAR2
) FINAL;
/


CREATE OR REPLACE TYPE BODY tp_musico AS
      
      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_musico) IS
      BEGIN
            SELF.exibirDetalhes();
            DBMS_OUTPUT.PUT_LINE('Ocupação: Músico');
      END;

      -- Essa função vai ordenar os músicos pelo seu nome artistico
      OVERRIDING MAP MEMBER FUNCTION ordemAlfabetica RETURN VARCHAR2 IS
      BEGIN
            RETURN nome_artistico;
      END;
END;
/
      

-- Criação do subtipo Patrocinador 
CREATE TYPE tp_patrocinador UNDER tp_usuario (
      nome_fantasia VARCHAR2(100),
      CNPJ VARCHAR2(14),

      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_patrocinador)
) FINAL;
/

CREATE OR REPLACE TYPE BODY tp_patrocinador AS
      OVERRIDING MEMBER PROCEDURE exibirInfoProfissional(SELF tp_patrocinador) IS
      BEGIN
            SELF.exibirDetalhes();
            DBMS_OUTPUT.PUT_LINE('Ocupação: Patrocinador');
      END;
END;
/

-- Criação do tipo evento.
CREATE OR REPLACE TYPE tp_evento AS OBJECT (
      ID_Evento VARCHAR2(10),
      Localizacao VARCHAR2(25),
      Data_Inicio DATE,
      Duracao NUMBER, -- um evento pode durar até 1 ano (366 dias para ano bissexto)
      Nome VARCHAR2(30),
      
      CONSTRUCTOR FUNCTION tp_evento(
            id VARCHAR2,
            loc VARCHAR2,
            dat_ini DATE,
            Data_Final DATE,
            nom VARCHAR2
      ) RETURN SELF AS RESULT,

      ORDER MEMBER FUNCTION comparaDuracao (X tp_evento) RETURN INTEGER
);
/

-- Corpo do tipo tp_evento
CREATE OR REPLACE TYPE BODY tp_evento AS 
      CONSTRUCTOR FUNCTION tp_evento (id VARCHAR2, loc VARCHAR2, dat_ini DATE, Data_Final DATE, nom VARCHAR2) RETURN SELF AS RESULT
      IS
      BEGIN
            SELF.ID_Evento := id;
            SELF.Localizacao := loc;
            SELF.Data_Inicio := dat_ini;
            SELF.Nome := nom;
            SELF.Duracao := 1 + Data_Final - dat_ini;
            RETURN;
      END;

      ORDER MEMBER FUNCTION comparaDuracao (X tp_evento) RETURN INTEGER 
      IS
      BEGIN
            RETURN self.duracao - x.duracao;
      END;
END;
/


-- Criação da tabela de eventos.
CREATE TABLE tb_eventos OF tp_evento (
      ID_Evento primary key,
      Localizacao not null,
      Data_Inicio not null,
      Duracao not null, 
      Nome not null,


      CHECK (Duracao > 0)
);
/


-- Inserir isso dentro de um procedure, que tem dois parametros (id_evento1, id_evento2), como o procedimento da linha 74
CREATE OR REPLACE PROCEDURE compareDurationEventos(id_evento1 tb_eventos.id_evento%type, id_evento2 tb_eventos.id_evento%type)
IS
      evento1 tp_evento;
      result number;
BEGIN
      SELECT VALUE(e) INTO evento1 FROM tb_eventos e WHERE e.id_evento = id_evento1;

      SELECT evento2.comparaDuracao(evento1) INTO result FROM tb_eventos evento2 WHERE evento2.id_evento = id_evento2;

      IF (result > 0) THEN
            DBMS_OUTPUT.PUT_LINE('O evento 2 tem mais duração que o evento 1');
      ELSIF (result < 0) THEN
            DBMS_OUTPUT.PUT_LINE('O evento 1 tem mais duração que o evento 2');
      ELSE
            DBMS_OUTPUT.PUT_LINE('Os eventos possuem a mesma duração');
      END IF;
END;
/

-- Criação do tipo conta
CREATE OR REPLACE TYPE tp_conta AS OBJECT (
      usuario VARCHAR2(30),
      senha VARCHAR2(40),
      email VARCHAR2(100),
      cpf_usuario VARCHAR2(11)
) FINAL;
/

-- Criação do tipo música
CREATE OR REPLACE TYPE tp_musica AS OBJECT (
      nome VARCHAR2(100),
      cpf_compositor VARCHAR2(11),
      genero VARCHAR2(60),
      ano DATE
) FINAL;
/

-- Criação do tipo seguir
CREATE OR REPLACE TYPE tp_seguir AS OBJECT (
      cpf_seguido REF tp_usuario,
      cpf_seguidor REF tp_usuario
) FINAL;
/

/* 
      ------------------------ Criação de tabelas ----------------------------------------

*/

-- Criação da tabela de contas.
CREATE TABLE tb_contas OF tp_conta (
      usuario PRIMARY KEY,
      CONSTRAINT tb_contas_fk FOREIGN KEY (cpf_usuario) REFERENCES tb_usuario(cpf)
);
/

CREATE TABLE tb_musicos OF tp_musico (
      cpf PRIMARY KEY
) NESTED TABLE lista_fones STORE AS tb_lista_fones_musicos;
/

-- Criação da tabela de compositores
CREATE TABLE tb_compositores OF tp_compositor (
    cpf PRIMARY KEY
) NESTED TABLE lista_fones STORE AS tb_lista_fones_compositores;
/

-- Criação da tabela de músicas
CREATE TABLE tb_musicas OF tp_musica (
      CONSTRAINT Musica_pkey PRIMARY KEY (nome,cpf_compositor),
      CONSTRAINT tb_musicas_fk FOREIGN KEY (cpf_compositor) REFERENCES tb_compositores(cpf)
);
/

-- Criação da tabela tp_seguir
CREATE TABLE tb_seguir OF tp_seguir (
      -- scope is E ROWID tão redundantes, mas fazer oq né ¯\_(ツ)_/¯
      cpf_seguido SCOPE IS tb_usuario,
      cpf_seguidor WITH ROWID REFERENCES tb_usuario
);
/

/* 
      ----------------------------- Povoamento das tabelas -------------------------------------
*/

-- Inserção na tabela Eventos
INSERT INTO tb_eventos (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME) 
VALUES ( 'A123456789', 'São Paulo', '28-Jul-2022', 4, 'Lollapalooza 2022');

INSERT INTO tb_eventos (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('B987654321','Rio de Janeiro', '02-Sep-2022', 10, 'Rock In Rio IX');

INSERT INTO tb_eventos (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('C897645231','Olinda', '18-Feb-2023', 4, 'Carvalheira 2023');

INSERT INTO tb_eventos (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('D898845231', 'Recife', '17-Feb-2023', 5, 'Carnaval Recife');

INSERT INTO tb_eventos (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('F899945231','Londres', '13-Jul-1985', 1, 'Live Aid Londres');

INSERT INTO tb_eventos (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('H899945224', 'Bethel, NY', '15-Aug-1969', 4, 'Woodstock');

INSERT INTO tb_eventos (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('G899354522', 'São Paulo', '02-Sep-2023', 5, 'The Town 2023');


-- Inserção na tabela tb_usuario
INSERT INTO tb_usuario VALUES (tp_usuario_comum(
    'Adriano',
    89,
    '89110025489',
    v_enderecos(
    	tp_endereco('87','Rua CIn', 'Recife','PE','50478200','Brasil'),
    	tp_endereco('988','Rua Poda','Recife','PE','50478201','Itália')
    ),
    tp_nt_fone(
    	tp_fone('89987440170'),
    	tp_fone('87202125697')
    )
));

INSERT INTO tb_usuario VALUES (tp_usuario_comum(
    'Paulo Tejando',
    25,
    '10796487721',
    v_enderecos(
    	tp_endereco('999','Rua CIn', 'Recife','PE','50478200','Brasil'),
    	tp_endereco('333','Rua Poda','Recife','PE','50478201','Itália')
    ),
    tp_nt_fone(
    	tp_fone('84256875642'),
    	tp_fone('11987661658')
    )
));

INSERT INTO tb_musicos VALUES (
      'Steffani Germanota',
      89,
      '10584569874',
      v_enderecos(
            tp_endereco('85', 'Rua Los Angeles', 'Recife', 'Pernambuco', '50480251', 'Estados Unidos'),
            tp_endereco('98', 'Rua do Ninho das Cobras', 'São Luiz', 'Maranhão', '50740280', 'Brasil')
      ),
      tp_nt_fone(
            tp_fone('82987440170'),
            tp_fone('87985142012')
      ),
      'Lady Gaga'
);

-- Inserção na tabela tb_contas
INSERT INTO tb_contas VALUES (
    'adriano2023',
    'overfitting202111',
    'adri@gmail.com',
    '89110025489'
);

INSERT INTO tb_contas VALUES (
    'paulete1967',
    'overfitting407770',
    'pltj@gmail.com',
    '10796487721'
);

-- Inserção na tabela tb_seguir
INSERT INTO tb_seguir (cpf_seguido,cpf_seguidor) VALUES (
      (SELECT REF(seguido) FROM tb_usuario seguido WHERE seguido.cpf = '10796487721'),
      (SELECT REF(seguidor) FROM tb_usuario seguidor WHERE seguidor.cpf = '89110025489')
);

-- Consulta na tabela tb_seguir seria
SELECT DEREF(U.cpf_seguido).nome AS Seguido, 
      DEREF(U.cpf_seguidor).nome AS Seguidor 
FROM tb_seguir U;

CREATE OR REPLACE TYPE tp_publicar AS OBJECT (
      cpf_patrocinador REF tp_patrocinador,
      id_evento REF tp_evento,
      data_de_publicacao DATE,

      conteudo VARCHAR2(128)
) FINAL;
/

CREATE OR REPLACE TYPE tp_reagir AS OBJECT (
      cpf_usuario REF tp_usuario,
      publicacao REF tp_publicar
) FINAL;
/

CREATE OR REPLACE TYPE tp_comparecer AS OBJECT (
      cpf_usuario REF tp_usuario,
      id_evento REF tp_evento
) FINAL;
/

CREATE OR REPLACE TYPE tp_apresentar AS OBJECT (
      cpf_musico REF tp_musico,
      musica REF tp_musica,
      id_evento REF tp_evento
) FINAL;
/

CREATE TABLE tb_publicar OF tp_publicar;
/

CREATE TABLE tb_reagir OF tp_reagir;
/

CREATE TABLE tb_comparecer OF tp_comparecer;
/

CREATE TABLE tb_apresentar OF tp_apresentar;
/