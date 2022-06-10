import 'package:mslim_life_style/model/athkar/athkar_list.dart';
import 'package:mslim_life_style/model/athkar/athkar_model.dart';


class AzkarByCategory {
  final List<AthkarModel> _azkarList = [];

  getAzkarByCategory(String category) {
    return allAthkar
        .where(
          (element) => element.containsValue(category),
    )
        .forEach(
          (element) => _azkarList.add(
            AthkarModel.fromJson(element),
      ),
    );
  }

  List<AthkarModel> get azkarList => _azkarList;
}
