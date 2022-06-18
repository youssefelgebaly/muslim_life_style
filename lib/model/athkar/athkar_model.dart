import 'athkar_list.dart';

class AthkarModel {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String zekr;

  AthkarModel(
      {required this.category, required this.count, required this.description, required this.reference, required this.zekr});

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'zekr': zekr,
    };
  }

  factory AthkarModel.fromJson(Map<String, dynamic> map) {
    return AthkarModel(
      category: map['category'] ?? '',
      count: map['count'] ?? '',
      description: map['description'] ?? '',
      reference: map['reference'] ?? '',
      zekr: map['zekr'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Azkar(category: $category, count: $count, description: $description, reference: $reference, zekr: $zekr)';
  }

}

class AthkarByCategory {
  final List<AthkarModel> _azkarList = [];

  getAthkarByCategory(String category) {
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