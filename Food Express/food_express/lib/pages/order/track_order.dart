import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/order/track_order_map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  bool ratingScreen = false;
  bool confirm = true;
  bool deliveryBoyReach = false;
  bool waiting = false;
  bool onTheWay = false;
  bool delivered = false;
  String time = '0:20';
  bool oneStar = true;
  bool twoStar = false;
  bool threeStar = false;
  bool fourStar = false;
  bool fiveStar = false;
  String ratingText = '1';
  bool enthusiastic = false;
  bool fast = false;
  bool friendly = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      setState(() {
        deliveryBoyReach = true;
        time = '0:15';
      });
    });

    Timer(Duration(seconds: 10), () {
      setState(() {
        waiting = true;
        time = '0:10';
      });
    });

    Timer(Duration(seconds: 15), () {
      setState(() {
        onTheWay = true;
        time = '0:05';
      });
    });

    Timer(Duration(seconds: 20), () {
      setState(() {
        delivered = true;
        time = '0:00';
      });
    });
  }

  changeoptionsStatus(title) {
    if (title == 'Enthusiastic') {
      setState(() {
        enthusiastic = !enthusiastic;
      });
    }
    if (title == 'Fast') {
      setState(() {
        fast = !fast;
      });
    }
    if (title == 'Friendly') {
      setState(() {
        friendly = !friendly;
      });
    }
  }

  changeRating(rating) {
    if (rating == '1') {
      setState(() {
        oneStar = true;
        twoStar = false;
        threeStar = false;
        fourStar = false;
        fiveStar = false;
        ratingText = '1';
      });
    }
    if (rating == '2') {
      setState(() {
        oneStar = false;
        twoStar = true;
        threeStar = false;
        fourStar = false;
        fiveStar = false;
        ratingText = '2';
      });
    }
    if (rating == '3') {
      setState(() {
        oneStar = false;
        twoStar = false;
        threeStar = true;
        fourStar = false;
        fiveStar = false;
        ratingText = '3';
      });
    }
    if (rating == '4') {
      setState(() {
        oneStar = false;
        twoStar = false;
        threeStar = false;
        fourStar = true;
        fiveStar = false;
        ratingText = '4';
      });
    }
    if (rating == '5') {
      setState(() {
        oneStar = false;
        twoStar = false;
        threeStar = false;
        fourStar = false;
        fiveStar = true;
        ratingText = '5';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Tracking on Map',
          style: headingStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SlidingUpPanel(
        maxHeight: height - 200.0,
        panel: Container(
          width: width,
          padding: EdgeInsets.all(fixPadding),
          child:
              (!ratingScreen) ? orderTrackDetailScreen() : ratingScreenData(),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Container(
            width: width,
            padding: EdgeInsets.all(fixPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Your food is coming in $time', style: headingStyle),
                Divider(),
                Text(
                  '(Slide up to show more detail..)',
                  style: listItemTitleStyle,
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: TrackOrderMap(),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }

  orderTrackDetailScreen() {
    return Column(
      children: <Widget>[
        Text('Your food is coming in $time'),
        Divider(),
        orderDetail(),
        Divider(),
        deliveryBoyData(),
        Divider(),
        // Trip Start
        (delivered) ? tripComplete() : trip(),
        // Trip End
        Divider(),

        // Rating Start
        (delivered) ? rating() : Container(),
        // Rating End
      ],
    );
  }

  ratingScreenData() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            setState(() {
              ratingScreen = false;
            });
          },
        ),
        Container(
          width: width - (fixPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('AWESOME!', style: headingStyle),
              heightSpace,
              heightSpace,
              Text('You rated Devin $ratingText Stars',
                  style: listItemSubTitleStyle),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //1
                  InkWell(
                    onTap: () {
                      changeRating('1');
                    },
                    child: Icon(
                      Icons.star,
                      size: 35.0,
                      color: ((oneStar == true) ||
                              (twoStar == true) ||
                              (threeStar == true) ||
                              (fourStar == true) ||
                              (fiveStar == true))
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  widthSpace,
                  // 2
                  InkWell(
                    onTap: () {
                      changeRating('2');
                    },
                    child: Icon(
                      Icons.star,
                      size: 35.0,
                      color: ((twoStar == true) ||
                              (threeStar == true) ||
                              (fourStar == true) ||
                              (fiveStar == true))
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  widthSpace,
                  // 3
                  InkWell(
                    onTap: () {
                      changeRating('3');
                    },
                    child: Icon(
                      Icons.star,
                      size: 35.0,
                      color: ((threeStar == true) ||
                              (fourStar == true) ||
                              (fiveStar == true))
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  widthSpace,
                  // 4
                  InkWell(
                    onTap: () {
                      changeRating('4');
                    },
                    child: Icon(
                      Icons.star,
                      size: 35.0,
                      color: ((fourStar == true) || (fiveStar == true))
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  widthSpace,
                  // 5
                  InkWell(
                    onTap: () {
                      changeRating('5');
                    },
                    child: Icon(
                      Icons.star,
                      size: 35.0,
                      color: ((fiveStar == true))
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              Divider(),
              heightSpace,
              getOptionsListItem('Enthusiastic'),
              heightSpace,
              heightSpace,
              getOptionsListItem('Fast'),
              heightSpace,
              heightSpace,
              getOptionsListItem('Friendly'),
              heightSpace,
              heightSpace,
              // Complete Button
              Padding(
                padding: EdgeInsets.all(fixPadding),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
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
                      'Complete',
                      style: wbuttonWhiteTextStyle,
                    ),
                  ),
                ),
              ),
              // Complete Button
            ],
          ),
        ),
      ],
    );
  }

  getOptionsListItem(String title) {
    return Padding(
      padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              changeoptionsStatus(title);
            },
            child: Container(
              width: 26.0,
              height: 26.0,
              decoration: BoxDecoration(
                  color: (title == 'Enthusiastic')
                      ? (enthusiastic)
                          ? primaryColor
                          : whiteColor
                      : (title == 'Fast')
                          ? (fast)
                              ? primaryColor
                              : whiteColor
                          : (friendly)
                              ? primaryColor
                              : whiteColor,
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(
                      width: 1.0, color: greyColor.withOpacity(0.7))),
              child: Icon(Icons.check, color: whiteColor, size: 15.0),
            ),
          ),
          widthSpace,
          Text(
            title,
            style: listItemTitleStyle,
          ),
        ],
      ),
    );
  }

  verticalLine(Color color) {
    return Container(
      width: 1.0,
      height: 30.0,
      color: color,
    );
  }

  orderDetail() {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 90.0,
          width: 90.0,
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: AssetImage('assets/restaurant/restaurant_5.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: width - ((fixPadding * 2) + 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(fixPadding),
                child: Text(
                  'Kichi Coffee & Drink',
                  style: listItemTitleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: fixPadding, right: fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 1.0, color: primaryColor),
                      ),
                    ),
                    widthSpace,
                    Text(
                      '43e4215',
                      style: listItemSubTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: fixPadding, bottom: fixPadding, left: fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '4 Items',
                      style: listItemSubTitleStyle,
                    ),
                    Text(
                      'On the Way',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: primaryColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  deliveryBoyData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(5.0)),
                image: DecorationImage(
                  image: AssetImage('assets/user_profile/user_6.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Devin Stokes', style: listItemTitleStyle),
                heightSpace,
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.orange, size: 18.0),
                    SizedBox(width: 3.0),
                    Text('4.5', style: listItemTitleStyle),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue,
              ),
              child: Icon(Icons.chat, color: whiteColor, size: 25.0),
            ),
            widthSpace,
            Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.green,
              ),
              child: Icon(Icons.phone, color: whiteColor, size: 25.0),
            ),
          ],
        ),
      ],
    );
  }

  trip() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Trip'.toUpperCase(), style: headingStyle),
        heightSpace,
        // 1 Start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                      color: (confirm) ? primaryColor : whiteColor,
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: greyColor.withOpacity(0.7))),
                  child: Icon(Icons.check, color: whiteColor, size: 15.0),
                ),
                widthSpace,
                Text('Confirm Your Order', style: listItemTitleStyle),
              ],
            ),
            Text('9:15',
                style: (confirm) ? listItemTitleStyle : lightGreyStyle),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.0),
          child: (confirm)
              ? verticalLine(primaryColor)
              : verticalLine(lightGreyColor),
        ),
        // 1 End
        // 2 Start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                      color: (deliveryBoyReach) ? primaryColor : whiteColor,
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: greyColor.withOpacity(0.7))),
                  child: Icon(Icons.check, color: whiteColor, size: 15.0),
                ),
                widthSpace,
                Text('Delivery Boy go to Restaurant',
                    style: listItemTitleStyle),
              ],
            ),
            Text('9:15',
                style:
                    (deliveryBoyReach) ? listItemTitleStyle : lightGreyStyle),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.0),
          child: (deliveryBoyReach)
              ? verticalLine(primaryColor)
              : verticalLine(lightGreyColor),
        ),
        // 2 End
        // 3 Start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                      color: (waiting) ? primaryColor : whiteColor,
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: greyColor.withOpacity(0.7))),
                  child: Icon(Icons.check, color: whiteColor, size: 15.0),
                ),
                widthSpace,
                Text('Waiting', style: listItemTitleStyle),
              ],
            ),
            Text('9:20',
                style: (waiting) ? listItemTitleStyle : lightGreyStyle),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.0),
          child: (waiting)
              ? verticalLine(primaryColor)
              : verticalLine(lightGreyColor),
        ),
        // 3 End
        // 4 Start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                      color: (onTheWay) ? primaryColor : whiteColor,
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: greyColor.withOpacity(0.7))),
                  child: Icon(Icons.check, color: whiteColor, size: 15.0),
                ),
                widthSpace,
                Text('On the Way', style: listItemTitleStyle),
              ],
            ),
            Text('9:20',
                style: (onTheWay) ? listItemTitleStyle : lightGreyStyle),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.0),
          child: (onTheWay)
              ? verticalLine(primaryColor)
              : verticalLine(lightGreyColor),
        ),
        // 4 End
        // 5 Start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                      color: (delivered) ? primaryColor : whiteColor,
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: greyColor.withOpacity(0.7))),
                  child: Icon(Icons.check, color: whiteColor, size: 15.0),
                ),
                widthSpace,
                Text('Delivered', style: listItemTitleStyle),
              ],
            ),
            Text('9:25',
                style: (delivered) ? listItemTitleStyle : lightGreyStyle),
          ],
        ),
        // 5 End
      ],
    );
  }

  tripComplete() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Trip'.toUpperCase(), style: headingStyle),
        heightSpace,
        // 1 Start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: greyColor.withOpacity(0.7))),
                  child: Icon(Icons.check, color: whiteColor, size: 15.0),
                ),
                widthSpace,
                Text('Confirm Your Order', style: listItemTitleStyle),
              ],
            ),
            Text('9:15', style: listItemTitleStyle),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.0),
          child: verticalLine(primaryColor),
        ),
        // 1 End

        // 5 Start
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(
                          width: 1.0, color: greyColor.withOpacity(0.7))),
                  child: Icon(Icons.check, color: whiteColor, size: 15.0),
                ),
                widthSpace,
                Text('Delivered', style: listItemTitleStyle),
              ],
            ),
            Text('9:25', style: listItemTitleStyle),
          ],
        ),
        // 5 End
      ],
    );
  }

  rating() {
    return Padding(
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'How is your delivery boy?'.toUpperCase(),
            style: headingStyle,
          ),
          heightSpace,
          Text(
            'Your feedback will help us improve\ndelivery experience better.',
            textAlign: TextAlign.center,
            style: listItemSubTitleStyle,
          ),
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              setState(() {
                ratingScreen = true;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.star,
                    size: 35.0, color: Colors.grey.withOpacity(0.6)),
                widthSpace,
                Icon(Icons.star,
                    size: 35.0, color: Colors.grey.withOpacity(0.6)),
                widthSpace,
                Icon(Icons.star,
                    size: 35.0, color: Colors.grey.withOpacity(0.6)),
                widthSpace,
                Icon(Icons.star,
                    size: 35.0, color: Colors.grey.withOpacity(0.6)),
                widthSpace,
                Icon(Icons.star,
                    size: 35.0, color: Colors.grey.withOpacity(0.6)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
