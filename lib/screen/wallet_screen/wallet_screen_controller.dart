import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/model/global/global_setting.dart';
import 'package:doctor_flutter/model/wallet/wallet_statement.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreenController extends GetxController {
  int? start = 0;
  bool isLoading = false;
  List<WalletStatementData>? walletData;
  final scrollController = ScrollController();
  PrefService prefService = PrefService();
  DoctorData? doctorData;

  GlobalSettingData? settings;

  @override
  void onInit() {
    prefData();
    fetchDoctorWalletStatementApiCall();
    fetchScrollData();
    super.onInit();
  }

  void fetchDoctorWalletStatementApiCall() {
    isLoading = true;
    ApiService.instance.fetchDoctorWalletStatement(start: start).then((value) {
      if (start == 0) {
        walletData = value.data;
      } else {
        walletData?.addAll(value.data!);
      }
      start = walletData?.length;
      isLoading = false;
      update();
    });
  }

  void fetchScrollData() {
    scrollController.addListener(
      () {
        if (scrollController.offset ==
            scrollController.position.maxScrollExtent) {
          if (!isLoading) {
            fetchDoctorWalletStatementApiCall();
          }
        }
      },
    );
  }

  void prefData() async {
    await prefService.init();
    doctorData = prefService.getRegistrationData();
    settings = prefService.getSettingData();
    update();
  }

  void onWithdrawTap() {
    if (doctorData?.bankAccount == null) {
      CustomUi.snackBar(
          message: S.current.pleaseAddYourBankEtc,
          iconData: Icons.account_balance_rounded);
      return;
    }
    if ((doctorData?.wallet ?? 0) > (settings?.minAmountPayoutDoctor ?? 0)) {
      ApiService.instance.submitDoctorWithdrawRequest().then((value) {
        if (value.status == true) {
          CustomUi.snackBar(
              message: value.message,
              iconData: Icons.wallet_rounded,
              positive: true);
          ApiService.instance.fetchMyDoctorProfile().then((value) {
            doctorData = value.data;
            update();
          });
        } else {
          CustomUi.snackBar(
            message: value.message,
            iconData: Icons.wallet_rounded,
          );
        }
      });
    } else {
      CustomUi.snackBar(
          message:
              '${S.current.minimumAmountToWithdraw} ${settings?.minAmountPayoutDoctor}',
          iconData: Icons.wallet_rounded);
    }
  }
}
