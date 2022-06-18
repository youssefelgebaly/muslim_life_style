import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_cubit.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_state.dart';
import 'package:mslim_life_style/model/athkar/athkar.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';

class MorningAthkarScreen extends StatelessWidget {
  const MorningAthkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: const <Widget>[
      AthkarCard(athkar: 'أذكار الصباح'),
    ]);
  }
}
