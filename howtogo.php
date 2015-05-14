<?php
require_once("getPlacesList.php");
?>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Displaying text directions with <code>setPanel()</code></title>
    <style>
        html, body, #map-canvas {
            height: 100%;
            margin: 0px;
            padding: 0px
        }
        #panel {
            position: absolute;
            top: 5px;
            left: 50%;
            margin-left: -180px;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
        }
    </style>
    <style>
        #directions-panel {
            height: 100%;
            float: right;
            width: 390px;
            overflow: auto;
        }

        #map-canvas {
            margin-right: 400px;
        }

        #control {
            background: #fff;
            padding: 5px;
            font-size: 14px;
            font-family: Arial;
            border: 1px solid #ccc;
            box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
            display: none;
        }

        @media print {
            #map-canvas {
                height: 500px;
                margin: 0;
            }

            #directions-panel {
                float: none;
                width: auto;
            }
        }
    </style>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap-select.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script type="text/javascript" src="dist/js/bootstrap-select.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&language=ru"></script>
    <script>
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();

        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapOptions = {
                zoom: 16,
                center: new google.maps.LatLng(40.285072, 69.628000)
            };
            var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directions-panel'));

            var control = document.getElementById('control');
            control.style.display = 'block';
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
        }

        function calcRoute() {
            var start = document.getElementById('start').value;
            var end = document.getElementById('end').value;
            var splittedStart = start.split(";");
            var splittedEnd = end.split(";");
            var request = {
                origin: new google.maps.LatLng(splittedStart[0], splittedStart[1]),
                destination: new google.maps.LatLng(splittedEnd[0], splittedEnd[1]),
                travelMode: google.maps.TravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.METRIC

            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</head>
<body>
<div id="control">
    <strong>Start:</strong>
    <select id="start" onchange="calcRoute();" class="selectpicker" data-live-search="true">
        <?php
        showOptions();
        ?>
    </select>
    <strong>End:</strong>
    <select id="end" onchange="calcRoute();" class="selectpicker"  data-live-search="true">
        <?php
        showOptions();
        ?>
    </select>
</div>
<div id="directions-panel"></div>
<div id="map-canvas"></div>
</body>
</html>