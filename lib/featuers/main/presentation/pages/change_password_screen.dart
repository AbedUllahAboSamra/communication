import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/sharedWidget/back_icon.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String SCREEN_NAMED = "/ChangePasswordScreen";

  ChangePasswordScreen({Key? key}) : super(key: key);

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Change Password",
          style:
              Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17.sp),
        ),
        leading: const BackIcon(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.h),
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextFormField(
              controller: oldPasswordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Old Password",

                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: Colors.grey, width: .5.w)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.h),
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextFormField(
              controller: newPasswordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "New Password",
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: Colors.grey, width: .5.w)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.h),
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextFormField(
              controller: confirmPasswordController,
              obscureText: true,              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: Colors.grey, width: .5.w)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: 54.h,
            margin: EdgeInsets.symmetric(
              horizontal: 30.h,
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  12.r,
                )),
            child: Center(
              child: Text(
                "Change",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
