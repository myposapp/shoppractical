import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/home/home.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var thirdController = TextEditingController();
  var fourthController = TextEditingController();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    loadingDialog() {
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
              height: 150.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SpinKitPulse(
                    color: primaryColor,
                    size: 50.0,
                  ),
                  heightSpace,
                  heightSpace,
                  Text('Please Wait..', style: lightGreyStyle),
                ],
              ),
            ),
          );
        },
      );
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              ));
    }

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(fixPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Verification',
                  style: bigHeadingStyle,
                ),
                heightSpace,
                Text(
                  'Enter the OTP code from the phone we just sent you.',
                  style: lightGreyStyle,
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                // OTP Box Start
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 1 Start
                    Container(
                      width: 50.0,
                      height: 50.0,
                      alignment: Alignment.center,
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
                      child: TextField(
                        controller: firstController,
                        style: headingStyle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18.0),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (v) {
                          FocusScope.of(context).requestFocus(secondFocusNode);
                        },
                      ),
                    ),
                    // 1 End
                    // 2 Start
                    Container(
                      width: 50.0,
                      height: 50.0,
                      alignment: Alignment.center,
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
                      child: TextField(
                        focusNode: secondFocusNode,
                        controller: secondController,
                        style: headingStyle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18.0),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (v) {
                          FocusScope.of(context).requestFocus(thirdFocusNode);
                        },
                      ),
                    ),
                    // 2 End
                    // 3 Start
                    Container(
                      width: 50.0,
                      height: 50.0,
                      alignment: Alignment.center,
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
                      child: TextField(
                        focusNode: thirdFocusNode,
                        controller: thirdController,
                        style: headingStyle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18.0),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (v) {
                          FocusScope.of(context).requestFocus(fourthFocusNode);
                        },
                      ),
                    ),
                    // 3 End
                    // 4 Start
                    Container(
                      width: 50.0,
                      height: 50.0,
                      alignment: Alignment.center,
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
                      child: TextField(
                        focusNode: fourthFocusNode,
                        controller: fourthController,
                        style: headingStyle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18.0),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (v) {
                          loadingDialog();
                        },
                      ),
                    ),
                    // 4 End
                  ],
                ),
                // OTP Box End
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Didn\'t receive OTP Code!', style: lightGreyStyle),
                    widthSpace,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Resend',
                        style: listItemTitleStyle,
                      ),
                    ),
                  ],
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                InkWell(
                  onTap: () => loadingDialog(),
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: primaryColor,
                    ),
                    child: Text(
                      'Submit',
                      style: wbuttonWhiteTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
