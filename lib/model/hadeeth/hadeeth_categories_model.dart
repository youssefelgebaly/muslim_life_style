class HadeethsCategoriesModel {
  String? id;
  String? title;
  String? hadeethsCount;

  HadeethsCategoriesModel({this.id, this.title, this.hadeethsCount,});

  HadeethsCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    hadeethsCount = json['hadeeths_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['hadeeths_count'] = this.hadeethsCount;
    return data;
  }
}