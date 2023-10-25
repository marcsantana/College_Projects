--Insert infos definidas com CPF
INSERT INTO Usuario 
VALUES ('89547832565','Gabriel Carvalho', 18);
INSERT INTO Logradouro
VALUES ('89547832565', 'Brasil', '54410320', 'PE', 'Jaboatão dos Guararapes', 'Rua Maria Rita Barradas', 36);
INSERT INTO Contato
VALUES ('89547832565', '81993338673');
INSERT INTO Contato
VALUES ('89547832565', '81993238173');
INSERT INTO conta VALUES ('Gabriel', 'Carvalho2565', 'Gabriel565@gmail.com', '89547832565');

 
INSERT INTO Usuario 
VALUES ('65924587136','Francisca Silva', 20);
INSERT INTO Logradouro 
VALUES ('65924587136', 'Brasil', '54350320', 'PE', 'Jaboatão dos Guararapes', 'Rua Santa Terezinha', 45);
INSERT INTO Contato
VALUES ('65924587136', '81993338674');
INSERT INTO Contato
VALUES ('65924587136', '81993238174');
INSERT INTO conta VALUES ('Francisca', 'rancisca7136', 'Francisca136@gmail.com', '65924587136');


INSERT INTO Usuario 
VALUES ('78922398471','José Amargo', 45);
INSERT INTO Logradouro 
VALUES ('78922398471', 'Brasil', '03928040', 'SP', 'São Paulo', 'Rua Mário Tarenghi', 71);
INSERT INTO Contato
VALUES ('78922398471', '81993338675');
INSERT INTO Contato
VALUES ('78922398471', '81993238175');
INSERT INTO conta VALUES ('José', 'sé922398471', 'José471@gmail.com', '78922398471');


INSERT INTO Usuario
VALUES ('00541639874', 'Tomás Nascimento', 37);
INSERT INTO Logradouro 
VALUES ('00541639874', 'Brasil', '04891990', 'SP', 'São Paulo', 'Rua Filomena Belmont', 123);
INSERT INTO Contato
VALUES ('00541639874', '81993338676');
INSERT INTO conta VALUES ('Tomás', 'ascimento541639874', 'Tomás874@gmail.com', '00541639874');


INSERT INTO Usuario
VALUES ('89456918267', 'Marcelo Santana', 65);
INSERT INTO Logradouro 
VALUES ('89456918267', 'Brasil', '30512171', 'MG', 'Belo Horizonte', 'Beco Padre Teixeira', 42);
INSERT INTO Contato
VALUES ('89456918267', '81993338677');
INSERT INTO conta VALUES ('Marcelo', 'Santana18267', 'Marcelo267@gmail.com', '89456918267');



INSERT INTO Usuario
VALUES ('74028498321', 'Ícaro Nunes', 25); 
INSERT INTO Logradouro 
VALUES ('74028498321', 'Brasil', '26250630', 'RJ', 'Nova Iguaçu', 'Rua Marília Barbosa', 223);
INSERT INTO Contato
VALUES ('74028498321', '81993338678');
INSERT INTO conta VALUES ('Ícaro', 'nes8321', 'Ícaro321@gmail.com', '74028498321');


INSERT INTO Usuario
VALUES ('12584970220', 'João Victor', 48);
INSERT INTO Logradouro 
VALUES ('12584970220', 'Brasil', '30620525', 'MG', 'Belo Horizonte', 'Rua Quatro Mil e Seis', 98);
INSERT INTO Contato
VALUES ('12584970220', '81993338679');
INSERT INTO conta VALUES ('João', 'João970220', 'João220@gmail.com', '12584970220');


INSERT INTO Usuario
VALUES ('74183602750', 'Eliab Bernardino', 84); 
INSERT INTO Logradouro 
VALUES ('74183602750', 'Brasil', '68120991', 'PA', 'Santarém', 'Estrada Santarém-Mujuí', 89);
INSERT INTO Contato
VALUES ('74183602750', '81993338680');
INSERT INTO conta VALUES ('Eliab', 'Bernardino60275', 'Eliab275@gmail.com', '74183602750');


