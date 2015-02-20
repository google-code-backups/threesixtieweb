<form method="post" action="<?php $_SERVER['PHP_SELF']; ?>">
    <label for="user"><?php echo get_text('Select_a') . ' ' . strtolower(get_text('User')); ?>: </label>
    <select name="user">
        <option value=""><?php echo get_text('Choose_a') . ' ' . strtolower(get_text('User')); ?></option>
        <?php
        foreach ($departments as $department) {
            ?>
            <optgroup label="<?php echo $department['Name']; ?>">
                <?php
                foreach ($users as $user) {
                    $user_department = get_user_department($user['ID']);
                    if ($user_department == $department['ID']) {
                        ?>
                        <option
                            value="<?php echo $user['Username']; ?>"><?php echo $user['Firstname'] . ' ' . $user['Lastname']; ?></option>
                    <?php
                    }
                }
                ?>
            </optgroup>
        <?php
        }
        ?>
    </select>
    <br/>
    <input type="submit" value="<?php echo get_text('View'); ?>" name="view_user_info"/>
</form>