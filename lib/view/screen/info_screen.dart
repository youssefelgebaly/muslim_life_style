import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:launch_review/launch_review.dart';
import 'package:mslim_life_style/controller/layout_bloc/layout_cubit.dart';
import 'package:mslim_life_style/controller/layout_bloc/layout_states.dart';
import 'package:mslim_life_style/view/widgets/app_bar_custom.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        title: textCustom(text: 'أسلوب حياة المسلم', context: context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    //borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primaryColor, width: 1)
                ),
                child: Image.asset('assets/images/logo.jpg', width: 120,
                  height: 120,
                  fit: BoxFit.fill,)),
            InkWell(
              onTap: (){
                LaunchReview.launch(androidAppId: "com.omda.allFiveCalculator");
              },
              child: buildInfo(
                  title: 'شارك التطبيق', icon: Icons.share, context: context),
            ),
            BlocProvider(
              create: (context) => LayoutCubit(),
              child: BlocConsumer<LayoutCubit,LayoutStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return InkWell(
                      onTap: ()
                      {
                       LayoutCubit.get(context).launchWhatsapp(context);
                      },
                      child: buildInfo(
                          title: 'تواصل معنا', icon: Icons.phone, context: context));
                },
              ),
            ),
            buildInfo(title: 'قيم التطبيق', icon: Icons.star, context: context),
          ],
        ),
      ),
    );
  }

  Widget buildInfo({
    IconData? icon,
    String? title,
    context
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: primaryColor, width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: primaryColor),
          SizedBox(width: 20,),
          Center(child: textCustom(text: "$title",
              context: context,
              color: textColor,
              textAlign: TextAlign.center),),
        ],
      ),
    );
  }
}
