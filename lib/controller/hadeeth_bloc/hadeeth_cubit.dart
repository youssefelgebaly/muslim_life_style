import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/controller/hadeeth_bloc/hadeeth_states.dart';
import 'package:mslim_life_style/model/hadeeth/hadeeth_categories_model.dart';

import '../../model/hadeeth/hadeeth_details_model.dart';
import '../database/network/dio_helper.dart';

class HadeethCubit extends Cubit<HadeethStates> {
  HadeethCubit() : super(HadeethStatesInitialState());

  static HadeethCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> categories = [];
  HadeethsCategoriesModel? hadeethsCategoriesModel;

  Future<void> getHadeethCategories() async {
    emit(GetHadeethCategoriesLoadingState());
    await DioHelper.getData(
      url: 'hadeethenc.com/api/v1/categories/roots/?language=ar',
    ).then((value) {
      print(value.data);

      //hadeethsCategoriesModel = HadeethsCategoriesModel.fromJson(value.data);
      value.data.forEach((element) {
        categories.add(element);
      });
      emit(GetHadeethCategoriesSuccessState());
    }).catchError((error) {
      emit(GetHadeethCategoriesErrorState(error.toString()));
      print(error.toString());
    });
  }



  getHadeth({required String id,required int page}) {
    emit(GetHadethLoading());
    DioHelper.getData(
            url:
                'hadeethenc.com/api/v1/hadeeths/list/?language=ar&category_id=$id&page=$page&per_page=20')
        .then((value) {
     hadeethsCategoriesModel = HadeethsCategoriesModel.fromJson(value.data);

      print(hadeethsCategoriesModel!.data![0].title);
      emit(GetHadethSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHadethErrorState(error.toString()));
    });
  }


  // Future<dynamic> getCategoryCourses({
  //   required String id,
  // }) async {
  //   coursesModel = CourseModel();
  //   emit(GetCategoryCoursesStateLoading());
  //   try {
  //     final response = await DioHelper.getData(url:  'hadeethenc.com/api/v1/hadeeths/list/?language=ar&category_id=$id&page=$page&per_page=20');
  //
  //     // showToast(message: coursesModel!.message!);
  //     emit(GetCategoryCoursesStateSuccess());
  //     return coursesModel;
  //   } on DioError catch (e) {
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     showToast(message: errorMessage, color: Colors.red);
  //     emit(GetCategoryCoursesStateError(errorMessage));
  //     throw errorMessage;
  //   }
  // }

  HadeethDetailsModel? hadeethDetailsModel;

  getHadethDetails({required String id}) {
    emit(GetHadethDetailsLoadingState());
    DioHelper.getData(
            url: 'hadeethenc.com/api/v1/hadeeths/one/?language=ar&id=$id')
        .then((value) {
      hadeethDetailsModel = HadeethDetailsModel.fromJson(value.data);
      print(hadeethDetailsModel!.title);
      emit(GetHadethDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHadethDetailsErrorState(error.toString()));
    });
  }
}