INSERT INTO Usuario
VALUES ('78541036942','Maria Eduarda',52);
INSERT INTO Logradouro 
VALUES ('78541036942', 'Brasil', '58011298', 'PB', 'João Pessoa', 'Rua 15 de Janeiro', 194);
INSERT INTO Contato
VALUES ('78541036942', '81993338681');
INSERT INTO conta VALUES ('Maria', 'duarda6942', 'Maria942@gmail.com', '78541036942');


INSERT INTO Usuario
VALUES ('48759659899','Ana Beatriz',23);
INSERT INTO Logradouro 
VALUES ('48759659899', 'Brasil', '58079252', 'PB', 'João Pessoa', 'Rua Climene Pontes da Costa', 13);
INSERT INTO Contato
VALUES ('48759659899', '81993338682');
INSERT INTO Contato
VALUES ('48759659899', '81993238182');
INSERT INTO conta VALUES ('Ana', 'Ana759659899', 'Ana899@gmail.com', '48759659899');

INSERT INTO Usuario 
VALUES ('71447832565','Amadeo Carvalho', 18);
INSERT INTO Logradouro
VALUES ('71447832565', 'Brasil', '54120320', 'PB', 'Joao Pessoa', 'Rua Rita Barradas', 74);
INSERT INTO Contato
VALUES ('71447832565', '81683338673');
INSERT INTO Contato
VALUES ('71447832565', '81673238173');
INSERT INTO conta VALUES ('Amadeo', 'Carvalho7144', 'Amadeo7144@gmail.com', '71447832565');


INSERT INTO Usuario 
VALUES ('71443532565','Amado Batista', 18);
INSERT INTO Logradouro
VALUES ('71443532565', 'Brasil', '52630321', 'DF', 'Brasilia', 'Rua Maria Barradas', 94);
INSERT INTO Contato
VALUES ('71443532565', '81690338673');
INSERT INTO Contato
VALUES ('71443532565', '81679138173');
INSERT INTO conta VALUES ('Amado', 'Batista2565', 'Amado2565@gmail.com', '71443532565');

