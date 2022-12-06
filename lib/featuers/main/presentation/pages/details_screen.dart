import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/featuers/main/presentation/pages/qr_screen.dart';

import '../../../../core/sharedWidget/back_icon.dart';
import '../../../../core/sharedWidget/shimmer_widget.dart';
import '../../domain/entities/funerals.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.funerals}) : super(key: key);
  final Funerals funerals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "My Profile",
          style:
              Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17.sp),
        ),
        leading: const BackIcon(),
        actions: [
          Container(
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
                  "assets/images/share.png",
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 98.h,
                  width: 108.w,
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
                SizedBox(
                  width: 6.w,
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
            SizedBox(
              height: 16.h,
            ),
            Text(
              "THIS ${funerals.day} (${funerals.month} ${funerals.date})",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontSize: 17.sp, color: const Color(0xFF050F09)),
            ),
            SizedBox(
              height: 17.h,
            ),
            _buildItem(
              context: context,
              body: "12pm - 3pm at Trull Home",
              subBody: "165 Small Street New York",
              title: "Visitation",
            ),
            SizedBox(
              height: 8.h,
            ),
            _buildItem(
              context: context,
              body: "3:30pm at Stan Wadlow Park",
              subBody: "353 Small Steet",
              title: "Funeral Service",
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "invitees",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontSize: 14.sp, color: const Color(0xFF050F09)),
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(children: [
              funerals.users.isNotEmpty ? FlutterImageStack(
                imageList:
                funerals.users.map((e) => e.imageUrl).toList(),
                showTotalCount: true,
                totalCount: 0,
                itemRadius: 36.r,
                itemCount: funerals.users.length >=5 ? 5 :funerals.users.length,
                itemBorderWidth: 2,
              ):Container(),
              SizedBox(
                width: 6.w,
              ),
              funerals.users.length > 5
                  ? Text(
                      "+ ${funerals.users.length - 5} more",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: const Color(0xFF8E8E8E), fontSize: 13.sp),
                    )
                  : Container(),
            ]),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: (){
                Navigator.pushNamed(context, QrScreen.SCREEN_NAMED);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  children: [
                    Text(
                      "View QR Code",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Color(0xFF050F09), fontSize: 15.sp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30.h,),
            Container(
              height: 54.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.r,)
              ),
              child: Center(
                child: Text("Donate",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 17.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),

                ),
              ),
            ),
            SizedBox(height: 18.h,),
            Container(
              height: 54.h,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.r,)
              ),
              child: Center(
                child: Text("Donate",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 17.sp,
                  color: Color(0xFF050F09),
                 ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required String title,
    required String body,
    required String subBody,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: 13.sp, color: const Color(0xFF050F09)),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            body,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontSize: 18.sp, color: const Color(0xFF050F09)),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            subBody,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontSize: 15.sp, color: const Color(0xFF8E8E8E)),
          ),
          SizedBox(
            height: 8.h,
          ),
          Divider(
            thickness: .5,
            color: Color(0xFFDCDCDC),
          )
        ],
      ),
    );
  }
}
