import 'package:basicapp/services/api_service.dart';
import 'package:flutter/material.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({Key? key}) : super(key: key);

  @override
  _PostsTabState createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  List? postsAlbum = [];
  @override
  void initState() {
    fetchPosts().then((posts) {
      setState(() {
        postsAlbum = posts;
        print('PHOTOALBUMS ===> $postsAlbum');
        print(postsAlbum![0]['title']);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.home),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: postsAlbum!.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      postsAlbum![index]['url'],
                      height: 100,
                      width: 100,
                    ),
                    Text(postsAlbum![index]['albumId'].toString()),
                    Text(postsAlbum![index]['id'].toString()),
                    Text(postsAlbum![index]['title'].toString()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
