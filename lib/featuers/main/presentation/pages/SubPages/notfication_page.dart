import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/sharedWidget/shimmer_widget.dart';
import '../../../../../data.dart';
import '../../../../auth/domain/entities/users.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../profile_screen.dart';
import 'package:new_sulution_test/injection_container.dart' as di;

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Text(
                  "Notifications",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){
                    Navigator.pushNamed(context, ProfileScreen.SCREEN_NAMED);
                  },
                  child: Container(
                    height: 34.h,
                    width: 34.h,
                    margin: EdgeInsets.only(
                      top: 10.h,
                      right: 10.h,
                      bottom: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: SimmerWidget(
                      imageUrl:
                      di.sl<AuthCubit>().users!.imageUrl,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildUserFriend(context: context, user: users[index]);
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 10.h,
                  );
                },
                itemCount: users.length)
          ],
        ),
      ),
    );
  }

  Widget _buildUserFriend({
    required BuildContext context,
    required Users user,
  }) {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            height: 45.h,
            width: 45.h,
            margin: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(555.r),
            ),
            clipBehavior: Clip.hardEdge,
            child: SimmerWidget(
              imageUrl: user.imageUrl,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(),
                  Container(),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    user.location,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF575757)),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
