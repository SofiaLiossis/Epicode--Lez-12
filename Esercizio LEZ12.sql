CREATE TABLE Disco(
    NroSerie VARCHAR (50) PRIMARY KEY,
    TitoloAlbum VARCHAR (30),
    Anno INTEGER (4),
    Prezzo DECIMAL (10,2)
);

INSERT INTO Disco (NroSerie, TitoloAlbum, Anno, Prezzo) VALUES
('ABC123', 'Persona', 2020, 29.99),
('DEF456', 'Alba', 2014, 24.50),
('GHI789', 'Domani', 2003, 19.99),
('JKL101', 'Amore', 2008, 22.75),
('MNO202', 'Logico', 2010, 34.00);



CREATE TABLE CONTIENE(
    NroSerieDisco VARCHAR (50),
    CodiceReg INTEGER(30),
    NroProg INTEGER (25),
    PRIMARY KEY (CodiceReg),
FOREIGN KEY (NroSerieDisco) REFERENCES Disco (NroSerie)
);


INSERT INTO CONTIENE (NroSerieDisco, CodiceReg, NroProg) VALUES
('ABC123', 101, 1),
('DEF456', 102, 2),
('GHI789', 103, 3),
('JKL101', 104, 4),
('MNO202', 105, 5);




CREATE TABLE ESECUZIONE(
    CodiceReg INTEGER (30),
    TitoloCanz VARCHAR (30),
    Anno INTEGER (4),
    FOREIGN KEY (CodiceReg) REFERENCES CONTIENE (CodiceReg)
);

INSERT INTO ESECUZIONE (CodiceReg, TitoloCanz, Anno) VALUES
(101, 'Viaggi', NULL),
(102, 'Tempo', 2005),
(103, 'Soldi', 2010),
(104, 'Animali', NULL),
(105, 'Felicita', 2020);


CREATE TABLE  AUTORE(
    Nome VARCHAR (20),
    TitoloCanzone VARCHAR (30)
);

INSERT INTO AUTORE (Nome, TitoloCanzone) VALUES
('Cremonini', 'Viaggi'),
('Daniele', 'Tempo'),
('Pinguini', 'Soldi'),
('Marco', 'Animali'),
('Arisa', 'Felicita');



CREATE TABLE CANTANTE(
    NomeCantante VARCHAR (20),
    CodiceReg INTEGER (30),
    FOREIGN KEY (CodiceReg) REFERENCES ESECUZIONE (CodiceReg)
);

INSERT INTO CANTANTE (NomeCantante, CodiceReg) VALUES
('Cremonini', 101),
('Arisa', 102),
('Daniele', 103),
('Pinguini', 104),
('Marracash', 105);


#I cantautori (persone che hanno cantato e scritto la stessa canzone) il cui nome inizia per 'D’

SELECT NomeCantante FROM CANTANTE JOIN AUTORE ON CANTANTE.NomeCantante=AUTORE.Nome WHERE NomeCantante LIKE 'D%';

#I titoli dei dischi che contengono canzoni di cui non si conosce l'anno di registrazione;

SELECT TitoloAlbum
FROM Disco 
JOIN CONTIENE ON Disco.NroSerie=CONTIENE.NroSerieDisco
JOIN ESECUZIONE ON CONTIENE.CodiceReg=ESECUZIONE.CodiceReg
WHERE ESECUZIONE.Anno IS NULL;
















