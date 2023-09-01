import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/restaurant/products_tab_data_component/juice_list.dart';
import 'package:food_express/pages/restaurant/products_tab_data_component/popular_item_list.dart';

class ProductTabData extends StatefulWidget {
  @override
  _ProductTabDataState createState() => _ProductTabDataState();
}

class _ProductTabDataState extends State<ProductTabData> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        // Popular Items Start
        Padding(
          padding: EdgeInsets.all(fixPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Popular Items',
                style: headingStyle,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MoreList()));
                },
                child: Text('See all', style: moreStyle),
              ),
            ],
          ),
        ),
        PopularItemList(),
        // Popular Items End
        heightSpace,
        heightSpace,
        // Coffee Start
        Container(
          color: whiteColor,
          child: Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
                  'Juice',
                  style: headingStyle,
                ),
          ),
        ),
        Container(
          color: whiteColor,
          child: JuiceList(),
        ),
        Container(
          height: 10.0,
          color: whiteColor,
        ),
        // Juice End

        heightSpace,
        heightSpace,
        // Coffee Start
        Container(
          color: whiteColor,
          child: Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
                  'Coffee',
                  style: headingStyle,
                ),
          ),
        ),
        Container(
          color: whiteColor,
          child: JuiceList(),
        ),
        Container(
          height: 10.0,
          color: whiteColor,
        ),
        // Coffee End
        heightSpace,
        heightSpace,
      ],
    );
  }
}
