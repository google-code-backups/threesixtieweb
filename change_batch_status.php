<?php
	include'core/init.php';
	if(isset($_GET['id']) && isset($_GET['action'])){
		$batch = $_GET['id'];
		$action = $_GET['action'];
		switch ($_GET['action']) {
			case 'Init':
				break;
			case 'Start':
				start_batch($_GET['id']);
				stop_batch(get_published_batch_id());
				break;
			case 'Calculate':
				calculate_couples($_GET['id']);
				break;
			case 'Run':
				run_batch($_GET['id']);
				break;
			case 'Publish':
				publish_batch($_GET['id']);
				break;
			case 'Stop':
				stop_batch($_GET['id']);
				break;
			default:
					# code...
			break;
		}
		$batches = get_batches();
		echo mysql_error();
		?>
		<tr>
			<th>ID</th>
			<th>Init Date</th>
			<th>Phase 1</th>
			<th>Phase 2</th>
			<th>Finished Date</th>
			<th>Status</th>
			<th>Comment</th>
			<th>Action</th>
		</tr>
		<?php
		foreach ($batches as $batch) {
			?>
			<tr>
				<td><?php echo $batch['ID']; ?></td>
				<td><?php echo $batch['Init_date']; ?></td>
				<td><?php echo $batch['Running1_date']; ?></td>
				<td><?php echo $batch['Running2_date']; ?></td>
				<td><?php echo $batch['Finished_date']; ?></td>
				<td><?php echo get_batch_status_name($batch['Status']); ?></td>
				<td><?php echo $batch['Comment']; ?></td>
				<td>
					<?php include('includes/form/change_batch_status.php'); ?>
				</td>
			</tr>
		<?php
		}
		?>
		<tr>
			<td colspan="8">
				<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
					<input type="submit" name="add_batch" onclick="add_new_batch();" value="Batch toevoegen" />
				</form>
			</td>
		</tr>
		<?php
	}
?>