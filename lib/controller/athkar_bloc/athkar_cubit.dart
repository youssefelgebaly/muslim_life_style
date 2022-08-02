import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';

import '../../model/athkar/athkar_list.dart';
import 'athkar_state.dart';

class AthkarCubit extends Cubit<AthkarStates> {
  AthkarCubit() : super(AthkarStatesInitialState());

  static AthkarCubit get(context) => BlocProvider.of(context);
  AthkarModel? athkarModel;

  // void readJsonData() async
  // {
  //   final jsonData = await rootBundle.rootBundle.loadString('assets/azkar.json');
  //   final list = json.decode(jsonData) as List<dynamic>;
  //   list.map((e) => AthkarModel.fromJson(e)).toList();
  // }
  // final List<AthkarModel> _azkarList = [];
  getAzkarByCategory(String category) {
    return allAthkar
        .where(
          (element) => element.containsValue(category),
        )
        .forEach(
          (element) => athkarModel = AthkarModel.fromJson(element),
        );
  }
  //List<AthkarModel> get azkarList => _azkarList;

  int count = 0;
  double percent = 0;

  incrementCounter({required int counter}) {
    late double constNumber = 1 / counter;
    if (count < counter) {
      count++;
      percent = percent + constNumber;
      return percent;
    } else {
      return null;
    }
  }
}
