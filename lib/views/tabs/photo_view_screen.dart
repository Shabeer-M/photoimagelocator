import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../model/image_response.model.dart';

class PhotoViewerScreen extends StatefulWidget {
  @override
  _PhotoViewerScreenState createState() => _PhotoViewerScreenState();
}

class _PhotoViewerScreenState extends State<PhotoViewerScreen> {
  List<PhotoModel> photoModels = [];

  @override
  void initState() {
    getPhotoData();
    super.initState();
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(52),
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }

  getPhotoData() async {
    var response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=UXpClXQFyUtHcOwnetgB5NhUgWJXvCw4SpkfovEBczs'));

    List<dynamic> jsonData = json.decode(response.body);

    jsonData.forEach((element) {
      PhotoModel photoModel = new PhotoModel();
      photoModel = PhotoModel.fromMap(element);
      photoModels.add(photoModel);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CarouselSlider.builder(
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              color: Colors.red,
              child: Image.network(
                photoModels[index].urls!.small.toString(),
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(height: 400),
          itemCount: 6,
        ),
      ),
    );
  }
}
