<?php
$username="root";
$password="";
$database="khujandmap";

// Opens a connection to a MySQL server
$connection=mysql_connect ("localhost", $username, $password);
if (!$connection) {
    die('Not connected : ' . mysql_error());
}
mysql_query("set names utf8");
// Set the active MySQL database
$db_selected = mysql_select_db($database, $connection);
if (!$db_selected) {
    die ('Can\'t use db : ' . mysql_error());
}

function db2Array($query){
    $arr = array();
    while($row = @mysql_fetch_assoc($query)){
        $arr[] =$row;
    }
    return $arr;
}
