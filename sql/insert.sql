/* Database leeg maken*/
DELETE FROM answer;
DELETE FROM question;
DELETE FROM category;
DELETE FROM poll;
DELETE FROM user;
DELETE FROM department;


/* Database opvullen */

/* Categorien toevoegen aan database */
INSERT INTO category (Name) VALUES
	('Professionaliteit'),
	('Communicatie'),
	('Organisatie'),
	('Samenwerking'),
	('Andere');

/* Vragen toevoegen aan database */
INSERT INTO question (Category, Question) VALUES
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Is enthousiast over zijn/haar vakgebied'),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Straalt vertouwen uit over de kennis die hij/zij heeft in zijn/haar vakgebied'),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Is in staat begrijpbaar advies te geven over zijn/haar vakgebied'),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Kent de core business van het bedrijf genoeg om de juiste prioriteiten te leggen in zijn/haar werk'),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Komt steeds op tijd voor meetings en afspraken'),
	((SELECT ID FROM category WHERE Name = 'Professionaliteit'), 'Neemt initiatief als er acties vereist zijn en houdt zich aan deze verantwoordelijkheden'),

	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Communiceert respectvol'),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Is helder in zijn/haar briefings aan anderen'),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Deelt informatie met anderen en houdt deze niet voor zich'),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Is duidelijk in zijn/haar verbale communicatie'),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Is duidelijk in zijn/haar schriftelijke communicatie'),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Luistert goed en gebruik de informatie op een correcte manier'),
	((SELECT ID FROM category WHERE Name = 'Communicatie'), 'Toont begrip voor anderen'),

	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Helpt graag medewerkers met problemen'),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Stelt het belang van de organisatie voorop en toont toewijding'),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Durft problemen binnen de organisatie aan te kaarten'),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Handhaaft de afgesproken waarden en normen binnen de organisatie'),
	((SELECT ID FROM category WHERE Name = 'Organisatie'), 'Draagt mee aan een goede werksfeer'),

	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Werkt graag in teamverband'),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Durft beslissingen te nemen en hier de verantwoordelijkheid voor te dragen. Ook wanneer het misloopt.'),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Draagt op efficiënte manier bij aan meetings'),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Draagt bij tot een goede samenwerking tussen departementen'),
	((SELECT ID FROM category WHERE Name = 'Samenwerking'), 'Neemt een vragende houding aan, ipv eisend over te komen'),

	((SELECT ID FROM category WHERE Name = 'Andere'), 'Is enthousiast in het uitvoeren van zijn/haar job'),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Kan anderen goed motiveren'),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Komt eerlijk en betrouwbaar over'),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Toont makkelijk waardering voor anderen'),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Is hulpvaardig'),
	((SELECT ID FROM category WHERE Name = 'Andere'), 'Kan zaken makkelijk relativeren');

/* Departmenten toevoegen aan database */
INSERT INTO department (Name) VALUES
	('Support/Communication'),
	('Operations'),
	('Development'),
	('Management'),
	('Finance/HR');

/* Users toevoegen aan databank*/
INSERT INTO user (Name, Department) VALUES
	('Johanh',	(SELECT ID FROM department WHERE Name = 'Development')),
	('Loesje',	(SELECT ID FROM department WHERE Name = 'Development')),
	('Leander',	(SELECT ID FROM department WHERE Name = 'Operations')),
	('Kristof',	(SELECT ID FROM department WHERE Name = 'Operations')),
	('Kevin',	(SELECT ID FROM department WHERE Name = 'Support/Communication')),
	('Kathleen',(SELECT ID FROM department WHERE Name = 'Support/Communication')),
	('Karen',	(SELECT ID FROM department WHERE Name = 'Finance/HR')),
	('Helga',	(SELECT ID FROM department WHERE Name = 'Finance/HR')),
	('Philipdb',(SELECT ID FROM department WHERE Name = 'Management')),
	('Maarten',	(SELECT ID FROM department WHERE Name = 'Management')),
	('Lut',		(SELECT ID FROM department WHERE Name = 'Management')),
	('Peter',	(SELECT ID FROM department WHERE Name = 'Management')),
	('Dave',	(SELECT ID FROM department WHERE Name = 'Management'));

/* Managers toevoegen aan department*/
UPDATE department SET Manager = (SELECT ID FROM user WHERE Name = 'Lut') WHERE Name = 'Support/Communication';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Name = 'Dave') WHERE Name = 'Operations';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Name = 'Maarten') WHERE Name = 'Development';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Name = 'Philipdb') WHERE Name = 'Management';
UPDATE department SET Manager = (SELECT ID FROM user WHERE Name = 'Peter') WHERE Name = 'Finance/HR';

