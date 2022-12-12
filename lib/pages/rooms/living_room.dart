import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_home/pages/Camera.dart';
import 'package:firebase_database/firebase_database.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom(
      {Key? key,
      required this.room,
      required this.devices,
      required this.color,
      required this.icon})
      : super(key: key);

  final String room;
  final int devices;
  final Color color;
  final IconData icon;

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  final DatabaseReference _ref = FirebaseDatabase.instance.reference();

  bool BoobSwicht = false;
  bool ACSwicht = false;
  bool DoorSwicht = false;
  bool TVSwicht = false;
  bool HomeWifi = false;
  bool Console = false;

  double _temperature = 0;
  double _humidity = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("init");
    _ref.child("Bulbs").once().then((event) {
      final dataSnapshot = event.snapshot;
      BoobSwicht = dataSnapshot.value != null
          ? (dataSnapshot.value as Map)[widget.room]
          : false;
      debugPrint(BoobSwicht.toString());
    });

    _ref.child("house").once().then((event) {
      final dataSnapshot = event.snapshot;

      _temperature = (dataSnapshot.value as Map)["temperature"] * 1.0;

      _humidity = (dataSnapshot.value as Map)["humidity"] * 1.0;
      debugPrint(_temperature.toString());
      debugPrint(_humidity.toString());

      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    debugPrint("Build");
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/home_background2.jpeg"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              alignment: Alignment.topLeft,
              width: size.width,
              height: size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.dashboard,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.04, right: size.width * 0.04),
                  height: size.height * 0.25,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black45,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.room,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Icon(
                          widget.icon,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Temperature: ${_temperature}°C | Humidity: ${_humidity}%",
                          style: TextStyle(
                              fontSize: size.width * 0.045,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Camera(room: widget.room);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.04, right: size.width * 0.04),
                    height: 70,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black45,
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Video Camera",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Wrap(
                      children: [
                        // boob
                        Container(
                          margin: EdgeInsets.all(size.width * 0.04),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: size.width * 0.42,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white54),
                                child: Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${widget.room} Bulb",
                                            style: TextStyle(
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: size.width * 0.04,
                                          ),
                                          Text(BoobSwicht ? "On" : "Off",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.w200)),
                                          Switch(
                                            value: BoobSwicht,
                                            onChanged: (bool newVal) {
                                              setState(
                                                () {
                                                  BoobSwicht = newVal;
                                                  DatabaseReference _Buld =
                                                      FirebaseDatabase.instance
                                                          .reference()
                                                          .child("Bulbs");
                                                  _Buld.child(widget.room)
                                                      .set(BoobSwicht);
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 15,
                                        right: 5,
                                        child: Container(
                                          child: Icon(
                                            Icons.lightbulb,
                                            size: 60,
                                            color: BoobSwicht
                                                ? Colors.yellow
                                                : Colors.black87,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Ac
                        Container(
                          margin: EdgeInsets.all(size.width * 0.04),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: size.width * 0.42,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white54),
                                child: Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${widget.room} AC",
                                            style: TextStyle(
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: size.width * 0.04,
                                          ),
                                          Text(ACSwicht ? "On" : "Off",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.w200)),
                                          Switch(
                                            value: ACSwicht,
                                            onChanged: (bool newVal) {
                                              setState(
                                                () {
                                                  ACSwicht = newVal;
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 15,
                                        right: 5,
                                        child: Container(
                                          child: Icon(
                                            Icons.ac_unit,
                                            size: 60,
                                            color: ACSwicht
                                                ? Colors.lightBlue
                                                : Colors.black87,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // tv
                        Container(
                          margin: EdgeInsets.all(size.width * 0.04),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: size.width * 0.42,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white54),
                                child: Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${widget.room} Tv",
                                            style: TextStyle(
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: size.width * 0.04,
                                          ),
                                          Text(TVSwicht ? "On" : "Off",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.w200)),
                                          Switch(
                                            value: TVSwicht,
                                            onChanged: (bool newVal) {
                                              setState(
                                                () {
                                                  TVSwicht = newVal;
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 15,
                                        right: 5,
                                        child: Container(
                                          child: Icon(
                                            Icons.tv,
                                            size: 60,
                                            color: TVSwicht
                                                ? Colors.lightBlue
                                                : Colors.black87,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Wifi
                        Container(
                          margin: EdgeInsets.all(size.width * 0.04),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: size.width * 0.42,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white54),
                                child: Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${widget.room} WiFi",
                                            style: TextStyle(
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: size.width * 0.04,
                                          ),
                                          Text(HomeWifi ? "On" : "Off",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.w200)),
                                          Switch(
                                            value: HomeWifi,
                                            onChanged: (bool newVal) {
                                              setState(
                                                () {
                                                  HomeWifi = newVal;
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 15,
                                        right: 5,
                                        child: Container(
                                          child: Icon(
                                            Icons.wifi,
                                            size: 60,
                                            color: HomeWifi
                                                ? Colors.lightBlue
                                                : Colors.black87,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // gamming Console
                        Container(
                          margin: EdgeInsets.all(size.width * 0.04),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: size.width * 0.42,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white54),
                                child: Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Gaming console",
                                            style: TextStyle(
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: size.width * 0.04,
                                          ),
                                          Text(Console ? "On" : "Off",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.w200)),
                                          Switch(
                                            value: Console,
                                            onChanged: (bool newVal) {
                                              setState(
                                                () {
                                                  Console = newVal;
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 15,
                                        right: 5,
                                        child: Container(
                                          child: Icon(
                                            Icons.gamepad,
                                            size: 60,
                                            color: Console
                                                ? Colors.lightBlue
                                                : Colors.black87,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      )),
    );
  }
}
