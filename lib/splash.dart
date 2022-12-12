import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_home/home.dart';
import 'package:smart_home/pages/home.dart';
import 'package:smart_home/pages/login.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({Key? key}) : super(key: key);

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(const Duration(microseconds: 4000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          debugPrint("hello1");
          return const MyHomePage();
        }
        else {
          debugPrint("hello");
          return const Login();
        }
      }
    )));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      // body: StreamBuilder<User?>(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if(snapshot.hasData){
      //         debugPrint("hello1");
      //         return const MyHomePage();
      //       }
      //       else {
      //         debugPrint("hello");
      //         return const Login();
      //       }
      //     }
      // ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            color: Colors.lightBlue
          // image: DecorationImage(
          //     image: AssetImage("images/splash.jpg"),
          //     fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                    child: Container(
                      color: Colors.black38,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.home_filled, size: 55, color: Colors.white,),
                          const SizedBox(height: 10,),
                          const Text("Smart Home", style: TextStyle(fontSize: 20, color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: const CircularProgressIndicator(color: Colors.white,),
              )
            ],
          ),
        ),
      ),

    );
  }
}
