import 'package:flutter/material.dart';

class AddRoom extends StatelessWidget {
  const AddRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      padding:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter the Room Name"),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter the number of connected devices"),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Text("Chose and Icon", style: TextStyle(fontSize: 20),),
                  SizedBox(width: size.width * 0.1,),
                  IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return const AlertDialog(content: Text("Icon Chosen"),);
                    });
                  }, icon: Icon(Icons.insert_emoticon,size: size.width * 0.09,))
                ],
              ),),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
              alignment: Alignment.topRight,
              child: ElevatedButton(onPressed: () {
                showDialog(context: context, builder: (context){
                  return AlertDialog(content: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent
                        ),
                        child: Icon(Icons.security_update_good_rounded)
                      ),
                      SizedBox(width: size.width * 0.02,),
                      Text("Succefully Added a room")
                    ],
                  ),);
                });
              }, child: const Text("Add")))
        ],
      ),
    );
  }
}
