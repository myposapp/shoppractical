import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/order/ongoing_order.dart';
import 'package:food_express/pages/order/history_order/history.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Text(
            'Order',
            style: bigHeadingStyle,
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey.withOpacity(0.3),
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OngoingOrder(),
            HistoryOrder(),
          ],
        ),
      ),
    );
  }
}
