CREATE DATABASE GAGARAGE2;

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
--30 personnes minimum
CREATE TABLE PERSONNE (
	Id INT PRIMARY KEY,
	Nom VARCHAR(50),
	Prenom VARCHAR(50),
	Adresse INT,
	Tel VARCHAR(10),
	Mail VARCHAR(50),
	FOREIGN KEY (Adresse) REFERENCES ADRESSE(Id));

--3 types d'accès différents 1:directeur 2:livreur 3:garagiste
CREATE TABLE ACCES(
	Id INT PRIMARY KEY,
	Niveau VARCHAR(50));

CREATE TABLE GARAGE(
	Id INT PRIMARY KEY,
	Adresse INT,
	FOREIGN KEY (Adresse) REFERENCES ADRESSE(Id));
--15 employé minimum
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
--Minimum 20 et au moi autant de camionette que de livreur (chaque camionnette est relié à un livreur)
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
--minimum 20
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
-- Insert data into PAYS table
INSERT INTO PAYS (Nom, Capitale) VALUES
('France', 'Paris'),
('USA', 'Washington, D.C.'),
('Germany', 'Berlin'),
('Japan', 'Tokyo');

-- Insert data into VILLE table
INSERT INTO VILLE (Nom, Code_Postal, Pays) VALUES
('Paris', 75000, 'France'),
('New York', 10001, 'USA'),
('Berlin', 10115, 'Germany'),
('Tokyo', 100-0001, 'Japan');

-- Insert data into ADRESSE table
INSERT INTO ADRESSE (Id, Rue, Num, Ville) VALUES
(1, 'Rue de la Paix', '12', 'Paris'),
(2, 'Broadway', '123', 'New York'),
(3, 'Unter den Linden', '45', 'Berlin'),
(4, 'Ginza', '6-10-1', 'Tokyo');

-- Insert data into PERSONNE table
INSERT INTO PERSONNE (Id, Nom, Prenom, Adresse, Tel, Mail) VALUES
(1, 'Dupont', 'Jean', 1, '1234567890', 'jean.dupont@email.com'),
(2, 'Smith', 'John', 2, '9876543210', 'john.smith@email.com'),
(3, 'Müller', 'Anna', 3, '5551234567', 'anna.muller@email.com'),
(4, 'Tanaka', 'Hiroshi', 4, '9998887777', 'hiroshi.tanaka@email.com'),
(5, 'Lefevre', 'Sophie', 2, '1112223333', 'sophie.lefevre@email.com'),
(6, 'Brown', 'Emma', 3, '4445556666', 'emma.brown@email.com'),
(7, 'Schmidt', 'Michael', 4, '7778889999', 'michael.schmidt@email.com'),
(8, 'Yamamoto', 'Yuki', 1, '3334445555', 'yuki.yamamoto@email.com'),
(9, 'Garcia', 'Carlos', 3, '1231231234', 'carlos.garcia@email.com'),
(10, 'Wang', 'Lin', 4, '5675675678', 'lin.wang@email.com'),
(11, 'Kim', 'Min-Jae', 1, '9998887777', 'minjae.kim@email.com'),
(12, 'Moreno', 'Isabella', 2, '1112223333', 'isabella.moreno@email.com'),
(13, 'Chen', 'Wei', 3, '5556667777', 'wei.chen@email.com'),
(14, 'Martinez', 'Luisa', 4, '9990001111', 'luisa.martinez@email.com'),
(15, 'Nguyen', 'Anh', 1, '3334445555', 'anh.nguyen@email.com'),
(16, 'Gomez', 'Maria', 2, '7778889999', 'maria.gomez@email.com'),
(17, 'Lee', 'Jin-Ho', 3, '1112223333', 'jin.ho.lee@email.com'),
(18, 'Rodriguez', 'Carmen', 4, '5556667777', 'carmen.rodriguez@email.com'),
(19, 'Liu', 'Wei', 1, '9998887777', 'wei.liu@email.com'),
(20, 'Martinez', 'Alejandro', 2, '1112223333', 'alejandro.martinez@email.com'),
(21, 'Choi', 'Yeon-Ju', 3, '5556667777', 'yeonju.choi@email.com'),
(22, 'Fernandez', 'Luis', 4, '8887776666', 'luis.fernandez@email.com'),
(23, 'Wu', 'Li', 1, '3334445555', 'li.wu@email.com'),
(24, 'Hernandez', 'Gabriela', 2, '7778889999', 'gabriela.hernandez@email.com'),
(25, 'Park', 'Joon-Ho', 3, '1112223333', 'joonho.park@email.com'),
(26, 'Garcia', 'Lucia', 4, '5556667777', 'lucia.garcia@email.com');

