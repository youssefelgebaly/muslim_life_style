import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';

import '../../../model/athkar/athkar.dart';
class EveningAthkarScreen extends StatelessWidget {
   EveningAthkarScreen({Key? key}) : super(key: key);
  AthkarModel? athkarModel;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        AthkarCard(athkar:athkarDataList[1].toString().trim()),
      ],
    );
  }
}
