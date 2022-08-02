import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mslim_life_style/view/widgets/component.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = SizedBox(height: 32);
    final errorColor = primaryColor;

    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              child: LottieBuilder.asset('assets/jsonfile/location.json'),
            ),
            box,
            Text(
              'الرجاء تفعيل خدمة الموقع على الهاتف',
              style: TextStyle(color: errorColor, fontWeight: FontWeight.bold,fontSize: 18),
            ),
            box,
            MaterialButton( onPressed: () {
              if (callback != null) callback!();
            },
              child: Text("أعد المحاولة",
              style: TextStyle(
                color: textColorDrawer
              ),
              ),
              color: Colors.green,
            )


            ],
        ),
      ),
    );
  }
}
