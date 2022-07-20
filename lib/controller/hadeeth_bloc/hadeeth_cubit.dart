import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/hadeeth_bloc/hadeeth_states.dart';
import 'package:mslim_life_style/model/hadeeth/hadeeth_categories_model.dart';

import '../database/network/dio_helper.dart';


class HadeethCubit extends Cubit<HadeethStates> {
  HadeethCubit() : super(HadeethStatesInitialState());

  static HadeethCubit get(context) => BlocProvider.of(context);

  HadeethsCategoriesModel? hadeethsCategoriesModel;
  Future<void> getHadeethCategories() async {
    emit(GetHadeethCategoriesLoadingState());
    await DioHelper.getData(url: 'categories/roots/?language=ar',)
        .then((value) {
          print(value.data);
      hadeethsCategoriesModel = HadeethsCategoriesModel.fromJson(value.data);
      emit(GetHadeethCategoriesSuccessState());
    }).catchError((error) {
      emit(GetHadeethCategoriesErrorState(error.toString()));
      print(error.toString());
    });
  }

}