import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/order/history_order/history_order_detail.dart';
import 'package:page_transition/page_transition.dart';

class HistoryOrder extends StatefulWidget {
  @override
  _HistoryOrderState createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
  final restaurantsList = [
    {
      'title': 'Bar 61 Restaurant',
      'subtitle': '6 Item',
      'image': 'assets/restaurant/restaurant_5.png',
      'duration': 'Yesterday'
    },
    {
      'title': 'Core by Clare Smyth',
      'subtitle': '2 Item',
      'image': 'assets/restaurant/restaurant_4.png',
      'duration': 'Jun 09, 2020'
    },
    {
      'title': 'Amrutha Lounge',
      'subtitle': '1 Item',
      'image': 'assets/restaurant/restaurant_3.png',
      'duration': 'Jun 03, 2020'
    },
    {
      'title': 'The Barbary',
      'subtitle': '2 Item',
      'image': 'assets/restaurant/restaurant_2.png',
      'duration': 'Jun 03, 2020'
    },
    {
      'title': 'The Palomar',
      'subtitle': '3 Item',
      'image': 'assets/restaurant/restaurant_1.png',
      'duration': 'May 23, 2020'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: restaurantsList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = restaurantsList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: HistoryOrderDetail()));
          },
          child: Container(
            width: width,
            height: 100.0,
            margin: (index == 0)
                ? EdgeInsets.all(fixPadding)
                : EdgeInsets.only(
                    right: fixPadding, left: fixPadding, bottom: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 90.0,
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(5.0)),
                    image: DecorationImage(
                      image: AssetImage(item['image']),
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
                          item['title'],
                          style: listItemTitleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.star,
                                    color: Colors.lime, size: 18.0),
                                SizedBox(width: 2.0),
                                Text(
                                  item['subtitle'],
                                  style: listItemSubTitleStyle,
                                ),
                              ],
                            ),
                            Text(
                              item['duration'],
                              style: listItemSubTitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
