import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:mslim_life_style/view/screen/qibla/qiblah_compass.dart';
import 'package:mslim_life_style/view/widgets/app_bar_custom.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'loading_indicator.dart';

class QiblaScreen extends StatelessWidget {
   QiblaScreen({Key? key}) : super(key: key);
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarWidget('',  context),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }

          if (snapshot.data!) {
            return QiblahCompass();
          } else {
            return  CircularProgressIndicator(color: primaryColor,);
          }
        },
      ),

    );
  }
}
