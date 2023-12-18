CREATE DATABASE GAGARAGE;

CREATE TABLE PAYS (
	Nom VARCHAR(50) PRIMARY KEY,
	Capitale VARCHAR(50)
	);

CREATE TABLE VILLE(
	Nom VARCHAR(50) PRIMARY KEY,
	Code_Postal INT,
	Pays VARCHAR(50),
	FOREIGN KEY (Pays) REFERENCES PAYS(Nom));

CREATE TABLE ADRESSE(
	Id INT PRIMARY KEY,
	Rue VARCHAR(50),
	Num VARCHAR(10),
	Ville VARCHAR(50),
	FOREIGN KEY (Ville) REFERENCES VILLE(Nom)); 

CREATE TABLE PERSONNE (
	Id INT PRIMARY KEY,
	Nom VARCHAR(50),
	Prenom VARCHAR(50),
	Adresse INT,
	Tel VARCHAR(10),
	Mail VARCHAR(50),
	FOREIGN KEY (Adresse) REFERENCES ADRESSE(Id));


CREATE TABLE ACCES(
	Id INT PRIMARY KEY,
	Niveau VARCHAR(50));

CREATE TABLE GARAGE(
	Id INT PRIMARY KEY,
	Adresse INT,
	FOREIGN KEY (Adresse) REFERENCES ADRESSE(Id));

CREATE TABLE EMPLOYE(
	NumEmpl INT PRIMARY KEY,
	Personne INT, 
	Job VARCHAR(50),
	DateArrive DATE,
	DateSortie DATE NULL,
	NumCompte VARCHAR(20),
	Acces INT,
	Garage INT,
	FOREIGN KEY (Garage) REFERENCES GARAGE(Id),
	FOREIGN KEY (Personne) REFERENCES PERSONNE(Id));

CREATE TABLE VEHICULE(
	Plaque VARCHAR(7) PRIMARY KEY,
	NumChassis INT,
	Typevoiture VARCHAR(50),
	Proprietaire INT,
	FOREIGN KEY (Proprietaire) REFERENCES PERSONNE(Id));

CREATE TABLE FOURNISSEUR(
	Nom VARCHAR(50) PRIMARY KEY,
	Adresse INT,
	Acces INT,
	FOREIGN KEY (Adresse) REFERENCES ADRESSE(Id),
	FOREIGN KEY (Acces) REFERENCES ACCES(Id));

CREATE TABLE PIECE(
	Ref INT PRIMARY KEY,
	Quantite INT,
	Prix FLOAT,
	Fournisseur VARCHAR(50),
	stockage INT,
	Typepiece VARCHAR(50),
	FOREIGN KEY (Fournisseur) REFERENCES FOURNISSEUR(Nom),
	FOREIGN KEY (Stockage) REFERENCES GARAGE(Id));

CREATE TABLE INTERVENTION(
	Id INT PRIMARY KEY,
	Vehicule VARCHAR(7),
	Prix FLOAT,
	Datee DATE,
	Duree TIME,
	Statu BIT,
	FOREIGN KEY (Vehicule) REFERENCES VEHICULE(Plaque));


CREATE TABLE FACTURE(
	Num_fact INT PRIMARY KEY,
	Personne INT,
	Piece INT,
	Intervention INT,
	Statu BIT,
	FOREIGN KEY (Personne) REFERENCES PERSONNE(Id),
	FOREIGN KEY (Piece) REFERENCES PIECE(Ref),
	FOREIGN KEY (Intervention) REFERENCES INTERVENTION(Id));

CREATE TABLE LIVRAISON(
	Id INT PRIMARY KEY,
	Piece INT,
	Garage INT,
	Livreur INT,
	Statu BIT,
	FOREIGN KEY (Piece) REFERENCES PIECE(Ref),
	FOREIGN KEY (GARAGE) REFERENCES GARAGE(Id),
	FOREIGN KEY (Livreur) REFERENCES EMPLOYE(NumEmpl));
-- Insert into ACCES table (3 levels: Livreur, Directeur, and Garagiste)
INSERT INTO ACCES (Id, Niveau) VALUES
(4, 'Livreur'),
(5, 'Directeur'),
(6, 'Garagiste');

