import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool Light = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.02,
            left: size.width * 0.02,
            right: size.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Theme:"),
                  Row(
                    children: [
                      Text(Light ? "Light" : "Dark"),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Light = !Light;
                            });
                          },
                          icon: Icon(Light ? Icons.sunny : Icons.dark_mode))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Text(
              "ABOUT:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.lightBlue),
              width: 50,
              height: 3,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Smart home is a software for embedded system and Smart houses. Nowaday it is not that easy to find a system that can suit your house or other system. Where the raison of this app to help Us.",
              style: TextStyle(fontSize: 19),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Version:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.red),
              width: 50,
              height: 3,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "2.0.2",
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}
