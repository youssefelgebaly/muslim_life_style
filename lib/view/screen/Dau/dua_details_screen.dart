import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../model/athkar/athkar_model.dart';

class DuaDetailsScreen extends StatefulWidget {
  DuaDetailsScreen({required this.Athkar, Key? key}) : super(key: key);
  String Athkar;

  @override
  State<DuaDetailsScreen> createState() => _DuaDetailsScreenState();


}


class _DuaDetailsScreenState extends State<DuaDetailsScreen> {
  AthkarByCategory athkarByCategory =AthkarByCategory();

  @override
  void initState() {
    athkarByCategory.getAthkarByCategory(widget.Athkar);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.Athkar,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Uthman',
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.grey.shade50,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        children: athkarByCategory.azkarList.map((model){
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: primaryColor, width: 1)),
            // margin: const EdgeInsets.symmetric(
            //     horizontal: 8,
            //     vertical: 5
            // ),
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 16,
            //   vertical: 16,
            // ),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(16.0),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey[300]!,
            //       offset: Offset(0.6, 1.2), //(x,y)
            //       blurRadius: 6.0,
            //     ),
            //   ],
            //   color: Colors.white,
            // ),
            child: Column(
                children: [

                  textCustom(text: model.zekr, context: context,color: textColor,fontSize: 20),

                  const Divider(),
                  textCustom(text:  model.description, context: context),
                  // Text(
                  //   model.description,
                  //   style: const TextStyle(
                  //     color: Colors.black45,
                  //   ),
                  // ),

                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.copy,color: primaryColor,),
                        ),
                      ),

                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share,color: primaryColor,),
                        ),
                      ),
                    ],
                  )

                ],

            ),
          );
        }).toList(),
      ),
    );
  }
}
