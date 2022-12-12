import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  final List<Feature> features = [
    Feature(
      title: "living room",
      color: Colors.blue,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
    Feature(
      title: "family room",
      color: Colors.pink,
      data: [1, 0.8, 0.6, 0.7, 0.3],
    ),
    Feature(
      title: "bedroom",
      color: Colors.cyan,
      data: [0.5, 0.4, 0.85, 0.4, 0.7],
    ),
    Feature(
      title: "kitchen",
      color: Colors.green,
      data: [0.6, 0.2, 0, 0.1, 1],
    ),
    Feature(
      title: "toilet",
      color: Colors.amber,
      data: [0.25, 1, 0.3, 0.8, 0.6],
    ),

    Feature(
      title: "Garage",
      color: Colors.lightGreenAccent,
      data: [0.25, 1, 0.3, 0.8, 0.6],
    ),
  ];

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Tasks Track",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white
              ),
            ),
          ),
          LineGraph(
            features: features,
            size: Size(size.width*0.9, size.height*0.6),
            labelX: ['4 days ago', '3 days ago', '2 days ago', 'yesterday', 'today'],
            labelY: ['15', '18', '25', '28', '32'],
            showDescription: true,
            graphColor: Colors.white54,
            graphOpacity: 0.2,
            verticalFeatureDirection: true,
            descriptionHeight: 200,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
