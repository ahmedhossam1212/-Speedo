import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// ignore: unused_element
Widget _getLinearGauge() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: const LinearTickStyle(length: 20),
          axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: const LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
    ) ;
  }


Widget defaultButton({
required double width ,
required double height ,
Color background = Colors.blue,
Color textColor= Colors.blue,
double radius = 3.0,
required Function function,
required String text,

}) =>
Container(
width: width,
height: height,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(
radius,
),
color: background,

),
child: MaterialButton(  
  

onPressed: (){function();},
child: Text(
 text,
style:  TextStyle(
color: textColor,
),
),
),
);

