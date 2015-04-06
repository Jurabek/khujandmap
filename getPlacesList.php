<?php
require("dbInfo.php");

$types = "SELECT * FROM types";
$result = mysql_query($types);

echo '<select id="places" class="selectpicker" onchange="changeFunction();" data-live-search="true">';

foreach (db2Array($result) as $type) {

    echo "<optgroup label=" . $type['type_name'] . ">";
    foreach (getMarkersWithType($type['id']) as $item) {
        $lat = $item['lat'];
        $lng = $item['lng'];
        $arr = array();
        $arr[] = $lat;
        $arr[] = $lng;
        echo "<option value='" . $arr[0] . ";" . $arr[1] . "'>" . $item['marker_name'] . "</option>";
    }
    echo "</optgroup>";
}

function getMarkersWithType($typeId)
{
    $sql = "SELECT * FROM markers WHERE type = " . $typeId;
    return db2Array(mysql_query($sql));
}

echo '</select>';


