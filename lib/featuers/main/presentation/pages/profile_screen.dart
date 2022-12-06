import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/sharedWidget/back_icon.dart';
import 'package:new_sulution_test/featuers/auth/presentation/manager/auth_cubit.dart';
import 'package:new_sulution_test/featuers/auth/presentation/manager/auth_state.dart';
import 'package:new_sulution_test/featuers/main/presentation/pages/edit_profile.dart';
 import '../../../../core/sharedWidget/shimmer_widget.dart';
import 'change_password_screen.dart';
import 'package:new_sulution_test/injection_container.dart' as di ;

class ProfileScreen extends StatelessWidget {
  static const String SCREEN_NAMED = "/ProfileScreen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            title: Text(
              "My Profile",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: 17.sp),
            ),
            leading: const BackIcon(),
            actions: [
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(context, EditProfile.SCREEN_NAMED);
                },
                child: Container(
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
                        "assets/images/editIcon.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Container(
                    height: 90.h,
                    width: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(555.r),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child:  SimmerWidget(
                      imageUrl: di.sl<AuthCubit>().users!.imageUrl,
                    )),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  di.sl<AuthCubit>().users!.name,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                ),
                Text(
                  di.sl<AuthCubit>().users!.location,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 14.sp,
                        color: const Color(0xFF050F09),
                      ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 80.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        width: 32.w,
                        height: 32.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(55555.r),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {},
                          child: const Image(
                            image: AssetImage(
                              "assets/images/emailIcon.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        di.sl<AuthCubit>().users!.email,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                              fontSize: 17.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        width: 32.w,
                        height: 32.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(55555.r),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {},
                          child: const Image(
                            image: AssetImage(
                              "assets/images/callIcon.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        di.sl<AuthCubit>().users!.phone,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                              fontSize: 17.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        width: 32.w,
                        height: 32.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(55555.r),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {},
                          child: const Image(
                            image: AssetImage(
                              "assets/images/dateIcon.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        di.sl<AuthCubit>().users!.dateOfBirth,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                              fontSize: 17.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        width: 32.w,
                        height: 32.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(55555.r),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {},
                          child: const Image(
                            image: AssetImage(
                              "assets/images/gender.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        di.sl<AuthCubit>().users!.gender,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                              fontSize: 17.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushNamed(
                        context, ChangePasswordScreen.SCREEN_NAMED);
                  },
                  child: Container(
                    height: 80.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          width: 32.w,
                          height: 32.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(55555.r),
                          ),
                          child: const Image(
                            image: AssetImage(
                              "assets/images/lockIcon.png",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Change Password",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                  ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        ),
                        SizedBox(
                          width: 16.w,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


    );
  }
}
