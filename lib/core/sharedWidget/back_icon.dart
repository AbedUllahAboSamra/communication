import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/extensions/context_extension.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back,
        size: 22.r,
        color:  Colors.black  ,
      ),
    );
  }
}
