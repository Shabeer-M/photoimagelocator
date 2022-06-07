import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photolocation/views/tabs/location_screen.dart';
import 'package:photolocation/views/tabs/photo_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text("Photo & Location"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Photo",
              icon: Icon(Icons.image),
            ),
            Tab(
              text: "Location",
              icon: Icon(Icons.location_city),
            ),
          ]),
        ),
        body: TabBarView(children: [
           PhotoViewerScreen(),
           LocationShowerScreen(),
        ]),
      ),
    );
  }
}
