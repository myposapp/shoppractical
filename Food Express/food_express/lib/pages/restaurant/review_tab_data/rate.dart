import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class RateSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(fixPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Rate', style: headingStyle),
          // 5 Star Rating Start
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('99+', style: greyHeadingStyle,),
              heightSpace,
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
            ],
          ),
          // 5 Star Rating End
          // 4 Star Rating Start
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('56', style: greyHeadingStyle,),
              heightSpace,
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
            ],
          ),
          // 4 Star Rating End
          // 3 Star Rating Start
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('45', style: greyHeadingStyle,),
              heightSpace,
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
            ],
          ),
          // 3 Star Rating End
          // 2 Star Rating Start
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('12', style: greyHeadingStyle,),
              heightSpace,
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
            ],
          ),
          // 1 Star Rating End
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('5', style: greyHeadingStyle,),
              heightSpace,
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.grey[300], size: 18.0,),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: fixPadding/2),
                child: Icon(Icons.star, color: Colors.orange, size: 18.0,),
              ),
            ],
          ),
          // 1 Star Rating End
        ],
      ),
    );
  }
}