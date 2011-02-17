<?php

$fp = fopen("test_file", "r+");

if (flock($fp, LOCK_EX | LOCK_NB)) { // do an exclusive lock
    echo "locked file, now sleeping";
    sleep(50000);
    flock($fp, LOCK_UN); // release the lock
} else {
    echo "Couldn't get the lock!";
}

fclose($fp);

?>

