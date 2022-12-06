import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/featuers/auth/presentation/manager/auth_cubit.dart';
import 'package:new_sulution_test/featuers/auth/presentation/pages/signup_screen.dart';
import 'package:new_sulution_test/featuers/main/presentation/pages/main_screen.dart';
import '../../../../core/sharedWidget/back_icon.dart';
import '../../../../core/utils/colors.dart';
import '../manager/auth_state.dart';
import '../widgets/text_form_filed_widget.dart';
import 'package:new_sulution_test/injection_container.dart' as di;


class LoginScreen extends StatelessWidget {
  static String SCREEN_NAMED = "/LoginScreen";

  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthWithEmailLoaded ||
            state is AuthSignInWithFaceBookLoaded ||
            state is AuthSignInWithGoogleLoaded) {
          Navigator.pushReplacementNamed(context, MainScreen.SCREEN_NAMED);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              "Sign in",
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: 17.sp,
                  ),
            ),
            leading: const BackIcon(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      TextFormFiledWidget(
                        label: "Email",
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value != null &&
                              value.length > 6 &&
                              value.contains("@") &&
                              value.contains(".")) {
                            return null;
                          }
                          return "invalid data";
                        },
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      TextFormFiledWidget(
                        label: "Password",
                        textInputType: TextInputType.emailAddress,
                        controller: passwordController,
                        validator: (value) {
                          if (value != null && value.length >= 6) {
                            return null;
                          }
                          return "invalid data";
                        },
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password ?",
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF3F3D56),
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (_formKey.currentState?.validate() == true &&
                                state is! AuthWithEmailLoading) {
                              di.sl<AuthCubit>().login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            }
                          },
                          child: Container(
                            height: 52.h,
                            width: 299.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: state is AuthWithEmailLoading
                                ? SizedBox(
                                    height: 20.r,
                                    width: 20.r,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 1.5,
                                    ),
                                  )
                                : Text(
                                    "Sign in",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                          child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Or Continue with",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      fontSize: 13.sp,
                                      color: const Color(0xFF898F9C)),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  onTap: () {
                                    di.sl<AuthCubit>().signInWithFacebook();
                                  },
                                  child: Container(
                                    height: 44.h,
                                    width: 44.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/facebook_button.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  onTap: () {
                                    di.sl<AuthCubit>().googleSignIn();
                                    // Navigator.pushReplacementNamed(context, MainScreen.SCREEN_NAMED);
                                  },
                                  child: Container(
                                    height: 44.h,
                                    width: 44.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/googleIcon.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Don’t have an account ?",
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontSize: 15.sp,
                                      color: const Color(0xFF3F3D56),
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.SCREEN_NAMED);
                            },
                            child: Text(
                              "Sign up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontSize: 15.sp,
                                    decoration: TextDecoration.underline,
                                    color: const Color(0xFF3F3D56),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
