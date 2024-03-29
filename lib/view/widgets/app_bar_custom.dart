import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';

PreferredSizeWidget appBarWidget(String title,BuildContext context) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: kBlackColor,
    ),
    elevation: 0,
    title: textCustom(text: title, context: context,color: kBlackColor,fontSize: 18),
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_forward_ios,textDirection: TextDirection.ltr),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  );
}
