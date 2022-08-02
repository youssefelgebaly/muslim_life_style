import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  @override
  final _today = HijriCalendar.now();
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter ,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset('assets/images/1789.jpg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textCustom(text: 'الصلاة التالية :', context: context,fontSize: 20,color: textColorDrawer),
                        const SizedBox(width: 10,),
                        Row(
                          children: [
                            textCustom(text: 'الفجر', context: context,fontSize: 30,color: textColorDrawer),
                            const SizedBox(width: 10,),
                            textCustom(text: 'am 5:13', context: context,fontSize: 30,color: textColorDrawer,fontWeight: FontWeight.bold),

                          ],
                        ),
                      ],
                    ),
                  ),


                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 15),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textCustom(text: '${_today.fullDate()}', context: context,color: textColor,fontSize: 30,fontWeight: FontWeight.w600)


                  ],
                ),
              ),
                         ],
          ),
          Container(
            margin: EdgeInsets.only(top: 210),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(topRight: Radius.circular(22),topLeft: Radius.circular(22))
            ),
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 0.9,
              mainAxisSpacing: 0.9,
              crossAxisCount: 2,
              children: <Widget>[
                buildItem(lable: 'القرآن الكريم', url: 'assets/images/quran.png',screen: 'Index',context: context),
                buildItem(lable: 'التسبيح', url: 'assets/images/tasbih.png',screen: 'TasbihScreen',context: context),
                buildItem(lable: 'دعاء', url: 'assets/images/pray.png',screen: 'DuaScreen',context: context),
                buildItem(lable: 'القبلة', url: 'assets/images/kaaba.png',screen: 'QiblaScreen',context: context),
                buildItem(lable: ' الاحديث النبوية', url: 'assets/images/muslim.png',screen: 'HadeethCategoriesScreen',context: context),
                buildItem(lable: 'مواقية الصلاة', url: 'assets/images/prayer-mat.png',screen: 'PrayerTimesScreen',context: context),
                buildItem(lable: 'اذكار', url: 'assets/images/moon.png',screen: 'AthkarScreen',context: context),
                buildItem(lable: 'حساب الزكاة', url: 'assets/images/money-bag.png',screen: '',context: context),
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
  }){
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screen!);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),

        padding: const EdgeInsets.all(8),
        decoration:  BoxDecoration(
          borderRadius:BorderRadius.circular(20),
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
          children:  [
            //SizedBox(height: 15,),
            Image.asset('$url',
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 10,),
            textCustom(text: lable, context: context,color: kBlackColor)


          ],
        ),
      ),
    );

  }
}

