CREATE DATABASE butorwebshop DEFAULT CHARACTER SET = 'utf8' COLLATE utf8_hungarian_ci;

CREATE TABLE felhasznalok (
    felhasznalo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    felhasznalo_nev VARCHAR(40) NOT NULL,
    felhasznalo_email VARCHAR(50) NOT NULL,
    felhasznalo_jelszo BLOB NOT NULL
);

CREATE TABLE rendeles (
    rendeles_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rendeles_felhasznalo_id INT NOT NULL,
    rendeles_szallitasi_nev VARCHAR(40) NOT NULL,
    rendeles_varos VARCHAR(50) NOT NULL,
    rendeles_datum TIMESTAMP NOT NULL,
    rendeles_telefon INT(20) NOT NULL,
    FOREIGN KEY (rendeles_felhasznalo_id) REFERENCES felhasznalok(felhasznalo_id)
);

CREATE TABLE rendelesreszlet (
    reszlet_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    reszlet_darab INT NOT NULL,
    reszlet_rendeles_id INT NOT NULL,
    reszlet_termek_id INT NOT NULL,
    FOREIGN KEY (reszlet_rendeles_id) REFERENCES rendeles(rendeles_id),
    FOREIGN KEY (reszlet_termek_id) REFERENCES termekek(termek_id)
);

CREATE TABLE termekek (
    termek_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    termek_nev VARCHAR(100) NOT NULL,
    termek_ar INT(10) NOT NULL,
    termek_kategoria_id INT NOT NULL,
    termek_raktaron INT(10) NOT NULL,
    termek_kep_id INT NOT NULL,
    FOREIGN KEY (termek_kategoria_id) REFERENCES termekkategoiak(kategoria_id),
    FOREIGN KEY (termek_kep_id) REFERENCES kepek(kep_id)
);

CREATE TABLE kepek (
    kep_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kep_nev VARCHAR(100) NOT NULL,
    kep_file LONGBLOB NOT NULL
);

CREATE TABLE termekkategoiak (
    kategoria_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kategoria_nev VARCHAR(30) NOT NULL
);

INSERT INTO `felhasznalok` VALUES 
    (null, 'John Doe', 'john.doe@gmail.com', 'asd');

INSERT INTO `rendeles`  VALUES 
    (null, 1, 3, 'Kalapos Jenő', 'Budapest', NOW(), 123456789);

INSERT INTO `rendelesreszlet` VALUES 
    (null, 2, 1, 1, 2, 4);

INSERT INTO `termekek`  VALUES 
    (null, 'Asztal', 15000, 1, 10, 1, 7, 2);

INSERT INTO `kepek` VALUES 
    ('asztal_image.jpg', LOAD_FILE('/asztal_image.jpg'));

INSERT INTO `termekkategoiak` VALUES 
    ('Hálószoba');