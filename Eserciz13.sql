CREATE TABLE Dipendente(
    id INTEGER, 
    nome TEXT (20),
    cognome TEXT (20),
    email VARCHAR (30), 
    numerotelefono VARCHAR (20), 
    data_assunzione DATE,
    id_lavoro INTEGER,
    salario DECIMAL (10,2),
    id_manager INTEGER,
    id_dipartimento INTEGER
);



INSERT INTO Dipendente (id, nome, cognome, email, numerotelefono, data_assunzione, id_lavoro, 
salario, id_manager, id_dipartimento)
VALUES
(1, 'Luigi', 'Rossi', 'luigi.rossi@gmail.com', 3466168459, '2020-01-01', 101, 50000.00,10, 25),
(2, 'Anna', 'Sordi', 'anna.sordi@gmail.com', 3354465981, '2023-02-15', 102, 60000.00, NULL, 24),
(3, 'Luca', 'Mattino', 'luca.mattino@gmail.com', 3564987265, '2021-03-20', 103, 70000.00, 10, 23),
(4, 'Mario', 'Moreno', 'mario.moreno@gmail.com', 3216597849, '2018-04-01', 104, 80000.00, 10, 22),
(5, 'Giovanna', 'Sale', 'giovanna.sale@gmail.com', 3652157894, '2017-05-15', 105, 90000.00, NULL, 21),
(6, 'Camilla', 'Lonte', 'camilla.lonte@gmail.com', 3564168952, '2016-06-20', 106, 10000.00, NULL, 20),
(7, 'Andrea', 'Bianchi', 'andrea.bianchi@gmail.com', 3156498265, '2015-07-20', 107, 20000.00, 5, 19),
(8, 'Paolo', 'Mannarino', 'paolo.mannarino@gmail.com', 3452163548, '2019-08-20', 108, 30000.00, 5, 18),
(9, 'Bianca', 'Saporito', 'bianca.saporito@gmail.com', 3205684986, '2014-09-20', 109, 40000.00, 5, 17),
(10, 'Lucia', 'Tramonto', 'lucia.tramonto@gmail.com', 3452103658, '2016-10-20', 110, 45000.00, 11, 16),
(11, 'Sara', 'Riccio', 'sara.riccio@gmail.com', 3625498752, '2020-11-20', 111, 35000.00, 12, 15),
(12, 'Roberto', 'Scafati', 'roberto.scafati@gmail.com', 3265129456, '2021-12-20', 112, 25000.00, 14, 14),
(13, 'Dario', 'Calamino', 'dario.calamino@gmail.com', 3602156478, '2022-01-20', 113, 65000.00, 14, 13),
(14, 'Federica', 'Amato', 'federica.amato@gmail.com', 3405613259, '2023-02-20', 114, 12000.00, 8, 12),
(15, 'Giuseppe', 'Bolle', 'giuseppe.bolle@gmail.com', 3503214569, '2018-03-20', 115, 35000.00, 8, 11);




CREATE TABLE Dipartimento(
    id_dipartimento INTEGER,
    nome_dip TEXT (20), 
    id_manager INTEGER,
    id_location INTEGER
    );


INSERT INTO Dipartimento (id_dipartimento, nome_dip, id_manager, id_location)
VALUES
(25, 'Finanza', 1, 200),
(24, 'Marketing', NULL, 202),
(23, 'Sviluppo', 3, 203),
(22, 'Vendite', 4, 204),
(21, 'Risorse Umane', NULL, 205),
(20, 'Produzione', NULL, 206),
(19, 'Comunicazione', 7, 207),
(18, 'Amministrazione', 8, 208);

INSERT INTO Dipartimento (id_dipartimento, nome_dip, id_manager, id_location)
VALUES
(16, 'IT', 1, 200);
 

#Visualizzare la data di assunzione dei manager e i loro id appartenenti al dipartimento ’Amministrazione’
#nel formato Nome mese, giorno, anno

SELECT 
DATE_FORMAT(Dipendente.data_assunzione,'%m/%d/%Y') AS DATA_ASSUNZIONE, Dipendente.id_manager
FROM Dipendente
JOIN Dipartimento ON Dipendente.id_manager = Dipartimento.id_manager
WHERE nome_dip = 'Amministrazione';

#Visualizzare il nome e il cognome dei dipendenti assunti nel mese di Giugno

SELECT nome, cognome
FROM dipendente 
WHERE month(data_assunzione) = 6;

#Visualizzare gli anni in cui più di 10 dipendenti sono stati assunti

SELECT year(data_assunzione) AS anno
FROM Dipendente
GROUP BY year(data_assunzione)
HAVING COUNT(id) >10;

#Visualizzare il nome del dipartimento, il nome del manager, il salario del manager di tutti i manager 
#la cui esperienza è maggiore di 5 anni

SELECT nome_dip,nome,salario
FROM dipendente 
LEFT JOIN dipartimento ON dipendente.id_dipartimento = dipartimento.id_dipartimento
WHERE id IN (
SELECT distinct id_manager 
FROM dipendente)
AND datediff(CURDATE(),data_assunzione) > 5*365
;








