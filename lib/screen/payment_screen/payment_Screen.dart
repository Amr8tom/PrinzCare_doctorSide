import 'package:doctor_flutter/model/billing_data/billingdata.dart';
import 'package:doctor_flutter/screen/payment_screen/paymentScreenWebview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/service/api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'Payment_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class paymentScreen extends StatefulWidget {
  const paymentScreen({Key? key}) : super(key: key);

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = payment_controller();
    return Scaffold(
      body:Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child:ElevatedButton(
              child: Text("pay"),
              onPressed: ()async {
                final token = await ApiService.instance.get_payment_token_paymob();
                print(token);
                final OrderID= await ApiService.instance.get_payment_orderID_paymob(
                    auth_token: token, amount_cents: "100000",
                    currency: "EGP", items: []);
                print(OrderID);
                final endtoken= await ApiService.instance.get_payment_endtoken(auth_token: token,
                    amount_cents: "100000",
                    order_id: OrderID.toString(),
                    currency: "EGP",
                    integration_id: 4482050,
                    billing_data:
                    {
                      "apartment": "803",
                      "email": "claudette09@exa.com",
                      "floor": "42",
                      "first_name": "Clifford",
                      "street": "Ethan Land",
                      "building": "8028",
                      "phone_number": "+86(8)9135210487",
                      "shipping_method": "PKG",
                      "postal_code": "01898",
                      "city": "Jaskolskiburgh",
                      "country": "CR",
                      "last_name": "Nicolas",
                      "state": "Utah"
                    }
                    );
                print("end token is : $endtoken");
               await launchUrl(Uri.parse("https://accept.paymobsolutions.com/api/acceptance/iframes/823169?payment_token=${endtoken}"));


               },
            ) ,
          ),
          GetBuilder(
           init: controller,
              builder: (controller){
             return Container(
               child: ElevatedButton(child:
               Text("payment2"),
                 onPressed: ()async{

                 await controller.init_payment(amount_cents: "10000", currency: "EGP");
                final String path= await controller.pay_creditcartd_Uri(amount_cents: "10000",
                     currency:"EGP",
                     obj_form_Billingdata: billingdata(
                         first_name: "amr",
                         last_name: "alaa",
                         phone_number:"+201011577033",
                         email: "amr8tom@gmail.com"),
                         iframes: "823169",
                         integration_id: 4482050);
                Get.to(()=>Webviepayment(path: path,));
                }
                 ,)
               ,);
              },
          )
        ],
      ),),
    );
  }
}
