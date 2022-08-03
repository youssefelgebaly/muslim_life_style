import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mslim_life_style/view/screen/quran/reading_page.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';
import 'package:quran/quran.dart' as quran;
import 'package:google_fonts/google_fonts.dart';

import '../../../model/quran/quran_model.dart';

class QuranScreen extends StatefulWidget {
  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen>
    with TickerProviderStateMixin {
  List<Surah> surahList = [];
  int selectedIndex = 0;
  bool isReverse = false;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/surah.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
    debugPrint(surahList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        actions: [
          Transform.rotate(
            angle: isReverse ? pi : 2 * pi,
            child: IconButton(
                icon: Icon(Icons.sort),
                onPressed: () {
                  setState(() {
                    isReverse = !isReverse;
                  });
                }),
          ),
        ],
      ),
      body: surahList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : chaptersList(isReverse ? surahList.reversed.toList() : surahList),
    );
  }

  Widget chaptersList(List<Surah> chapters) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: chapters.length,
        itemExtent: 80,
        itemBuilder: (BuildContext context, int index) => ListTile(
            title:textCustom(text: chapters[index].arabicName.toString(),color: deepSeaGreenText, context: context,fontWeight: FontWeight.bold,fontSize: 14),
            subtitle: Text(chapters[index].versesCount.toString()),
            leading: Image(
                image:
                AssetImage("assets/images/${chapters[index].revelationPlace}.png"),
                width: 35,
                height: 35),
            trailing:
            CircleAvatar(
              backgroundColor: deepSeaGreenText,
                child: textCustom(text:"${ chapters[index].id}",color: textColorDrawer, context: context),),
            onTap: () {
              /// Push to Quran view ([int pages] represent surah page(reversed index))
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SurahPage(surah: chapters[index]),));
            }),
      );



    //   ListView.separated(
    //   controller: _controller,
    //   itemBuilder: (context, index) => ListTile(
    //     leading: CircleAvatar(
    //       child: Text(chapters[index].id.toString()),
    //     ),
    //     title: Text(chapters[index].name),
    //     subtitle: Text(chapters[index].versesCount.toString()),
    //     trailing: Text(
    //       chapters[index].arabicName,
    //       style: GoogleFonts.cairo(
    //         fontSize: 18,
    //       ),
    //     ),
    //     onTap: () => Navigator.push(
    //       context,
    //       MaterialPageRoute<void>(
    //         builder: (BuildContext context) =>
    //             SurahPage(surah: chapters[index]),
    //       ),
    //     ),
    //   ),
    //   separatorBuilder: (context, index) => Divider(height: 1),
    //   itemCount: chapters.length,
    // );
  }
}
