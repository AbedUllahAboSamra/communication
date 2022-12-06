import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/core/sharedWidget/shimmer_widget.dart';
import '../../../../../data.dart';
import '../../../../auth/domain/entities/users.dart';
import 'package:new_sulution_test/injection_container.dart' as di;

import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../profile_screen.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

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
                  "Friends",
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
                  onTap: () {
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
                      imageUrl: di.sl<AuthCubit>().users!.imageUrl,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Row(
              children: [
                Text(
                  "Suggestion",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 13.sp, color: Colors.black),
                ),
                const Spacer(),
                Text(
                  "See All",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 13.sp, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            users.isNotEmpty
                ? _buildUserFriend(
                    context: context,
                    user: users[0],
                    isFollow: false,
                  )
                : Container(),
            SizedBox(
              height: 13.h,
            ),
            users.length > 1
                ? _buildUserFriend(
                    context: context,
                    user: users[1],
                    isFollow: false,
                  )
                : Container(),
            SizedBox(
              height: 22.h,
            ),
            Row(
              children: [
                Text(
                  "Friends",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 13.sp, color: Colors.black),
                ),
                const Spacer(),
                Text(
                  "See All",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 13.sp, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildUserFriend(
                      context: context, user: users[index], isFollow: true);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 13.h,
                  );
                },
                itemCount: users.length)
          ],
        ),
      ),
    );
  }

  Widget _buildUserFriend(
      {required BuildContext context,
      required Users user,
      required bool isFollow}) {
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: isFollow ? Colors.black : Colors.grey[100],
                borderRadius: BorderRadius.circular(16.r),
              ),
              margin: EdgeInsets.only(bottom: 8.h, left: 8.h, right: 8.h),
              padding: EdgeInsets.symmetric(
                horizontal: 12.4.w,
                vertical: 3.h,
              ),
              child: Text(
                isFollow ? "Unfollow" : "Follow",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: 13.5.sp,
                    color: isFollow ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
