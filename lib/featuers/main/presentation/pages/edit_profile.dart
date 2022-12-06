import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharedWidget/back_icon.dart';
import '../../../../core/sharedWidget/shimmer_widget.dart';

class EditProfile extends StatefulWidget {
  static const String SCREEN_NAMED = "/EditProfile";

   EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final mobileController = TextEditingController();

  final locationController = TextEditingController();

  final genderController = TextEditingController();

  final birthController = TextEditingController();

  @override
  void initState() {
    nameController.text = "Abed Ullah";
    emailController.text = "Abed@gmail.com";
    mobileController.text = "1 802-356-8287";
    locationController.text = "213 Essex Court Newfane";
    genderController.text = "Female";
    birthController.text = "Nov 10, 1999";

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style:
              Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17.sp),
        ),
        leading: const BackIcon(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(555.r),
              ),
              height: 90.h,
              width: 90.h,
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  const SimmerWidget(
                    imageUrl:
                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
                  ),
                  Container(
                    color: Colors.black26,
                    child: const Center(
                      child: Icon(Icons.add_rounded,
                      color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal:18.h
              ),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  counter: Container(),
                  
                  labelText: "Name",
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.grey,width: .5.w
                    )
                  ),
                  enabledBorder:UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(
                          color: Colors.grey,width: .5.w
                      )
                  ),
               focusedBorder: UnderlineInputBorder(
                   borderRadius: BorderRadius.circular(5.r),
                   borderSide: BorderSide(
                       color: Colors.grey,width: .5.w
                   )
               )
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal:18.h
              ),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                    labelText: "Email",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    enabledBorder:UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    )
                ),
              ),
            ),

            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal:18.h
              ),
              child: TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                    labelText: "Mobile",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    enabledBorder:UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    )
                ),
              ),
            ),

            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal:18.h
              ),
              child: TextFormField(
                controller: locationController,
                enabled: false,
                decoration: InputDecoration(
                    labelText: "Location",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    enabledBorder:UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        ),

                    ),
                  disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        color: Colors.grey,width: .5.w
                    ),

                  ),
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,
                  size: 18.r,),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal:18.h
              ),
              child: TextFormField(
                controller: genderController,
                enabled: false,
                decoration: InputDecoration(
                    labelText: "Gender",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    enabledBorder:UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        ),

                    ),
                  disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        color: Colors.grey,width: .5.w
                    ),

                  ),
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,
                  size: 18.r,),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal:18.h
              ),
              child: TextFormField(
                controller: birthController,
                enabled: false,
                decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    enabledBorder:UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(
                            color: Colors.grey,width: .5.w
                        ),

                    ),
                  disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                        color: Colors.grey,width: .5.w
                    ),

                  ),
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,
                  size: 18.r,),
                ),
              ),
            ),

 SizedBox(height: 55.h,),
            Container(
              height: 54.h,
              margin: EdgeInsets.symmetric(horizontal: 30.h,
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.r,)
              ),
              child: Center(
                child: Text("Done",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),

                ),
              ),
            ),
            ///

          ],
        ),
      ),
    );
  }
}
