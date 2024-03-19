import 'dart:io';
import 'dart:ui';

import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/accept_reject_screen/accept_reject_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: ColorRes.transparent,
        child: AspectRatio(
          aspectRatio: 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(),
              Text(
                S.current.scanTheBookingQREtc,
                style: const TextStyle(fontSize: 15, color: ColorRes.white),
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: Get.width / 1.7,
                    height: Get.width / 1.7,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: ColorRes.havelockBlue,
                      width: 3,
                    )),
                    child: QRView(
                      key: qrKey,
                      overlayMargin: EdgeInsets.zero,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        setState(
          () {
            result = scanData;
            if (result?.code != null) {
              ApiService.instance
                  .fetchAppointmentDetails(
                      appointmentId: int.parse(result?.code ?? '-1'))
                  .then((value) {
                Get.off(() => const AcceptRejectScreen(),
                    arguments: value.data);
              });
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
