import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/search/get_search_results.dart';

class NearBy extends StatefulWidget {
  @override
  _NearByState createState() => _NearByState();
}

class _NearByState extends State<NearBy> {
  String currentAddress = "76A, New York, US.";
  bool address1 = true;
  bool address2 = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Text(
            'Nearby',
            style: bigHeadingStyle,
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                _addressBottomSheet(context, width);
              },
              child: Container(
                width: width / 1.8,
                padding: EdgeInsets.all(fixPadding),
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: greyColor,
                      size: 16.0,
                    ),
                    Text(currentAddress, style: greyHeadingStyle),
                    Icon(
                      Icons.arrow_drop_down,
                      color: greyColor,
                      size: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey.withOpacity(0.3),
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            tabs: [
              Tab(text: 'Food'),
              Tab(text: 'Drink'),
              Tab(text: 'Fastfood'),
              Tab(text: 'Asia'),
              Tab(text: 'Chinese'),
              Tab(text: 'Veg'),
              Tab(text: 'Non Veg'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GetSearchResults(),
            GetSearchResults(),
            GetSearchResults(),
            GetSearchResults(),
            GetSearchResults(),
            GetSearchResults(),
            GetSearchResults(),
          ],
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
