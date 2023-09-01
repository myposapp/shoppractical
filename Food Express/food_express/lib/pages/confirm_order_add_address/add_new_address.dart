import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddNewAddress extends StatefulWidget {
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final addressController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  Key _k1 = GlobalKey();
  BitmapDescriptor customIcon;
  Set<Marker> markers;

  @override
  void initState() {
    super.initState();
    addressController.text = "";
    markers = Set.from([]);
    if (customIcon == null) {
      // ImageConfiguration configuration =
      //     createLocalImageConfiguration(context, size: Size(48.0, 48.0));
      BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),
              'assets/custom_marker.png')
          .then((icon) {
        customIcon = icon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Add New Delivery Address',
          style: headingStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomSheet: Wrap(
        children: <Widget>[
          Material(
            elevation: 7.0,
            child: Container(
              padding: EdgeInsets.all(fixPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
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
                    heightSpace,
                    heightSpace,
                    Text('Type your Address', style: headingStyle),
                    heightSpace,
                    Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding),
                      child: Container(
                        width: width - (fixPadding * 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.7, color: primaryColor),
                        ),
                        child: TextFormField(
                          key: _k1,
                          controller: addressController,
                          autofocus: false,
                          style: moreStyle,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Type your address here',
                            hintStyle: moreStyle,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: InkWell(
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
                            'Add new Address',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: GoogleMap(
        markers: markers,
        onTap: (pos) {
          print(pos);
          Marker m =
              Marker(markerId: MarkerId('1'), icon: customIcon, position: pos);
          setState(() {
            markers.add(m);
          });
        },
        onMapCreated: (GoogleMapController controller) {
          Marker m = Marker(
              markerId: MarkerId('1'),
              icon: customIcon,
              position: LatLng(36.98045570527457, -121.99002496898174));
          setState(() {
            markers.add(m);
          });
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(36.98, -121.99), zoom: 18),
      ),
    );
  }
}
