import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import "dart:io" show Platform;


class DeterminePosition{

  Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    // var os;
    // os = Platform.operatingSystem;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$os")));

    // print(Platform.isAndroid);
    //
    // if(Platform.isAndroid){
    //   Geolocator.openLocationSettings();
    //   Geolocator.openAppSettings();
    //   await Geolocator.checkPermission();
    //   await Geolocator.requestPermission();
    // }




    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}