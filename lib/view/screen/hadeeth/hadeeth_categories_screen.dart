import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/hadeeth_bloc/hadeeth_cubit.dart';
import 'package:mslim_life_style/controller/hadeeth_bloc/hadeeth_states.dart';
import 'package:mslim_life_style/view/widgets/component.dart';

class HadeethCategoriesScreen extends StatelessWidget {
  const HadeethCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HadeethCubit, HadeethStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HadeethCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cubit.hadeethsCategoriesModel != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: gray,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text('${cubit.hadeethsCategoriesModel!.title}'),
                            Text(
                                '${cubit.hadeethsCategoriesModel!.hadeethsCount}'),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        );
      },
    );
  }
}
