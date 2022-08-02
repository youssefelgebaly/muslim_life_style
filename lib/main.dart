import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/view/screen/Dau/dua_screen.dart';
import 'package:mslim_life_style/view/screen/athkar/athkar_screen.dart';
import 'package:mslim_life_style/view/screen/hadeeth/hadeeth_categories_screen.dart';
import 'package:mslim_life_style/view/screen/main_page.dart';
import 'package:mslim_life_style/view/screen/prayer_times/prayer_times_screen.dart';
import 'package:mslim_life_style/view/screen/qibla/qibla_screen.dart';
import 'package:mslim_life_style/view/screen/tasbih/tasbih_screen.dart';
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
      ),
    );
  }
}
