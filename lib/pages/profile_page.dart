import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.2),
                  child: Image.asset("images/avatar.jpg",
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      fit: BoxFit.cover),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  "John Deo",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.1),
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(112, 194, 255, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "Gender: Male",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.1),
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(115, 255, 115, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "Age: 21",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.1),
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(122, 255, 210, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "Country: Cameroon",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
