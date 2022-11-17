import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Home_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'weather',
      routes: {
        '/': (context) => const home(),
        'map': (context) => const map(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

Placemark? current;

class Public {
  static double lat = 0.0;
  static double long = 0.0;
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Permission.location.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("API"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                openAppSettings();
              },
              icon: const Icon(Icons.settings_outlined))
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Public.lat}\n${Public.long}\n$current"),
            ElevatedButton(
                onPressed: () async {
                  Geolocator.getPositionStream()
                      .listen((Position position) async {
                    setState(() {
                      Public.lat = position.latitude;
                      Public.long = position.longitude;
                    });
                    List<Placemark> placemark =
                        await placemarkFromCoordinates(Public.lat, Public.long);
                    setState(() {
                      current = placemark[0];
                    });
                  });
                  setState(
                    () {
                      Navigator.of(context).pushNamed('map');
                    },
                  );
                },
                child: const Text("get loction"))
          ],
        ),
      ),
    );
  }
}
