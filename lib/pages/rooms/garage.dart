import 'package:flutter/material.dart';

class Garage extends StatefulWidget {
  const Garage(
      {Key? key,
        required this.room,
        required this.color})
      : super(key: key);

  final String room;
  final Color color;

  @override
  State<Garage> createState() => _GarageState();
}

class _GarageState extends State<Garage> {
  bool BoobSwicht = false;
  bool ACSwicht = false;
  bool DoorSwicht = false;
  bool TVSwicht = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              alignment: Alignment.topLeft,
              width: size.width,
              height: size.height * 0.1,
              color: widget.color,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
              ),
            ),
            Expanded(
              child: Stack(children: [
                Container(
                  width: size.width,
                  height: size.height * 0.3,
                  color: widget.color,
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.garage,
                          size: 70,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          widget.room,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      height: size.height * 0.65,
                      child: Column(
                        children: [

                          // boob
                          Container(
                            margin:
                            EdgeInsets.only(left: 15, right: 10, top: 20),
                            padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: widget.color),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Bulb",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Switch(
                                      value: BoobSwicht,
                                      onChanged: (bool newVal) {
                                        setState(
                                              () {
                                            BoobSwicht = newVal;
                                          },
                                        );
                                      },
                                    ),
                                    Text(BoobSwicht ? "On" : "Off",
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              ],
                            ),
                          ),


                          // AC
                          Container(
                            margin:
                            EdgeInsets.only(left: 15, right: 10, top: 20),
                            padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: widget.color),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "AC",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
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
                                    Text(ACSwicht ? "On" : "Off",
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Door
                          Container(
                            margin:
                            EdgeInsets.only(left: 15, right: 10, top: 20),
                            padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: widget.color),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Door",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Switch(
                                      value: DoorSwicht,
                                      onChanged: (bool newVal) {
                                        setState(
                                              () {
                                            DoorSwicht = newVal;
                                          },
                                        );
                                      },
                                    ),
                                    Text(DoorSwicht ? "Open" : "Close",
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}


