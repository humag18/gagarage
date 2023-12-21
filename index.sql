USE GAGARAGE;

CREATE INDEX idx_pays_primary ON PAYS(Nom);
CREATE INDEX idx_ville_primary ON VILLE(nom);
CREATE INDEX idx_ville_pays_fk ON VILLE(Pays);
CREATE INDEX idx_adresse_primary ON ADRESSE(id);
CREATE INDEX idx_adresse_ville_fk ON ADRESSE(Ville);
CREATE INDEX idx_garage_primary ON GARAGE(id);
CREATE INDEX idx_garage_adresse_fk ON GARAGE(Adresse);
