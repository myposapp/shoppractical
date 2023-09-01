import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/login_signup/otp_screen.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Image.asset(
                  'assets/login-icon.png',
                  width: 200.0,
                  fit: BoxFit.fitWidth,
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text('Register your account', style: greyHeadingStyle),
                heightSpace,
                heightSpace,
                heightSpace,
                // Full Name TextField Start
                Container(
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
                    style: headingStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Full Name',
                      hintStyle: greyHeadingStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Full Name TextField End
                heightSpace,
                heightSpace,
                // Password TextField Start
                Container(
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
                    style: headingStyle,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Password',
                      hintStyle: greyHeadingStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Password TextField End
                heightSpace,
                heightSpace,
                // Email Address TextField Start
                Container(
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
                    style: headingStyle,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Email Address',
                      hintStyle: greyHeadingStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Email Address TextField End
                heightSpace,
                heightSpace,
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OTPScreen()));
                  },
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
                      'Continue',
                      style: wbuttonWhiteTextStyle,
                    ),
                  ),
                ),
                heightSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
