import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'main.dart';

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  GoogleMapController? controller;
  final CameraPosition initialPosition =
      CameraPosition(target: LatLng(Public.lat, Public.long));
  var typemap = MapType.normal;
  var cord = 'cord';
  var lat = Public.lat;
  var long = Public.long;
  var address = '';
  var options = [
    MapType.normal,
    MapType.hybrid,
    MapType.terrain,
    MapType.satellite
  ];

  static final CameraPosition cameraPosition =
      CameraPosition(target: LatLng(Public.lat, Public.long), zoom: 30);
  List<Marker> marker = [];
  List<Marker> list = [
    Marker(
        markerId: const MarkerId("1"),
        position: LatLng(Public.lat, Public.long),
        infoWindow: const InfoWindow(title: "Current Loction"))
  ];

  Future getAddress(latt, longg) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(latt, longg);
    Placemark place = placeMark[0];
    setState(() {
      address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Current Loction'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: Set.of(marker),
            myLocationEnabled: true,
            initialCameraPosition: initialPosition,
            mapType: typemap,
            onMapCreated: (controller) {
              setState(() {
                controller = controller;
              });
            },
            onTap: (val) {
              setState(() {
                lat = val.latitude;
                long = val.longitude;
                getAddress(lat, long);
                cord = val.toString();
              });
            },
          ),
          Positioned(
            left: 5,
            bottom: 150,
            child: Text(
              cord,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 100,
            child: SizedBox(
              width: 200,
              child: Text(
                address,
                softWrap: true,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
