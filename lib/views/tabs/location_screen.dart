import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/map_controller.dart';
import '../../utils/map/map_utils.dart';

class LocationShowerScreen extends StatefulWidget {
   LocationShowerScreen({Key? key}) : super(key: key);

  @override
  State<LocationShowerScreen> createState() => _LocationShowerScreenState();
}

class _LocationShowerScreenState extends State<LocationShowerScreen> {

  MapController mapController =MapController();
  @override
  void initState() {
    mapController.getLocation();
    super.initState();
  }
  // var long = "longitude";
  // var lat = "latitude";
  // void getlocation() async {
  //   LocationPermission per = await Geolocator.checkPermission();
  //   if (per == LocationPermission.denied ||
  //       per == LocationPermission.deniedForever) {
  //     print("permission denied");
  //     LocationPermission per1 = await Geolocator.requestPermission();
  //   } else {
  //     Position currentLoc = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     setState(() {
  //       long = currentLoc.longitude.toString();
  //       lat = currentLoc.latitude.toString();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child:  ElevatedButton(
            onPressed: () {
             var lan= mapController.latitude.value;
             var lon=mapController.longitude.value;
              // MapUtils.openMap(
              //     tripController.tripDetails.value.dropPoint?.latitude,
              //     tripController
              //         .tripDetails.value.dropPoint?.longitude);
              MapUtils.openMap(double.parse('$lan'), double.parse('$lon'));
            },
            child: Text("Current Location"),

        ),
    ),
      ));
  }
}
