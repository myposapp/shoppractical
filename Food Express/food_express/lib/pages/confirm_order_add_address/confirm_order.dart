import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/home/home.dart';
import 'package:food_express/pages/confirm_order_add_address/add_new_address.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  bool visa = true;
  bool masterCard = false;

  @override
  Widget build(BuildContext context) {
    oorderPlacedDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 175.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      border: Border.all(color: primaryColor, width: 1.0),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 40.0,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Your order has been placed!",
                    style: greyHeadingStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          );
        },
      );

      Future.delayed(const Duration(milliseconds: 3000), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Confirm Order',
                  style: bigHeadingStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ID:',
                      style: greyHeadingStyle,
                    ),
                    Text(
                      '43e2116',
                      style: headingStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // Delivert to Start
          deliveryTo(),
          // Delivert to End
          heightSpace,
          // Delivery Time Start
          Container(
            padding: EdgeInsets.all(fixPadding),
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Delivery Time',
                  style: greyHeadingStyle,
                ),
                widthSpace,
                Text(
                  '45 min',
                  style: headingStyle,
                ),
              ],
            ),
          ),
          // Delivery Time End

          // Order Item Start
          orderItem(),
          // Order Item End

          // Add Voucher Start
          addVoucher(),
          // Add Voucher End
          heightSpace,
          // Note Start
          enterNote(),
          // Note End

          // Payment Method Start
          paymentMethod(),
          // Payment Method End

          // Confirm Button
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: InkWell(
              onTap: () => oorderPlacedDialog(),
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
                  'Confirm',
                  style: wbuttonWhiteTextStyle,
                ),
              ),
            ),
          ),
          // Confirm Button
        ],
      ),
    );
  }

  deliveryTo() {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Delivery to',
                style: headingStyle,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNewAddress()));
                },
                child: Text(
                  'Add New Address',
                  style: blueTextStyle,
                ),
              ),
            ],
          ),
          heightSpace,
          Container(
            width: width - fixPadding * 2.0,
            height: 140.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    color: Colors.grey[300]),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(fixPadding),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: AssetImage('assets/restaurant_location.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width - 160.0,
                  height: 140.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: blackColor,
                            size: 20.0,
                          ),
                          widthSpace,
                          Container(
                            width: width - 200.0,
                            child: Text(
                              '76A England',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: blackColor,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: blackColor,
                            size: 20.0,
                          ),
                          widthSpace,
                          Text(
                            'Beatrice Owen',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: blackColor,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: blackColor,
                            size: 20.0,
                          ),
                          widthSpace,
                          Text(
                            '+1 (454) 34211432',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: blackColor,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
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
    );
  }

  orderItem() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage('assets/products/lemon_juice.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              Container(
                width: width - ((fixPadding * 2) + 90.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Kichi Coffee & Drink',
                      style: listItemTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    heightSpace,
                    Text(
                      'Lemon Juice Fresh',
                      style: listItemSubTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Subtotal (1 item)',
                style: listItemTitleStyle,
              ),
              Text(
                '\$2.9',
                style: headingStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ship Fee (2.4 Km)',
                style: listItemTitleStyle,
              ),
              Text(
                '\$1.3',
                style: headingStyle,
              ),
            ],
          ),
          heightSpace,
          Divider(),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total',
                style: priceStyle,
              ),
              Text(
                '\$4.2',
                style: priceStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  addVoucher() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          width: width,
          padding: EdgeInsets.all(fixPadding),
          color: Colors.grey.withOpacity(0.1),
          child: Text(
            'Add Voucher',
            style: greyHeadingStyle,
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.all(fixPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width - ((fixPadding * 2) + 75.0),
                child: TextField(
                  style: moreStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Add Voucher Code',
                    hintStyle: moreStyle,
                    prefixIcon: Icon(
                      Icons.local_activity,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              widthSpace,
              Container(
                width: 65.0,
                padding: EdgeInsets.all(fixPadding),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Apply',
                  style: whiteSubHeadingStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  enterNote() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: width,
          padding: EdgeInsets.all(fixPadding),
          color: Colors.grey.withOpacity(0.1),
          child: Text(
            'Note',
            style: greyHeadingStyle,
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.all(fixPadding),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter Note Here',
              border: InputBorder.none,
              fillColor: Colors.grey.withOpacity(0.1),
              filled: true,
            ),
          ),
        ),
        heightSpace,
      ],
    );
  }

  paymentMethod() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // Visa Start
          InkWell(
            onTap: () {
              setState(() {
                visa = true;
                masterCard = false;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(fixPadding),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 1.0,
                      color: (visa) ? primaryColor : Colors.grey[300]),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      padding: EdgeInsets.only(
                          top: fixPadding,
                          bottom: fixPadding,
                          left: fixPadding,
                          right: (visa) ? fixPadding * 4 : fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 15.0,
                            child: Image.asset('assets/payment/visa.png',
                                fit: BoxFit.fitHeight),
                          ),
                          widthSpace,
                          Text(
                            '**** **** **** *316',
                            style: headingStyle,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: (visa)
                          ? Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                                color: primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.check,
                                  color: whiteColor, size: 15.0),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Visa End
          // Mastercard Start
          InkWell(
            onTap: () {
              setState(() {
                visa = false;
                masterCard = true;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(fixPadding),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 1.0,
                      color: (masterCard) ? primaryColor : Colors.grey[300]),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      padding: EdgeInsets.only(
                          top: fixPadding,
                          bottom: fixPadding,
                          left: fixPadding,
                          right: (masterCard) ? fixPadding * 4 : fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 30.0,
                            child: Image.asset('assets/payment/master_card.png',
                                fit: BoxFit.fitHeight),
                          ),
                          widthSpace,
                          Text(
                            '**** **** **** *316',
                            style: headingStyle,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: (masterCard)
                          ? Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                                color: primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.check,
                                  color: whiteColor, size: 15.0),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Mastercard End
        ],
      ),
    );
  }
}
