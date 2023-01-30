

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  Position? lat;
  Position? long;

  MapScreen({Key? key, this.lat, this.long}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();





}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  void getLocation() async {
    _markers.add(Marker(markerId: MarkerId('Home'),
        position: LatLng(widget.lat?.latitude ?? 0.0, widget.long?.longitude ?? 0.0)
    ));
  }
@override
  void initState() {
    getLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map'),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition:CameraPosition(
            target: LatLng(48.8561, 2.2930),
            zoom: 12.0,
          ),
          onMapCreated: (GoogleMapController controller){
            _controller = controller;
          },
          markers: _markers,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching,color: Colors.white,),
        onPressed: (){
          print('markers $_markers');
          getLocation();
        },
      ),
    );
  }

}
