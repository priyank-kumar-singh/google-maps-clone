import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  static final CameraPosition _kInitialCameraPosition = CameraPosition(
    target: LatLng(28.61355037163269, 77.21211522817612),
    zoom: 3.0,
  );

  void moveCamera({CameraPosition position, LatLng coordinates}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position ?? CameraPosition(
      target: coordinates,
      zoom: 10.0,
    )));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kInitialCameraPosition,
      mapType: MapType.normal,
      markers: _markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) {
        if (!_controller.isCompleted) {
          _controller.complete(controller);
        }
      },
      mapToolbarEnabled: false,
      zoomControlsEnabled: false,
      onTap: (argument) {
        var marker = Marker(
          markerId: MarkerId('destination${_markers.length}'),
          position: LatLng(argument.latitude, argument.longitude),
        );
        _markers.clear();
        _markers.add(marker);
        setState(() {});
      },
    );
  }
}
