/* Nederlandse tekst toevoegen aan database */
TRUNCATE TABLE text_nl;
/* you can consider truncating tables in this kind of operations, suggestion */
INSERT INTO text_nl (Name, Text) VALUES
	('Title', 		'ThreeSixtyWeb'),
	('ID', 			'ID'),
	('Username', 	'Gebruikersnaam'),
	('Password', 	'Wachtwoord'),
	('User', 		'Gebruiker'),
	('Reviewer', 	'Reviewer'),
	('Reviewee', 	'Reviewee'),
	('Poll', 		'Vragenlijst'),
	('Polls', 		'Vragenlijsten'),
	('Question', 	'Vraag'),
	('Questions', 	'Vragen'),
	('Answer', 		'Antwoord'),
	('Answers', 	'Antwoorden'),
	('Add_poll', 	'Vragenlijst toevoegen'),
	('Add_answer', 	'Antwoord toevoegen'),
	('Add_answers', 'Antwoorden toevoegen'),
	('Preference',	'Voorkeur'),
	('Preferences', 'Voorkeuren'),
	('No_polls_found', 'Geen vragenlijsten gevonden'),
	('Choose_a', 	'Kies een'),
	('Select_a',	'Selecteer een'),
	('View', 		'Bekijk'),
	('About', 		'Over'),
	('This_person_may_answer_my_poll', 'Deze persoon mag mijn vragenlijst invullen'),
	('I_want_to_answer_poll_about_this_person', 'Ik wil de vragenlijst van deze persoon invullen'),
	('Time_Created', 'Aangemaakt op'),
	('Information',	'Informatie'),
	('Please_choose_a_user', 'Gelieve een gebruiker te selecteren'),
	('Poll_already_exists', 'Deze vragenlijst bestaat al'),
	('Question_already_answered', 'Deze vraag werd al beantwoord'),
	('Answered', 'Beantwoord'),
	('Prohibited_to_prefer_yourself', 'Het is verboden om jezelf als voorkeur op te geven'),
	('Added',		'Toegevoegd');