CREATE TABLE STUDENTE(
Matricola INT(10),
Nome TEXT(20),
Citta TEXT(20)
);

INSERT INTO STUDENTE (Matricola,Nome,Citta) VALUES
(1,'Dario','Napoli'),
(2,'Amanda','Roma'),
(3,'Gaetano','Firenze')
;

CREATE TABLE  CORSO(
Codice VARCHAR(20),
Nome TEXT(20),
MatricolaDocente INT(10)
);

INSERT INTO CORSO(Codice,Nome,MatricolaDocente) VALUES
('A1','Matematica',100),
('A2','Biologia',101),
('A3','Fisica',100)
;

CREATE TABLE  DOCENTE(
Matricola INT(10), 
Nome TEXT (20)
);

INSERT INTO DOCENTE(Matricola,Nome) VALUES
(100,'Mario'),
(101,'Paolo'),
(102,'Anna')
;

CREATE TABLE ESAME(
 Codice VARCHAR (20),
 MatricolaStudente INT (20), 
 Data DATE, 
 Voto INT (20),
 SettoreScientifico TEXT (20)
 );
 
 INSERT INTO ESAME (Codice,MatricolaStudente,Data,Voto,SettoreScientifico) VALUES
 ('A1',1,'2023-10-01',29,'MAT'),
 ('A2',2,'2022-05-02',20,'BIO'),
 ('A2',1,'2023-02-06',28,'BIO'),
 ('A3',3,'2020-01-06',30,'FIS'),
 ('A3',1,'2022-12-12',25,'FIS')
 ;
 
 #Per ogni studente, visualizzare gli esami sostenuti con voto maggiore di 28 assieme alla matricola 
 #dello studente e al nome del docente che ha tenuto il corso.
 
 SELECT STUDENTE.Nome,STUDENTE.Matricola,CORSO.Nome AS Corso,Voto,DOCENTE.Nome AS Docente
 FROM STUDENTE
 JOIN ESAME ON STUDENTE.Matricola = ESAME.MatricolaStudente 
 JOIN CORSO ON ESAME.Codice = CORSO.Codice
 JOIN DOCENTE ON CORSO.MatricolaDocente=DOCENTE.Matricola
 WHERE Voto >28;
 
 
#Per ogni docente, visualizzare il nome, il nome del corso di cui è titolare e il settore scientifico del corso.
SELECT DISTINCT DOCENTE.Nome,Corso.Nome AS Corso,SettoreScientifico
FROM DOCENTE 
JOIN CORSO ON DOCENTE.Matricola = CORSO.MatricolaDocente
JOIN ESAME ON CORSO.Codice = ESAME.Codice;