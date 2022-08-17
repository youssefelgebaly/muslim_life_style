// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class CircularPercentIndicatorCustom extends StatelessWidget {
  double percent;
  double? radius;
  int? counter;
  int? fontSize;
  bool? tasbih =false;

   CircularPercentIndicatorCustom({required this.percent, this.radius,required this.counter,this.fontSize,this.tasbih,Key? key,}) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius??80,
      lineWidth: 5.0,
      percent: percent,
      animation: false,
      animateFromLastPercent: false,

      circularStrokeCap: CircularStrokeCap
          .round,
      center: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              '$counter',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              )
          ),
          const Padding(
            padding: EdgeInsets.only(right: 65.0),
            child: Text(
                '/100',
                style: TextStyle(
                    fontSize: 16
                )
            ),
          ),
        ],
      ),
      // onAnimationEnd:1,
      progressColor: Colors.green,
    );
  }
}
