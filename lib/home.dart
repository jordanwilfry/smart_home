import 'package:flutter/material.dart';
import 'package:smart_home/pages/add_room.dart';
import 'package:smart_home/pages/home.dart';
import 'package:smart_home/pages/profile_page.dart';
import 'package:smart_home/pages/setting_page.dart';
import 'package:smart_home/pages/statistic.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    AddRoom(),
    Statistic(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_filled), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.add_business_rounded), label: "Add room"),
              NavigationDestination(icon: Icon(Icons.stacked_bar_chart), label: "Statistic"),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: "Settings")
            ],
            onDestinationSelected: (int index) {
              setState(() {
                currentPage = index;
              });
            },
            selectedIndex: currentPage,
          ),
          body: pages[
          currentPage] // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
