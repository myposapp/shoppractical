import 'package:flutter/material.dart';
import 'package:food_express/constant/constant.dart';
import 'package:food_express/pages/search/search_result.dart';
import 'package:page_transition/page_transition.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchController = TextEditingController();
  String searchInput = '';

  @override
  void initState() {
    super.initState();
    searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                // AppBar Start
                SliverAppBar(
                  expandedHeight: 90,
                  pinned: false,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                      ),
                      child: Container(
                        width: width,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
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
                                  onChanged: (v) {
                                    setState(() {
                                      searchInput = searchController.text;
                                    });
                                  },
                                  onSubmitted: (v) {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: SearchResult(
                                                searchQuery:
                                                    searchController.text)));
                                  }),
                            ),
                            InkWell(
                              onTap: () {
                                if (searchInput == '') {
                                  Navigator.pop(context);
                                } else {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: SearchResult(
                                              searchQuery:
                                                  searchController.text)));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(fixPadding),
                                width: 75.0,
                                alignment: Alignment.center,
                                child: Text(
                                  (searchInput == '') ? 'Exit' : 'Search',
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
                    ),
                  ),
                  automaticallyImplyLeading: false,
                ),
              ];
            },
            // AppBar End
            body: SafeArea(
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15.0)),
                  color: scaffoldBgColor,
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    heightSpace,
                    // History Start
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'History',
                            style: headingStyle,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text('Clear all', style: moreStyle),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: SearchResult(searchQuery: 'Mix Tea')));
                      },
                      child: getHistoryItem('Mix Tea'),
                    ),
                    getDivider(width),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child:
                                    SearchResult(searchQuery: 'Roe Chicken')));
                      },
                      child: getHistoryItem('Roe Chicken'),
                    ),
                    getDivider(width),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: SearchResult(searchQuery: 'Coffee')));
                      },
                      child: getHistoryItem('Coffee'),
                    ),
                    getDivider(width),
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: InkWell(
                        onTap: () {},
                        child: Text('View More', style: moreStyle),
                      ),
                    ),
                    // History End
                    // Suggestions Start
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: Text(
                        'Suggestions',
                        style: headingStyle,
                      ),
                    ),
                    getSuggestionItem(width, 'assets/products/products_8.png',
                        'Delicious Pizza'),
                    getSuggestionItem(
                        width, 'assets/products/products_5.png', 'Asia Food'),
                    getSuggestionItem(width, 'assets/products/products_1.png',
                        'Chinese Food'),
                    getSuggestionItem(
                        width, 'assets/products/lemon_juice.png', 'Juice'),
                    // Suggestions End
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getDivider(double width) {
    return Padding(
      padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
      child: Container(
        width: width - fixPadding * 2,
        height: 0.7,
        color: greyColor.withOpacity(0.2),
      ),
    );
  }

  getHistoryItem(String title) {
    return Padding(
      padding: EdgeInsets.all(fixPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: greyColor,
              fontSize: 15.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.close,
              size: 18.0,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }

  getSuggestionItem(double width, String imagePath, String title) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: SearchResult(searchQuery: '')));
      },
      child: Container(
        width: width,
        padding: EdgeInsets.all(fixPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            widthSpace,
            Text(
              title,
              style: headingStyle,
            ),
          ],
        ),
      ),
    );
  }
}
