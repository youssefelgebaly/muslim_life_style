import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/text_custom.dart';

import '../../../model/athkar/athkar_model.dart';
import '../../widgets/components.dart';

class DuaDetailsScreen extends StatefulWidget {
  DuaDetailsScreen({required this.athkar, Key? key}) : super(key: key);
  String athkar;

  @override
  State<DuaDetailsScreen> createState() => _DuaDetailsScreenState();


}


class _DuaDetailsScreenState extends State<DuaDetailsScreen> {
  AthkarByCategory athkarByCategory =AthkarByCategory();

  Future<void> shareText(String link, String text) async {
    await FlutterShare.share(
        title: 'Example share',
        text: text,
        linkUrl: link,
        chooserTitle: 'Example Chooser Title'
    );
  }
  @override
  void initState() {
    athkarByCategory.getAthkarByCategory(widget.athkar);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.athkar,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Uthman',
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.grey.shade50,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        children: athkarByCategory.azkarList.map((model){
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: primaryColor, width: 1)),

            child: Column(
                children: [

                  textCustom(text: model.zekr, context: context,color: textColor,fontSize: 20),

                  const Divider(),
                  textCustom(text:  model.description, context: context),

                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: model.zekr));
                            showToast(message: 'تم النسخ في الحافظة');
                          },
                          icon: const Icon(Icons.copy,color: primaryColor,),
                        ),
                      ),

                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            setState((){
                              shareText(model.zekr,'');
                            });
                          },
                          icon: const Icon(Icons.share,color: primaryColor,),
                        ),
                      ),
                    ],
                  )

                ],

            ),
          );
        }).toList(),
      ),
    );
  }
}
