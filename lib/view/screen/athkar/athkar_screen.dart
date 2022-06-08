import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/screen/athkar/evening_athkar_screen.dart';
import 'morning_athkar_screen.dart';

class AthkarScreen extends StatefulWidget {
  const AthkarScreen({Key? key}) : super(key: key);

  @override
  State<AthkarScreen> createState() => _AthkarScreenState();
}

class _AthkarScreenState extends State<AthkarScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              'الأذكار',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'الصباح',
                ),
                Tab(
                  text: 'المساء',
                ),
              ],
            ),
            backgroundColor: Colors.grey.shade50,
            elevation: 0,
          ),
          body:  TabBarView(
            children: [
              MorningAthkarScreen(),
              EveningAthkarScreen(),
            ],
          )),
    );
  }
}