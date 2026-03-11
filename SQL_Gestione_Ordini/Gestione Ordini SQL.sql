-- BUILD WEEK 2
-- Sistema gestione magazzini - VendiCose SpA

--task 1 & 2
CREATE DATABASE vendicosespa;
USE vendicosespa;

-- creo tabelle

CREATE TABLE Categoria (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE Prodotto (
    ProdottoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeProdotto VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2),
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

CREATE TABLE Magazzino (
    MagazzinoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeMagazzino VARCHAR(50),
    Città VARCHAR(50),
    Indirizzo VARCHAR(100)
);

CREATE TABLE Negozio (
    NegozioID INT AUTO_INCREMENT PRIMARY KEY,
    NomeNegozio VARCHAR(50),
    Telefono VARCHAR(50),
    Città VARCHAR(50),
    Indirizzo VARCHAR(100),
    MagazzinoID INT,
    FOREIGN KEY (MagazzinoID) REFERENCES Magazzino(MagazzinoID)
);

CREATE TABLE Giacenza (
    ProdottoID INT,
    MagazzinoID INT,
    Quantità_magazzino INT,
    Sogliarestock INT,
    PRIMARY KEY (ProdottoID, MagazzinoID),
    FOREIGN KEY (ProdottoID) REFERENCES Prodotto(ProdottoID),
    FOREIGN KEY (MagazzinoID) REFERENCES Magazzino(MagazzinoID)
);

CREATE TABLE Vendite (
    TransazioneID INT AUTO_INCREMENT PRIMARY KEY,
    Data_Vendita DATETIME NOT NULL UNIQUE,
    NegozioID INT,
    FOREIGN KEY (NegozioID) REFERENCES Negozio(NegozioID)
);

CREATE TABLE Dettaglio_Vendite (
    Dettaglio_VenditeID INT AUTO_INCREMENT PRIMARY KEY,
    TransazioneID INT,
    ProdottoID INT,
    Quantità INT,
    FOREIGN KEY (TransazioneID) REFERENCES Vendite(TransazioneID),
    FOREIGN KEY (ProdottoID) REFERENCES Prodotto(ProdottoID)
);

-- popolo tabelle con dati dummy

INSERT INTO Categoria (NomeCategoria) VALUES
('Action Figures'),
('Puzzle'),
('Giochi Educativi'),
('Bambole'),
('Costruzioni');

INSERT INTO Prodotto (NomeProdotto, Price, CategoriaID) VALUES
('Super Robot X', 29.99, 1),
('Puzzle Mondo 1000 Pezzi', 14.50, 2),
('Abaco Colorato', 9.99, 3),
('Bambola Anna con Accessori', 24.90, 4),
('Blocchi Costruzioni Maxi', 39.99, 5),
('Puzzle Animali della Fattoria', 12.00, 2),
('Kit Esperimenti Base', 18.75, 3),
('Action Hero Blaze', 22.50, 1),
('Mattoncini Creativi 500 pezzi', 44.99, 5);

INSERT INTO Magazzino (NomeMagazzino, Città, Indirizzo) VALUES
('Magazzino Nord', 'Milano', 'Via Lombardia 45'),
('Magazzino Sud', 'Napoli', 'Via Vesuvio 12'),
('Magazzino Centro', 'Firenze', 'Via del Mercato 101');

INSERT INTO Negozio (NomeNegozio, Telefono, Città, Indirizzo, MagazzinoID) VALUES
('GiocaGiò Milano', '02-1234567', 'Milano', 'Corso Buenos Aires 33', 1),
('Bimbi Felici Napoli', '081-9876543', 'Napoli', 'Via Partenope 10', 2),
('Giochi&Cose Firenze', '055-334455', 'Firenze', 'Piazza della Libertà 88', 3);

INSERT INTO Giacenza (ProdottoID, MagazzinoID, Quantità_magazzino, Sogliarestock) VALUES
(1, 1, 200, 50),
(2, 1, 80, 30),
(3, 2, 120, 40),
(4, 2, 40, 60),
(5, 3, 160, 70),
(6, 1, 60, 30),
(7, 3, 100, 40),
(8, 2, 180, 50),
(9, 3, 240, 70);

-- task 3 aggiornamento giacenze post vendita

CREATE VIEW vendita1 AS
SELECT 
    n.NegozioID,
    n.NomeNegozio,
    n.MagazzinoID,
    m.NomeMagazzino,
    v.TransazioneID,
    v.Data_Vendita,
    d.ProdottoID,
    d.Quantità
FROM Negozio n
JOIN Magazzino m 
ON n.MagazzinoID = m.MagazzinoID
JOIN Vendite v 
ON n.NegozioID = v.NegozioID
JOIN Dettaglio_Vendite d 
ON v.TransazioneID = d.TransazioneID;

-- simulazione vendita

INSERT INTO Vendite (Data_Vendita, NegozioID) 
VALUES ('2025-06-01 10:23:00', 1);

INSERT INTO Dettaglio_Vendite (TransazioneID, ProdottoID, Quantità) 
VALUES
(1, 1, 2),
(1, 6, 1);


-- aggiornamento con soluzione finale

UPDATE Giacenza g
JOIN (
    SELECT 
        dv.ProdottoID,
        n.MagazzinoID,
        dv.Quantità AS QuantitàVenduta
    FROM Dettaglio_Vendite dv
    JOIN Vendite v ON dv.TransazioneID = v.TransazioneID
    JOIN Negozio n ON v.NegozioID = n.NegozioID
    WHERE dv.TransazioneID = (
        SELECT TransazioneID
        FROM Vendite
        WHERE Data_Vendita = (
            SELECT MAX(Data_Vendita) FROM Vendite
        )
    )
) AS sub
ON g.ProdottoID = sub.ProdottoID 
AND g.MagazzinoID = sub.MagazzinoID
SET g.Quantità_magazzino = g.Quantità_magazzino - sub.QuantitàVenduta;

--view x rendere più leggibile

CREATE VIEW UltimaVendita AS
SELECT 
    dv.ProdottoID,
    n.MagazzinoID,
    dv.Quantità AS QuantitàVenduta
FROM Dettaglio_Vendite dv
JOIN Vendite v ON dv.TransazioneID = v.TransazioneID
JOIN Negozio n ON v.NegozioID = n.NegozioID
WHERE v.Data_Vendita = (SELECT MAX(Data_Vendita) FROM Vendite);

UPDATE Giacenza g
JOIN UltimaVendita uv
ON g.ProdottoID = uv.ProdottoID 
AND g.MagazzinoID = uv.MagazzinoID
SET g.Quantità_magazzino = g.Quantità_magazzino - uv.QuantitàVenduta;

-- verifica giacenza prodotto

SELECT
g.ProdottoID,
p.NomeProdotto,
g.Quantità_magazzino AS Giacenza_prodotto,
g.MagazzinoID,
m.NomeMagazzino
FROM Giacenza g
JOIN Prodotto p ON g.ProdottoID = p.ProdottoID
JOIN Magazzino m ON g.MagazzinoID = m.MagazzinoID
WHERE g.MagazzinoID = 2 
AND g.ProdottoID = 7;

-- monitoraggio re-stock

SELECT 
g.ProdottoID,
p.NomeProdotto,
g.MagazzinoID,
m.NomeMagazzino,
g.Quantità_magazzino AS Giacenza_prodotto,
g.Sogliarestock,
IF ((g.Quantità_magazzino - g.Sogliarestock) > 0, 'OK', 'RIORDINO') AS Alert_Restock
FROM Giacenza g
JOIN Prodotto p ON g.ProdottoID = p.ProdottoID
JOIN Magazzino m ON g.MagazzinoID = m.MagazzinoID
ORDER BY Alert_Restock DESC;

--fineeee
