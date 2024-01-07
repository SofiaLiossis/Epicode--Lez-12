CREATE TABLE STUDENTE(
Matricola INT(10),
Nome TEXT(20),
Citta TEXT(20)
);

INSERT INTO STUDENTE (Matricola,Nome,Citta) VALUES
(1,'Dario','Napoli'),
(2,'Amanda','Roma'),
(3,'Gaetano','Firenze'),
(4,'Sonia','Catania')
;

CREATE TABLE  CORSO(
Codice VARCHAR(20),
Nome TEXT(20),
MatricolaDocente INT(10)
);

INSERT INTO CORSO(Codice,Nome,MatricolaDocente) VALUES
('A1','Matematica',100),
('A2','Biologia',101),
('A3','Fisica',100),
('A4','Chimica',102)
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
 ('A3',1,'2022-12-12',25,'FIS'),
 ('A4',4,'2023-11-20',19,'CHIM'),
 ('A1',4,'2022-03-16',24,'MAT'),
 ('A4',2,'2020-05-23',26,'CHIM'),
 ('A1',2,'2023-06-06',29,'MAT'),
 ('A2',3,'2022-10-03',22,'BIO'),
 ('A4',3,'2023-01-16',26,'CHIM'),
 ('A3',4,'2020-06-15',18,'FIS')
 ;
 
 #Visualizzare per ogni studente la matricola, il nome, il voto massimo,
 #minimo e medio conseguito negli esami. 

 SELECT STUDENTE.Nome, Matricola, MAX(Voto), MIN(Voto), AVG(Voto)
 FROM STUDENTE
 JOIN ESAME ON STUDENTE.Matricola = ESAME.MatricolaStudente
 GROUP BY Matricola, Nome
 ;
 
 #Visualizzare - per ogni studente con media voti maggiore di 25 e che ha sostenuto esami in almeno 10 date
#la matricola, il nome, il voto massimo, minimo e medio conseguito negli esami. Ordinare per voto.
 
SELECT STUDENTE.Nome, Matricola, MAX(Voto) AS MAX, MIN(Voto) AS MIN, AVG(Voto) AS MEDIA, COUNT(Data) AS N_ESAMI
 FROM STUDENTE
 JOIN ESAME ON STUDENTE.Matricola = ESAME.MatricolaStudente
 GROUP BY Matricola, Nome
 HAVING AVG(Voto)>25 AND COUNT(Data)>=2
 ORDER BY AVG(Voto) DESC
 ;


 
 
 