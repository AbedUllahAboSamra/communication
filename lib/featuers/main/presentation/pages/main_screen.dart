import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_sulution_test/featuers/main/presentation/pages/SubPages/home_page.dart';
import 'package:new_sulution_test/featuers/main/presentation/pages/SubPages/notfication_page.dart';
import 'package:new_sulution_test/featuers/main/presentation/pages/SubPages/users_page.dart';

class MainScreen extends StatefulWidget {
  static const String SCREEN_NAMED = "/MainScreen";
  MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var pages = const [
    HomePage(),
    UsersPage(),
    NotificationPage(),
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7FA),
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: pages[index],
    );
  }

  Widget get _bottomNavigationBar {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 13, offset: Offset(0, 2)),
          ]),
      clipBehavior: Clip.hardEdge,
      child: BottomNavigationBar(
          currentIndex: index,
          onTap: (s) {
            setState(() {
              index = s;
            });
          },
          selectedLabelStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          iconSize: 28,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage("assets/images/unSelectedHomeIcon.png")),
              activeIcon: Image(
                  image: AssetImage("assets/images/selectedHomeIcon.png")),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage("assets/images/unselectedUserIcon.png")),
              activeIcon: Image(
                  image: AssetImage("assets/images/selectedUserIcon.png")),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage(
                      "assets/images/unselectedNotificationIcon.png")),
              activeIcon: Image(
                  image:
                      AssetImage("assets/images/selectedNotificationIcon.png")),
              label: 'Users',
            ),
          ]),
    );
  }
}
