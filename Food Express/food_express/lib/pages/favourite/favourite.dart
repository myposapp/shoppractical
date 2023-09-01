import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/favourite/foods_tab_data.dart';
import 'package:food_express/pages/favourite/restaurants_tab_data.dart';

class Favourite extends StatelessWidget {
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
            'Favourite',
            style: bigHeadingStyle,
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey.withOpacity(0.3),
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            tabs: [
              Tab(text: 'Foods'),
              Tab(text: 'Restaurants'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FoodsTabData(),
            RestaurantsTabData(),
          ],
        ),
      ),
    );
  }
}
