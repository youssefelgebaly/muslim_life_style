import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/tasbih/tasbih_model.dart';
import 'package:mslim_life_style/view/widgets/circularPercentIndicator_custom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SelectedTasbihScreen extends StatefulWidget {
  final TasbihModel tasbihModel;
  SelectedTasbihScreen({Key? key, required this.tasbihModel}) : super(key: key);

  @override
  State<SelectedTasbihScreen> createState() => _SelectedTasbihScreenState();
}


class _SelectedTasbihScreenState extends State<SelectedTasbihScreen> {
  double percent=0;
  int _counter= 0;
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
  refreshf(){
    _counter =0;
    percent=0.0;
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       iconTheme: const IconThemeData(color: Colors.black),
       elevation: 0,
     ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Text(
                      '${widget.tasbihModel.content}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Uthman',

                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        incrementCounter(counter:99);
                      });
                      },
                    child:CircularPercentIndicatorCustom(
                      radius: 300.0,
                      counter: _counter,
                      percent: percent,
                    ),

                  ),
                  const SizedBox(
                    height: 35,
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        refreshf();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green
                      ),
                      child: Icon(Icons.refresh,color: Colors.white,),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${widget.tasbihModel.description}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500]!,
                  fontFamily: 'Uthman',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     shape: MaterialStateProperty.all(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(
                  //           8,
                  //         ),
                  //       ),
                  //     ),
                  //     minimumSize: MaterialStateProperty.all(
                  //       Size(
                  //         0,
                  //         56.h,
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     BlocProvider.of<SelectedTasbihBloc>(context)
                  //         .add(ResetCounter());
                  //   },
                  //   child: SvgPicture.asset(
                  //     'assets/images/tasbih_icon/svg/restart.svg',
                  //     color: kDarkTextColor,
                  //   ),
                  // ),
                ],
              ),
            ),
          );


  }
}
