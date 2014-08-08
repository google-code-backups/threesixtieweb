<?php
	require('includes/header.php');
	protect_page();
?>
<?php
if(isset($_GET['Start'])){
	?>
	<div id="aside">
		<ol>
			<li class="<?php if(!isset($_GET['Step'])){ echo 'active';} ?>">Start</li>
			<li class="<?php if(isset($_GET['Step']) && $_GET['Step'] == 1){ echo 'active';} ?>">Vragenlijst invullen</li>
			<li class="<?php if(isset($_GET['Step']) && $_GET['Step'] == 2){ echo 'active';} ?>">Keuze: Jouw vragenlijst</li>
			<li class="<?php if(isset($_GET['Step']) && $_GET['Step'] == 3){ echo 'active';} ?>">Keuze: Andere vragenlijst</li>
		</ol>
	</div>
	<div id="content">
		<?php
		if(!isset($_GET['Step'])){
			?>
			Het ThreeSixtyWeb evalutieproject bestaat uit twee fasen:
			<ol>
				<li>
					Fase 1 gaat over je eigen vragenlijst. Deze fase bestaat op zijn beurt weer uit 3 stappen:
					<ol>
						<li>Tijdens de eerste stap moet je je eigen vragenlijst invullen. Zodra deze vragenlijst is ingevuld, kan je deze insturen. Het is ook mogelijk om de vragenlijst op te slaan, zodat je deze later nog kan aanpassen. Zodra je de antwoorden op de vragenlijst heb doorgestuurd, is het niet meer mogelijk om deze aan te passen.</li>
						<li>Zodra je je eigen vragenlijst hebt doorgestuurd, kom je op een nieuw scherm terecht. Op dit scherm dient u medewerkers te selecteren waarvan u graag hebt dat zijn dezelfde vragenlijst over u invullen.</li>
						<li>Op het laatste venster dien je tenslotte medewerkers te selecteren waarvan u graag de vragenlijst invult</li>
						De selecties die u hebt gemaakt in stap 1 en 2 worden gebruikt om de bepalen welke vragenlijsten u uiteindelijk mag invullen, en welke medewerkers u vragenlijst zullen invullen.
					</ol>
				</li>
				<li>
					Zodra alle gebruikers fase 1 hebben afgerond, wordt fase 2 gestart. Tijdens deze fase dient u de vragenlijsten in te vullen van een aantal medewerkers.
					Ook hier is het mogelijk om de vragenlijst op te slaan, zodat u deze later nog kan aanpassen alvorens deze definitief te verzenden.
				</li>
			</ol>
			<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&amp;Step=1">Verder</a>

			<?php
		}else{
			if(isset($_POST['answer_own_questions']) || isset($_POST['save_own_questions'])){
				$poll = get_poll_by_reviewer_reviewee($_SESSION['user_id'],$_SESSION['user_id']);	
				for ($question=1; $question < 30; $question++) {
					$answer = $_POST[$question];
					answer($poll, $question, $answer);
				}
				if(isset($_POST['answer_own_questions'])){
					change_poll_status($poll, 'Ingestuurd');
					?>
					<p>Je vragenlijst is succesvol doorgestuurd.</p>
					<?php
				}else if(isset($_POST['save_own_questions'])){
					change_poll_status($poll, 'Opgeslagen');
					?>
					<p>Je vragenlijst is succesvol opgeslagen.</p>
					<?php
				}
				?>
					
					<p>Klik op Volgende om naar de volgende stap te gaan.</p>
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=1">Vorige</a>
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=2">Volgende</a>
					
				<?php
			}else if(isset($_POST['add_preferred_reviewers'])){
				if(isset($_POST['preferred_reviewer'])){
					$preferred_reviewers = $_POST['preferred_reviewer'];
					$reviewee = get_username_by_id($_SESSION['user_id']);

					foreach ($preferred_reviewers as $preferred_reviewer){
						add_preferred($preferred_reviewer, $reviewee, $reviewee);
					}
					?>
					<p>Klik op Volgende om naar de volgende stap te gaan.</p>
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=2">Vorige</a>
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=3">Volgende</a>
					<?php
				}else{
					echo "Gelieve minstens x gebruikers te selecteren.";
					?>
					<br />
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=2">Vorige</a>
					<?php
				}
			}else if(isset($_POST['add_preferred_reviewees'])){
				if(isset($_POST['preferred_reviewee'])){
					$preferred_reviewees = $_POST['preferred_reviewee'];
					$reviewer = get_username_by_id($_SESSION['user_id']);

					foreach ($preferred_reviewees as $preferred_reviewee){
						add_preferred($reviewer, $preferred_reviewee, $reviewer);
					}
					$success = true;
				}else{
					echo "Gelieve minstens x gebruikers te selecteren.";
					?>
					<br />
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=3">Vorige</a>
					<?php
					$success = false;
				}
				/*foreach ($preferred_reviewers as $preferred_reviewer) {
					echo $preferred_reviewer;
				}*/
				if($success){
				?>
					<p>Klik op Volgende om naar de volgende stap te gaan.</p>
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=3">Vorige</a>
					<a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=3">Volgende</a>
					<?php
				}
			}else if($_GET['Step'] == 1){
				$poll = get_poll_by_reviewer_reviewee($_SESSION['user_id'],$_SESSION['user_id']);
				if($poll){
					$poll_status = get_poll_status($poll);
					include('includes/form/own_poll.php');
				}else{
					echo "Er is een fout opgetreden. Probeer later nog eens.";
				}
			}else if($_GET['Step'] == 2){
				include('includes/form/preferred_reviewer.php');
			}else if($_GET['Step'] == 3){
				include('includes/form/preferred_reviewee.php');
			}
		}
		?>
	</div>
	<?php
}else{
	?>
	Welkom bij het ThreeSixtyWeb evaluatieproject.
	<br />
	Klik op <b>Start</b> om de vragenlijsten in te vullen.
	<span id="start"><a href="?Start"><h1>Start >></h1></a></span>
	<?php
}
?>
<?php require('includes/footer.php'); ?>