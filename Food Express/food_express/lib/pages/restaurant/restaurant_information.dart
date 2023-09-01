import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class RestaurantInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(fixPadding),
          child: Text(
            'Informations',
            style: headingStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(fixPadding),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: listItemTitleStyle,
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          margin: EdgeInsets.all(fixPadding * 1.5),
          width: width - (fixPadding * 3.0),
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 2.0, color: whiteColor),
            image: DecorationImage(
              image: AssetImage('assets/restaurant_location.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          // child: Image.asset('assets/restaurant_location.jpg', fit: BoxFit.cover),
        ),
      ],
    );
  }
}
