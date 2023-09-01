import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/restaurant/restaurant.dart';
import 'package:page_transition/page_transition.dart';

class GetSearchResults extends StatefulWidget {
  @override
  _GetSearchResultsState createState() => _GetSearchResultsState();
}

class _GetSearchResultsState extends State<GetSearchResults> {
  final restaurantsList = [
    {
      'title': 'Bar 61 Restaurant',
      'subtitle': '76A England',
      'image': 'assets/restaurant/restaurant_5.png',
      'rating': '4.5',
      'distance': '0.5',
      'status': 'none'
    },
    {
      'title': 'Core by Clare Smyth',
      'subtitle': '220 Opera Street',
      'image': 'assets/restaurant/restaurant_4.png',
      'rating': '4.2',
      'distance': '1.8',
      'status': 'none'
    },
    {
      'title': 'Amrutha Lounge',
      'subtitle': '90B Silicon Velley',
      'image': 'assets/restaurant/restaurant_3.png',
      'rating': '5.0',
      'distance': '0.7',
      'status': 'none'
    },
    {
      'title': 'The Barbary',
      'subtitle': '99C OBC Area',
      'image': 'assets/restaurant/restaurant_2.png',
      'rating': '4.7',
      'distance': '0.2',
      'status': 'none'
    },
    {
      'title': 'The Palomar',
      'subtitle': '31A Om Colony',
      'image': 'assets/restaurant/restaurant_1.png',
      'rating': '4.1',
      'distance': '1.5',
      'status': 'none'
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
                    type: PageTransitionType.fade, child: Restaurant()));
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
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: fixPadding,
                  right: fixPadding,
                  child: InkWell(
                    onTap: () {
                      if (item['status'] == 'none') {
                        setState(() {
                          item['status'] = 'saved';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Added to Favourite'),
                        ));
                      } else {
                        setState(() {
                          item['status'] = 'none';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Remove from Favourite'),
                        ));
                      }
                    },
                    child: Icon(
                      (item['status'] == 'none')
                          ? Icons.bookmark_border
                          : Icons.bookmark,
                      size: 22.0,
                      color: greyColor,
                    ),
                  ),
                ),
                Row(
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
                                Icon(
                                  Icons.location_on,
                                  color: greyColor,
                                  size: 18.0,
                                ),
                                Text(
                                  item['subtitle'],
                                  style: listItemSubTitleStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
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
                                      item['rating'],
                                      style: listItemSubTitleStyle,
                                    ),
                                  ],
                                ),
                                Text(
                                  '${item['distance']} km',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
