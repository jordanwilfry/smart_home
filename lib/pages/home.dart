import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_home/pages/profile_page.dart';
import 'package:smart_home/pages/rooms/bath_room.dart';
import 'package:smart_home/pages/rooms/bed_room.dart';
import 'package:smart_home/pages/rooms/family_room.dart';
import 'package:smart_home/pages/rooms/garage.dart';
import 'package:smart_home/pages/rooms/kitchen.dart';
import 'package:smart_home/pages/rooms/living_room.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser;
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/home_background2.jpeg"),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.02, right: size.width * 0.02),
                margin: EdgeInsets.only(bottom: size.height * 0.02),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: signOut,
                        icon: Icon(
                          Icons.logout,
                          size: 30,
                        ),
                      ),
                      Text(
                        "Smart Home",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            letterSpacing: size.width * 0.01),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ProfilePage();
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Image(
                              image: AssetImage("images/avatar.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome!",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Good Morning John Doe",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "November 5, 2022",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      "12:30 AM",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(size.width * 0.02),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.04),
                      height: 180,
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Positioned(child: Icon(Icons.sunny, color: Colors.yellow,size: 30,)),
                                  Icon(
                                    Icons.cloud,
                                    size: 55,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Text("Sunny", style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w700
                              ),),
                              Text("40 C", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 60
                              ),)
                            ],
                          ),
                          SizedBox(height: size.height * 0.03,),
                          Text("BUEA - CAMEROON", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w200),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.01,
                      right: size.width * 0.02,
                      left: size.width * 0.02,
                      bottom: size.height * 0.02),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 255, 0, 0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Living room",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 255, 0, 0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Family Room",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 255, 0, 0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Kitcken",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 255, 0, 0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Bath Room",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 255, 0, 0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Garage",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 255, 0, 0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Bed Room",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      PlacesInHouseBox(
                        size: size,
                        textColor: const Color.fromRGBO(255, 174, 222, 1),
                        room: 'Living Room',
                        icon: const Icon(
                          Icons.chair,
                          size: 40,
                          color: Colors.grey,
                        ),
                        color: const Color.fromRGBO(255, 174, 222, 0.5),
                        devices: '5 connected devices',
                        navigation: const LivingRoom(
                          room: 'Living room',
                          devices: 6,
                          color: Color.fromRGBO(255, 174, 222, 0.5), icon: Icons.chair,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PlacesInHouseBox(
                        size: size,
                        textColor: const Color.fromRGBO(255, 244, 131, 1),
                        room: 'Kitchen',
                        icon: const Icon(
                          Icons.kitchen,
                          size: 40,
                          color: Colors.grey,
                        ),
                        color: const Color.fromRGBO(255, 244, 131, 0.5),
                        devices: '5 connected devices',
                        navigation: const LivingRoom(
                          room: "Kitchen",
                          color: Color.fromRGBO(255, 244, 131, 0.5), devices: 5, icon: Icons.kitchen,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PlacesInHouseBox(
                        size: size,
                        textColor: const Color.fromRGBO(102, 255, 74, 1),
                        room: 'Garage',
                        icon: const Icon(
                          Icons.garage,
                          size: 40,
                          color: Colors.grey,
                        ),
                        color: const Color.fromRGBO(102, 255, 74, 0.5),
                        devices: '5 connected devices',
                        navigation: const LivingRoom(
                          room: "Garage",
                          color: Color.fromRGBO(102, 255, 74, 0.5), icon: Icons.garage, devices: 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      PlacesInHouseBox(
                        size: size,
                        textColor: const Color.fromRGBO(96, 255, 235, 1),
                        room: 'Family Room',
                        icon: const Icon(
                          Icons.family_restroom,
                          size: 40,
                          color: Colors.grey,
                        ),
                        color: const Color.fromRGBO(96, 255, 235, 0.5),
                        devices: '5 connected devices',
                        navigation: const LivingRoom(
                          room: "Family room",
                          color: Color.fromRGBO(96, 255, 235, 0.5), icon: Icons.family_restroom, devices: 4,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PlacesInHouseBox(
                        size: size,
                        textColor: const Color.fromRGBO(55, 55, 55, 1),
                        room: 'bath Room',
                        icon: const Icon(
                          Icons.bathtub,
                          size: 40,
                          color: Colors.white70,
                        ),
                        color: const Color.fromRGBO(55, 55, 55, 0.5),
                        devices: '5 connected devices',
                        navigation: const LivingRoom(
                          room: "Bath room",
                          color: Color.fromRGBO(55, 55, 55, 0.5), devices: 5,icon: Icons.bathtub,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PlacesInHouseBox(
                        size: size,
                        textColor: const Color.fromRGBO(253, 118, 124, 1),
                        room: 'BedRoom',
                        icon: const Icon(
                          Icons.bed,
                          size: 40,
                          color: Colors.grey,
                        ),
                        color: const Color.fromRGBO(253, 118, 124, 0.5),
                        devices: '5 connected devices',
                        navigation: const LivingRoom(
                          room: "Bed room",
                          color: Color.fromRGBO(253, 118, 124, 0.5), devices: 5, icon: Icons.bed,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(onTap:() => debugPrint(user.toString()),
              child: Text("click"),)
            ],
          ),
        ),
      ),
    );
  }


  Future signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}

class PlacesInHouseBox extends StatelessWidget {
  const PlacesInHouseBox({
    Key? key,
    required this.size,
    required this.textColor,
    required this.color,
    required this.room,
    required this.devices,
    required this.icon,
    required this.navigation,
  }) : super(key: key);

  final Size size;
  final Color textColor;
  final Color color;
  final String room;
  final String devices;
  final Icon icon;
  final Widget navigation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return navigation;
            },
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  // boxShadow: [
                  //    BoxShadow(
                  //       offset: Offset(0, 0),
                  //       color: Colors.grey,
                  //       blurRadius: 5,
                  //       spreadRadius: 2)
                  // ]
                ),
                width: size.width * 0.45,
                height: size.width * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: color, radius: 30, child: icon),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      room,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: textColor),
                    ),
                    Container(
                      height: 20,
                    ),
                    Text(
                      devices,
                      style: TextStyle(color: textColor),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: textColor, borderRadius: BorderRadius.circular(5)),
              ))
        ],
      ),
    );
  }

}
