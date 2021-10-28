CREATE DATABASE Martiens_V2;

USE Martiens_V2;

CREATE TABLE Terrien(
	terrien_id INT PRIMARY KEY IDENTITY(1,1),
	name_terrien VARCHAR(50) NOT NULL,
	continent_id INT NOT NULL,
	FOREIGN KEY (continent_id) REFERENCES Continent(continent_id),
);

CREATE TABLE Continent(
	continent_id INT PRIMARY KEY IDENTITY(1,1),
	name_continent VARCHAR(50) NOT NULL,
);

CREATE TABLE Base(
	base_id INT PRIMARY KEY IDENTITY(1,1),
	name_base VARCHAR(50) NOT NULL,
);


CREATE TABLE martiens(
	martien_id INT IDENTITY(1,1) PRIMARY KEY,
	name_martien VARCHAR(50) NOT NULL,
	chef_id INT UNIQUE,
	FOREIGN KEY (chef_id) REFERENCES martiens(martien_id),
	base_id INT,
	FOREIGN KEY (base_id) REFERENCES Base(base_id),
	humain_id INT,
	FOREIGN KEY (humain_id)REFERENCES Terrien(terrien_id)
);


INSERT INTO Base(name_base)
Values ('marsbase'),
		('toto'),
		('marseille');

INSERT INTO Continent (name_continent)
Values ('saturne'),
		('pluton'),
		('terre');

INSERT INTO Terrien(name_terrien,continent_id) 
Values ('Thomas', 1),
		('Naim',2),
		('Patrick',3);
	

INSERT INTO martiens(name_martien,chef_id,base_id,humain_id) Values ('blobtee',1,1,1);
INSERT INTO martiens(name_martien,chef_id,base_id,humain_id) Values ('mwabil',2,1,1);
INSERT INTO martiens(name_martien,chef_id,base_id,humain_id) Values ('mawitone',3,2,2);
INSERT INTO martiens(name_martien,chef_id,base_id,humain_id) Values ('quotuvy',4,2,2);



SELECT *
FROM Terrien
INNER JOIN Continent
ON Terrien.terrien_id=Continent.continent_id;

SELECT name_martien,name_terrien,name_continent,name_base
FROM martiens
INNER JOIN Terrien
ON martiens.humain_id=Terrien.terrien_id
INNER JOIN Base
ON martiens.humain_id=Base.base_id
INNER JOIN Continent
ON martiens.humain_id=Continent.continent_id;





