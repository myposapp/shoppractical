import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/search/get_search_results.dart';

class SearchResult extends StatefulWidget {
  final searchQuery;
  SearchResult({Key key, @required this.searchQuery}) : super(key: key);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.text =
        (widget.searchQuery == '') ? 'Juice' : widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // here the desired height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width - 95.0,
                    decoration: BoxDecoration(
                      color: darkPrimaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      style: searchTextStyle,
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        hintText: 'Search',
                        hintStyle: searchTextStyle,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                  widthSpace,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Text(
                        'Exit',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: height - 90.0,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          color: scaffoldBgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            heightSpace,
            Padding(
              padding: EdgeInsets.all(fixPadding),
              child: Text('Approximately 134 results', style: moreStyle),
            ),
            Container(height: height - 164.0, child: GetSearchResults()),
          ],
        ),
      ),
    );
  }
}
