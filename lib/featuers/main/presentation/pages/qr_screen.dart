

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/sharedWidget/back_icon.dart';

class QrScreen extends StatelessWidget {
  static const String SCREEN_NAMED = "/QrScreen";
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "QR Code",
          style:
          Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17.sp),
        ),
        leading: const BackIcon(),
        actions: [
          Container(
            width: 32.w,
            height: 32.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {},
              child: const Image(
                image: AssetImage(
                  "assets/images/share.png",
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 350.h,
 width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Image(
              image: AssetImage("assets/images/QRIMAGE.png"),
            fit: BoxFit.cover,
            ),
          ),
          SizedBox(height:100.h,),
          Container(
            height: 54.h,
            margin: EdgeInsets.symmetric(horizontal: 26.w),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.r,)
            ),
            child: Center(
              child: Text("Share QR Code",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),

              ),
            ),
          ),
        ],
      ),

    );
  }
}
