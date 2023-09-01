import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final sliderImageList = [
    {
      'title': 'All',
      'image': 'assets/category/all.png',
    },
    {
      'title': 'Coffee',
      'image': 'assets/category/coffee.png',
    },
    {
      'title': 'Drink',
      'image': 'assets/category/drink.png',
    },
    {
      'title': 'FastFood',
      'image': 'assets/category/fastfood.png',
    },
    {
      'title': 'Pizza',
      'image': 'assets/category/pizza.png',
    },
    {
      'title': 'Snacks',
      'image': 'assets/category/snacks.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 110.0,
      child: ListView.builder(
        itemCount: sliderImageList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = sliderImageList[index];
          return InkWell(
            onTap: () {},
            child: Container(
              width: 70.0,
              margin: (index != (sliderImageList.length - 1))
                  ? EdgeInsets.only(left: fixPadding)
                  : EdgeInsets.only(left: fixPadding, right: fixPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child:
                        Image.asset(item['image'], height: 40.0, width: 40.0),
                  ),
                  heightSpace,
                  Text(
                    item['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: listItemTitleStyle,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
