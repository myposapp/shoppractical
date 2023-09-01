import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class ProductsOrdered extends StatefulWidget {
  @override
  _ProductsOrderedState createState() => _ProductsOrderedState();
}

class _ProductsOrderedState extends State<ProductsOrdered> {
  final productList = [
    {
      'title': 'Fried Noodles',
      'subtitle': 'Chinese',
      'image': 'assets/products/products_6.png',
      'status': 'none'
    },
    {
      'title': 'Hakka Nuddles',
      'subtitle': 'Chinese',
      'image': 'assets/products/products_1.png',
      'status': 'none'
    },
    {
      'title': 'Dry Manchuriyan',
      'subtitle': 'Chinese',
      'image': 'assets/products/products_2.png',
      'status': 'none'
    },
    {
      'title': 'Margherita Pizza',
      'subtitle': 'Delicious Pizza',
      'image': 'assets/products/products_3.png',
      'status': 'none'
    },
    {
      'title': 'Thin Crust Pizza',
      'subtitle': 'Delicious Pizza',
      'image': 'assets/products/products_4.png',
      'status': 'none'
    },
    {
      'title': 'Veg Burger',
      'subtitle': 'Fast Food',
      'image': 'assets/products/products_5.png',
      'status': 'none'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 170.0,
      child: ListView.builder(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = productList[index];
          return InkWell(
            onTap: () {},
            child: Container(
              width: 130.0,
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
