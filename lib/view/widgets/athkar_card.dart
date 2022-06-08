import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/athkar_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class AthkarCard extends StatelessWidget {
  final AthkarModel? athkarModel;
  final int index;
  const AthkarCard({Key? key, this.athkarModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/paperBackground.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: const Offset(
                        0, 7), // changes position of shadow
                  ),
                ]

            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, right: 20, left: 20),
              child: Column(
                children: [
                  Text(
                    '${morningAthkarList[index].description}',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Text(
                    '${morningAthkarList[index].zekr}',
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.copy),
                        ),
                      ),

                      Expanded(
                        child: CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 6.0,
                          percent: 1.0,
                          circularStrokeCap: CircularStrokeCap
                              .round,
                          center: Text(
                              ' 1/ 2',
                              style: const TextStyle(
                                  fontSize: 20
                              )
                          ),
                          // onAnimationEnd:1,
                          progressColor: Colors.green,
                        ),
                      ),

                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
