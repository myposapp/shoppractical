import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/confirm_order_add_address/add_new_address.dart';
import 'package:food_express/pages/home/home_component/category_list.dart';
import 'package:food_express/pages/home/home_component/favourite_restaurants_list.dart';
import 'package:food_express/pages/home/home_component/hot_sale.dart';
import 'package:food_express/pages/home/home_component/image_slider_list.dart';
import 'package:food_express/pages/home/home_component/product_ordered.dart';
import 'package:food_express/pages/search/search.dart';
import 'package:page_transition/page_transition.dart';
import 'package:food_express/pages/notification.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  String currentAddress = "76A, New York, US.";
  bool address1 = true;
  bool address2 = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 160,
                  pinned: true,
                  floating: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                      },
                    ),
                  ],
                  title: InkWell(
                    onTap: () {
                      _addressBottomSheet(context, width);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Delivering To'.toUpperCase(),
                            style: appbarHeadingStyle),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: whiteColor,
                              size: 16.0,
                            ),
                            Text(currentAddress, style: appbarSubHeadingStyle),
                            Icon(
                              Icons.arrow_drop_down,
                              color: whiteColor,
                              size: 16.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.all(fixPadding * 2),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: primaryColor,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Search()));
                        },
                        child: Container(
                          width: width,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: darkPrimaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(fixPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  color: whiteColor,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: fixPadding),
                                  child: Text(
                                    'Do you want find something?',
                                    style: searchTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  automaticallyImplyLeading: false,
                ),
              ];
            },
            body: SafeArea(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15.0)),
                  color: scaffoldBgColor,
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    // Image Slider List Start
                    Padding(
                      padding: EdgeInsets.only(top: fixPadding * 1.5),
                      child: ImageSliderList(),
                    ),
                    // Image Slider List End
                    heightSpace,

                    // Categories Start
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Text(
                        'Categories',
                        style: headingStyle,
                      ),
                    ),
                    CategoryList(),
                    // Categories End
                    heightSpace,

                    // Products Ordered Start
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Products Ordered',
                            style: headingStyle,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MoreList()));
                            },
                            child: Text('View all', style: moreStyle),
                          ),
                        ],
                      ),
                    ),
                    ProductsOrdered(),
                    // Products Ordered End

                    heightSpace,
                    heightSpace,

                    // Products Ordered Start
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Favourite Restaurants',
                            style: headingStyle,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MoreList()));
                            },
                            child: Text('View all', style: moreStyle),
                          ),
                        ],
                      ),
                    ),
                    FavouriteRestaurantsList(),
                    // Products Ordered End
                    heightSpace,
                    heightSpace,
                    // Hot Sale Start
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Hot Sale',
                            style: headingStyle,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: MoreList()));
                            },
                            child: Text('View all', style: moreStyle),
                          ),
                        ],
                      ),
                    ),
                    HotSale(),
                    // Hot Sale End

                    heightSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Bottom Sheet for Address Starts Here
  void _addressBottomSheet(context, width) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Material(
            elevation: 7.0,
            child: Container(
              color: Colors.white,
              child: Wrap(
                children: <Widget>[
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: width,
                            padding: EdgeInsets.all(fixPadding),
                            alignment: Alignment.center,
                            child: Text(
                              'Select Address'.toUpperCase(),
                              style: headingStyle,
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentAddress = '76A, New York, US.';
                                address1 = true;
                                address2 = false;
                              });
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                      color: (address1)
                                          ? primaryColor
                                          : whiteColor,
                                      borderRadius: BorderRadius.circular(13.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: greyColor.withOpacity(0.7))),
                                  child: Icon(Icons.check,
                                      color: whiteColor, size: 15.0),
                                ),
                                widthSpace,
                                Text(
                                  '76A, New York, US.',
                                  style: listItemTitleStyle,
                                ),
                              ],
                            ),
                          ),
                          heightSpace,
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentAddress = '55C, California, US.';
                                address1 = false;
                                address2 = true;
                              });
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 26.0,
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                      color: (address2)
                                          ? primaryColor
                                          : whiteColor,
                                      borderRadius: BorderRadius.circular(13.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: greyColor.withOpacity(0.7))),
                                  child: Icon(Icons.check,
                                      color: whiteColor, size: 15.0),
                                ),
                                widthSpace,
                                Text(
                                  '55C, California, US.',
                                  style: listItemTitleStyle,
                                ),
                              ],
                            ),
                          ),
                          heightSpace,
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddNewAddress()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 26.0,
                                  height: 26.0,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),
                                ),
                                widthSpace,
                                Text(
                                  'Add New Address',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          heightSpace,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
  // Bottom Sheet for Address Ends Here
}
