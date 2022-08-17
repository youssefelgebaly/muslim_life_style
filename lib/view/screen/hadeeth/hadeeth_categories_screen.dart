import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/hadeeth_bloc/hadeeth_cubit.dart';
import 'package:mslim_life_style/controller/hadeeth_bloc/hadeeth_states.dart';
import 'package:mslim_life_style/view/screen/hadeeth/hadeeth_screen.dart';
import 'package:mslim_life_style/view/widgets/app_bar_custom.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/components.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';

class HadeethCategoriesScreen extends StatelessWidget {
  const HadeethCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadeethCubit()..getHadeethCategories(),
      child: BlocConsumer<HadeethCubit, HadeethStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HadeethCubit.get(context);
          return Scaffold(
            appBar: appBarWidget('موسوعة الحديث الشريف',  context),
            body: ConditionalBuilder(
              condition: cubit.categories.isNotEmpty,
              builder: (context) => Column(
                children: [
                  Expanded(
                    child:GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 0.9,
                      mainAxisSpacing: 0.9,
                      crossAxisCount: 2,
                      children: <Widget>[
                        buildItem(lable: "${cubit.categories[0]['title']}", count: int.parse(cubit.categories[0]['hadeeths_count']),context: context,id: '1'),
                        buildItem(lable: "${cubit.categories[1]['title']}", count: int.parse(cubit.categories[1]['hadeeths_count']),context: context,id: '2'),
                        buildItem(lable: "${cubit.categories[2]['title']}", count: int.parse(cubit.categories[2]['hadeeths_count']),context: context,id: '3'),
                        buildItem(lable: "${cubit.categories[3]['title']}", count: int.parse(cubit.categories[3]['hadeeths_count']),context: context,id: '4'),
                        buildItem(lable: "${cubit.categories[4]['title']}", count: int.parse(cubit.categories[4]['hadeeths_count']),context: context,id: '5'),
                        buildItem(lable: "${cubit.categories[5]['title']}", count: int.parse(cubit.categories[5]['hadeeths_count']),context: context,id: '6'),
                        buildItem(lable: "${cubit.categories[6]['title']}", count: int.parse(cubit.categories[6]['hadeeths_count']),context: context,id: '7'),
                      ],
                    ),
                  ),
                ],
              ),
              fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                color: green,
              )),
            ),
          );
        },
      ),
    );
  }
  Widget buildItem({
    required String lable,
    required int count,
    String url= 'assets/images/muslim.png',
    context,
    String? id
  }){
    return InkWell(
      onTap: () {
        navigator(context, HadeethsScreen(id: id!, name: lable));
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
            Image.asset(url,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 10,),
            textCustom(text: lable, context: context,color: kBlackColor),

            const SizedBox(height: 5,),
            textCustom(text: '$count', context: context,fontWeight: FontWeight.bold),


          ],
        ),
      ),
    );

  }
}
