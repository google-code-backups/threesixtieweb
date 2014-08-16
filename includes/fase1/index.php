<?php
if(isset($_GET['Start'])){
	?>
	<div class="content">
		<div class="sidebarContent">
			<?php include('includes/aside/fase1.php'); ?>
		</div>
		<?php
		if(!isset($_GET['Step'])){
			?>
			<div class="topContent">
				<?php echo get_text('Project_text'); ?>
				<h3><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&amp;Step=1"><?php echo get_text('Next'); ?></a></h3>
			</div>

			<?php
		}else{
			if(isset($_POST['answer_own_questions']) || isset($_POST['save_own_questions'])){
				$poll = get_poll_by_reviewer_reviewee_batch($_SESSION['user_id'],$_SESSION['user_id'], get_running1_batch_id());	
				for ($question=1; $question < 30; $question++) {
					$answer = $_POST[$question];
					answer($poll, $question, $answer);
				}
				if(isset($_POST['answer_own_questions'])){
					change_poll_status($poll, 'Ingestuurd');
					$result = "<p>".get_text('Poll_send_successfully')."</p>";
				}else if(isset($_POST['save_own_questions'])){
					change_poll_status($poll, 'Opgeslagen');
					$result = "<p>".get_text('Poll_saved_successfully')."</p>";
				}
				?>
				<div class="topContent">
					<?php echo $result; ?>
					<p><?php echo get_text('Click_next_for_next_step'); ?></p>
					
					<h3 class="back"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&amp;Step=1"><?php echo get_text('Back'); ?></a></h3>
					<h3 class="next"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&amp;Step=2"><?php echo get_text('Next'); ?></a></h3>
				</div>
					
				<?php
			}else if(isset($_POST['add_preferred_reviewers'])){
				//if(isset($_POST['preferred_reviewer'])){
					
					$preferred_reviewers = $_POST['preferred_reviewer'];
					$reviewee = get_username_by_id($_SESSION['user_id']);
					delete_preferred_reviewer($reviewee);
					foreach ($preferred_reviewers as $preferred_reviewer){
						add_preferred($preferred_reviewer, $reviewee, $reviewee);
					}
				//}
					?>
					<div class="topContent">
						<p><?php echo get_text('Click_next_for_next_step'); ?></p>
						<h3 class="back"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&amp;Step=2"><?php echo get_text('Back'); ?></a></h3>
						<h3 class="next"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&amp;Step=3"><?php echo get_text('Next'); ?></a></h3>
					</div>
					<?php
				/*}else{
					$error = get_text('Select_x_users_at_least');
					?>
					<div class="topContent">
						<?php echo $error; ?>
						<br />
						<h3><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=2"><?php echo get_text('Back'); ?></a></h3>
					</div>
					<?php
				}*/
			}else if(isset($_POST['add_preferred_reviewees'])){
				if(isset($_POST['preferred_reviewee'])){
					$preferred_reviewees = $_POST['preferred_reviewee'];
					$reviewer = get_username_by_id($_SESSION['user_id']);
					delete_preferred_reviewee($reviewer);
					foreach ($preferred_reviewees as $preferred_reviewee){
						add_preferred($reviewer, $preferred_reviewee, $reviewer);
					}
					
				}/*else{
					$error = get_text('Select_x_users_at_least');
					?>
					<div class="topContent">
						<?php echo $error; ?>
						<br />
						<h3><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&Step=3"><?php echo get_text('Back'); ?></a></h3>
					</div>
					<?php
					$success = false;
				}*/
				$success = true;
				if($success){
				?>
					<div class="topContent">
						<p><?php echo get_text('End_phase1_text'); ?></p>
						<h3 class="back"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?Start&amp;Step=3"><?php echo get_text('Back'); ?></a></h3>
						<h3 class="next"><a href="<?php echo $_SERVER['PHP_SELF']; ?>"><?php echo get_text('Exit'); ?></a></h3>
					</div>
					<?php
				}
			}else if($_GET['Step'] == 1){
				$poll = get_poll_by_reviewer_reviewee_batch($_SESSION['user_id'],$_SESSION['user_id'], get_running1_batch_id());
				if($poll){
					$poll_status = get_poll_status($poll);
					echo '<div class="topContent">';
						include('includes/form/own_poll.php');
					echo '</div>';
				}else{
					echo '<div class="topContent">'.get_text('Error_occured_try_again').'</div>';
				}
			}else if($_GET['Step'] == 2){
				echo '<div class="topContent">';
					include('includes/form/preferred_reviewer.php');
				echo '</div>';
			}else if($_GET['Step'] == 3){
				echo '<div class="topContent">';
					include('includes/form/preferred_reviewee.php');
				echo '</div>';
			}
		}
		?>
	</div>
	<div class="topSidebar step">
		<?php include('includes/aside/fase1.php'); ?>
	</div>
<?php
}else{
	?>
	<div class="topContent">
		<?php echo get_text('Phase1_text'); ?>
		<span id="start"><a href="?Start"><h1><?php echo get_text('Start'); ?> >></h1></a></span>
	</div>
	<?php
}
?>