import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(target: LatLng(41.0445653064826, 28.99566545012448), zoom: 14),
        markers: {Marker(markerId: MarkerId("locale"), position: LatLng(41.0445653064826, 28.99566545012448))},
      ),
    );
  }
}
