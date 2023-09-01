import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';

class PaymentMethods extends StatefulWidget {
  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool visa = true;
  bool masterCard = true;
  bool newVisaCard = true;
  bool newMasterCard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
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
          child: Container(
            padding: EdgeInsets.only(left: fixPadding * 2.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Payment Methods',
              style: bigHeadingStyle,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          heightSpace,
          heightSpace,
          (visa)
              ? getPaymentMethodTile(
                  'assets/payment/visa.png', '**** **** *157', '2020', 'visa')
              : Container(),
          (masterCard)
              ? getPaymentMethodTile('assets/payment/master_card.png',
                  '**** **** *987', '2022', 'masterCard')
              : Container(),
          heightSpace,
          heightSpace,
          heightSpace,
          addNewPaymentMethod(),
        ],
      ),
    );
  }

  getPaymentMethodTile(
      String iconPath, String number, String year, String type) {
    return Container(
      margin: EdgeInsets.all(fixPadding),
      padding: EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1.5,
            spreadRadius: 1.5,
            color: Colors.grey[200],
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(iconPath, width: 50.0, fit: BoxFit.fitWidth),
              widthSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(number, style: headingStyle),
                  Text(year, style: greyHeadingStyle),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              size: 16.0,
              color: Colors.grey.withOpacity(0.6),
            ),
            onPressed: () {
              setState(() {
                if (type == 'visa') {
                  visa = false;
                } else {
                  masterCard = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  addNewPaymentMethod() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Add New Payment Method',
            style: bigHeadingStyle,
          ),
          heightSpace,
          heightSpace,
          InkWell(
            onTap: _selectCardTypeSheet,
            child: Container(
              padding: EdgeInsets.only(
                right: fixPadding,
                left: fixPadding,
                top: (newVisaCard) ? fixPadding * 1.5 : fixPadding,
                bottom: (newVisaCard) ? fixPadding * 1.5 : fixPadding,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 1.5,
                    spreadRadius: 1.5,
                    color: Colors.grey[200],
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                          (newVisaCard)
                              ? 'assets/payment/visa.png'
                              : 'assets/payment/master_card.png',
                          width: 50.0,
                          fit: BoxFit.fitWidth),
                      widthSpace,
                      Text((newVisaCard) ? 'Visa Card' : 'Master Card',
                          style: headingStyle)
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16.0,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ],
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 1.5,
                  spreadRadius: 1.5,
                  color: Colors.grey[200],
                ),
              ],
            ),
            child: TextField(
              style: headingStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Card Number',
                hintStyle: greyHeadingStyle,
                border: InputBorder.none,
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: ((width / 2.0) - 20.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                child: TextField(
                  style: headingStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Valid Thru',
                    hintStyle: greyHeadingStyle,
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: ((width / 2.0) - 20.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                child: TextField(
                  style: headingStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'CVV',
                    hintStyle: greyHeadingStyle,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          // Complete Button
          InkWell(
            onTap: () => Navigator.pop(context),
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
                'Complete',
                style: wbuttonWhiteTextStyle,
              ),
            ),
          ),
          // Complete Button
        ],
      ),
    );
  }

  // Bottom Sheet for Change Card (Visa or Master) Start Here
  void _selectCardTypeSheet() {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: whiteColor,
            child: new Wrap(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Choose Card Type',
                            textAlign: TextAlign.center,
                            style: headingStyle,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              newVisaCard = true;
                              newMasterCard = false;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/payment/visa.png',
                                    width: 40.0, fit: BoxFit.fitWidth),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Visa Card',
                                  style: listItemTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              newVisaCard = false;
                              newMasterCard = true;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/payment/master_card.png',
                                    width: 40.0, fit: BoxFit.fitWidth),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Master Card',
                                  style: listItemTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
  // Bottom Sheet for Change Card (Visa or Master) Ends Here
}
