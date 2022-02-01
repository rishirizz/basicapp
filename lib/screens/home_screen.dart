import 'package:basicapp/constants/textStyles.dart';
import 'package:basicapp/screens/photos_tab.dart';
import 'package:basicapp/screens/posts_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool expenseContents = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          // drawer: (isSmallDevice(context)) ? NavigationDrawer() : null,
          appBar: AppBar(
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
                          PhotosTab(),
                          PostsTab(),
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
}
