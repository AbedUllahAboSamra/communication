import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/utils/colors.dart';
import 'package:new_sulution_test/featuers/auth/presentation/pages/signup_screen.dart';

import 'login_screen.dart';

class LoginOrSignUpScreen extends StatelessWidget {
  static const String SCREEN_NAMED = "/LoginOrSignUpScreen";

  const LoginOrSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                 decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/signinOrSignupImage.png"),
                    fit: BoxFit.fitWidth
                  )
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 42.h,
                    ),
                    Text(
                      "Welcome to  ",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "PAY YOUR RESPECT",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 31.sp,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Sign in, or create an account if you\ndon't have.",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF050F09)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children : [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap :(){
                       Navigator.pushNamed(context, LoginScreen.SCREEN_NAMED);
                      },
                      child: Container(
                        height: 52.h,
                        width: 255.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: Text("SIGN IN",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap :(){
                        Navigator.pushNamed(context, SignUpScreen.SCREEN_NAMED);
                      },
                      child: Container(
                        height: 52.h,
                        width: 255.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: Text("SIGN UP",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Color(0xFF050F09),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                      ),
                    ),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