-- Insert into PERSONNE table (30 people)
INSERT INTO PERSONNE (Id, Nom, Prenom, Adresse, Tel, Mail) VALUES
(1, 'Dupont', 'Pierre', 1, '1234567890', 'pierre.dupont@example.com'),
(2, 'Schmidt', 'Anna', 2, '9876543210', 'anna.schmidt@example.com'),
(3, 'Johnson', 'John', 3, '5551234567', 'john.johnson@example.com'),
(4, 'Martin', 'Sophie', 1, '5554443333', 'sophie.martin@example.com'),
(5, 'Garcia', 'Carlos', 2, '1112223333', 'carlos.garcia@example.com'),
(6, 'Wang', 'Li', 3, '9998887777', 'li.wang@example.com'),
(7, 'Smith', 'Emily', 1, '3335557777', 'emily.smith@example.com'),
(8, 'Müller', 'Andreas', 2, '7778889999', 'andreas.muller@example.com'),
(9, 'Lopez', 'Maria', 3, '2221114444', 'maria.lopez@example.com'),
(10, 'Johnson', 'Olivia', 1, '6667778888', 'olivia.johnson@example.com'),
(11, 'Kim', 'Joon', 2, '3336669999', 'joon.kim@example.com'),
(12, 'Dubois', 'Claire', 3, '4445556666', 'claire.dubois@example.com'),
(13, 'Gupta', 'Raj', 1, '8887776666', 'raj.gupta@example.com'),
(14, 'Fernández', 'Juan', 2, '1114445555', 'juan.fernandez@example.com'),
(15, 'Chen', 'Yun', 3, '2223334444', 'yun.chen@example.com'),
(16, 'Lee', 'Seung', 1, '4443332222', 'seung.lee@example.com'),
(17, 'Moreno', 'Luis', 2, '6669991111', 'luis.moreno@example.com'),
(18, 'Sato', 'Yuki', 3, '5554448888', 'yuki.sato@example.com'),
(19, 'González', 'Ana', 1, '7778881111', 'ana.gonzalez@example.com'),
(20, 'Wu', 'Wei', 2, '8881114444', 'wei.wu@example.com'),
(21, 'Brown', 'Emma', 3, '9992225555', 'emma.brown@example.com'),
(22, 'Kumar', 'Amit', 1, '3332225555', 'amit.kumar@example.com'),
(23, 'Nguyen', 'Linh', 2, '5551117777', 'linh.nguyen@example.com'),
(24, 'Cohen', 'David', 3, '2223331111', 'david.cohen@example.com'),
(25, 'Gomes', 'Marta', 1, '4445556666', 'marta.gomes@example.com'),
(26, 'Nakamura', 'Takashi', 2, '9998887777', 'takashi.nakamura@example.com'),
(27, 'Liu', 'Xin', 3, '6665554444', 'xin.liu@example.com'),
(28, 'Abe', 'Hiroshi', 1, '1112223333', 'hiroshi.abe@example.com'),
(29, 'Taylor', 'Sophia', 2, '5553337777', 'sophia.taylor@example.com'),
(30, 'Choi', 'Min', 3, '7779991111', 'min.choi@example.com');

-- Insert into GARAGE table
INSERT INTO GARAGE (Id, Adresse) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert into EMPLOYE table (15 employees with Livreur, Directeur, and Garagiste roles)
INSERT INTO EMPLOYE (NumEmpl, Personne, Job, DateArrive, DateSortie, NumCompte, Acces, Garage) VALUES
(101, 1, 'Garagiste', '2022-01-01', NULL, 'ABC123', 6, 1),
(102, 2, 'Livreur', '2022-01-15', NULL, 'XYZ789', 4, 2),
(103, 3, 'Directeur', '2022-02-01', NULL, 'DEF456', 5, 3),
(104, 4, 'Livreur', '2022-02-15', NULL, 'GHI789', 4, 1),
(105, 5, 'Garagiste', '2022-03-01', NULL, 'JKL123', 6, 2),
(106, 6, 'Directeur', '2022-03-15', NULL, 'MNO456', 5, 3),
(107, 7, 'Livreur', '2022-04-01', NULL, 'PQR789', 4, 1),
(108, 8, 'Garagiste', '2022-04-15', NULL, 'STU123', 6, 2),
(109, 9, 'Directeur', '2022-05-01', NULL, 'VWX456', 5, 3),
(110, 10, 'Livreur', '2022-05-15', NULL, 'YZA789', 4, 1),
(111, 11, 'Garagiste', '2022-06-01', NULL, 'BCD123', 6, 2),
(112, 12, 'Directeur', '2022-06-15', NULL, 'EFG456', 5, 3),
(113, 13, 'Livreur', '2022-07-01', NULL, 'HIJ789', 4, 1),
(114, 14, 'Garagiste', '2022-07-15', NULL, 'KLM123', 6, 2),
(115, 15, 'Directeur', '2022-08-01', NULL, 'NOP456', 5, 3);

INSERT INTO VEHICULE (Plaque, NumChassis, Typevoiture, Proprietaire) VALUES
('ABC1234', 123456, 'Sedan', 1),
('XYZ5678', 654321, 'SUV', 2),
('DEF9012', 789012, 'Hatchback', 3),
('JKL4567', 987654, 'Sedan', 6),
('MNO8901', 123789, 'SUV', 7),
('PQR2345', 456321, 'Hatchback', 8),
('STU6789', 789012, 'Truck', 9),
('VWX1234', 234567, 'Convertible', 10),
('YZA5678', 876543, 'Motorcycle', 11),
('BCD9012', 345678, 'Sedan', 12),
('EFG3456', 567890, 'Van', 13),
('HIJ7890', 678901, 'Coupe', 14),
('KLM2345', 789012, 'SUV', 15);

-- Insert into FOURNISSEUR table
INSERT INTO FOURNISSEUR (Nom, Adresse, Acces) VALUES
('Supplier1', 1, 1),
('Supplier2', 2, 2),
('Supplier3', 3, 3);

-- Insert into PIECE table
INSERT INTO PIECE (Ref, Quantite, Prix, Fournisseur, stockage, Typepiece) VALUES
(1, 100, 10.99, 'Supplier1', 1, 'Engine'),
(2, 50, 5.99, 'Supplier2', 2, 'Tire'),
(3, 200, 2.49, 'Supplier3', 3, 'Oil');

-- Insert into INTERVENTION table
INSERT INTO INTERVENTION (Id, Vehicule, Prix, Datee, Duree, Statu) VALUES
(1, 'ABC1234', 100.00, '2022-03-01', '01:30:00', 1),
(2, 'XYZ5678', 75.50, '2022-03-02', '01:00:00', 0),
(3, 'DEF9012', 120.75, '2022-03-03', '02:15:00', 1);

-- Insert into FACTURE table
INSERT INTO FACTURE (Num_fact, Personne, Piece, Intervention, Statu) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 0),
(3, 3, 3, 3, 1);

-- Insert into LIVRAISON table
INSERT INTO LIVRAISON (Id, Piece, Garage, Livreur, Statu) VALUES
(1, 1, 1, 101, 1),
(2, 2, 2, 102, 0),
(3, 3, 3, 103, 1);