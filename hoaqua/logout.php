<?php

session_start();
unset($_SESSION["user"]);  //xoa session user
unset($_SESSION['user']['type']);
header("Location: login.php");

?>