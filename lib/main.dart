import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

Widget permission({required String name}) {
  return Ink(
    child: CircleAvatar(
      radius: 72.0,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(name),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission App"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  openAppSettings();
                });
              },
              icon: const Icon(Icons.settings_sharp))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              //Bluetooth
              InkWell(
                onTap: () async {
                  PermissionStatus res =
                      await Permission.bluetoothConnect.request();
                  setState(() {
                    if (res == PermissionStatus.granted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("bluetoothConnect is granted"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.permanentlyDenied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("bluetoothConnect is permanentlyDenied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("bluetoothConnect is denied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.restricted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("bluetoothConnect is restricted"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    }
                  });
                },
                child: permission(name: "assets/images/Bluetooth.png"),
              ),
              const SizedBox(height: 30),
              //Location
              InkWell(
                onTap: () async {
                  PermissionStatus res = await Permission.location.request();
                  setState(() {
                    if (res == PermissionStatus.granted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Location is granted"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.permanentlyDenied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Location is permanentlyDenied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Location is denied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.restricted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Location is restricted"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    }
                  });
                },
                child: permission(name: "assets/images/Location.png"),
              ),
              const SizedBox(height: 30),
              //video
              InkWell(
                onTap: () async {
                  PermissionStatus res = await Permission.camera.request();
                  setState(() {
                    if (res == PermissionStatus.granted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("videos is granted"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.permanentlyDenied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("videos is permanentlyDenied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("videos is denied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.restricted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("videos is restricted"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    }
                  });
                },
                child: permission(name: "assets/images/media.png"),
              ),
              const SizedBox(height: 30),
              //stotage
              InkWell(
                onTap: () async {
                  PermissionStatus res = await Permission.storage.request();
                  setState(() {
                    if (res == PermissionStatus.granted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("storage is granted"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.permanentlyDenied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("storage is permanentlyDenied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("storage is denied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.restricted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("storage is red"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    }
                  });
                },
                child: permission(name: "assets/images/storage.png"),
              ),
              const SizedBox(height: 30),
              //phone
              InkWell(
                onTap: () async {
                  PermissionStatus res = await Permission.phone.request();
                  setState(() {
                    if (res == PermissionStatus.granted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Phone is Granted"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.permanentlyDenied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Phone is PermanentlyDenied"),
                          backgroundColor: Colors.black,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Phone is Denied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.restricted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("phone is restricted"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    }
                  });
                },
                child: permission(name: "assets/images/phone.png"),
              ),
              const SizedBox(height: 30),
              //Calender
              InkWell(
                onTap: () async {
                  PermissionStatus res = await Permission.calendar.request();
                  setState(() {
                    if (res == PermissionStatus.granted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("calendar is granted"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.permanentlyDenied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("calendar is permanentlyDenied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("calendar is denied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.restricted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("calendar is restricted"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    }
                  });
                },
                child: permission(name: "assets/images/calculator.png"),
              ),
              const SizedBox(height: 30),
              //Microphone
              InkWell(
                onTap: () async {
                  PermissionStatus res = await Permission.microphone.request();
                  setState(() {
                    if (res == PermissionStatus.granted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("microphone is granted"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.permanentlyDenied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("microphone is permanentlyDenied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("microphone is denied"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    } else if (res == PermissionStatus.restricted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("microphone is restricted"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating));
                    }
                  });
                },
                child: permission(name: "assets/images/microphone.png"),
              ),
              const SizedBox(height: 30),
              //SMS
              InkWell(
                onTap: () async {
                  PermissionStatus res = await Permission.sms.request();
                  setState(
                    () {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("sms is granted"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("sms is permanentlyDenied"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("sms is denied"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("sms is restricted"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating));
                      }
                    },
                  );
                },
                child: permission(name: "assets/images/sms.png"),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
