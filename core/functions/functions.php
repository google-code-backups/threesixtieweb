<?php
	ob_start();
	function create_date(){
		$time = time();
		$date = date("Y-m-d H:i:s", $time);
		return $date;
	}
	function get_text($name){
		$query = mysql_query("SELECT Text FROM text_nl WHERE Name = '$name'");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_text_info($name){
		$query = mysql_query("SELECT * FROM text_nl WHERE Name = '$name'");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$questions[] = array(
					'ID' => $row['ID'],
					stripslashes('Name') => $row['Name'],
					stripslashes('Text') => $row['Text'],
					stripslashes('Comment') => $row['Comment']
				);
			}
			return $questions;
		}
	}
	function get_managers(){
		$query = mysql_query("SELECT d.Name AS Department, u.Name FROM user u INNER JOIN department d ON u.ID = d.Manager");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$managers[] = array(
					stripslashes('Department') => $row['Department'],
					stripslashes('Name') => $row['Name']
				);
			}
			return $managers;
		}
	}
	function get_users(){
		$query = mysql_query("SELECT * FROM user ORDER BY Lastname ASC");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$users[] = array(
					'ID' => $row['ID'],
					stripslashes('Firstname') => $row['Firstname'],
					stripslashes('Lastname') => $row['Lastname'],
					stripslashes('Username') => $row['Username'],
					stripslashes('Job_Title') => $row['Job_Title']
				);
			}
			return $users;
		}
	}
	function get_polls(){
		$query = mysql_query("SELECT * FROM poll");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$polls[] = array(
					'ID'			=> $row['ID'],
					'Reviewer' 		=> $row['Reviewer'],
					'Reviewee'		=> $row['Reviewee'],
					'Comment'		=> $row['Comment'],
					'Status'		=> $row['Status'],
					'Time_Created'	=> $row['Time_Created'],
					'Last_Update'	=> $row['Last_Update']
				);
			}
			return $polls;
		}
	}
	function get_poll_status($poll){
		$query = mysql_query("SELECT Status FROM poll WHERE ID = $poll");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_poll_status_id($poll_status){
		$query = mysql_query("SELECT ID FROM poll_status WHERE Name = '$poll_status'");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_user_by_id($id){
		$query = mysql_query("SELECT Firstname, Lastname FROM user WHERE ID = $id");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_username_by_id($id){
		$query = mysql_query("SELECT Username FROM user WHERE ID = $id");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_id_by_username($username){
		$query = mysql_query("SELECT ID FROM user WHERE Username = $username");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_questions(){
		$query = mysql_query("SELECT * FROM question");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$questions[] = array(
					'ID' => $row['ID'],
					stripslashes('Question') => $row['Question'],
					'Category' => $row['Category']
				);
			}
			return $questions;
		}
	}
	function get_running_batch_id(){
		$query = mysql_query("SELECT ID FROM batch WHERE Status = (SELECT ID FROM batch_status WHERE Name = 'Running')");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_answers($poll){
		$query = mysql_query("SELECT * FROM answer WHERE poll = $poll ORDER BY Question ASC");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$answers[] = array(
					'ID' => $row['ID'],
					'Poll' => $row['Poll'],
					'Question' => $row['Question'],
					stripslashes('Answer') => $row['Answer'],
					'Last_Update' => $row['Last_Update']
				);
			}
			return $answers;
		}
	}
	function get_answer($poll, $question){
		$query = mysql_query("SELECT Answer FROM answer WHERE Poll = $poll AND Question = $question");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_categories(){
		$query = mysql_query("SELECT * FROM category");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$categories[] = array(
					'ID' => $row['ID'],
					stripslashes('Name') => $row['Name']
				);
			}
			return $categories;
		}
	}
	function get_departments(){
		$query = mysql_query("SELECT * FROM department");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$categories[] = array(
					'ID' => $row['ID'],
					stripslashes('Name') => $row['Name'],
					'Manager' => $row['Manager']
				);
			}
			return $categories;
		}
	}
	function get_batch($status){
		$query = mysql_query("SELECT ID FROM batch WHERE Name = '$status'");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_batches(){
		$query = mysql_query("SELECT * FROM batch");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$categories[] = array(
					'ID' => $row['ID'],
					'Init_date' => $row['Init_date'],
					'Running_date' => $row['Running_date'],
					'Finished_date' => $row['Finished_date'],
					'Status' => $row['Status'],
					'Comment' => $row['Comment']
				);
			}
			return $categories;
		}
	}
	function get_batch_status_name($status_id){
		$query = mysql_query("SELECT Name FROM batch_status WHERE Id = $status_id");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_user_id($user){
		$query = mysql_query("SELECT ID FROM user WHERE Username = '$user'");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_answer_name($value){
		$query = mysql_query("SELECT Name FROM answer_enum WHERE ID = $value");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_answer_value_by_name($name){
		$query = mysql_query("SELECT ID FROM answer_enum WHERE Name = '$name'");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_poll_by_reviewer_reviewee($reviewer, $reviewee){
		$query = mysql_query("SELECT ID FROM poll WHERE Reviewer = $reviewer AND Reviewee = $reviewee");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_all_poll_statuses(){
		$query = mysql_query("SELECT * FROM poll_status ORDER BY ID");
		if(!$query || mysql_num_rows($query) <=0) {
			echo mysql_error();
			return false;
		}else{
			while ($row = mysql_fetch_assoc($query)) {
				$statuses[] = array(
					'ID' => $row['ID'],
					stripslashes('Name') => $row['Name']
				);
			}
			return $statuses;
		}
	}
	function get_user_name($id){
		$query = mysql_query("SELECT Firstname, Lastname FROM user WHERE ID = $id");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_user_department($id){
		$query = mysql_query("SELECT Department FROM user_department WHERE User = $id");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_user_type_id($type){
		$query = mysql_query("SELECT ID FROM user_type WHERE Name = '$type'");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_number_of_users(){
		$query = mysql_query("SELECT count(ID) FROM user");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}

	function create_poll($reviewer, $reviewee, $status){
		$date = create_date();
		$query = mysql_query("SELECT * FROM poll WHERE Reviewer = (SELECT ID FROM user WHERE Username = '$reviewer') AND Reviewee = (SELECT ID FROM user WHERE Username = '$reviewee') AND Batch = $batch");
		if(!$query || mysql_num_rows($query)>0 || mysql_num_rows($query) < 0){
			if(mysql_num_rows($query) > 0) {
				echo get_text('Poll_already_exists');
			}else{
				echo mysql_error();

			}
		}else{
			$query = mysql_query("INSERT INTO poll (Reviewer, Reviewee, Status, Time_Created, Last_Update, Batch) VALUES ((SELECT ID FROM user WHERE Username = '$reviewer'),(SELECT ID FROM user WHERE Username = '$reviewee'), (SELECT ID FROM poll_status WHERE Name = '$status'), '$date', '$date', $batch)");
			if(!$query) {
				echo mysql_error();
			}else{
				echo get_text('Poll').' '.strtolower(get_text('Created'));
			}
		}
	}
	function answer($poll, $question, $answer){
		$date = create_date();
		$query = mysql_query("INSERT INTO answer (Poll, Question, Answer, Time_Created, Last_Update) VALUES ($poll, $question, $answer, '$date', '$date') ON DUPLICATE KEY UPDATE Answer = $answer, Last_Update = '$date'");
		if(!$query) {
			echo mysql_error();
		}else{
			/*echo get_text('Question').' '.strtolower(get_text('Answered'));*/
		}
	}
	function init_batch($batch){}
	function run_status($id){
		$date = create_date();
		mysql_query("UPDATE batch SET Status = (SELECT ID FROM batch_status WHERE Name = 'Running'), Running_date = '$date' WHERE ID = $id");
	}
	function stop_batch($id){}
	function add_preferred($reviewer, $reviewee, $user){
		$batch = get_running_batch_id();
		if($reviewer == $reviewee){
			echo get_text('Prohibited_to_prefer_yourself');
		}else{
			$query = mysql_query("	SELECT *
									FROM preferred_poll
									WHERE (
										Reviewer = (SELECT ID FROM user WHERE Username = '$reviewer')
										AND
										Reviewee = (SELECT ID FROM user WHERE Username = '$reviewee')
										AND
										User = (SELECT ID FROM user WHERE Username = '$user')
										AND
										Batch = $batch
									)
								");
			if(!$query || mysql_num_rows($query) < 0){
				echo mysql_error();
			}else if(mysql_num_rows($query) == 0){
				$query = mysql_query("	INSERT INTO preferred_poll (Reviewer, Reviewee, User, Batch) VALUES (
											(SELECT ID FROM user WHERE Username = '$reviewer'),
											(SELECT ID FROM user WHERE Username = '$reviewee'),
											(SELECT ID FROM user WHERE Username = '$user'),
											$batch
										)
										ON DUPLICATE KEY UPDATE
										Reviewer = 	(SELECT ID FROM user WHERE Username = '$reviewer'),
										Reviewee = 	(SELECT ID FROM user WHERE Username = '$reviewee'),
										User = 		(SELECT ID FROM user WHERE Username ='$user'),
										Batch =		$batch
									");
				if(!$query){
					echo mysql_error();
				}else{
						//echo get_Text('Preference').' '.strtolower('Added');
				}
			}else if(mysql_num_rows($query) > 0){
				//echo "Deze voorkeur werd al ingegeven";
			}
		}
	}
	function change_poll_status($poll, $status){
		$query = mysql_query("UPDATE poll SET Status = (SELECT ID FROM poll_status WHERE Name = '$status') WHERE ID = $poll");
	}


	function login($username, $password, $rememberme){
		$query = mysql_query("SELECT ID, Password FROM user WHERE Username = '$username'");
		if(!$query || mysql_num_rows($query) <= 0){
			echo mysql_error();
			echo "Er is een fout opgetreden. Heb je wel een account?";
		}else{
			$user = mysql_fetch_row($query);
			if(password_verify($password, $user['1'])){
				if($rememberme == "on"){
					setcookie("username",$username, time()+7200);
				}else if($rememberme == ""){
					$_SESSION['user_id'] = $user['0'];
				}
				header('Location: home.php');
				exit();
			}else{
				echo "Foutief wachtwoord";
			}
		}
	}
	function logged_in_redirect(){
		if(logged_in() === true){
			header('Location: home.php');
			exit();
		}
	}
	function logged_in(){
		return (isset($_SESSION['user_id'])||isset($_COOCKIE['username'])) ? true : false;
	}
	function protect_page(){
		if(logged_in() === false){
			header('Location: login.php');
			exit();
		}
	}
	function has_access($user, $type) {
		$query = mysql_query("SELECT Type FROM user WHERE ID = $user");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			if(mysql_result($query,0) == $type){
				return true;
			}else{
				return false;
			}
		}
	}
	

	function get_admin_id($name){
		$query = mysql_query("SELECT ID FROM admin WHERE Username = '$name");
		if(!$query || mysql_num_rows($query) <=0){
			echo mysql_error();
			return false;
		}else{
			return mysql_result($query,0);
		}
	}
	function get_user_info($id){
		$user 					= get_user_by_id($id);
		$reviews_given 			= get_number_of_reviews_given($id);
		$reviews_received 		= get_number_of_reviews_received($id);
		$teammember_reviews		= get_number_of_poll_team_members($id);
		$notteammember_reviews 	= get_number_of_poll_not_team_members($id);
		$teammanager_reviews 	= get_number_of_poll_team_manager($id);
		$notteammanager_reviews = get_number_of_poll_not_team_manager($id);
		$preferred_reviewers 	= get_number_of_preferred_reviewers($id);
		$preferred_reviewees 	= get_number_of_preferred_reviewees($id);
		$questions 				= get_questions();
		echo "
			Heeft <b>$reviews_given</b> review geschreven.
			<br />
			Heeft <b>$reviews_received</b> reviews gekregen.
			<br />
			Krijgt review(s) van <b>$teammember_reviews</b> teamleden.
			<br />
			Krijgt review(s) van <b>$notteammember_reviews</b> niet-teamleden.
			<br />
			Krijgt <b>$teammanager_reviews</b> review(s) van zijn teammanager.
			<br />
			Krijgt <b>$notteammanager_reviews</b> review(s) van andere teammanagers.
			<br />
			<b>$preferred_reviewers</b> van de gebruikers die $user aangaf, mogen ook effectief de vragenlijst over $user invullen.
			<br />
			$user mag van <b>$preferred_reviewees</b> gebruiker die zijn had gekozen, ook effectief de vragenlijst invullen.";
			?>
			<table>
				<tr>
					<th></th>
					<th>Vraag</th>
					<th>Gemiddelde score</th>
				</tr>
				<?php 
					foreach ($questions as $question) {
						?>
						<tr>
							<td>
								<?php echo $question['ID'] ?>
							</td>
							<td>
								<?php echo $question['Question']; ?>
							</td>
							<td style="text-align:center;">
								<?php echo get_average_score($id, $question['ID']); ?>
							</td>
						</tr>
						<?php
					}
				?>
			</table>
			<?php	
	}
	function get_number_of_reviews_given($id){
		$query = mysql_query("SELECT Aantal_Reviews FROM reviews_given_view WHERE Reviewer = $id");
		if(!$query || mysql_num_rows($query) <0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_number_of_reviews_received($id){
		$query = mysql_query("SELECT Aantal_Reviews FROM reviews_received_view WHERE Reviewee = $id");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_number_of_poll_team_members($id){
		$query = mysql_query("SELECT Aantal_TeamLeden FROM teammember_view WHERE Reviewee = $id");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_number_of_poll_not_team_members($id){
		$query = mysql_query("SELECT Aantal_NietTeamLeden FROM notteammember_view WHERE Reviewee = $id");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_number_of_poll_team_manager($id){
		$query = mysql_query("SELECT Aantal_TeamManagers FROM teammanager_view WHERE Reviewee = $id");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_number_of_poll_not_team_manager($id){
		$query = mysql_query("SELECT Aantal_NietTeamManagers FROM notteammanager_view WHERE Reviewee = $id");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_number_of_preferred_reviewers($id){
		$query = mysql_query("SELECT Aantal_Preferred_Reviewers FROM preferred_reviewers_view WHERE Reviewee = $id");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_number_of_preferred_reviewees($id){
		$query = mysql_query("SELECT Aantal_Preferred_Reviewees FROM preferred_reviewees_view WHERE Reviewer = $id");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}
	function get_average_score($user, $question){
		$query = mysql_query("SELECT Average_Score FROM average_score_view WHERE Reviewee = $user AND Question = $question");
		if(!$query || mysql_num_rows($query) < 0) {
			echo mysql_error();
			return false;
		}else{
			if(mysql_num_rows($query) == 0){
				return 0;
			}
			return mysql_result($query, 0);
		}
	}

	function is_preferred_reviewee($reviewer, $reviewee){
		return(mysql_result(mysql_query("SELECT COUNT(*) FROM preferred_poll WHERE Reviewer = $reviewer AND Reviewee = $reviewee"), 0) == 1) ? true : false;
	}
	function is_preferred_reviewer($reviewee, $reviewer){
		return(mysql_result(mysql_query("SELECT COUNT(*) FROM preferred_poll WHERE Reviewer = $reviewer AND Reviewee = $reviewee"), 0) == 1) ? true : false;
	}
	function sanitize($data) {
		return htmlentities(strip_tags(mysql_real_escape_string($data)));
	}




	$questions = get_questions();
	$categories = get_categories();
	$polls = get_polls();
	$users = get_users();
	$departments = get_departments();
	$poll_statuses = get_all_poll_statuses();
	$number_of_users = get_number_of_users();
?>