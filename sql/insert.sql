/* Database leeg maken*/
DELETE FROM answer;
DELETE FROM question;
DELETE FROM category;
DELETE FROM poll;
DELETE FROM user;
DELETE FROM department;
DELETE FROM poll_status;
DELETE FROM batch_status;


/* Database opvullen */

/* Categorien toevoegen aan database */
INSERT INTO category (Name) VALUES
	('Professionaliteit'),
	('Communicatie'),
	('Organisatie'),
	('Samenwerking'),
	('Andere');

/* Batch status toevoegen aan database */
INSERT INTO batch_status (Name, Description) VALUES
	('Init', 	'Deze batch is geinitialiseerd en kan gestart worden'),
	('Running1', 'Dit is een actieve batch in fase 1'),
	('Calculate', 'De polls van deze batch kunnen berekend worden'),
	('Accepted', 'De berekende polls zijn aanvaard'),
	('Running2', 'Dit is een actieve batch in fase 2'),
	('Published','De resultaten van deze batch zijn toegangkelijk voor de gebruikers'),
	('Finished','Deze batch is afgelopen');

/* Vragen toevoegen aan database */
INSERT INTO question (Category, Question, Batch) VALUES
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Is enthousiast over zijn/haar vakgebied', 															(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Straalt vertouwen uit over de kennis die hij/zij heeft in zijn/haar vakgebied',						(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Is in staat begrijpbaar advies te geven over zijn/haar vakgebied', 									(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Kent de core business van het bedrijf genoeg om de juiste prioriteiten te leggen in zijn/haar werk',	(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Komt steeds op tijd voor meetings en afspraken', 														(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Neemt initiatief als er acties vereist zijn en houdt zich aan deze verantwoordelijkheden', 			(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),

	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Communiceert respectvol', 											(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Is helder in zijn/haar briefings aan anderen', 					(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Deelt informatie met anderen en houdt deze niet voor zich', 		(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Is duidelijk in zijn/haar verbale communicatie', 					(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Is duidelijk in zijn/haar schriftelijke communicatie', 			(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Luistert goed en gebruik de informatie op een correcte manier', 	(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Toont begrip voor anderen',										(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),

	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Helpt graag medewerkers met problemen', 							(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Stelt het belang van de organisatie voorop en toont toewijding', 	(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Durft problemen binnen de organisatie aan te kaarten', 				(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Handhaaft de afgesproken waarden en normen binnen de organisatie', 	(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Draagt mee aan een goede werksfeer', 								(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),

	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Werkt graag in teamverband', 																				(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Durft beslissingen te nemen en hier de verantwoordelijkheid voor te dragen. Ook wanneer het misloopt.', 	(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Draagt op efficiente manier bij aan meetings', 															(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Draagt bij tot een goede samenwerking tussen departementen', 												(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Neemt een vragende houding aan, ipv eisend over te komen', 												(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),

	((SELECT ID FROM category WHERE Name = 'Andere'), 'Is enthousiast in het uitvoeren van zijn/haar job', 	(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Kan anderen goed motiveren', 						(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Komt eerlijk en betrouwbaar over', 					(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Toont makkelijk waardering voor anderen', 			(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Is hulpvaardig', 									(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init'))),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Kan zaken makkelijk relativeren', 					(SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Init')));

/* Departmenten toevoegen aan database */
INSERT INTO department (Name) VALUES
	('Support/Communications'),
	('Operations'),
	('Development'),
	('Management'),
	('Finance/HR');

/* Admin toevoegen aan database */
INSERT INTO admin(Username, Password, Email) VALUES
	('Admin', '$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'admin@admin.com');

/* Users toevoegen aan database*/
INSERT INTO user (Firstname, Lastname, Username, Password, Email) VALUES
	('Maarten',		'Bosteels', 	'MaartenB',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Kathleen',	'Buffels', 		'KathleenB',		'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Dimitri',		'De Graef',		'DimitriDG',		'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Leander',		'Dierckx', 		'LeanderD',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Kevin',		'Dillaerts',	'KevinD',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Philip',		'Du Bois', 		'PhilipDB',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),	
	('Ronald',		'Geens',		'RonaldG',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Kurt',		'Gielen',		'KurtG',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Lut',			'Goedhuys', 	'LutG',				'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('David',		'Goelen', 		'DavidG',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Loesje',		'Hermans', 		'LoesjeH',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Johan',		'Heylen', 		'JohanH',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Kevin',		'Jacquemyn', 	'KevinJ',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Jasper',		'Kesteloot',	'JasperK',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Kristof',		'Konings',		'KristofK',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Bert',		'Maleszka',		'BertM',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Stijn',		'Niclaes',		'StijnN',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Helga',		'Parijs', 		'HelgaP',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Nico',		'Point',		'NicoP',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Veerle',		'Tenier',		'VeerleT',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Kristof',		'Tuyteleers', 	'KristofT',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Hilde',		'Van Bree',		'HildeVB',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Cecile',		'Van der Borght','CecileVDB',		'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Veronique',	'Van der Borght','VeroniqueVDB',	'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Sven',		'Van Dyck',		'SvenVD',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Karen',		'Van Rillaer', 	'KarenVR',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Pieter',		'Vandepitte',	'PieterV',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Peter',		'Vergote', 		'PeterV',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com'),
	('Koen',		'Zagers',		'KoenZ',			'$2y$10$CQtvXZmXCjMBfC9LePexPeUOeX/ihEzClezWg/bCsFqwXbw0zKRKO', 'wens.cedric@gmail.com');

/* Users koppelen aan departement */
INSERT INTO user_department (User, Department) VALUES
	((SELECT ID FROM user WHERE Firstname = 'Maarten'	AND Lastname = 'Bosteels'), 	(SELECT ID FROM department WHERE Name = 'Management')),
	((SELECT ID FROM user WHERE Firstname = 'Kathleen'	AND Lastname = 'Buffels'), 		(SELECT ID FROM department WHERE Name = 'Support/Communications')),
	((SELECT ID FROM user WHERE Firstname = 'Dimitri'	AND Lastname = 'De Graef'),		(SELECT ID FROM department WHERE Name = 'Operations')),
	((SELECT ID FROM user WHERE Firstname = 'Leander'	AND Lastname = 'Dierckx'), 		(SELECT ID FROM department WHERE Name = 'Operations')),
	((SELECT ID FROM user WHERE Firstname = 'Kevin'		AND Lastname = 'Dillaerts'),	(SELECT ID FROM department WHERE Name = 'Support/Communications')),
	((SELECT ID FROM user WHERE Firstname = 'Philip'	AND Lastname = 'Du Bois'), 		(SELECT ID FROM department WHERE Name = 'Management')),	
	((SELECT ID FROM user WHERE Firstname = 'Ronald'	AND Lastname = 'Geens'),		(SELECT ID FROM department WHERE Name = 'Management')),
	((SELECT ID FROM user WHERE Firstname = 'Kurt'		AND Lastname = 'Gielen'),		(SELECT ID FROM department WHERE Name = 'Operations')),
	((SELECT ID FROM user WHERE Firstname = 'Lut'		AND Lastname = 'Goedhuys'), 	(SELECT ID FROM department WHERE Name = 'Management')),
	((SELECT ID FROM user WHERE Firstname = 'David'		AND Lastname = 'Goelen'), 		(SELECT ID FROM department WHERE Name = 'Management')),
	((SELECT ID FROM user WHERE Firstname = 'Loesje'	AND Lastname = 'Hermans'), 		(SELECT ID FROM department WHERE Name = 'Development')),
	((SELECT ID FROM user WHERE Firstname = 'Johan'		AND Lastname = 'Heylen'), 		(SELECT ID FROM department WHERE Name = 'Development')),
	((SELECT ID FROM user WHERE Firstname = 'Kevin'		AND Lastname = 'Jacquemyn'), 	(SELECT ID FROM department WHERE Name = 'Development')),
	((SELECT ID FROM user WHERE Firstname = 'Jasper'	AND Lastname = 'Kesteloot'),	(SELECT ID FROM department WHERE Name = 'Support/Communications')),
	((SELECT ID FROM user WHERE Firstname = 'Kristof'	AND Lastname = 'Konings'),		(SELECT ID FROM department WHERE Name = 'Development')),
	((SELECT ID FROM user WHERE Firstname = 'Bert'		AND Lastname = 'Maleszka'),		(SELECT ID FROM department WHERE Name = 'Development')),
	((SELECT ID FROM user WHERE Firstname = 'Stijn'		AND Lastname = 'Niclaes'),		(SELECT ID FROM department WHERE Name = 'Development')),
	((SELECT ID FROM user WHERE Firstname = 'Helga'		AND Lastname = 'Parijs'), 		(SELECT ID FROM department WHERE Name = 'Finance/HR')),
	((SELECT ID FROM user WHERE Firstname = 'Nico'		AND Lastname = 'Point'),		(SELECT ID FROM department WHERE Name = 'Operations')),
	((SELECT ID FROM user WHERE Firstname = 'Veerle'	AND Lastname = 'Tenier'),		(SELECT ID FROM department WHERE Name = 'Operations')),
	((SELECT ID FROM user WHERE Firstname = 'Kristof'	AND Lastname = 'Tuyteleers'), 	(SELECT ID FROM department WHERE Name = 'Operations')),
	((SELECT ID FROM user WHERE Firstname = 'Hilde'		AND Lastname = 'Van Bree'),		(SELECT ID FROM department WHERE Name = 'Support/Communications')),
	((SELECT ID FROM user WHERE Firstname = 'Cecile'	AND Lastname = 'Van der Borght'),(SELECT ID FROM department WHERE Name = 'Support/Communications')),
	((SELECT ID FROM user WHERE Firstname = 'Veronique'	AND Lastname = 'Van der Borght'),(SELECT ID FROM department WHERE Name = 'Support/Communications')),
	((SELECT ID FROM user WHERE Firstname = 'Sven'		AND Lastname = 'Van Dyck'),		(SELECT ID FROM department WHERE Name = 'Operations')),
	((SELECT ID FROM user WHERE Firstname = 'Karen'		AND Lastname = 'Van Rillaer'), 	(SELECT ID FROM department WHERE Name = 'Finance/HR')),
	((SELECT ID FROM user WHERE Firstname = 'Pieter'	AND Lastname = 'Vandepitte'),	(SELECT ID FROM department WHERE Name = 'Development')),
	((SELECT ID FROM user WHERE Firstname = 'Peter'		AND Lastname = 'Vergote'), 		(SELECT ID FROM department WHERE Name = 'Management')),
	((SELECT ID FROM user WHERE Firstname = 'Koen'		AND Lastname = 'Zagers'),		(SELECT ID FROM department WHERE Name = 'Operations'));

/* Managers toevoegen aan department*/
UPDATE department SET Manager = (SELECT ID FROM user WHERE Firstname = 'Lut' AND Lastname = 'Goedhuys') WHERE Name = 'Support/Communications';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Firstname = 'David' AND Lastname = 'Goelen') WHERE Name = 'Operations';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Firstname = 'Maarten' AND Lastname = 'Bosteels') WHERE Name = 'Development';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Firstname = 'Philip' AND Lastname = 'Du Bois') WHERE Name = 'Management';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Firstname = 'Peter' AND Lastname = 'Vergote') WHERE Name = 'Finance/HR';

/* Statussen toevoegen aan database*/
INSERT INTO poll_status (Name) VALUES 
	('Niet ingevuld'),
	('Opgeslagen'),
	('Ingestuurd'),
	('Commentaar');

/* Parameters toevoegen aan database */
/*gebruik hier ook een short-name kolom */
/* Hoe worden parameters door php opgehaald ? via ID  of via beschrijving ? */
/* een ID (numeriek is weinig zeggend voor de lezer*/
/*short name column needs to be unique */
INSERT INTO parameter (Short_name, Name, Value) VALUES
	('Reviews_to_give', 'Aantal reviews geven', 5),
	('Reviews_to_receive', 'Aantal reviews krijgen', 5),
	('Reviews_by_not_teammanager', 'Maximum aantal reviews door (niet eigen) manager', 1),
	/*('Reviews_selected_reviewees', 'Minimaal aantal reviews dat reviewer geeft aan gebruikers die hij heeft geselecteerd', 3),
	('Reviews_selected_reviewers', 'Minimaal aantal reviews dat reviewee krijgt van gebruikers die hij heeft geselecteerd', 2),*/
	('Reviews_own_department', 'Maximum aantal reviews uit eigen departement', 2);

/* Antwoord mogelijkheden toevoegen aan database */
INSERT INTO answer_enum (Name, Description) VALUES
	('Heel slecht', 'De gebruiker wordt zeer slecht beoordeeld op dit onderdeel'),
	('Slecht', 'De gebruiker wordt slecht beoordeeld op dit onderdeel'),
	('Neutraal', 'De gebruiker wordt neutraal beoordeeld op dit onderdeel'),
	('Goed', 'De gebruiker wordt goed beoordeeld op dit onderdeel'),
	('Zeer goed', 'De gebruiker wordt zeer goed beoordeeld op dit onderdeel'),
	('N.v.t', 'Dit onderdeel was niet van toepassing voor de gebruiker');