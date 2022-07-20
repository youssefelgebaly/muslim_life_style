import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(''),
                fit: BoxFit.cover,
              )
          ),
          child: Stack(
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'الفجر',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        const Text(
                          'am 5:13',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),
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
                     Text(
                      '14جمادي اولي 1443',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
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
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 0.9,
            mainAxisSpacing: 0.9,
            crossAxisCount: 3,
            children: <Widget>[
              buildItem(lable: 'القرآن الكريم', url: 'assets/images/quran.png',screen: '',context: context),
              buildItem(lable: 'التسبيح', url: 'assets/images/tasbih.png',screen: 'TasbihScreen',context: context),
              buildItem(lable: 'دعاء', url: 'assets/images/pray.png',screen: 'DuaScreen',context: context),
              buildItem(lable: 'القبلة', url: 'assets/images/kaaba.png',screen: '',context: context),
              buildItem(lable: 'الاحديث النبوية', url: 'assets/images/muslim.png',screen: 'HadeethCategoriesScreen',context: context),
              buildItem(lable: 'مواقية الصلاة', url: 'assets/images/prayer-mat.png',screen: '',context: context),
              buildItem(lable: 'اذكار', url: 'assets/images/moon.png',screen: 'AthkarScreen',context: context),
              buildItem(lable: 'حساب الزكاة', url: 'assets/images/money-bag.png',screen: '',context: context),
            ],
          ),
        ),
      ],
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
        padding: const EdgeInsets.all(8),
        child: Column(
          children:  [
            Image.asset('assets/images/quran.png',
              width: 45,
              height: 45,
            ),
            Text(lable,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'CairoWebFont',
            ),),
          ],
        ),
      ),
    );

  }
}