/* Poll toevoegen aan database */
INSERT INTO poll (Reviewer, Reviewee, Comment, Status, Time) VALUES
((SELECT ID FROM user WHERE Name = 'Johanh'), (SELECT ID FROM user WHERE Name = 'Leander'), NULL, 0, '2014-08-04 11:30:32'),
((SELECT ID FROM user WHERE Name = 'Johanh'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 11:44:21'),
((SELECT ID FROM user WHERE Name = 'Peter'), (SELECT ID FROM user WHERE Name = 'Maarten'), NULL, 0, '2014-08-04 11:44:40'),
((SELECT ID FROM user WHERE Name = 'Helga'), (SELECT ID FROM user WHERE Name = 'Karen'), NULL, 0, '2014-08-04 11:44:53'),
((SELECT ID FROM user WHERE Name = 'Johanh'), (SELECT ID FROM user WHERE Name = 'Lut'), NULL, 0, '2014-08-04 13:06:30'),
((SELECT ID FROM user WHERE Name = 'Johanh'), (SELECT ID FROM user WHERE Name = 'Peter'), NULL, 0, '2014-08-04 13:31:39'),
((SELECT ID FROM user WHERE Name = 'Karen'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 15:55:09'),
((SELECT ID FROM user WHERE Name = 'Kathleen'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 15:55:31'),
((SELECT ID FROM user WHERE Name = 'Dave'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 15:55:45'),
((SELECT ID FROM user WHERE Name = 'Loesje'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 15:55:53'),
((SELECT ID FROM user WHERE Name = 'Helga'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 15:56:03'),
((SELECT ID FROM user WHERE Name = 'Maarten'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 16:25:17'),
((SELECT ID FROM user WHERE Name = 'Peter'), (SELECT ID FROM user WHERE Name = 'Johanh'), NULL, 0, '2014-08-04 16:39:56'),
((SELECT ID FROM user WHERE Name = 'Philipdb'), (SELECT ID FROM user WHERE Name = 'Maarten'), NULL, 0, '2014-08-05 09:47:50'),
((SELECT ID FROM user WHERE Name = 'Dave'), (SELECT ID FROM user WHERE Name = 'Maarten'), NULL, 0, '2014-08-05 09:49:00');

/* Antwoorden toevoegen aan database */
/*INSERT INTO answer (Poll, Question, Answer, Time) VALUES
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 1, '5', '2014-08-04 11:41:46'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 2, '3', '2014-08-04 11:54:59'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 3, '4', '2014-08-04 11:55:05'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 4, '5', '2014-08-04 11:55:09'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 5, '2', '2014-08-04 11:55:17'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 6, '4', '2014-08-04 11:55:41'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 7, '4', '2014-08-04 12:06:48'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 8, '4', '2014-08-04 12:06:54'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 9, '4', '2014-08-04 12:06:59'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 10, '4', '2014-08-04 12:07:04'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 11, '4', '2014-08-04 12:07:09'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 13, '4', '2014-08-04 12:07:15'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 12, '4', '2014-08-04 12:07:32'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 14, '4', '2014-08-04 12:07:51'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 15, '4', '2014-08-04 12:07:58'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 17, '4', '2014-08-04 12:08:03'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 18, '4', '2014-08-04 12:08:16'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 16, '3', '2014-08-04 12:08:38'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 19, '4', '2014-08-04 12:09:54'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 20, '4', '2014-08-04 12:10:01'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 21, '4', '2014-08-04 12:10:07'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 22, '4', '2014-08-04 12:10:14'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 23, '4', '2014-08-04 12:10:20'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 24, '4', '2014-08-04 12:10:26'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 26, '2', '2014-08-04 12:10:36'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 25, '1', '2014-08-04 12:11:08'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 27, '2', '2014-08-04 12:11:15'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 28, '2', '2014-08-04 12:11:24'),
((SELECT ID FROM poll WHERE Reviewer = 'Johanh' AND Reviewee = 'Leander'), 29, '1', '2014-08-04 12:11:36'),
((SELECT ID FROM poll WHERE Reviewer = 'Karen' AND Reviewee = 'Johanh'), 1, '5', '2014-08-04 12:14:12'),
((SELECT ID FROM poll WHERE Reviewer = 'Karen' AND Reviewee = 'Johanh'), 2, '1', '2014-08-04 12:14:31'),
((SELECT ID FROM poll WHERE Reviewer = 'Karen' AND Reviewee = 'Johanh'), 3, '5', '2014-08-04 12:15:56');*/