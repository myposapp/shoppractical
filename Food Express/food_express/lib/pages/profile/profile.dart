import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/login_signup/login.dart';
import 'package:food_express/pages/profile/edit_profile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:food_express/pages/profile/payment_methods.dart';
import 'package:food_express/pages/profile/address.dart';
import 'package:food_express/pages/notification.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    logoutDialogue() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 130.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You sure want to logout?",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: buttonBlackTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Log out',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: bigHeadingStyle,
        ),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: EditProfile()));
            },
            child: Container(
              width: width,
              padding: EdgeInsets.all(fixPadding),
              color: whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage('assets/user_profile/user_3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      widthSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Fannie Jackson',
                            style: headingStyle,
                          ),
                          heightSpace,
                          Text(
                            '123456789',
                            style: lightGreyStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(fixPadding),
            padding: EdgeInsets.all(fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 1.5,
                  spreadRadius: 1.5,
                  color: Colors.grey[200],
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: PaymentMethods()));
                  },
                  child: getTile(
                      Icon(Icons.payment, color: Colors.grey.withOpacity(0.6)),
                      'Payment Methods'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Address()));
                  },
                  child: getTile(
                      Icon(Icons.location_on,
                          color: Colors.grey.withOpacity(0.6)),
                      'Address'),
                ),
                InkWell(
                  onTap: () {},
                  child: getTile(
                      Icon(Icons.local_activity,
                          color: Colors.grey.withOpacity(0.6)),
                      'My Vouchers'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(fixPadding),
            padding: EdgeInsets.all(fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 1.5,
                  spreadRadius: 1.5,
                  color: Colors.grey[200],
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Notifications()));
                  },
                  child: getTile(
                      Icon(Icons.notifications,
                          color: Colors.grey.withOpacity(0.6)),
                      'Notifications'),
                ),
                InkWell(
                  onTap: () {},
                  child: getTile(
                      Icon(Icons.language, color: Colors.grey.withOpacity(0.6)),
                      'Language'),
                ),
                InkWell(
                  onTap: () {},
                  child: getTile(
                      Icon(Icons.settings, color: Colors.grey.withOpacity(0.6)),
                      'Settings'),
                ),
                InkWell(
                  onTap: () {},
                  child: getTile(
                      Icon(Icons.group_add,
                          color: Colors.grey.withOpacity(0.6)),
                      'Invite Friends'),
                ),
                InkWell(
                  onTap: () {},
                  child: getTile(
                      Icon(Icons.headset_mic,
                          color: Colors.grey.withOpacity(0.6)),
                      'Support'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(fixPadding),
            padding: EdgeInsets.all(fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 1.5,
                  spreadRadius: 1.5,
                  color: Colors.grey[200],
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: logoutDialogue,
                  child: getTile(
                      Icon(Icons.exit_to_app,
                          color: Colors.grey.withOpacity(0.6)),
                      'Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getTile(Icon icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40.0,
              width: 40.0,
              alignment: Alignment.center,
              child: icon,
            ),
            widthSpace,
            Text(
              title,
              style: listItemTitleStyle,
            ),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
          color: Colors.grey.withOpacity(0.6),
        ),
      ],
    );
  }
}
