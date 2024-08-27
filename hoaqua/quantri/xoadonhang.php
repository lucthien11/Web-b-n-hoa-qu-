<?php
//lay id goi den
$id = $_GET['id'];

//ket noi csdl
require('../db/conn.php');
$sql_str = "delete from orders where id=$id";
mysqli_query($conn, $sql_str);

//trở về trang liệt kê 
header("location:listorders.php");
?>