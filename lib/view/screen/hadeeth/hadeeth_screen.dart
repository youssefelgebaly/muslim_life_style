import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/view/screen/hadeeth/hadeeth_details_screen.dart';
import 'package:mslim_life_style/view/widgets/app_bar_custom.dart';
import 'package:mslim_life_style/view/widgets/component.dart';

import '../../../controller/hadeeth_bloc/hadeeth_cubit.dart';
import '../../../controller/hadeeth_bloc/hadeeth_states.dart';
import '../../widgets/components.dart';
import '../../widgets/text_custom.dart';

class HadeethsScreen extends StatelessWidget {
  final String id;
  final String name;
  bool hasMore =true;
   int page=1;
   HadeethsScreen({Key? key, required this.id, required this.name}) : super(key: key);
  final controller =ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadeethCubit()..getHadeth(id: id,page: 1),
      child: BlocConsumer<HadeethCubit, HadeethStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HadeethCubit.get(context);
          // controller.addListener(() {
          //   if(controller.position.maxScrollExtent ==controller.offset){
          //     page ++;
          //
          //     if(cubit.hadeethsCategoriesModel!.data!.length<10){
          //       hasMore=false;
          //     }
          //     cubit.getHadeth(id: id,page: page);
          //   }
          //
          // });
          return Scaffold(
            appBar: appBarWidget(name,  context),

            body: ConditionalBuilder(
              condition: cubit.hadeethsCategoriesModel != null,
              builder: (context) {
                return BlocConsumer<HadeethCubit, HadeethStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              controller: controller,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: cubit.hadeethsCategoriesModel!.data!.length ,
                              itemBuilder: (BuildContext context, int index) {
                               // if(index <cubit.hadeethsCategoriesModel!.data!.length){
                                  return  InkWell(
                                    onTap: (){
                                      navigator(context,HedeethDetailsScreen(id: '${cubit.hadeethsCategoriesModel!.data![index].id}',));
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(color: primaryColor,width: 1)
                                        ),
                                        child:Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            textCustom(
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              context: context,
                                              color: kBlackColor,
                                              text: "${cubit.hadeethsCategoriesModel!.data![index].title}",
                                              fontSize: 20,
                                            ),
                                            const SizedBox(height: 15,),
                                            Center(child:  textCustom(text: 'قراءة الحديث', context: context))
                                          ],
                                        )

                                    ),
                                  );
                                }
                                // else{
                                //   return  Padding(
                                //     padding: const EdgeInsets.symmetric(vertical: 32),
                                //     child: Center(child:
                                //         hasMore ? const CircularProgressIndicator(color: primaryColor,):Container()),
                                //   );
                                // }
                             // }

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              InkWell(
                                onTap:
                                int.parse(cubit.hadeethsCategoriesModel!.meta!.currentPage!) > 1
                                    ? () {
                                  cubit.getHadeth(
                                      id: id,
                                      page: int.parse(cubit.hadeethsCategoriesModel!.meta!.currentPage!) - 1);
                                } : null,
                                child: Container(
                                  child: textCustom(text: 'السابق', context: context,fontSize: 18,fontWeight: FontWeight.bold,color: textColor,) ,
                                ),
                              ),
                    textCustom(
                               text:
                               '${cubit.hadeethsCategoriesModel != null ? cubit.hadeethsCategoriesModel!.meta!.currentPage! : ''} / ${cubit.hadeethsCategoriesModel!.meta!.lastPage}',
                               fontWeight: FontWeight.bold,
                               context: context,
                               fontSize: 20),


                              InkWell(
                                onTap:
                                int.parse(cubit.hadeethsCategoriesModel!.meta!.currentPage!) < cubit.hadeethsCategoriesModel!.meta!.lastPage!
                                    ? () {
                                  cubit.getHadeth(
                                      id: id,
                                      page: int.parse(cubit.hadeethsCategoriesModel!.meta!.currentPage!) + 1);
                                } : null,
                                child: Container(
                                  child: textCustom(text: 'التالي', context: context,fontSize: 18,fontWeight: FontWeight.bold,color: textColor) ,
                                ),
                              ),
                          ],),
                        )
                      ],
                    );
                  },
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
}