-- INSERT Evento ---------------------------------------------------------------------------------------------------
INSERT INTO Evento (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('A123456789', 'São Paulo', '28-Jul-2022', 4, 'Lollapalooza 2022');

INSERT INTO Evento (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('B987654321','Rio de Janeiro', '02-Sep-2022', 10, 'Rock In Rio IX');

INSERT INTO Evento (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('C897645231','Olinda', '18-Feb-2023', 4, 'Carvalheira 2023');

INSERT INTO Evento (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('D898845231', 'Recife', '17-Feb-2023', 5, 'Carnaval Recife');

INSERT INTO Evento (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('F899945231','Londres', '13-Jul-1985', 1, 'Live Aid Londres');

INSERT INTO Evento (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('H899945224', 'Bethel, NY', '15-Aug-1969', 4, 'Woodstock');

INSERT INTO Evento (ID_Evento, LOCALIZACAO, DATA_INICIO, DURACAO, NOME)
VALUES ('G899354522', 'São Paulo', '02-Sep-2023', 5, 'The Town 2023');
--------------------------------------------------------------------------------------------------------------------



-- INSERT Compositor -----------------------------------------------------------------------------------------------
-- 'Eliab Bernardino'
INSERT INTO Compositor (CPF_COMPOSITOR)
VALUES ('74183602750');

-- 'Francisca Silva'
INSERT INTO Compositor (CPF_COMPOSITOR)
VALUES ('65924587136');

-- 'José Amargo'
INSERT INTO Compositor (CPF_COMPOSITOR)
VALUES ('78922398471');

-- 'Ana Beatriz'
INSERT INTO Compositor (CPF_COMPOSITOR)
VALUES ('48759659899');
--------------------------------------------------------------------------------------------------------------------



-- INSERT Musica ---------------------------------------------------------------------------------------------------
INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('74183602750', 'O Segundo Sol', 'MPB', 1999);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('74183602750', 'I Kissed A Girl', 'Pop', 2008);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('74183602750', 'Malvadão 3', 'Rap', 2021);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('65924587136', 'Kiss Me More', 'Rap', 2021);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('65924587136', 'Mastermind', 'Folk', 2022);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('78922398471', 'Born & Raised', 'Country', 2012);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('78922398471', 'Take Me Home, Country Roads', 'Country', 1971);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('48759659899', 'Quando A Chuva Passar', 'MPB', 2005);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('48759659899', 'Se Eu Não Te Amasse Tanto Assim', 'MPB', 1999);

INSERT INTO Musica (CPF_COMPOSITOR, NOME_MUSICA, GENERO, ANO)
VALUES ('48759659899', 'Viver Sem Ti', 'MPB', 2010);
--------------------------------------------------------------------------------------------------------------------


-- INSERT Patrocinador------------------------------------------------------------------------------------------------------------------
INSERT INTO Patrocinador 
VALUES ('89547832565', '12345678910112'); 


INSERT INTO Patrocinador 
VALUES ('65924587136', '11109865432101'); 


INSERT INTO Patrocinador 
VALUES ('78922398471', '12109865432101'); 


--INSERT Empresa------------------------------------------------------------------------------------------------------------------

INSERT INTO Empresa
VALUES ('12109865432101', 'Jositos'); 


INSERT INTO Empresa
VALUES ('11109865432101', 'Francisbacon'); 


INSERT INTO Empresa
VALUES ('12345678910112', 'Games Gabe'); 

-- INSERT MUSICO----------------------------------------------------------------------------------------------------
-- Amadeo Carvalho
INSERT INTO Musico (CPF_Musico, Nome_Artistico)
VALUES ('71447832565', 'Amadeus Mozart');
-- Amado Batista
INSERT INTO Musico (CPF_Musico, Nome_Artistico)
VALUES ('71443532565', 'Amado Belo');
-- 'José Amargo'
INSERT INTO Musico (CPF_Musico, Nome_Artistico)
VALUES ('78922398471', 'José Saramago');
-- 'Ana Beatriz'
INSERT INTO Musico (CPF_Musico, Nome_Artistico)
VALUES ('48759659899', 'Ana Cavaquinho');
----------------------------------------------------------------------------------------------------------------------

-- Insert Seguir------------------------------------------------------------------------------------------------------
-- Tomás Segue Ana Beatriz
INSERT INTO Seguir (CPF_Seguido, CPF_Seguidor)
VALUES ('00541639874','48759659899');
-- Ícaro Nunes Segue Amadeo Carvalho
INSERT INTO Seguir (CPF_Seguido, CPF_Seguidor)
VALUES ('74028498321','71447832565');
-- Amado Batista Segue José Amargo
INSERT INTO Seguir (CPF_Seguido, CPF_Seguidor)
VALUES ('71443532565','78922398471');
-- José Amargo Segue Amado Batista
INSERT INTO Seguir (CPF_Seguido, CPF_Seguidor)
VALUES ('78922398471','71443532565');
-- Eliab Bernardino Segue Marcelo Santana
INSERT INTO Seguir (CPF_Seguido, CPF_Seguidor)
VALUES ('74183602750','89456918267');
------------------------------------------------------------------------------------------------

-- Insert Publicar ---------------------------------------------------------------------------------------------------

-- Gabriel Publica The Town 2023 1677810806 Descricao
INSERT INTO Publicar (CPF_Patrocinador, ID_Evento, Data_Publicacao, Conteudo)
VALUES ('89547832565', 'G899354522', '01-FEB-23', 'O evento de música The Town 2023 em São Paulo será imperdível pela sua incrível lineup de artistas, performances espetaculares e atmosfera única, prometendo ser uma experiência inesquecível para os amantes de música.');

-- Francisca publica sobre Live Aid Londres em 1622257199  Descricao
INSERT INTO Publicar (CPF_Patrocinador, ID_Evento, Data_Publicacao, Conteudo)
VALUES ('65924587136', 'C897645231', '02-JAN-22', 'O evento Live Aid Londres de 1985 foi histórico e imperdível por reunir alguns dos maiores artistas da época para arrecadar fundos para combater a fome na África. Com mais de 1,5 bilhão de telespectadores em todo o mundo, foi um momento icônico da cultura pop e um exemplo de como a música pode ser usada para ajudar a mudar o mundo.');

-------------------------------------------------------------------------------------------------------------

-- INSERT Comparecer -------------------------------------------------------------------------------------------------------------------
INSERT INTO Comparecer VALUES ('89547832565', 'H899945224');

INSERT INTO Comparecer VALUES ('89547832565', 'A123456789');

INSERT INTO Comparecer VALUES ('65924587136', 'F899945231');

INSERT INTO Comparecer VALUES ('65924587136', 'D898845231');

INSERT INTO Comparecer VALUES ('78922398471', 'H899945224');

INSERT INTO Comparecer VALUES ('78922398471', 'B987654321');

INSERT INTO Comparecer VALUES ('78922398471', 'C897645231');

INSERT INTO Comparecer VALUES ('00541639874', 'D898845231');

INSERT INTO Comparecer VALUES ('00541639874', 'A123456789');

INSERT INTO Comparecer VALUES ('00541639874', 'G899354522');

INSERT INTO Comparecer VALUES ('89456918267', 'H899945224');

INSERT INTO Comparecer VALUES ('89456918267', 'C897645231');

INSERT INTO Comparecer VALUES ('89456918267', 'A123456789');

INSERT INTO Comparecer VALUES ('74028498321', 'B987654321');

INSERT INTO Comparecer VALUES ('74028498321', 'D898845231');

INSERT INTO Comparecer VALUES ('12584970220', 'B987654321');

INSERT INTO Comparecer VALUES ('12584970220', 'H899945224');

INSERT INTO Comparecer VALUES ('12584970220', 'A123456789');

INSERT INTO Comparecer VALUES ('74183602750', 'F899945231');

INSERT INTO Comparecer VALUES ('74183602750', 'C897645231');

INSERT INTO Comparecer VALUES ('74183602750', 'D898845231');

INSERT INTO Comparecer VALUES ('78541036942', 'A123456789');

INSERT INTO Comparecer VALUES ('78541036942', 'D898845231');

INSERT INTO Comparecer VALUES ('78541036942', 'G899354522');

INSERT INTO Comparecer VALUES ('48759659899', 'D898845231');

INSERT INTO Comparecer VALUES ('71447832565', 'A123456789');

INSERT INTO Comparecer VALUES ('71447832565', 'B987654321');

INSERT INTO Comparecer VALUES ('71447832565', 'F899945231');

INSERT INTO Comparecer VALUES ('71443532565', 'A123456789');

INSERT INTO Comparecer VALUES ('71443532565', 'C897645231');

INSERT INTO Comparecer VALUES ('71443532565', 'F899945231');

-- Insert Apresentar ---------------------------------------------------------------------
-- Ana Beatriz apresenta 'Se Eu Não Te Amasse Tanto Assim' de Ana Beatriz

INSERT INTO Apresentar(ID_Evento, CPF_Musico, Nome_Musica, CPF_COMPOSITOR)
VALUES ('G899354522','48759659899', 'Se Eu Não Te Amasse Tanto Assim', '48759659899');

-- José Saramago apresenta 'Malvadão 3' de Eliab Bernardino

INSERT INTO Apresentar(ID_Evento, CPF_Musico, Nome_Musica, CPF_COMPOSITOR)
VALUES ('G899354522', '78922398471', 'Malvadão 3', '74183602750');

-- Amado Belo apresenta Viver Sem Ti de Ana Beatriz
INSERT INTO Apresentar(ID_Evento, CPF_Musico, Nome_Musica, CPF_COMPOSITOR)
VALUES ('F899945231', '71443532565', 'Viver Sem Ti', '48759659899');

-- Amadeus Mozart apresenta Mastermind de Francisca Silva
INSERT INTO Apresentar(ID_Evento, CPF_Musico, Nome_Musica, CPF_COMPOSITOR)
VALUES ('C897645231', '71447832565', 'Mastermind', '65924587136');
----------------------------------------------------------------------------------------

-- INSERT Reagir------------------------------------------------------------------------------------
INSERT INTO Reagir VALUES ('65924587136', '89547832565', 'G899354522', '01-FEB-23');

INSERT INTO Reagir VALUES ('89547832565', '65924587136', 'C897645231', '02-JAN-22');