import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:page_transition/page_transition.dart';
import 'package:food_express/pages/confirm_order_add_address/confirm_order.dart';

void productDescriptionModalBottomSheet(context, height) {
  int initialItemCount = 1;
  double itemPrice = 2.5;
  double price = 2.5;
  double width = MediaQuery.of(context).size.width;
  bool s = false, m = false, l = false, option1 = false, option2 = false;

  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (context, setState) {
            incrementItem() {
              setState(() {
                initialItemCount = initialItemCount + 1;
                price = itemPrice * initialItemCount;
              });
            }

            decrementItem() {
              if (initialItemCount > 1) {
                setState(() {
                  initialItemCount = initialItemCount - 1;
                  price = itemPrice * initialItemCount;
                });
              }
            }

            changeSizeStatus(String size) {
              if (size == 'S') {
                setState(() {
                  s = !s;
                  m = false;
                  l = false;
                });
              }
              if (size == 'M') {
                setState(() {
                  s = false;
                  m = !m;
                  l = false;
                });
              }
              if (size == 'L') {
                setState(() {
                  s = false;
                  m = false;
                  l = !l;
                });
              }
            }

            changeoptionsStatus(title) {
              if (title == 'Add Lemon') {
                setState(() {
                  option1 = !option1;
                });
              } else {
                setState(() {
                  option2 = !option2;
                });
              }
            }

            getSizeListItem(String size, String qty, String price) {
              return Padding(
                padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            changeSizeStatus(size);
                          },
                          child: Container(
                            width: 26.0,
                            height: 26.0,
                            decoration: BoxDecoration(
                                color: (size == 'S')
                                    ? (s) ? primaryColor : whiteColor
                                    : (size == 'M')
                                        ? (m) ? primaryColor : whiteColor
                                        : (l) ? primaryColor : whiteColor,
                                borderRadius: BorderRadius.circular(13.0),
                                border: Border.all(
                                    width: 1.0,
                                    color: greyColor.withOpacity(0.7))),
                            child: Icon(Icons.check,
                                color: whiteColor, size: 15.0),
                          ),
                        ),
                        widthSpace,
                        Text(
                          'Size $size',
                          style: listItemTitleStyle,
                        ),
                        widthSpace,
                        Text(
                          '($qty ml)',
                          style: listItemSubTitleStyle,
                        ),
                      ],
                    ),
                    Text(
                      '\$$price',
                      style: listItemTitleStyle,
                    ),
                  ],
                ),
              );
            }

            getOptionsListItem(String title) {
              return Padding(
                padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        changeoptionsStatus(title);
                      },
                      child: Container(
                        width: 26.0,
                        height: 26.0,
                        decoration: BoxDecoration(
                            color: (title == 'Add Lemon')
                                ? (option1) ? primaryColor : whiteColor
                                : (option2) ? primaryColor : whiteColor,
                            borderRadius: BorderRadius.circular(13.0),
                            border: Border.all(
                                width: 1.0, color: greyColor.withOpacity(0.7))),
                        child: Icon(Icons.check, color: whiteColor, size: 15.0),
                      ),
                    ),
                    widthSpace,
                    Text(
                      title,
                      style: listItemTitleStyle,
                    ),
                  ],
                ),
              );
            }

            return Wrap(
              children: <Widget>[
                Container(
                  // height: height - 100.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                    color: whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        child: Container(
                          width: 35.0,
                          height: 3.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: greyColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(fixPadding),
                        child: Text(
                          'Add New Item',
                          style: headingStyle,
                        ),
                      ),
                      Container(
                        width: width,
                        height: 70.0,
                        margin: EdgeInsets.all(fixPadding),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 70.0,
                              width: 70.0,
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/products/lemon_juice.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: width - ((fixPadding * 2) + 70.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: fixPadding * 2,
                                        left: fixPadding,
                                        bottom: fixPadding),
                                    child: Text(
                                      'Lemon Juice Fresh',
                                      style: listItemTitleStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: fixPadding,
                                        right: fixPadding,
                                        left: fixPadding),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '\$$price',
                                          style: priceStyle,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: decrementItem,
                                              child: Container(
                                                height: 26.0,
                                                width: 26.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13.0),
                                                  color: (initialItemCount == 1)
                                                      ? Colors.grey[300]
                                                      : primaryColor,
                                                ),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: (initialItemCount == 1)
                                                      ? blackColor
                                                      : whiteColor,
                                                  size: 15.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 8.0, left: 8.0),
                                              child: Text('$initialItemCount'),
                                            ),
                                            InkWell(
                                              onTap: incrementItem,
                                              child: Container(
                                                height: 26.0,
                                                width: 26.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13.0),
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      heightSpace,
                      // Size Start
                      Container(
                        color: scaffoldBgColor,
                        padding: EdgeInsets.all(fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Size',
                              style: listItemSubTitleStyle,
                            ),
                            Text(
                              'Price',
                              style: listItemSubTitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: whiteColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            heightSpace,
                            getSizeListItem('S', '500', '0'),
                            heightSpace,
                            getSizeListItem('M', '750', '0.5'),
                            heightSpace,
                            getSizeListItem('L', '1100', '1.2'),
                            heightSpace,
                          ],
                        ),
                      ),
                      // Size End
                      // Options Start
                      Container(
                        width: width,
                        color: scaffoldBgColor,
                        padding: EdgeInsets.all(fixPadding),
                        child: Text(
                          'Options',
                          style: listItemSubTitleStyle,
                        ),
                      ),
                      Container(
                        color: whiteColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            heightSpace,
                            getOptionsListItem('Add Lemon'),
                            heightSpace,
                            getOptionsListItem('Add Ice'),
                            heightSpace,
                          ],
                        ),
                      ),
                      // Options End
                      // Add to Cart button row start here
                      Padding(
                        padding: EdgeInsets.all(fixPadding),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: ConfirmOrder()));
                          },
                          child: Container(
                            width: width - (fixPadding * 2),
                            padding: EdgeInsets.all(fixPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '$initialItemCount ITEM',
                                      style: TextStyle(
                                        color: darkPrimaryColor,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    SizedBox(height: 3.0),
                                    Text(
                                      '\$$price',
                                      style: whiteSubHeadingStyle,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Add to Cart',
                                  style: wbuttonWhiteTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Add to Cart button row end here
                    ],
                  ),
                ),
              ],
            );
          },
        );
      });
}
