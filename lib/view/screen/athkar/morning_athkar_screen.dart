import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_cubit.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_state.dart';
import 'package:mslim_life_style/model/athkar/athkar.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';

class MorningAthkarScreen extends StatelessWidget {
  MorningAthkarScreen({Key? key}) : super(key: key);

  AthkarModel? athkarModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AthkarCubit()..getAzkarByCategory('أذكار الصباح'),
      child: BlocConsumer<AthkarCubit,AthkarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AthkarCubit.get(context);

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              AthkarCard(athkar:athkarDataList[0].toString().trim()),
            ],
          );


        },
      ),
    );
  }
}
