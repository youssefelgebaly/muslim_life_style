import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';

class MorningAthkarScreen extends StatelessWidget {
  MorningAthkarScreen({Key? key}) : super(key: key);

  AthkarModel? athkarModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          AthkarCard(athkarModel: athkarModel, index: index),
      itemCount: morningAthkarList.length,
    );
  }
}
