import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';
import 'package:mslim_life_style/view/widgets/circularPercentIndicator_custom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

  class AthkarCard extends StatefulWidget {
  const AthkarCard({Key? key, this.athkar,}) : super(key: key);
  final String? athkar;

  @override
  State<AthkarCard> createState() => _AthkarCardState();

}

class _AthkarCardState extends State<AthkarCard> {
  AthkarByCategory athkarByCategory =AthkarByCategory();
  @override
  void initState() {
    athkarByCategory.getAthkarByCategory(widget.athkar!);
    super.initState();
  }
  int _counter= 0;
  double percent=0;

  incrementCounter(
      {required int counter}
      ) {
    late double constNumber=1/counter;
    if(_counter<counter) {
      _counter++;
      percent = percent+constNumber;
      //percent=percent2;
    }else{
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: athkarByCategory.azkarList.map((model)
      {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 10.0),
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
                        model.zekr,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Text(
                        model.description,
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
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  incrementCounter(counter:int.parse(model.count));
                                });
                              },
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 5.0,
                                percent: percent,
                                circularStrokeCap: CircularStrokeCap
                                    .round,
                                center: Text(
                                    '${model.count}/ 0',
                                    style: const TextStyle(
                                        fontSize: 20
                                    )
                                ),
                                // onAnimationEnd:1,
                                progressColor: Colors.green,
                              ),
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
      }).toList(),
    );

  }
  }