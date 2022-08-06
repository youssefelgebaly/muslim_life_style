import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:mslim_life_style/controller/layout_bloc/layout_cubit.dart';
import 'package:mslim_life_style/controller/layout_bloc/layout_states.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  final _today = HijriCalendar.now();

  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/1789.jpg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textCustom(
                          text: 'أسلوب حياة المسلم',
                          context: context,
                          textAlign: TextAlign.center,
                          color: textColor,
                            fontWeight: FontWeight.w600,
                          fontSize: 14
                        ),
                        textCustom(
                            text: _today.fullDate(),
                            context: context,
                            color: textColor,
                            fontSize: 25,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                  ),
                ],
              ),
              BlocProvider(
                create: (context) => LayoutCubit()..determinePosition(),
                child: BlocConsumer<LayoutCubit, LayoutStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = LayoutCubit.get(context);

                    return ConditionalBuilder(
                      condition: cubit.locationData != null &&
                          cubit.myCoordinates != null &&
                          cubit.params != null
                          && cubit.getPrayer() !=null,
                      builder: (context) {
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(color: primaryColor, width: 1)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textCustom(
                                        context: context,
                                        text: 'الصلاة التالية',
                                        color: textColor,
                                        fontSize: 18),
                                    textCustom(
                                        context: context,
                                        text:
                                            '${cubit.getPrayerName()} : ${DateFormat.jm('ar_EG').format(cubit.getPrayer()!)}',
                                        color: textColor,
                                        fontSize: 20),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(color: primaryColor, width: 1)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textCustom(
                                        context: context,
                                        text: 'الوقت المتبقي',
                                        color: textColor,
                                        fontSize: 18),
                                    // textCustom(text: '${cubit.getPrayer()!}',color: deepSeaGreenText,fontWeight: FontWeight.bold, context: context)
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CountdownTimer(
                                      endTime: cubit
                                          .getPrayer()!
                                          .millisecondsSinceEpoch,
                                      textStyle: TextStyle(
                                        color: deepSeaGreenText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      fallback: (context) =>
                          textCustom(text: '', context: context),
                    );
                  },
                ),
              )
              // Container(
              //   padding: EdgeInsets.all(25),
              //   decoration: BoxDecoration(
              //
              //     color: Colors.grey[200]!.withOpacity(0.7),
              //     borderRadius: BorderRadius.circular(15),
              //     //border: Border.all(color: primaryColor, width: 1)
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       textCustom(text: 'الصلاة التالية :', context: context,fontSize: 20,color: textColor),
              //       const SizedBox(width: 10,),
              //       Row(
              //         children: [
              //           textCustom(text: 'الفجر', context: context,fontSize: 30,color: textColor),
              //           const SizedBox(width: 10,),
              //           textCustom(text: 'am 5:13', context: context,fontSize: 30,color: textColor,fontWeight: FontWeight.bold),
              //
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 0.9,
              mainAxisSpacing: 0.9,
              crossAxisCount: 2,
              children: <Widget>[
                buildItem(
                    lable: 'القرآن الكريم',
                    url: 'assets/images/quran.png',
                    screen: 'QuranScreen',
                    context: context),
                buildItem(
                    lable: 'التسبيح',
                    url: 'assets/images/tasbih.png',
                    screen: 'TasbihScreen',
                    context: context),
                buildItem(
                    lable: 'دعاء',
                    url: 'assets/images/pray.png',
                    screen: 'DuaScreen',
                    context: context),
                buildItem(
                    lable: 'القبلة',
                    url: 'assets/images/kaaba.png',
                    screen: 'QiblaScreen',
                    context: context),
                buildItem(
                    lable: ' الاحديث النبوية',
                    url: 'assets/images/muslim.png',
                    screen: 'HadeethCategoriesScreen',
                    context: context),
                buildItem(
                    lable: 'مواقية الصلاة',
                    url: 'assets/images/prayer-mat.png',
                    screen: 'PrayerTimesScreen',
                    context: context),
                buildItem(
                    lable: 'اذكار',
                    url: 'assets/images/moon.png',
                    screen: 'AthkarScreen',
                    context: context),
                buildItem(
                    lable: 'حساب الزكاة',
                    url: 'assets/images/give.png',
                    screen: 'ZakahScreen',
                    context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem({
    required String lable,
    required String url,
    Function? onTap,
    context,
    String? screen,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screen!);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: 15,),
            Image.asset(
              url,
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            textCustom(text: lable, context: context, color: kBlackColor)
          ],
        ),
      ),
    );
  }
}
