import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mslim_life_style/model/athkar/athkar.dart';
import 'package:mslim_life_style/view/screen/Dau/dua_details_screen.dart';
import 'package:mslim_life_style/view/widgets/athkar_card.dart';
import 'package:mslim_life_style/view/widgets/component.dart';

import '../../widgets/app_bar_custom.dart';
class DuaScreen extends StatelessWidget {
   DuaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أدعية', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
      ),
      body: ListView.builder(itemBuilder: (context, index) => _buildListItem(context, index) ,
          itemCount: athkarDataList.length,
      ),
    );
  }
  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: Offset(0.6, 1.2), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DuaDetailsScreen(
                Athkar: athkarDataList[index].toString().trim(),
              ),
            ),
          );
        },
        child: Row(

          children: [
             Padding(
              padding: EdgeInsets.only(right: 18,top: 10,bottom: 10,left: 15),
              child:Image.asset('assets/images/pray.png',
                width: 60,
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  athkarDataList[index].toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
