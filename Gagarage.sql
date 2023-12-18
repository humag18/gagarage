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

CREATE TABLE EMPLOYE(
	NumEmpl INT PRIMARY KEY,
	Personne INT, 
	Job VARCHAR(50),
	DateArrive DATE,
	DateSortie DATE NULL,
	NumCompte VARCHAR(20),
	Acces INT,
	FOREIGN KEY (Personne) REFERENCES PERSONNE(Id));

CREATE TABLE ACCES(
	Id INT PRIMARY KEY,
	Niveau VARCHAR(50));

CREATE TABLE GARAGE(
	Id INT PRIMARY KEY,
	Adresse INT,
	Employe INT,
	Directeur INT,
	FOREIGN KEY (Adresse) REFERENCES ADRESSE(Id),
	FOREIGN KEY (Employe) REFERENCES PERSONNE(Id),
	FOREIGN KEY (Directeur) REFERENCES PERSONNE(Id));

CREATE TABLE VEHICULE(
	Plaque VARCHAR(7) PRIMARY KEY,
	NumChassis INT,
	Typevoiture VARCHAR(50),
	Proprietaire INT,
	FOREIGN KEY (Proprietaire) REFERENCES PERSONNE(Id));

CREATE TABLE CENTREDESTOCKAGE(
	Id INT PRIMARY KEY,
	Adresse INT,
	Employe  INT,
	Directeur INT,
	VEHICULE VARCHAR(7),
	FOREIGN KEY (Adresse) REFERENCES ADRESSE(Id),
	FOREIGN KEY (Employe) REFERENCES PERSONNE(Id),
	FOREIGN KEY (Directeur) REFERENCES PERSONNE(Id),
	FOREIGN KEY (VEHICULE) REFERENCES VEHICULE(Plaque),);

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
	FOREIGN KEY (Stockage) REFERENCES CENTREDESTOCKAGE(Id));

CREATE TABLE INTERVENTION(
	Id INT PRIMARY KEY,
	Vehicule VARCHAR(7),
	Prix FLOAT,
	Datee DATE,
	Duree TIME,
	Statu INT,
	FOREIGN KEY (Vehicule) REFERENCES VEHICULE(Plaque));


CREATE TABLE FACTURE(
	Num_fact INT PRIMARY KEY,
	Personne INT,
	Piece INT,
	Intervention INT,
	Statu INT,
	FOREIGN KEY (Personne) REFERENCES PERSONNE(Id),
	FOREIGN KEY (Piece) REFERENCES PIECE(Ref),
	FOREIGN KEY (Intervention) REFERENCES INTERVENTION(Id));
