-- Tabella STUDENTE
CREATE TABLE STUDENTE (
    Matricola INT (10),
    NomeStudente TEXT(20),
    AnnoLaurea INT (10),
    TitoloStudio TEXT(20),
    VotoLaurea INT (3)
);


-- Tabella DIPARTIMENTO
CREATE TABLE DIPARTIMENTO (
    CodiceDipartimento VARCHAR (10),
    NomeDipartimento TEXT(20),
    SettoreScientifico TEXT(20),
    NumDocenti INT (10)
);

-- Tabella CONCORSOMASTER
CREATE TABLE CONCORSOMASTER (
    CodiceMaster VARCHAR (10),
    CodiceDipartimento VARCHAR(10),
    DataPubblicazione DATE,
    DataScadenza DATE,
    NumPostiDisponibili INT(10)
);

-- Tabella PARTECIPACONCORSOMASTER
CREATE TABLE PARTECIPACONCORSOMASTER (
    CodiceDipartimento VARCHAR(10),
    CodiceMaster VARCHAR(10),
    MatricolaStudente INT(10),
    DataInvioDomanda DATE
);

-- Inserimento dati per la tabella STUDENTE
INSERT INTO STUDENTE (Matricola, NomeStudente, AnnoLaurea, TitoloStudio, VotoLaurea)
VALUES
    (1, 'Mario Rossi', 2022, 'Ingegneria Informatica', 105),
    (2, 'Giulia Bianchi', 2021, 'Scienze Politiche', 90),
    (3, 'Luca Verdi', 2023, 'Economia', 110),
    (4, 'Laura Neri', 2022, 'Psicologia', 106),
    (5, 'Paolo Giallo', 2020, 'Architettura', 99);

-- Inserimento dati per la tabella DIPARTIMENTO
INSERT INTO DIPARTIMENTO (CodiceDipartimento, NomeDipartimento, SettoreScientifico, NumDocenti)
VALUES
    ('DIP01', 'Ingegneria', 'Ingegneria', 50),
    ('DIP02', 'Scienze Politiche', 'Scienze Sociali', 30),
    ('DIP03', 'Economia', 'Scienze Economiche', 40),
    ('DIP04', 'Psicologia', 'Scienze Psicologiche', 20),
    ('DIP05', 'Architettura', 'Architettura', 25);

-- Inserimento dati per la tabella CONCORSOMASTER
INSERT INTO CONCORSOMASTER (CodiceMaster, CodiceDipartimento, DataPubblicazione, DataScadenza, NumPostiDisponibili)
VALUES
    ('CM01', 'DIP01', '2022-01-01', '2022-02-01', 10),
    ('CM02', 'DIP02', '2022-02-01', '2022-03-01', 15),
    ('CM03', 'DIP03', '2022-03-01', '2022-04-01', 12),
    ('CM04', 'DIP04', '2022-01-01', '2022-05-01', 8),
    ('CM05', 'DIP05', '2022-01-01', '2022-06-01', 5);

-- Inserimento dati per la tabella PARTECIPACONCORSOMASTER
INSERT INTO PARTECIPACONCORSOMASTER (CodiceDipartimento, CodiceMaster, MatricolaStudente, DataInvioDomanda)
VALUES
    ('DIP01', 'CM01', 1, '2022-01-15'),
    ('DIP02', 'CM02', 2, '2022-02-15'),
    ('DIP03', 'CM03', 3, '2022-03-15'),
    ('DIP04', 'CM04', 4, '2022-04-15'),
    ('DIP05', 'CM05', 5, '2022-05-15'),
    ('DIP04', 'CM04', 2, '2022-04-20'),
    ('DIP05', 'CM05', 2, '2022-10-15');

#Per ogni studente che ha partecipato a 3 concorsi di master, visualizzare il nome dello studente 
#e il settore scientifico per cui ha partecipato a tutti i concorsi. 
#Ordinare per Nome dello studente

SELECT NomeStudente, SettoreScientifico
FROM STUDENTE 
JOIN partecipaconcorsomaster ON STUDENTE.Matricola = partecipaconcorsomaster.MatricolaStudente
JOIN dipartimento ON partecipaconcorsomaster.CodiceDipartimento = dipartimento.CodiceDipartimento
where STUDENTE.Matricola in (
 SELECT MatricolaStudente
        FROM PARTECIPACONCORSOMASTER
        GROUP BY MatricolaStudente
        HAVING COUNT(CodiceMaster) = 3
)
ORDER BY STUDENTE.Nomestudente ASC
;

#Per i dipartimenti in cui sono stati effettuati solo concorsi di master aventi ciascuno un numero di posti
#disponibili superiore a 7, visualizzare il nome del dipartimento, il settore scientifico di afferenza e il numero di concorsi di master. 
#Ordinare per nome del dipartimento e settore scientifico


SELECT NomeDipartimento, SettoreScientifico, COUNT(CODICEMASTER) AS NUMCONCORSI
FROM DIPARTIMENTO
JOIN concorsomaster ON dipartimento.CodiceDipartimento = concorsomaster.CodiceDipartimento
WHERE dipartimento.CodiceDipartimento IN (
SELECT CodiceDipartimento
FROM concorsomaster 
where NumPostiDisponibili >7)
GROUP BY Nomedipartimento, Settorescientifico
ORDER BY nomedipartimento, settorescientifico ASC;

SELECT NOMESTUDENTE,MATRICOLA
FROM STUDENTE 
WHERE votolaurea >100 
AND MATRICOLA IN (
SELECT MatricolaSTUDENTE
FROM  partecipaconcorsomaster
JOIN concorsomaster ON concorsomaster.CodiceMaster = partecipaconcorsomaster.CodiceMaster
GROUP BY MatricolaStudente, DataPubblicazione
HAVING COUNT(DATAPUBBLICAZIONE)>=2
)


