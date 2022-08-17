import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/view/widgets/app_bar_custom.dart';
import '../../../controller/hadeeth_bloc/hadeeth_cubit.dart';
import '../../../controller/hadeeth_bloc/hadeeth_states.dart';
import '../../widgets/component.dart';
import '../../widgets/text_custom.dart';

class HedeethDetailsScreen extends StatelessWidget {
  final String id;

  const HedeethDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadeethCubit()..getHadethDetails(id: id),
      child: BlocConsumer<HadeethCubit, HadeethStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HadeethCubit.get(context);

          return Scaffold(
            appBar: appBarWidget('', context),
            body: ConditionalBuilder(
              condition: cubit.hadeethDetailsModel != null,
              builder: (context) {
                return  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          buildItemHadeeth(context: context,title: 'الحديث',iconData: Icons.text_fields_outlined),

                          const SizedBox(height: 10,),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: primaryColor,width: 1),),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textCustom(
                                  textAlign: TextAlign.start,
                                  context: context,
                                  fontWeight: FontWeight.bold,
                                  text: cubit.hadeethDetailsModel!.hadeeth!,
                                  fontSize: 24,
                                  color: textColor,

                                ),

                                Wrap(children: [

                                  textCustom(
                                      color: kGrayColor,
                                      textAlign: TextAlign.center,
                                      context: context,
                                      text: "[${cubit.hadeethDetailsModel!.attribution!}]",
                                      fontSize: 20
                                  ),
                                  textCustom(
                                      color: kGrayColor,
                                      textAlign: TextAlign.center,
                                      context: context,
                                      text: "[${cubit.hadeethDetailsModel!.grade!}]",
                                      fontSize: 20
                                  ),],),

                              ],
                            ),
                          ),


                          const Divider(
                            height: 50,
                            thickness: 2,
                          ),
                          buildItemHadeeth(context: context,title: 'التفسير',iconData: Icons.format_list_bulleted_outlined),

                          textCustom(
                              textAlign: TextAlign.start,
                            wordSpacing: 7,
                            context: context,
                            text: cubit.hadeethDetailsModel!.explanation!,
                            fontSize: 20,
                            color: deepSeaGreenText
                          ),
                          const Divider(
                            height: 50,
                            thickness: 2,
                          ),


                          buildItemHadeeth(context: context,title: 'معاني الكلمات',iconData: Icons.edit_outlined),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              cubit.hadeethDetailsModel!.wordsMeanings!.length,
                                  (index) => Wrap(
                                children: [
                                  textCustom(
                                    textAlign: TextAlign.start,
                                    color: secondaryColor,
                                    context: context,
                                    text:
                                    '${cubit.hadeethDetailsModel!.wordsMeanings![index].word!} : ',
                                    fontSize: 22,

                                  ),

                                  textCustom(
                                      textAlign: TextAlign.start,
                                      context: context,
                                      text: cubit.hadeethDetailsModel!
                                          .wordsMeanings![index].meaning!,
                                      fontSize: 20,
                                      color: deepSeaGreenText
                                  )

                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            height: 50,
                            thickness: 2,
                          ),
                          buildItemHadeeth(context: context,title: 'الفوائد',iconData: Icons.lightbulb_outline),


                          Column(
                            children: List.generate(cubit.hadeethDetailsModel!.hints!.length, (index) => Column(
                              children: [
                                textCustom(
                                  textAlign: TextAlign.start,
                                  context: context,
                                  text: cubit.hadeethDetailsModel!.hints![index],
                                  color: deepSeaGreenText,
                                  fontSize: 20,
                                ),
                              ],
                            ))
                          ),


                          const Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          buildItemHadeeth(context: context,title: 'المرجع',iconData: Icons.library_books),

                          textCustom(
                            textAlign: TextAlign.start,
                            context: context,
                            color: kGrayColor,
                            text: cubit.hadeethDetailsModel!.reference!,
                            fontSize: 16,

                          ),
                        ],
                      ),
                    ),

                );
              },
              fallback: (context) => const Center(
                child: CircularProgressIndicator(color: primaryColor,),
              ),
          ),
            );
        },
      ),
    );
  }
  Widget buildItemHadeeth({
    String? title,
    IconData? iconData,
    context
}){
    return Row(
      children: [
        Icon(iconData,color:textColor ,),
        const SizedBox(width: 10,),
        textCustom(
          textAlign: TextAlign.center,
          context: context,
          text: title!,
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ],
    );

  }
}