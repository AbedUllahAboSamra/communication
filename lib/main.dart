import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_sulution_test/featuers/auth/presentation/manager/auth_cubit.dart';
import 'package:new_sulution_test/featuers/auth/presentation/pages/login_or_siginup_screen.dart';
import 'package:new_sulution_test/featuers/auth/presentation/pages/splash_screen.dart';
 import 'package:new_sulution_test/featuers/main/presentation/pages/qr_screen.dart';
import 'core/utils/colors.dart';
import 'featuers/auth/presentation/pages/forget_password_screen.dart';
import 'featuers/auth/presentation/pages/login_screen.dart';
import 'featuers/auth/presentation/pages/signup_screen.dart';
import 'featuers/main/presentation/pages/change_password_screen.dart';
import 'featuers/main/presentation/pages/edit_profile.dart';
import 'featuers/main/presentation/pages/main_screen.dart';
import 'featuers/main/presentation/pages/profile_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
         BlocProvider(create: (context) => di.sl<AuthCubit>() ,),
       ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            routes: {
              SplashScreen.SCREEN_NAMED: (context) => const SplashScreen(),
              LoginScreen.SCREEN_NAMED: (context) =>   LoginScreen(),
              LoginOrSignUpScreen.SCREEN_NAMED: (context) =>
              const LoginOrSignUpScreen(),
              SignUpScreen.SCREEN_NAMED: (context) =>   SignUpScreen(),
              MainScreen.SCREEN_NAMED: (context) => MainScreen(),
              ProfileScreen.SCREEN_NAMED: (context) => ProfileScreen(),
              QrScreen.SCREEN_NAMED: (context) => QrScreen(),
              EditProfile.SCREEN_NAMED: (context) => EditProfile(),
              ChangePasswordScreen.SCREEN_NAMED: (context) =>
                  ChangePasswordScreen(),
              ForgotPasswordScreen.SCREEN_NAMED: (context) =>
                  ForgotPasswordScreen(),
            },
            initialRoute: SplashScreen.SCREEN_NAMED,
          );
        },
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: mainColor,
      cardColor: Colors.white,
      backgroundColor: Colors.green,
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        headline2: GoogleFonts.poppins(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headline3: GoogleFonts.poppins(
          fontSize: 20.sp,
          color: Colors.black,
        ),
        headline4: GoogleFonts.poppins(
          fontSize: 18.sp,
          color: Colors.black,
        ),
        headline5: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16.sp,
        ),
        bodyText1: GoogleFonts.poppins(fontSize: 18.sp, color: Colors.black),
        bodyText2: GoogleFonts.poppins(
          fontSize: 16.sp,
          color: Colors.black,
        ),
        headline6: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: const Color(0xFF484848),
            fontWeight: FontWeight.w300),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        fillColor: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF363837),
        size: 24,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 20,
      ),
    );
  }
}
