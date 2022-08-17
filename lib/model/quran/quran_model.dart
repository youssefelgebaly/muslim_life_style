class Surah {
  String place;
  String type;
  int count;
  String title;
  String titleAr;
  String index;
  int pages;
  int pageIndex;

  Surah(
      {
        required this.place,
        required this.type,
        required this.count,
        required this.title,
        required this.titleAr,
        required this.index,
        required this.pages,
        required this.pageIndex,
      });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return new Surah(
      place: json['place'] as String,
      type: json['type'] as String,
      count: json['count'] as int,
      title: json['title'] as String,
      titleAr: json['titleAr'] as String,
      index: json['index'] as String,
      // reversed pages
      pages: 569 - int.parse(json['pages']),
      pageIndex: int.parse(json['pages']),
    );
  }
}
