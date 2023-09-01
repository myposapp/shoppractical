import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/widget/column_builder.dart';
import 'package:food_express/pages/restaurant/products_tab_data_component/add_to_cart_bottomsheet.dart';

class JuiceList extends StatefulWidget {
  @override
  _JuiceListState createState() => _JuiceListState();
}

class _JuiceListState extends State<JuiceList> {
  final restaurantsList = [
    {
      'title': 'Lemon Juice Fresh',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'image': 'assets/products/lemon_juice.png',
      'price': '5.2',
      'status': 'none'
    },
    {
      'title': 'Orange Juice',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'image': 'assets/products/orange_juice.png',
      'price': '4.5',
      'status': 'none'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
          child: Text(
            '${restaurantsList.length} items',
            style: listItemSubTitleStyle,
          ),
        ),
        ColumnBuilder(
          itemCount: restaurantsList.length,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          itemBuilder: (context, index) {
            final item = restaurantsList[index];
            return Container(
              width: width,
              height: 105.0,
              margin: EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
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
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: width - ((fixPadding * 2) + 100.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  right: fixPadding * 2,
                                  left: fixPadding,
                                  bottom: fixPadding),
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
                              child: Text(
                                item['subtitle'],
                                style: listItemSubTitleStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: fixPadding, left: fixPadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
