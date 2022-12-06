import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/injection_container.dart' as di;
import '../../../../core/sharedWidget/back_icon.dart';
import '../../../../core/utils/colors.dart';
import '../../../main/presentation/pages/main_screen.dart';
import '../manager/auth_cubit.dart';
import '../manager/auth_state.dart';
import '../widgets/text_form_filed_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String SCREEN_NAMED = "/SignUpScreen";

  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        print("TODO: implement listener $state   this state");
        if (state is AuthSignUplLoading) {
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
              "Sign up",
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
                        height: 90.h,
                      ),
                      TextFormFiledWidget(
                        label: "Name",
                        textInputType: TextInputType.emailAddress,
                        controller: nameController,
                        validator: (value) {
                          if (value != null && value.length >= 5) {
                            return null;
                          }
                          return "check your name";
                        },
                      ),
                      SizedBox(
                        height: 14.h,
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
                          return "check your name";
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
                          if (value != null &&
                              value.length > 6 &&
                              value.toString() ==
                                  confirmPasswordController.text) {
                            return null;
                          }
                          return "invalid password";
                        },
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      TextFormFiledWidget(
                        label: "Confirm Password",
                        textInputType: TextInputType.emailAddress,
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value != null &&
                              value.length > 6 &&
                              value.toString() == passwordController.text) {
                            return null;
                          }
                          return "invalid password";
                        },
                      ),
                      SizedBox(
                        height: 50.h,
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
                                state is! AuthSignUplLoading) {
                              di.sl<AuthCubit>().signUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
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
                            child: state is AuthSignUplLoading
                                ? Container(
                                    height: 20.r,
                                    width: 20.r,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 1.5,
                                    ),
                                  )
                                : Text(
                                    "Sign up",
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Already have an account ?",
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
                                  context, LoginScreen.SCREEN_NAMED);
                            },
                            child: Text(
                              "Sign in",
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
