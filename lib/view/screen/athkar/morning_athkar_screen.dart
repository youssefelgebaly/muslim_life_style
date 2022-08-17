import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';

class MorningAthkarScreen extends StatelessWidget {
  const MorningAthkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AthkarCard(athkar: 'أذكار الصباح');
  }
}
