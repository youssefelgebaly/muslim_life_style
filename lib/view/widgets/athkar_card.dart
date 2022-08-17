import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_cubit.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_state.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';
import 'package:mslim_life_style/view/widgets/circularPercentIndicator_custom.dart';
import 'package:mslim_life_style/view/widgets/components.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'component.dart';

class AthkarCard extends StatelessWidget {

  AthkarCard({Key? key, this.athkar,}) : super(key: key);
  final String? athkar;

  AthkarByCategory athkarByCategory = AthkarByCategory();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AthkarCubit(),
      child: BlocConsumer<AthkarCubit, AthkarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          athkarByCategory.getAthkarByCategory(athkar!);
          var cubit = AthkarCubit.get(context);
          return ListView.builder(
            itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: primaryColor,width: 1)
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, right: 20, left: 20),
                          child: Column(
                            children: [
                              
                              textCustom(text: athkarByCategory.azkarList[index].zekr, context: context,fontSize: 17, fontWeight: FontWeight.bold,wordSpacing: 4,color: textColor),

                              const Divider(),
                              Text(
                                athkarByCategory.azkarList[index].description,
                                style: const TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(text: athkarByCategory.azkarList[index].zekr));
                                        showToast(message: 'تم النسخ في الحافظة');
                                      },
                                      icon: const Icon(Icons.copy),
                                    ),
                                  ),
                                  Expanded(

                                    child: textCustom(text: athkarByCategory.azkarList[index].count, context: context,fontSize: 22,fontWeight: FontWeight.bold,textAlign: TextAlign.center)

                                    // circularPercentIndicator(counter:athkarByCategory.azkarList[index].count,
                                    //   percent: cubit.percent,
                                    //   count: cubit.count,
                                    // ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        cubit.shareText(athkarByCategory.azkarList[index].zekr,'');
                                      },
                                      icon: const Icon(Icons.share),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
            ),],),
            itemCount: athkarByCategory.azkarList.length,
          );
        },
      ),
    );
  }

  Widget circularPercentIndicator({
    counter,
     count,
    percent
  }) {
        return  CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 5.0,
            percent: percent,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text('$counter/ $count',
                style: const TextStyle(fontSize: 20)),
            // onAnimationEnd:1,
            progressColor: Colors.green,
        );

  }
}
