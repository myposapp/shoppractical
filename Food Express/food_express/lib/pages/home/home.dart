import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/favourite/favourite.dart';
import 'package:food_express/pages/home/home_main.dart';
import 'package:food_express/pages/nearby/nearby.dart';
import 'package:food_express/pages/order/order.dart';
import 'package:food_express/pages/profile/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex;
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: whiteColor,
        hasNotch: false,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.explore,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.explore,
              color: primaryColor,
            ),
            title: Text(
              'Discover',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.location_on,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.location_on,
              color: primaryColor,
            ),
            title: Text(
              'Near By',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.shopping_basket,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.shopping_basket,
              color: primaryColor,
            ),
            title: Text(
              'Order',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.bookmark_border,
                color: greyColor,
              ),
              activeIcon: Icon(
                Icons.bookmark,
                color: primaryColor,
              ),
              title: Text(
                'Favourite',
                style: bottomBarItemStyle,
              )),
          BubbleBottomBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.person,
                color: greyColor,
              ),
              activeIcon: Icon(
                Icons.person,
                color: primaryColor,
              ),
              title: Text(
                'Profile',
                style: bottomBarItemStyle,
              ))
        ],
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? HomeMain()
            : (currentIndex == 1)
                ? NearBy()
                : (currentIndex == 2)
                    ? Order()
                    : (currentIndex == 3)
                        ? Favourite()
                        : Profile(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return Future.value(false);
    } else {
      return true;
    }
  }
}
