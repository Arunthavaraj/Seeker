import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => MyMapState();
}

class MyMapState extends State<MyMap> {
  final Map<String, Marker> _markers = {};

   static var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  StreamSubscription<Position> positionStream = Geolocator()
      .getPositionStream(locationOptions)
      .listen((Position position) {
    print(position == null
        ? 'Unknown'
        : position.latitude.toString() + ', ' + position.longitude.toString());
  });

  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markers["Current Location"] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(40.688841, -74.044015),
            zoom: 11,
          ),
          markers: _markers.values.toSet(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getLocation,
          tooltip: 'Get Location',
          child: Icon(Icons.location_searching),
        ),
      ),
    );
  }
}
