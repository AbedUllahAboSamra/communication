import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharedWidget/back_icon.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String SCREEN_NAMED = "/ForgotPasswordScreen";

  ForgotPasswordScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style:
              Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17.sp),
        ),
        leading: const BackIcon(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Need help with password?",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              "You can retrieve your password by entering\nyour email in the text box below",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: const Color(0xFF050F09), fontSize: 15.sp),
         textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextFormField(
              controller: emailController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Put your email here",
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
            height: 70.h,
          ),
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 54.h,
              margin: EdgeInsets.symmetric(
                horizontal: 34.h,
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                    12.r,
                  )),
              child: Center(
                child: Text(
                  "Send",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
