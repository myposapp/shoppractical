import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/restaurant/review_tab_data/rate.dart';
import 'package:food_express/pages/restaurant/review_tab_data/review.dart';

class ReviewTabData extends StatefulWidget {
  @override
  _ReviewTabDataState createState() => _ReviewTabDataState();
}

class _ReviewTabDataState extends State<ReviewTabData> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        heightSpace,
        // Rate Section Start
        RateSection(),
        // Rate Section End
        Container(
          height: 1.5,
          width: width - 20.0,
          margin: EdgeInsets.only(right: fixPadding, left: fixPadding),
          color: Colors.grey[300],
        ),
        heightSpace,
        ReviewSection()
      ],
    );
  }
}