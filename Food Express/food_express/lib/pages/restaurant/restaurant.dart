import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/restaurant/products_tab_data.dart';
import 'package:food_express/pages/restaurant/restaurant_information.dart';
import 'package:food_express/pages/restaurant/review_tab_data/review_tab_data.dart';

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  bool favourite = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 230,
                  pinned: true,
                  elevation: 0.0,
                  actions: <Widget>[
                    IconButton(
                      icon: (favourite)
                          ? Icon(
                              Icons.bookmark,
                              color: whiteColor,
                            )
                          : Icon(
                              Icons.bookmark_border,
                              color: whiteColor,
                            ),
                      onPressed: () {
                        setState(() {
                          favourite = !favourite;
                        });
                        (favourite)
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text('Added to Favourite'),
                              ))
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text('Remove from Favourite'),
                              ));
                      },
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            height: 180,
                            width: width,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/restaurant/restaurant_3.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Container(
                            height: 180.0,
                            width: width,
                            color: blackColor.withOpacity(0.6),
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(fixPadding),
                                  child: Text(
                                    'Bar 61 Restaurant',
                                    style: whiteHeadingStyle,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: fixPadding,
                                    left: fixPadding,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: whiteColor,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 2.0),
                                      Text(
                                        '76A England',
                                        style: whiteSubHeadingStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(fixPadding),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.star,
                                          color: Colors.lime, size: 18.0),
                                      SizedBox(width: 2.0),
                                      Text(
                                        '4.5',
                                        style: whiteSubHeadingStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                heightSpace,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    indicatorColor: darkPrimaryColor,
                    indicatorPadding: EdgeInsets.only(right: 15.0, left: 15.0),
                    tabs: [
                      Tab(text: 'Products'),
                      Tab(text: 'Review'),
                      Tab(text: 'Information'),
                    ],
                  ),
                ),
              ];
            },
            body: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                color: scaffoldBgColor,
              ),
              child: TabBarView(
                children: [
                  ProductTabData(),
                  ReviewTabData(),
                  RestaurantInformation(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
