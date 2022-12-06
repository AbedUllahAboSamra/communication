import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/featuers/auth/presentation/manager/auth_cubit.dart';
import 'package:new_sulution_test/featuers/main/presentation/pages/details_screen.dart';
import '../../../../../core/sharedWidget/shimmer_widget.dart';
import '../../../../../data.dart';
import '../../../domain/entities/funerals.dart';
import '../profile_screen.dart';
import 'package:new_sulution_test/injection_container.dart' as di;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      "Browse all funerals",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 17.sp),
                    ),
                  ],
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
              height: 15.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic,
                        color: Colors.grey[400],
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search_rounded)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _buildListItem(
                        context: context, funerals: funeralsData[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  },
                  itemCount: funeralsData.length),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({
    required BuildContext context,
    required Funerals funerals,
  }) {
    return InkWell(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(funerals: funerals ,)));
      },
      child: Container(
        height: 188.h,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 92.h,
                      width: 102.w,
                      margin: EdgeInsets.only(
                        top: 10.h,
                        right: 10.h,
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: SimmerWidget(
                        imageUrl: funerals.imageUrl,
                      ),
                    ),
                    Container(
                      width: 162.w,
                      child: Text(
                        funerals.name,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 23.sp, color: const Color(0xFF050F09)),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "THIS ${funerals.day} (${funerals.month} ${funerals.date})",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 16.sp, color: const Color(0xFF050F09)),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [

                        funerals.users.isNotEmpty ? FlutterImageStack(
                          imageList:
                          funerals.users.map((e) => e.imageUrl).toList(),
                          showTotalCount: true,
                          totalCount: 0,
                          itemRadius: 23.r,
                          itemCount: funerals.users.length >=5 ? 5 :funerals.users.length,
                          itemBorderWidth: 2,
                        ):Container(),
                        SizedBox(
                          width: 6.w,
                        ),
                        funerals.users.length > 5
                            ? Text(
                                "+ ${funerals.users.length - 5} more",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: const Color(0xFF8E8E8E),
                                        fontSize: 13.sp),
                              )
                            : Container(),
                        const Spacer(),
                        Container(
                          width: 29.w,
                          height: 29.w,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.all(6.r),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {},
                            child: Image(
                              image: AssetImage(
                                "assets/images/share.png",
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
