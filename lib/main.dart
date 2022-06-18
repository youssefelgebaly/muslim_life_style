import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/screen/Dau/dua_screen.dart';
import 'package:mslim_life_style/view/screen/athkar/athkar_screen.dart';
import 'package:mslim_life_style/view/screen/main_page.dart';
import 'package:mslim_life_style/view/screen/tasbih/tasbih_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    debugInvertOversizedImages = false;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      routes: {
        'AthkarScreen': (BuildContext context) => const AthkarScreen(),
        'TasbihScreen': (BuildContext context) => const TasbihScreen(),
        'DuaScreen': (BuildContext context) =>  DuaScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
      ),

      home: const MainPage(),
    );
  }
}
