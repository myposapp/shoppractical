import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_express/constant/constant.dart';

class FoodsTabData extends StatefulWidget {
  @override
  _FoodsTabDataState createState() => _FoodsTabDataState();
}

class _FoodsTabDataState extends State<FoodsTabData> {
  final foodsList = [
    {
      'title': 'Orange Juice',
      'subtitle': 'Bar 61 Restaurant',
      'image': 'assets/products/orange_juice.png',
      'rating': '4.5',
      'price': '12.5'
    },
    {
      'title': 'Delicious Pizza',
      'subtitle': 'Core by Clare Smyth',
      'image': 'assets/products/products_4.png',
      'rating': '4.2',
      'price': '15.9'
    },
    {
      'title': 'Choco Lava Cake',
      'subtitle': 'Amrutha Lounge',
      'image': 'assets/products/products_10.png',
      'rating': '5.0',
      'price': '8.7'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return (foodsList.length == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.bookmark_border,
                  color: Colors.grey,
                  size: 60.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'No Item in Favourite Foods',
                  style: greyHeadingStyle,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: foodsList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = foodsList[index];
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                secondaryActions: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: (index == 0) ? fixPadding : 0.0,
                      bottom: fixPadding,
                    ),
                    child: IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        setState(() {
                          foodsList.removeAt(index);
                        });

                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Item Removed'),
                        ));
                      },
                    ),
                  ),
                ],
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: width,
                    height: 100.0,
                    margin: (index == 0)
                        ? EdgeInsets.all(fixPadding)
                        : EdgeInsets.only(
                            right: fixPadding,
                            left: fixPadding,
                            bottom: fixPadding),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 90.0,
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.all(fixPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(5.0)),
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
                                      Icons.home,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                      '\$${item['price']}',
                                      style: priceStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
