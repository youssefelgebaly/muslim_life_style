import 'package:flutter/material.dart';
import 'package:mslim_life_style/view/widgets/app_bar_custom.dart';
import 'package:mslim_life_style/view/widgets/component.dart';
import 'package:mslim_life_style/view/widgets/components.dart';

import '../../widgets/text_custom.dart';

class ZakahScreen extends StatefulWidget {
  const ZakahScreen({Key? key}) : super(key: key);

  @override
  State<ZakahScreen> createState() => _ZakahScreenState();
}

class _ZakahScreenState extends State<ZakahScreen> {
  TextEditingController goldPrice = TextEditingController();
  TextEditingController moneySaved = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double elnisab = 0.0;
  double elzakah = 0.0;

  void calculateElzakah() {
    elnisab = double.parse(goldPrice.text) * (85);
    showToast(message: '  النصاب : $elnisab');
    elzakah = (double.parse(moneySaved.text)/100)*2.50;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('حساب الزكاه', context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/give.png',
                width: 100,
                height: 100,
              )),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: goldPrice,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل سعر الذهب عيار 21 اليوم';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: primaryGrey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  hintText: 'سعر جرام الذهب عيار 21',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: moneySaved,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل المال المدخر';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: primaryGrey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  hintText: 'المال المدخر',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  textCustom(
                      text: 'الزكاة :',
                      context: context,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  Expanded(
                    child: textCustom(
                        textAlign: TextAlign.center,
                        text: '$elzakah',
                        context: context,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'afs',
                        color: textColor),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    setState(() {
                      calculateElzakah();
                    });
                  },
                  child: textCustom(
                      text: 'احسب ',
                      context: context,
                      color: textColorDrawer,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primaryColor, width: 1)),
                child: Column(
                  children: [
                    textCustom(
                        text:
                            'ملحوظة :"المقرر شرعا أن الزكاة فرض وركن من أركان الإسلام تجب فى مال المسلمين متى بلغ النصاب الشرعى، وحال عليه الحول، وكان خاليا من الدين فاضلا عن حاجة المزكى الأصلية وحاجة من تلزمه نفقته، والنصاب الشرعى قيمته: 85 جراما من الذهب عيار 21، بالسعر السائد وقت إخراج الزكاة، ومقدارها: ربع العشر. أى: 2.5% على رأس المال وما أضيف إليه من عائد إن حال على العائد الحول أيضا، أما لو كان العائد يتم صرفه أولا بأول فلا زكاة على ما يصرف"',
                        context: context,
                        color: textColor,
                        fontSize: 18)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
