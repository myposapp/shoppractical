import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:page_transition/page_transition.dart';
import 'package:food_express/pages/order/track_order.dart';

class OngoingOrder extends StatefulWidget {
  @override
  _OngoingOrderState createState() => _OngoingOrderState();
}

class _OngoingOrderState extends State<OngoingOrder> {
  final orderList = [
    {
      'title': 'Kichi Coffee & Drink',
      'orderId': '43e4215',
      'image': 'assets/restaurant/restaurant_5.png',
      'item': '4',
      'status': 'On the Way'
    },
    {
      'title': 'Bar 61 Restaurant',
      'orderId': '24r4568',
      'image': 'assets/restaurant/restaurant_2.png',
      'item': '1',
      'status': 'Waiting'
    },
    {
      'title': 'The Barbary',
      'orderId': '86e5681',
      'image': 'assets/restaurant/restaurant_1.png',
      'item': '2',
      'status': 'On the Way'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: orderList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = orderList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: TrackOrder()));
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
                        padding: EdgeInsets.only(
                            left: fixPadding, right: fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border:
                                    Border.all(width: 1.0, color: primaryColor),
                              ),
                            ),
                            widthSpace,
                            Text(
                              item['orderId'],
                              style: listItemSubTitleStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: fixPadding,
                            bottom: fixPadding,
                            left: fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${item['item']} Items',
                              style: listItemSubTitleStyle,
                            ),
                            Text(
                              item['status'],
                              style: TextStyle(
                                fontSize: 14.0,
                                color: (item['status'] == 'On the Way')
                                    ? primaryColor
                                    : Colors.blue,
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
            ),
          ),
        );
      },
    );
  }
}
