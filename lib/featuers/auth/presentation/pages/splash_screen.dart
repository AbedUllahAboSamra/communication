import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/utils/colors.dart';
import 'package:new_sulution_test/featuers/auth/presentation/pages/login_or_siginup_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String SCREEN_NAMED = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  Future.delayed(Duration(seconds: 2),(){
    Navigator.pushReplacementNamed(context, LoginOrSignUpScreen.SCREEN_NAMED);
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 55.w),
            child: Image(
              image: AssetImage("assets/images/splashImage.png"),
            ),
          ),
        ),
      ),
    );
  }
}
