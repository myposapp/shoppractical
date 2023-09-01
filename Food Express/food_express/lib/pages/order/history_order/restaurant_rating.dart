import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class RestaurantRating extends StatefulWidget {
  @override
  _RestaurantRatingState createState() => _RestaurantRatingState();
}

class _RestaurantRatingState extends State<RestaurantRating> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool favourite = false;
  bool oneStar = true;
  bool twoStar = false;
  bool threeStar = false;
  bool fourStar = false;
  bool fiveStar = false;
  String ratingText = '1';

  changeRating(rating) {
    if (rating == '1') {
      setState(() {
        oneStar = true;
        twoStar = false;
        threeStar = false;
        fourStar = false;
        fiveStar = false;
        ratingText = '1';
      });
    }
    if (rating == '2') {
      setState(() {
        oneStar = false;
        twoStar = true;
        threeStar = false;
        fourStar = false;
        fiveStar = false;
        ratingText = '2';
      });
    }
    if (rating == '3') {
      setState(() {
        oneStar = false;
        twoStar = false;
        threeStar = true;
        fourStar = false;
        fiveStar = false;
        ratingText = '3';
      });
    }
    if (rating == '4') {
      setState(() {
        oneStar = false;
        twoStar = false;
        threeStar = false;
        fourStar = true;
        fiveStar = false;
        ratingText = '4';
      });
    }
    if (rating == '5') {
      setState(() {
        oneStar = false;
        twoStar = false;
        threeStar = false;
        fourStar = false;
        fiveStar = true;
        ratingText = '5';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Padding(
            padding: EdgeInsets.only(left: fixPadding * 2, bottom: fixPadding),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Rating',
                textAlign: TextAlign.left,
                style: bigHeadingStyle,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          child: Padding(
            padding: EdgeInsets.all(fixPadding),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: 50.0,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: primaryColor,
                ),
                child: Text(
                  'Complete',
                  style: wbuttonWhiteTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(fixPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Restaurant',
                  style: greyHeadingStyle,
                ),
                heightSpace,
                Container(
                  width: width - (fixPadding * 2.0),
                  padding: EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: whiteColor,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              favourite = !favourite;
                            });

                            if (favourite) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Added to Favourite')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Remove from Favourite')));
                            }
                          },
                          child: Icon(
                            (!favourite)
                                ? Icons.bookmark_border
                                : Icons.bookmark,
                            size: 22.0,
                            color: greyColor,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          orderDetail(),
                          heightSpace,
                          Divider(),
                          heightSpace,
                          ratingData(),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          enterNote(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  orderDetail() {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 90.0,
          width: 90.0,
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: AssetImage('assets/restaurant/restaurant_5.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: width - ((fixPadding * 4) + 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(fixPadding),
                child: Text(
                  'Kichi Coffee & Drink',
                  style: listItemTitleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: fixPadding, right: fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: greyColor,
                      size: 18.0,
                    ),
                    SizedBox(width: 3.0),
                    Text(
                      '76A England',
                      style: listItemSubTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ratingData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('What do you think about\nthis this restaurant?',
            textAlign: TextAlign.center, style: headingStyle),
        heightSpace,
        heightSpace,
        Text(
            'Your feedback will help us improve\nrestaurants experience better.',
            textAlign: TextAlign.center,
            style: listItemSubTitleStyle),
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //1
            InkWell(
              onTap: () {
                changeRating('1');
              },
              child: Icon(
                Icons.star,
                size: 35.0,
                color: ((oneStar == true) ||
                        (twoStar == true) ||
                        (threeStar == true) ||
                        (fourStar == true) ||
                        (fiveStar == true))
                    ? Colors.orange
                    : Colors.grey.withOpacity(0.6),
              ),
            ),
            widthSpace,
            // 2
            InkWell(
              onTap: () {
                changeRating('2');
              },
              child: Icon(
                Icons.star,
                size: 35.0,
                color: ((twoStar == true) ||
                        (threeStar == true) ||
                        (fourStar == true) ||
                        (fiveStar == true))
                    ? Colors.orange
                    : Colors.grey.withOpacity(0.6),
              ),
            ),
            widthSpace,
            // 3
            InkWell(
              onTap: () {
                changeRating('3');
              },
              child: Icon(
                Icons.star,
                size: 35.0,
                color: ((threeStar == true) ||
                        (fourStar == true) ||
                        (fiveStar == true))
                    ? Colors.orange
                    : Colors.grey.withOpacity(0.6),
              ),
            ),
            widthSpace,
            // 4
            InkWell(
              onTap: () {
                changeRating('4');
              },
              child: Icon(
                Icons.star,
                size: 35.0,
                color: ((fourStar == true) || (fiveStar == true))
                    ? Colors.orange
                    : Colors.grey.withOpacity(0.6),
              ),
            ),
            widthSpace,
            // 5
            InkWell(
              onTap: () {
                changeRating('5');
              },
              child: Icon(
                Icons.star,
                size: 35.0,
                color: ((fiveStar == true))
                    ? Colors.orange
                    : Colors.grey.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }

  enterNote() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width - fixPadding * 2,
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: 'Enter Note Here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
        ),
      ),
    );
  }
}
