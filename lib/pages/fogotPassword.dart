import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_home/pages/login.dart';

class FogotPassword extends StatefulWidget {
  const FogotPassword({Key? key}) : super(key: key);

  @override
  State<FogotPassword> createState() => _FogotPassword();
}

class _FogotPassword extends State<FogotPassword> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLodding = false;
  bool wrongCredential = false;

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
                          "Reset Password",
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
                          wrongCredential ? Text("User not found!", style: TextStyle(color: Colors.red),): Text(""),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          const Text("Recieve an Email to reset your password!", style: TextStyle(color: Colors.black, fontSize: 23)),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          TextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white12,
                            onTap:(){ setState(() {
                              wrongCredential = false;
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
                            height: size.height * 0.02,
                          ),
                          isLodding ? CircularProgressIndicator() : Container(
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              onPressed: singIn,
                              child: const Text("Send"),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Go back to "),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return Login();
                                        },
                                      ),
                                    );
                                  },
                                    child: Text(
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

  Future singIn() async {
    setState(() {
      isLodding = true;
    });
    try {
      debugPrint('Method');

      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim()
      );
      setState(() {
        isLodding = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("succesfully sent the Email")));
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLodding = false;
      });
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        setState(() {
          wrongCredential = true;
        });
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        setState(() {
          wrongCredential = true;
        });
      }
    }
  }
}
