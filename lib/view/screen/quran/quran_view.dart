import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class QuranView extends StatefulWidget {
  final int? page;

  QuranView({this.page, Key? key}) : super(key: key);

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  PdfController? pdfController;
  // final pdfController = PdfController(
  //   document: PdfDocument.openAsset('assets/quran.pdf'),
  //   initialPage: 17
  // );

  @override
  void initState() {
    // TODO: implement initState
    pdfController=PdfController(document: PdfDocument.openAsset('assets/quran.pdf'),
    initialPage: widget.page ?? 1
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
      child: PdfView(
        scrollDirection: Axis.horizontal,
        controller: pdfController!,
      ),
    ));
  }
}
