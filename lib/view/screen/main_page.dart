import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/screen/home_screen.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _screens =[
     HomeScreen(),
    const Scaffold(body: Center(child: Text('Explore Screen'),),)
  ];

  int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Stack(
        children: _screens
            .asMap()
            .map((index, screen) {
          return MapEntry(
            index,
            Offstage(
              offstage: _selectedIndex != index,
              child: screen,
            ),
          );
        }).values.toList() ,

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (Index){
          setState(() {
            _selectedIndex =Index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسة',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'الاعدادات',
            activeIcon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
