import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_cubit.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_state.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';
import 'package:mslim_life_style/view/widgets/circularPercentIndicator_custom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                                offset:
                                const Offset(0, 7), // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, right: 20, left: 20),
                          child: Column(
                            children: [
                              Text(
                                athkarByCategory.azkarList[index].zekr,

                                style: const TextStyle(
                                    fontFamily:'CairoRegular' ,

                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
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
                                      onPressed: () {},
                                      icon: const Icon(Icons.copy),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      
                                    },
                                    child: Expanded(
                                      child: circularPercentIndicator(counter:athkarByCategory.azkarList[index].count,
                                        percent: cubit.percent,
                                        count: cubit.count,
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
