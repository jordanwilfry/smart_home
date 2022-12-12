import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_home/home.dart';
import 'package:smart_home/pages/login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordControllerVerify = TextEditingController();
  bool isLodding = false;
  bool weakPassword = false;
  bool emailExist = false;
  bool passwordNoMacth = false;


  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.32,
                    width: size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/login_smart_home.png"),
                            fit: BoxFit.cover)),
                    child: const Center(
                        child: Text(
                          "Registration",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 10,
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: size.height * 0.66,
                      width: size.width,
                      padding: EdgeInsets.only(
                          left: size.width * 0.1, right: size.width * 0.1),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Color.fromRGBO(204, 242, 255, 1.0)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          emailExist ? const Text("Your email already have an account", style: TextStyle(color: Colors.red),): const Text(""),
                          weakPassword ? const Text("weak password enter at least 6 characters", style: TextStyle(color: Colors.red),): const Text(""),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          TextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white12,
                            onTap:(){ setState(() {
                              emailExist = false;
                              weakPassword = false;
                              passwordNoMacth = false;
                            });},
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Email",
                                filled: true,
                                fillColor: Colors.black26,
                                focusColor: Colors.white,
                                floatingLabelStyle:
                                TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.white))),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.white12,
                            onTap:(){ setState(() {
                              emailExist = false;
                              weakPassword = false;
                              passwordNoMacth = false;
                            });},
                            obscureText: true,
                            cursorRadius: const Radius.circular(2),
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Password",
                                filled: true,
                                fillColor: Colors.black26,
                                floatingLabelStyle:
                                TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Color.fromRGBO(
                                            255, 255, 255, 1.0)))),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextFormField(
                            controller: passwordControllerVerify,
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.white12,
                            onTap:(){ setState(() {
                              emailExist = false;
                              weakPassword = false;
                              passwordNoMacth = false;
                            });},
                            obscureText: true,
                            cursorRadius: const Radius.circular(2),
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Confirm password",
                                filled: true,
                                fillColor: Colors.black26,
                                floatingLabelStyle:
                                TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Color.fromRGBO(
                                            255, 255, 255, 1.0)))),
                          ),
                          passwordNoMacth ? const Text("password not matching", style: TextStyle(color: Colors.red),): const Text(""),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          isLodding ? const CircularProgressIndicator() : Container(
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              onPressed: singUp,
                              child: const Text("Sign Up"),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("I have an account already, "),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const Login();
                                        },
                                      ),
                                    );
                                  },
                                    child: const Text(
                                      "Login!",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w900),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future singUp() async {
    if(passwordController.text.trim() != passwordControllerVerify.text.trim()){
      setState(() {
        passwordNoMacth = true;
      });
    }
    else {
      setState(() {
        isLodding = true;
      });

      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim()
        );
        setState(() {
          isLodding = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return MyHomePage();
            },
          ),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLodding = false;
        });
        if (e.code == 'weak-password') {
          setState(() {
            weakPassword = true;
          });
          debugPrint('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          setState(() {
            emailExist = true;
          });
          debugPrint('The account already exists for that email.');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
