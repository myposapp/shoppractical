import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/restaurant/restaurant.dart';

class FavouriteRestaurantsList extends StatefulWidget {
  @override
  _FavouriteRestaurantsListState createState() =>
      _FavouriteRestaurantsListState();
}

class _FavouriteRestaurantsListState extends State<FavouriteRestaurantsList> {
  final restaurantsList = [
    {
      'title': 'Bar 61 Restaurant',
      'subtitle': '76A England',
      'image': 'assets/restaurant/restaurant_5.png',
      'status': 'none'
    },
    {
      'title': 'Core by Clare Smyth',
      'subtitle': '220 Opera Street',
      'image': 'assets/restaurant/restaurant_4.png',
      'status': 'none'
    },
    {
      'title': 'Amrutha Lounge',
      'subtitle': '90B Silicon Velley',
      'image': 'assets/restaurant/restaurant_3.png',
      'status': 'none'
    },
    {
      'title': 'The Barbary',
      'subtitle': '99C OBC Area',
      'image': 'assets/restaurant/restaurant_2.png',
      'status': 'none'
    },
    {
      'title': 'The Palomar',
      'subtitle': '31A Om Colony',
      'image': 'assets/restaurant/restaurant_1.png',
      'status': 'none'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 170.0,
      child: ListView.builder(
        itemCount: restaurantsList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = restaurantsList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Restaurant()));
            },
            child: Container(
              width: 130.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: (index != (restaurantsList.length - 1))
                  ? EdgeInsets.only(left: fixPadding)
                  : EdgeInsets.only(left: fixPadding, right: fixPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 110.0,
                    width: 130.0,
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(fixPadding),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(5.0)),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 130.0,
                    height: 50.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            item['title'],
                            style: listItemTitleStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Text(
                            item['subtitle'],
                            style: listItemSubTitleStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
