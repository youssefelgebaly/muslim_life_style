// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
//
//
// class QiblahScreen extends StatefulWidget {
//    QiblahScreen({Key? key}) : super(key: key);
//
//   @override
//   State<QiblahScreen> createState() => _QiblahScreenState();
// }
//
// class _QiblahScreenState extends State<QiblahScreen> {
//   final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//       ),
//       body: FutureBuilder(
//         future: _deviceSupport,
//         builder: (_, AsyncSnapshot<bool?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return LoadingIndicator();
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error.toString()}"),
//             );
//           }
//
//           if (snapshot.data!) {
//             return QiblahCompass();
//           } else {
//             return QiblahMaps();
//           }
//         },
//       ),
//     );
//   }
// }
//
//
//
