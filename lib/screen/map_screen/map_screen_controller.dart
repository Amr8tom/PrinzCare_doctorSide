import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  List<Marker> markers = <Marker>[];
  LatLng lng;

  MapScreenController(this.lng);

  @override
  void onInit() {
    if (lng.latitude != -1) {
      getCameraPosition(latitude: lng.latitude, longitude: lng.longitude);
    } else {
      getUserCurrentLocation().then((value) {
        getCameraPosition(latitude: value.latitude, longitude: value.longitude);
      });
    }
    super.onInit();
  }

  Future<void> getCameraPosition({latitude, longitude}) async {
    if (latitude == null || latitude == 0.0) {
      return;
    }
    markers = <Marker>[];
    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(latitude, longitude),
      ),
    );
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14,
    );
    lng = LatLng(latitude, longitude);
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    update();
  }

  void onDoneClick() {
    Get.back(result: [lng.latitude, lng.longitude]);
  }

  Future<Position> getUserCurrentLocation() async {
    try {
      await Geolocator.requestPermission()
          .then((value) {})
          .onError((error, stackTrace) async {
        await Geolocator.requestPermission();
      });
    } catch (e) {
      log(e.toString());
    }
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
    return await Geolocator.getCurrentPosition();
  }
}
