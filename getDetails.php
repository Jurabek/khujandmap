<?php
include "dbInfo.php";
$point = $_GET["point"];
$latAndLng = explode(";", $point);
$marker = "SELECT * from markers where lat = ". $latAndLng[0]." AND lng = ".$latAndLng[1];
$markerid = db2Array(mysql_query($marker))[0]['id'];
$sql = "SELECT * from details where id_marker = ".$markerid;
$item = db2Array(mysql_query($sql))[0];
echo $item['text'];



