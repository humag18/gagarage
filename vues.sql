use GAGARAGE;

CREATE VIEW VEHICULE_PROPRIETAIRE AS
SELECT V.Plaque, V.Typevoiture AS Type_Voiture, P.Nom AS Nom, P.Prenom AS Prenom
FROM VEHICULE V
JOIN PERSONNE P ON V.Proprietaire = P.Id;


CREATE VIEW INTERVENTION_VEHICULE AS
SELECT I.Id, I.Datee AS Date, I.Duree, I.Prix, I.Statu AS Statut, V.Typevoiture AS Type_Voiture, V.Plaque
FROM INTERVENTION I
JOIN VEHICULE V ON I.Vehicule = V.Plaque;



CREATE VIEW EMPLOYE_GARAGE AS
SELECT E.NumEmpl, P.Nom, P.Prenom, E.Job, G.Id AS Garage_Id, G.Adresse AS Adresse_Garage
FROM EMPLOYE E
JOIN PERSONNE P ON E.Personne = P.Id
JOIN GARAGE G ON E.Garage = G.Id;



CREATE VIEW PIECE_FOURNISSEUR AS
SELECT P.Ref, P.Quantite, P.Prix, P.Typepiece AS Type_Piece, F.Nom AS Fournisseur_Nom, F.Adresse AS Fournisseur_Adresse, G.Id AS Stockage_Id, G.Adresse AS Stockage_Adresse
FROM PIECE P
JOIN FOURNISSEUR F ON P.Fournisseur = F.Nom
JOIN GARAGE G ON P.Stockage = G.Id;

CREATE VIEW FICHE_CLIENT AS
SELECT Id, Nom, Prenom, Tel, Mail
FROM PERSONNE;
