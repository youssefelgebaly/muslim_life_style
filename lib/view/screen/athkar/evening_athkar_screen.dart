import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/athkar_model.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';
class EveningAthkarScreen extends StatelessWidget {
   EveningAthkarScreen({Key? key}) : super(key: key);
  AthkarModel? athkarModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => SizedBox(),itemCount:5,);
  }
}
