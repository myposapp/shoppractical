import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class ImageSliderList extends StatefulWidget {
  @override
  _ImageSliderListState createState() => _ImageSliderListState();
}

class _ImageSliderListState extends State<ImageSliderList> {
  final sliderImageList = [
    {
      'image': 'assets/slider/slider_1.png',
    },
    {
      'image': 'assets/slider/slider_2.png',
    },
    {
      'image': 'assets/slider/slider_3.png',
    },
    {
      'image': 'assets/slider/slider_4.png',
    },
    {
      'image': 'assets/slider/slider_5.png',
    },
    {
      'image': 'assets/slider/slider_6.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 160.0,
      child: ListView.builder(
        itemCount: sliderImageList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = sliderImageList[index];
          return InkWell(
            onTap: () {},
            child: Container(
              width: 170.0,
              margin: (index != (sliderImageList.length - 1))
                  ? EdgeInsets.only(left: fixPadding)
                  : EdgeInsets.only(left: fixPadding, right: fixPadding),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item['image']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
