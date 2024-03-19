import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/map_screen/map_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final double? latitude;
  final double? longitude;

  const MapScreen({
    Key? key,
    this.latitude,
    this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(MapScreenController(LatLng(latitude ?? -1, longitude ?? -1)));
    return Scaffold(
      body: GetBuilder(
          init: controller,
          builder: (context) {
            return Column(
              children: [
                TopBarArea(title: S.current.mapScreen),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GoogleMap(
                        onTap: (argument) {
                          controller.getCameraPosition(
                              latitude: argument.latitude,
                              longitude: argument.longitude);
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(controller.lng.latitude,
                              controller.lng.longitude),
                          zoom: 14.4746,
                        ),
                        markers: Set<Marker>.of(controller.markers.toSet()),
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        compassEnabled: false,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        onMapCreated: (GoogleMapController c) {
                          controller.mapController.complete(c);
                        },
                      ),
                      SafeArea(
                        top: false,
                        child: InkWell(
                          onTap: controller.onDoneClick,
                          child: Container(
                            height: 45,
                            width: Get.width / 3,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: StyleRes.linearGradient),
                            alignment: Alignment.center,
                            child: SafeArea(
                              top: false,
                              child: Text(
                                S.current.done,
                                style: const TextStyle(
                                    color: ColorRes.white,
                                    fontFamily: FontRes.medium),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.getUserCurrentLocation().then((value) async {
            controller.getCameraPosition(
                latitude: value.latitude, longitude: value.longitude);
          });
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
