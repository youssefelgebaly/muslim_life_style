import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/athkar_bloc/athkar_state.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';
import '../../../controller/athkar_bloc/athkar_cubit.dart';
import '../../../model/athkar/athkar.dart';
import '../../../model/athkar/athkar_model.dart';

class EveningAthkarScreen extends StatelessWidget {
  const EveningAthkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return AthkarCard(athkar:'أذكار المساء' );

  }
}
