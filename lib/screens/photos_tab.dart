import 'package:basicapp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotosTab extends StatefulWidget {
  const PhotosTab({Key? key}) : super(key: key);

  @override
  _PhotosTabState createState() => _PhotosTabState();
}

class _PhotosTabState extends State<PhotosTab> {
  List? photoAlbums = [];
  @override
  void initState() {
    fetchPhotos().then((photos) {
      setState(() {
        photoAlbums = photos;
        // print('PHOTOALBUMS ===> $photoAlbums');
        // print(photoAlbums![0]['title']);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: photoAlbums!.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: photoAlbums![index]['url'],
                    ),
                    Text(photoAlbums![index]['albumId'].toString()),
                    Text(photoAlbums![index]['id'].toString()),
                    Text(photoAlbums![index]['title'].toString()),
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