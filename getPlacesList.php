<?php
require("dbInfo.php");

// Select all the rows in the markers table
$query = "SELECT markers.marker_name, markers.address, markers.lat,markers.lng, types.type_name FROM markers INNER JOIN types ON markers.type = types.id";
$result = mysql_query($query);

foreach (db2Array($result) as $item) {
    $lat = $item['lat'];
    $lng = $item['lng'];
    echo "<a href='#' onclick='load($lat,$lng, 20)'>".$item['marker_name']."</a>"."<br>";
}


