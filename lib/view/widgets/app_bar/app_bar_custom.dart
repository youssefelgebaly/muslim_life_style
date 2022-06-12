import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

  IconData? iconData;
  String? tittle;
  Function? onPressed;

  appBarCustom({iconData = Icons.arrow_back_ios_rounded , leading = '', onPressed,}) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          onPressed == null ? null : onPressed!();
          // Navigator.pop(context);
        },
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
      title: Text(
        leading!,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
// }
