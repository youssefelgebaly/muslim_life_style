import 'package:adhan/adhan.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mslim_life_style/controller/layout_bloc/layout_cubit.dart';
import 'package:mslim_life_style/controller/layout_bloc/layout_states.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../widgets/app_bar_custom.dart';
import '../../widgets/text_custom.dart';

class PrayerTimesScreen extends StatelessWidget {
  PrayerTimesScreen({Key? key}) : super(key: key);
  final _today = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');

    return BlocProvider(
      create: (context) => LayoutCubit()..determinePosition(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);

          return Scaffold(
            appBar: appBarWidget('موقيت الصلاة', context),
            body: ConditionalBuilder(
              condition: cubit.locationData != null,
              builder: (context) {
                final myCoordinates = Coordinates(
                  cubit.locationData!.latitude!,
                  cubit.locationData!.longitude!,
                ); // Replace with your own location lat, lng.
                final params = CalculationMethod.egyptian.getParameters();
                params.madhab = Madhab.shafi;
                late final prayerTimes =
                    PrayerTimes.today(myCoordinates, params);
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textCustom(
                          text: '${_today.fullDate()}',
                          context: context,
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: primaryColor, width: 1)),
                        child: Column(
                          children: [
                            bildPayerItem(
                                context: context,
                                icon: 'assets/images/cloudy-night.png',
                                lable: 'الفجر',
                                prayerTimes: prayerTimes.fajr),
                            Divider(),
                            bildPayerItem(
                                context: context,
                                icon: 'assets/images/sunrise.png',
                                lable: 'الشروق',
                                prayerTimes: prayerTimes.sunrise),
                            Divider(),
                            bildPayerItem(
                                context: context,
                                icon: 'assets/images/sun.png',
                                lable: 'الظهر',
                                prayerTimes: prayerTimes.dhuhr),
                            Divider(),
                            bildPayerItem(
                                context: context,
                                icon: 'assets/images/cloudy.png',
                                lable: 'العصر',
                                prayerTimes: prayerTimes.asr),
                            Divider(),
                            bildPayerItem(
                                context: context,
                                icon: 'assets/images/sunset.png',
                                lable: 'المغرب',
                                prayerTimes: prayerTimes.maghrib),
                            Divider(),
                            bildPayerItem(
                                context: context,
                                icon: 'assets/images/night-mode.png',
                                lable: 'العشاء',
                                prayerTimes: prayerTimes.isha),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              fallback: (context) => const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bildPayerItem(
      {DateTime? prayerTimes, String? icon, String? lable, context}) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Image.asset(icon!, width: 27, height: 27, color: textColor),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: textCustom(
                text: lable!, context: context, fontSize: 24, color: textColor),
          ),
          Expanded(
            child: textCustom(
                text: DateFormat.jm().format(prayerTimes!),
                context: context,
                fontSize: 24,
                color: deepSeaGreenText),
          ),
        ],
      ),
    );
  }
}
