import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final double latitude;
  final double longitude;

  MapSample({required this.latitude, required this.longitude});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  // CameraPosition? _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  GoogleMapController? controller;
  animate() async {
    CameraPosition _kGooglePlexe = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.4746,
    );
    controller = await _controller.future;
    controller!.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlexe));
  }

  void onMapCreated(GoogleMapController _controller) {
    controller = _controller;
    methodA(LatLng(widget.latitude, widget.longitude));
  }

  void methodA(LatLng position) {
    controller!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15.0)));
  }

  @override
  void initState() {
    animate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(latitude);
    return Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
            zoom: 14.4746,
          ),
          onMapCreated: onMapCreated),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}
