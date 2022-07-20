import 'package:mslim_life_style/model/tasbih/tasbih_list.dart';

class TasbihModel {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  TasbihModel(
      {this.category,
        this.count,
        this.description,
        this.reference,
        this.content});

  TasbihModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['count'] = count;
    data['description'] = description;
    data['reference'] = reference;
    data['content'] = content;
    return data;
  }
}

class Tasbihs {
  final List<TasbihModel> _tasbihs = [];

  void initializeData() {
    return allTasbih.forEach((element) => _tasbihs.add(
              TasbihModel.fromJson(element),
    ));

  }
  List<TasbihModel> get tasbihs => _tasbihs;
}
