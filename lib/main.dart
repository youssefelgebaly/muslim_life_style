import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mslim_life_style/view/screen/Dau/dua_screen.dart';
import 'package:mslim_life_style/view/screen/athkar/athkar_screen.dart';
import 'package:mslim_life_style/view/screen/hadeeth/hadeeth_categories_screen.dart';
import 'package:mslim_life_style/view/screen/home_screen.dart';
import 'package:mslim_life_style/view/screen/main_page.dart';
import 'package:mslim_life_style/view/screen/prayer_times/prayer_times_screen.dart';
import 'package:mslim_life_style/view/screen/qibla/qibla_screen.dart';
import 'package:mslim_life_style/view/screen/quran/home.dart';
import 'package:mslim_life_style/view/screen/tasbih/tasbih_screen.dart';
import 'package:mslim_life_style/view/screen/zakah/zakah_screen.dart';
import 'controller/database/network/dio_helper.dart';
import 'controller/hadeeth_bloc/hadeeth_cubit.dart';
import 'controller/observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  runApp(const MyApp());
  await DioHelper.init();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = false;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HadeethCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'SA'),
        ],
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        routes: {
          'AthkarScreen': (BuildContext context) => const AthkarScreen(),
          'TasbihScreen': (BuildContext context) => const TasbihScreen(),
          'DuaScreen': (BuildContext context) => DuaScreen(),
          'HadeethCategoriesScreen': (BuildContext context) => const HadeethCategoriesScreen(),
          'QiblaScreen': (BuildContext context) =>  QiblaScreen(),
          'PrayerTimesScreen': (BuildContext context) => PrayerTimesScreen(),
          'ZakahScreen': (BuildContext context) => ZakahScreen(),
          'QuranScreen': (BuildContext context) => QuranScreen(),
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
        home: const MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 4), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          child: Lottie.asset('assets/muslim-people-lifestyle.json',

          ),
        ),
      ),
    );
  }

  void openOnBoard() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=>const MainPage(),
      ),
          (route)
      {
        return false;
      },
    );
  }
}

