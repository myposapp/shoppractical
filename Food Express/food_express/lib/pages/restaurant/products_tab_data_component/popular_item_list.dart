import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/restaurant/products_tab_data_component/add_to_cart_bottomsheet.dart';

class PopularItemList extends StatefulWidget {
  @override
  _PopularItemListState createState() => _PopularItemListState();
}

class _PopularItemListState extends State<PopularItemList> {
  final productList = [
    {
      'title': 'Margherita Pizza',
      'subtitle': 'Delicious Pizza',
      'image': 'assets/products/products_3.png',
      'status': 'none',
      'price': '5.9'
    },
    {
      'title': 'Thin Crust Pizza',
      'subtitle': 'Delicious Pizza',
      'image': 'assets/products/products_4.png',
      'status': 'none',
      'price': '11.0'
    },
    {
      'title': 'Veg Burger',
      'subtitle': 'Fast Food',
      'image': 'assets/products/products_5.png',
      'status': 'none',
      'price': '3.5'
    },
    {
      'title': 'Fried Noodles',
      'subtitle': 'Chinese',
      'image': 'assets/products/products_6.png',
      'status': 'none',
      'price': '7.5'
    },
    {
      'title': 'Hakka Nuddles',
      'subtitle': 'Chinese',
      'image': 'assets/products/products_1.png',
      'status': 'none',
      'price': '4.0'
    },
    {
      'title': 'Dry Manchuriyan',
      'subtitle': 'Chinese',
      'image': 'assets/products/products_2.png',
      'status': 'none',
      'price': '9.9'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: 195.0,
      child: ListView.builder(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = productList[index];
          return Container(
            width: 135.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: (index != (productList.length - 1))
                ? EdgeInsets.only(left: fixPadding)
                : EdgeInsets.only(left: fixPadding, right: fixPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 110.0,
                  width: 135.0,
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
                  width: 135.0,
                  height: 80.0,
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
                      Padding(
                        padding:
                            EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '\$${item['price']}',
                              style: priceStyle,
                            ),
                            InkWell(
                              onTap: () {
                                productDescriptionModalBottomSheet(
                                    context, height);
                              },
                              child: Container(
                                height: 20.0,
                                width: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 15.0,
                                ),
                              ),
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
        },
      ),
    );
  }
}
