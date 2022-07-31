import 'package:flutter/material.dart';
import 'package:flutter_speedo/componantes.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SpeedooCounter extends StatefulWidget {
  const SpeedooCounter({Key? key}) : super(key: key);

  @override
  State<SpeedooCounter> createState() => _SpeedooCounterState();
}

class _SpeedooCounterState extends State<SpeedooCounter> {
  GlobalKey<KdGaugeViewState> key = GlobalKey<KdGaugeViewState>();
  double pressure = 0;
  double level = 0 ; 
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speedo"),
      ),
      body:Row(
        children: [
          Column(
            children: [
              SizedBox( width: 300,
              height: 300,
                child: SfRadialGauge(
                  title: const GaugeTitle(
                      text: 'Pressure',
                      textStyle:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis( 
                      startAngle: 180,
                       endAngle: 270,
                      minimum: 0, maximum: 100, ranges: <GaugeRange>[
                      GaugeRange( 
                          startValue: 0,
                          endValue: 50,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                        
                          startValue: 50,
                          endValue: 100,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 100,
                          endValue: 150,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10)
                    ], pointers:  <GaugePointer>[
                      NeedlePointer(value:isEnabled? pressure:0)
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                              child:  Text('${isEnabled ? pressure.round().toString():0} Psi',
                                  style: const TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold))),
                          angle: 90,
                          positionFactor: 0.5)
                    ])
                  ]),
              ),
             
                Material( elevation: 5.0,
                  child: Container( width: 80,
                  height: 200,
                  color: Colors.white,
                    child: SfSlider.vertical(
                               min: 0.0,
                               max: 100.0,
                     value: pressure,
                     activeColor: Colors.black,
                     inactiveColor: Colors.grey,
                     interval: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: ( value) {
                    setState(() {
                               pressure = value;
                       });
                  }),
                  ),
                ), 
               const SizedBox(height: 10,),

               defaultButton(width:200 , height: 50, function: (){
                isEnabled=false;
               }, text: "Disable",background: Colors.redAccent,
               textColor: Colors.black)


           
            ],
          ),   
         const  SizedBox(width: 50,),   
          Column(
            children: [
              SizedBox( width: 300,
              height: 300,
                child: SfRadialGauge(
                  title: const GaugeTitle(
                      text: 'Level',
                      textStyle:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis( 
                      startAngle: 180,
                       endAngle: 270,
                      minimum: 0, maximum: 100, ranges: <GaugeRange>[
                      GaugeRange( 
                          startValue: 0,
                          endValue: 50,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                        
                          startValue: 50,
                          endValue: 100,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 100,
                          endValue: 150,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10)
                    ], pointers:  <GaugePointer>[
                      NeedlePointer(value:isEnabled? level:0)
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                              child:  Text('${ isEnabled? level.round().toString():0} m',
                                  style: const TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold))),
                          angle: 90,
                          positionFactor: 0.5)
                    ])
                  ]),
              ),
             
            Material( elevation: 5.0,
              child: Container( width: 80,
              height: 200,
              color: Colors.white,
                child: SfSlider.vertical(
                   min: 0.0,
                   max: 100.0,
                     value: level,
                     activeColor: Colors.black,
                     inactiveColor: Colors.grey,
                     interval: 20,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: ( value) {
                    setState(() {
                   level = value;
                       });
              }),
              ),
            ),
          const  SizedBox(height: 10,),

            defaultButton(width: 200,
             height: 50, 
             function: (){
              setState(() {
                isEnabled = true;
              });
             }, 
             text: "Enable",
             background: Colors.greenAccent,
             textColor: Colors.black)

           
            ],
          ),
          
        const SizedBox(width: 150,),
          Material( elevation: 9.0,
            child: Container( color: Colors.grey.withOpacity(0.1),
            width: 300,
            height: 500,
              child: Column(
                children: [
                   Lottie.network("https://assets1.lottiefiles.com/packages/lf20_xkty0q8r.json"),
                   SizedBox(
                    width: 300,
                    height: 300,
                    child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_uwngqzsb.json"))
          
                ],
              ),
            ),
          ),

         const SizedBox(width: 50,),

          Column(
            children: [  const SizedBox(height: 40,),
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.network("https://assets6.lottiefiles.com/private_files/lf30_vjpn4j6j.json")),
                SizedBox(
                height: 200,
                width: 200,
                child: Lottie.network("https://assets6.lottiefiles.com/private_files/lf30_vjpn4j6j.json")),
                SizedBox(
                height: 200,
                width: 200,
                child: Lottie.network("https://assets6.lottiefiles.com/private_files/lf30_vjpn4j6j.json")),
               ],
          ),
         
        ],
      )
      );
  }

}