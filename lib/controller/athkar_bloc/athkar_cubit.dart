import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';

import '../../model/athkar/athkar_list.dart';
import 'athkar_state.dart';

class AthkarCubit extends Cubit<AthkarStates> {
  AthkarCubit() : super(AthkarStatesInitialState());

  static AthkarCubit get(context) => BlocProvider.of(context);
  AthkarModel? athkarModel;

  getAzkarByCategory(String category) {
    return allAthkar
        .where(
          (element) => element.containsValue(category),
        )
        .forEach(
          (element) => athkarModel = AthkarModel.fromJson(element),
        );
  }

  Future<void> shareText(String link, String text) async {
    // List<dynamic> docs = await DocumentsPicker.pickDocuments;
    // if (docs == null || docs.isEmpty) return null;

    await FlutterShare.share(
      title: 'Example share',
      text: text,
      linkUrl: link,
        chooserTitle: 'Example Chooser Title'
    );
  }
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
