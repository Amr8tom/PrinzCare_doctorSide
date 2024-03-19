import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../model/billing_data/billingdata.dart';
import '../../service/api_service.dart';
class payment_controller extends GetxController{
  late String start_token;
  late String OrderID;
  late String end_token;


  init_payment({required String amount_cents, required String currency, List? items })async{
    start_token = await ApiService.instance.get_payment_token_paymob();
     OrderID= await ApiService.instance.get_payment_orderID_paymob(
        auth_token: start_token,
         amount_cents: amount_cents,
        currency: currency,
         items: items?? []);
     print(OrderID);
  }

   Future<String> pay_creditcartd_Uri({
    required String amount_cents ,
    required String currency ,
    required billingdata obj_form_Billingdata,
    required String iframes,
    required int integration_id

   })async {
    end_token= await ApiService.instance.get_payment_endtoken(
        auth_token: start_token,
        amount_cents: amount_cents,
        order_id: OrderID,
        currency: currency,
        integration_id: integration_id ??4482050,
        billing_data: obj_form_Billingdata.toMap()
    );
    return "https://accept.paymobsolutions.com/api/acceptance/iframes/${iframes}?payment_token=${end_token}";

  }
}

