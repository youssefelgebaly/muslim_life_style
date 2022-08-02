import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  const HadeethsScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadeethCubit()..getHadeth(id: id),
      child: BlocConsumer<HadeethCubit, HadeethStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HadeethCubit.get(context);
          return Scaffold(
            appBar: appBarWidget(name,  context),
            body: ConditionalBuilder(
              condition: cubit.hadeethsCategoriesModel != null,
              builder: (context) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.hadeethsCategoriesModel!.data!.length,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                              onTap: (){
                                navigator(context,HedeethDetailsScreen(id: '${cubit.hadeethsCategoriesModel!.data![index].id}',));
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
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
                                      text: cubit.hadeethsCategoriesModel!.data![index].title!,
                                      fontSize: 20,
                                    ),
                                    SizedBox(height: 15,),
                                    Center(child:  textCustom(text: 'قراءة الحديث', context: context))
                                  ],
                                )

                              ),
                            )

                      ),
                    ),
                  ],
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
