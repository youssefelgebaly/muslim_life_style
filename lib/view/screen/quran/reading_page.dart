import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

import '../../../model/quran/quran_model.dart';
import '../../widgets/component.dart';

class SurahPage extends StatelessWidget {
  final Surah surah;
  SurahPage({required this.surah});
  @override
  Widget build(BuildContext context) {
    int count = surah.versesCount;
    int index = surah.id;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(15),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: header(),
            ),
            SizedBox(
              height: 5,
            ),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: primaryColor,width: 1)
              ),
              child: RichText(
                textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
                text: TextSpan(
                  children: [
                    for (var i = 1; i <= count; i++) ...{
                      TextSpan(
                        text: ' ' +
                            quran.getVerse(index, i, verseEndSymbol: false).trim()+
                            ' ',
                        style: TextStyle(
                          fontFamily: 'Aldhabi',
                          fontSize: 25,
                          color: Colors.black87,
                        ),
                      ),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Text(
                            quran.getVerseEndSymbol(i),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              
                            ),
                            textAlign: TextAlign.center,
                            textScaleFactor: i.toString().length <= 2 ? 1 : .8,
                          ))
                    }
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text(
          surah.arabicName,
          style: TextStyle(
            fontFamily: 'Aldhabi',
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' ' + quran.basmala + ' ',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'NotoNastaliqUrdu',
            fontSize: 24,
          ),
        ),
      ],
    ));
  }
}
