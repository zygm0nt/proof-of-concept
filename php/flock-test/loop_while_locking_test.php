<?php

define('MAX_REPEAT_LOCK_FILE', 10);

$fp = fopen("test_file", "r+");

$lock_counter = 0;
while ($lock_counter < MAX_REPEAT_LOCK_FILE) {
    if (flock($fp, LOCK_EX | LOCK_NB)) { 
        echo "locked file, breaking from loop";
        break;
    } else {
        echo "Couldn't get the lock! Attempted $lock_counter lockings...\n";
        usleep(500000);
        $lock_counter+= 1;
    }
}
flock($fp, LOCK_UN); 

fclose($fp);

?>

