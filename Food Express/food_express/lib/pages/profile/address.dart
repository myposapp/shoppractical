import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            padding: EdgeInsets.all(fixPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(fixPadding),
                  child: Text(
                    'Address',
                    style: bigHeadingStyle,
                  ),
                ),
                heightSpace,

                // Home Address Start
                Container(
                  padding: EdgeInsets.all(fixPadding),
                  width: width - (fixPadding * 2),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: width - (fixPadding * 2 + 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Home', style: headingStyle),
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.location_on,
                                        color: Colors.grey.withOpacity(0.7)),
                                    widthSpace,
                                    Container(
                                      width: width -
                                          (fixPadding * 2 + 40.0 + 35.0),
                                      child: Text(
                                        '76A, Eighth Avenue, Andora Mercy, New York City, US.',
                                        style: listItemTitleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.person,
                                        color: Colors.grey.withOpacity(0.7)),
                                    widthSpace,
                                    Container(
                                      width: width -
                                          (fixPadding * 2 + 40.0 + 35.0),
                                      child: Text(
                                        'Fannie Jackson',
                                        style: listItemTitleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.phone,
                                        color: Colors.grey.withOpacity(0.7)),
                                    widthSpace,
                                    Container(
                                      width: width -
                                          (fixPadding * 2 + 40.0 + 35.0),
                                      child: Text(
                                        '123456789',
                                        style: listItemTitleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                // Home Address End
                heightSpace,
                heightSpace,
                // Work Address Start
                Container(
                  padding: EdgeInsets.all(fixPadding),
                  width: width - (fixPadding * 2),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: width - (fixPadding * 2 + 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('My Work', style: headingStyle),
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.location_on,
                                        color: Colors.grey.withOpacity(0.7)),
                                    widthSpace,
                                    Container(
                                      width: width -
                                          (fixPadding * 2 + 40.0 + 35.0),
                                      child: Text(
                                        '76A, Eighth Avenue, Andora Mercy, New York City, US.',
                                        style: listItemTitleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.person,
                                        color: Colors.grey.withOpacity(0.7)),
                                    widthSpace,
                                    Container(
                                      width: width -
                                          (fixPadding * 2 + 40.0 + 35.0),
                                      child: Text(
                                        'Fannie Jackson',
                                        style: listItemTitleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.phone,
                                        color: Colors.grey.withOpacity(0.7)),
                                    widthSpace,
                                    Container(
                                      width: width -
                                          (fixPadding * 2 + 40.0 + 35.0),
                                      child: Text(
                                        '123456789',
                                        style: listItemTitleStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                // Work Address End
                heightSpace,
                heightSpace,
                // Add New Address Start
                DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.grey.withOpacity(0.7),
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: width - fixPadding * 2.0,
                      padding: EdgeInsets.all(fixPadding*2.0),
                      alignment: Alignment.center,
                      child: Text('Add new Address', style: greyHeadingStyle,),
                    ),
                  ),
                ),
                // Add New Address End
              ],
            ),
          ),
        ],
      ),
    );
  }
}
