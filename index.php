<?php
?>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap-select.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script type="text/javascript" src="dist/js/bootstrap-select.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=false&language=ru" type="text/javascript"></script>

    <script type="text/javascript">
        var map;
        function load(lat, lng, zoom) {
            map = new google.maps.Map(document.getElementById("map"), {
                center: new google.maps.LatLng(lat, lng),
                zoom: zoom,
                mapTypeId: 'roadmap'
            });
        }


        function downloadUrl(url, callback) {
            var request = window.ActiveXObject ?
                new ActiveXObject('Microsoft.XMLHTTP') :
                new XMLHttpRequest;

            request.onreadystatechange = function () {
                if (request.readyState == 4) {
                    callback(request, request.status);
                }
            };

            request.open('GET', url, true);
            request.send(null);
        }

        function changeFunction(lat, lng, zoom) {
            var selectBox = document.getElementById('places');
            var selectedValue = selectBox.options[selectBox.selectedIndex].value;
            var splitted = selectedValue.split(";");
            find(splitted[0], splitted[1], 18);
        }

        function find(lat, lng, zoom) {
            map = new google.maps.Map(document.getElementById("map"), {
                center: new google.maps.LatLng(lat, lng),
                zoom: zoom,
                mapTypeId: 'roadmap'
            });
            var infoWindow = new google.maps.InfoWindow;

            // Change this depending on the name of your PHP file
            downloadUrl("phpsqlajax_genxml3.php", function (data) {
                var xml = data.responseXML;
                var markers = xml.documentElement.getElementsByTagName("marker");

                for (var i = 0; i < markers.length; i++) {
                    var localLat = parseFloat(markers[i].getAttribute("lat"));
                    var localLng = parseFloat(markers[i].getAttribute("lng"));
                    if (lat == localLat && lng == localLng) {
                        var name = markers[i].getAttribute("name");
                        var address = markers[i].getAttribute("address");
                        var type = markers[i].getAttribute("type");
                        var point = new google.maps.LatLng(localLat, localLng);
                        var html = "<b>" + name + "</b>";
                        html += "</br>" + address;
                        html += "<hr/>";
                        var marker = new google.maps.Marker({
                            map: map,
                            position: point
                        });
                        $.ajax(
                            {
                                type: "GET",
                                url: "getDetails.php",
                                data: {"point": localLat + ";" + localLng},
                                success: function (response) {
                                    html += response;
                                    bindInfoWindow(marker, map, infoWindow, html);
                                }
                            });
                    }
                }
            });

        }
        function bindInfoWindow(marker, map, infoWindow, html) {
            google.maps.event.addListener(marker, 'click', function () {
                infoWindow.setContent(html);
                infoWindow.open(map, marker);
            });
        }


    </script>
    <style>
        #map {
            float: left;
            width: 100%;
            height: 100%;
        }

        #control {
            background: transparent;
            padding: 10px;
            font-size: 14px;
        }

    </style>
</head>

<body onload="load(40.285072, 69.628000, 16)">

<div id="control">
    <div style="float: left">
        <strong>Чустучу:</strong>
        <?php
        require_once("getPlacesList.php");
        echo '<select id="places" class="selectpicker" onchange="changeFunction();" data-live-search="true">';
        showOptions();
        echo '</select>';
        ?>
    </div>
    <div>
        <img src="icons/1431644266_Socialmedia_icons_Navigation-128.png" width="30" height="30"/>
        <a href="howtogo.php">Как добраться</a>
    </div>
</div>
<div id="map"></div>
</body>
</html>
