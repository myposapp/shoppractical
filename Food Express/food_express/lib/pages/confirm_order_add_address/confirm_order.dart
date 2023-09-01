import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/home/home.dart';
import 'package:food_express/pages/confirm_order_add_address/add_new_address.dart';


/*
                            DETAILS ON HOW TO CONFIGURE PAYSTACK

1.  Create a Paystack Account: If you dont have a paystack account you could easily create one by
creating free account on paystack website https://paystack.com/. Fill in neccessary credentails and sign up.

2.  Acquire Api keys: On your Dashboard you can find the Api secret and public keys by scrolling a little down
or you could navigate to "Settings" > "API Keys & Webhooks." to get your Keys. Mind you, on default your account 
will be on test mode so any transaction made is not live yet but will get responses as if you are using live keys.

3.  Add Dependencies: In your pubspec.yaml file you add flutter_paystack: ^1.0.7 or later package to the dependencies save and
run the package by typing "flutter pub get" in your terminal.

4.  Create Payment class: After all done, you create a dart file and then make neccessary imports e.g the paystack package
import 'package:flutter_paystack/flutter_paystack.dart';. 
        - Create a class
        - Store your Key somewhere for use like this const String PAYSTACK_KEY = "pk_************************";
        - Create neccessary properties you have to pass to the class and generate its constructor
        - Initialize Paystack 
        - And do the Payment workflow

                                    Code Example Snippet on the Implementation
const String PAYSTACK_KEY = "pk_*******************************";

class PayStackPayment {

  final int? price;
  final String? email;
  final String? name;
  final BuildContext? ctx;

  PayStackPayment({
    this.price,
    this.email,
    this.name,
    this.ctx,
  });


  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'IOS';
    } else {
      platform = 'ANDROID';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaystackPlugin payStackPlugin = PaystackPlugin();

  Future initializePlugin() async {
    await payStackPlugin.initialize(publicKey: PAYSTACK_KEY);
  }

/CARD UI FIELDS
  PaymentCard _getCardUi() {
    return PaymentCard(
      number: "",
      cvc: "",
      expiryMonth: 0,
      expiryYear: 0,
      name: name,
    );
  }

/METH0D F0R CHARGING A CARD
  chargeCardANdMakePayment() async {
    initializePlugin().then((value) async {
      Charge charge = Charge()
        ..amount = price! * 100 //Paystack do their amount in Kobo thats the reason for multiplying
        ..email = email
        ..reference = _getReference() //The _getRefrence most times is used to detect Multiple transactions
        ..card = _getCardUi(); 

      CheckoutResponse res = await payStackPlugin.checkout(
        ctx!,
        logo: SizedBox(
            height: 50, width: 50, child: Image.asset("IMAGEPATH")),
        charge: charge,
        method: CheckoutMethod.card,  // You could use Selectable which include the Bank and Card method. The issue here 
        is the using Bank requires accessCode.
        fullscreen: true, //Boolean check for either to show as a dialog or in fullscreen
        hideAmount: false, // Its false because we dont want to hide amount
        hideEmail: false, 
      );
     

      if (res.status == true) {
        /Transaction is Successful
        snackBar(
            content: "Transaction Successful",
            context: ctx!,
            backgroundColor: green);
      } else {
        /Transaction Failed
        log(res.message.toString()); //This line is to Print the error message so we can Debug
        snackBar(
            content: res.message, context: ctx!, backgroundColor: Colors.red); 
            
      }
    });
  }
}



ps: - These are steps for local transactions(In-app Using the Paystack Plugin) and not for server. Using server will 
      only require using webview with the link provided by the backend developer. 
    - Using Test Mode you are required to use Test Cards for fake payments, when you want to switch to live ans get live keys
      you can do that by opening your Paystack account Dashboard > at the top right side you see test mode > Click and fill in required fields.
*/
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
