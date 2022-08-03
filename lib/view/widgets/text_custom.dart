import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/widgets/component.dart';


textCustom({
  required String text,
   double? fontSize = 14.0,
   Color? color = primaryColor,
   FontWeight? fontWeight = FontWeight.normal,
   TextDecoration decoration = TextDecoration.none,
   TextOverflow? overflow,
   int? maxLines,
   TextAlign textAlign = TextAlign.start,
   required BuildContext context,
   String fontFamily = 'ElMessiri',
   double? wordSpacing,
}) {
  return Text(
    text,
maxLines:maxLines ,


     overflow: overflow,
    textAlign: textAlign,
    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
      wordSpacing: wordSpacing,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily ,
      decoration: decoration,
      decorationColor: primaryColor,
    ),
  );
}