-- Insert data into ACCES table
INSERT INTO ACCES (Id, Niveau) VALUES
(1, 'directeur'),
(2, 'livreur'),
(3, 'garagiste');

-- Insert data into GARAGE table
INSERT INTO GARAGE (Id, Adresse) VALUES
(1, 1),
(2, 3);

-- Insert data into EMPLOYE table
INSERT INTO EMPLOYE (NumEmpl, Personne, Job, DateArrive, DateSortie, NumCompte, Acces, Garage) VALUES
(1, 1, 'Directeur', '2022-01-01', NULL, '123-456-789', 1, 1),
(2, 2, 'Livreur', '2022-02-15', NULL, '987-654-321', 2, 2),
(3, 3, 'Garagiste', '2022-03-10', NULL, '555-666-777', 3, 2),
(4, 4, 'Garagiste', '2022-04-05', NULL, '111-222-333', 3, 1),
(5, 5, 'Livreur', '2022-05-10', NULL, '444-555-666', 2, 1),
(6, 6, 'Garagiste', '2022-06-15', NULL, '777-888-999', 3, 2),
(7, 7, 'Directeur', '2022-07-20', NULL, '111-222-333', 1, 2),
(8, 8, 'Garagiste', '2022-08-25', NULL, '444-555-666', 3, 2);

-- Insert data into VEHICULE table
INSERT INTO VEHICULE (Plaque, NumChassis, Typevoiture, Proprietaire) VALUES
('ABC1234', 123456, 'Sedan', 2),
('XYZ9876', 654321, 'Truck', 3),
('DEF5678', 987654, 'SUV', 3),
('GHI9012', 123789, 'Truck', 4),
('JKL3456', 456321, 'Hatchback', 5),
('MNO7890', 789654, 'Van', 6),
('PQR1234', 654321, 'Convertible', 7),
('STU5678', 123456, 'Sedan', 8),
('VWX9012', 789012, 'Truck', 9),
('YZA3456', 987012, 'SUV', 10),
('BCD6789', 654789, 'Hatchback', 11),
('EFG0123', 321456, 'Van', 12);

-- Insert data into FOURNISSEUR table
INSERT INTO FOURNISSEUR (Nom, Adresse, Acces) VALUES
('AutoParts Co.', 1, 3),
('TechSupplies Ltd.', 2, 1);

-- Insert data into PIECE table
INSERT INTO PIECE (Ref, Quantite, Prix, Fournisseur, stockage, Typepiece) VALUES
(101, 50, 25.99, 'AutoParts Co.', 1, 'Engine'),
(102, 30, 15.50, 'TechSupplies Ltd.', 2, 'Brake Pad');

-- Insert data into INTERVENTION table
INSERT INTO INTERVENTION (Id, Vehicule, Prix, Datee, Duree, Statu) VALUES
(1, 'ABC1234', 100.00, '2023-01-15', '02:30:00', 1),
(2, 'XYZ9876', 150.50, '2023-02-20', '03:15:00', 0);

-- Insert data into FACTURE table
INSERT INTO FACTURE (Num_fact, Personne, Piece, Intervention, Statu) VALUES
(1, 1, 101, 1, 1),
(2, 2, 102, 2, 0);

-- Insert data into LIVRAISON table
INSERT INTO LIVRAISON (Id, Piece, Garage, Livreur, Statu) VALUES
(1, 101, 1, 2, 1),
(2, 102, 2, 2, 0);
