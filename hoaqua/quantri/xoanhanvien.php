<?php

//lay id goi den
$delid = $_GET['id'];

//ket noi csdl
require('../db/conn.php');

$sql_str = "delete from account where id=$delid";
mysqli_query($conn, $sql_str);

//trở về trang liệt kê 
header("location:listuser.php");