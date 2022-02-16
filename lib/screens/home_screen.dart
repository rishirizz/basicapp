import 'package:basicapp/constants/constants.dart';
import 'package:basicapp/constants/textStyles.dart';
import 'package:basicapp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool expenseContents = true;
  List? photoAlbums = [];
  List? postsAlbum = [];
  int _index = 0;
  int? cardCount;

  @override
  void initState() {
    fetchPhotos().then((photos) {
      setState(() {
        photoAlbums = photos;
        // print('PHOTOALBUMS ===> $photoAlbums');
        // print(photoAlbums![0]['title']);
      });
    });
    fetchPosts().then((posts) {
      setState(() {
        postsAlbum = posts;
        // print('PHOTOALBUMS ===> $postsAlbum');
        // print(postsAlbum![0]['title']);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('WIDTH IS =====> ${MediaQuery.of(context).size.width}');
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          // drawer: (isSmallDevice(context)) ? NavigationDrawer() : null,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.home),
              ),
            ],
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Color(0xffffffff),
            title: Text(
              'HOME',
              style: appBarTitleStyle,
            ),
          ),
          body: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.purple,
                      isScrollable: true,
                      tabs: [
                        Tab(
                          child: Text(
                            'PHOTOS',
                            style: tabBarTitleStyle,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'POSTS',
                            style: tabBarTitleStyle,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              itemCount: photoAlbums!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image: photoAlbums![index]['url'],
                                          fit: BoxFit.cover,
                                          height: getHeight(),
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Album ID : ',
                                                  style: cardHeaderTextStyle,
                                                ),
                                                Text(
                                                  photoAlbums![index]['albumId']
                                                      .toString(),
                                                  style: cardPrimaryTextStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'ID : ',
                                                  style: cardHeaderTextStyle,
                                                ),
                                                Text(
                                                  photoAlbums![index]['id']
                                                      .toString(),
                                                  style: cardPrimaryTextStyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.purple.shade200,
                                        ),
                                        Text(
                                          photoAlbums![index]['title']
                                              .toString(),
                                          style: cardSecondaryTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: postsAlbum!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'User ID : ',
                                                  style: cardHeaderTextStyle,
                                                ),
                                                Text(
                                                  postsAlbum![index]['userId']
                                                      .toString(),
                                                  style: cardPrimaryTextStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'ID : ',
                                                  style: cardHeaderTextStyle,
                                                ),
                                                Text(
                                                  postsAlbum![index]['id']
                                                      .toString(),
                                                  style: cardPrimaryTextStyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: Colors.purple.shade200,
                                        ),
                                        Text(
                                          postsAlbum![index]['title']
                                              .toString(),
                                          style: cardHeaderTextStyle.copyWith(
                                              color: Colors.purple),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          postsAlbum![index]['body'].toString(),
                                          style: cardSecondaryTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  double getHeight() {
    cardCount = getColumnCount(context);
    if (cardCount == 4)
      return 360;
    else if (cardCount == 3)
      return 280;
    else if (cardCount == 2)
      return 250;
    else
      return 210;
  }
}
