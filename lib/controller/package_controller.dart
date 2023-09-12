import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/controller/detailed_filter_controller.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/payment_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/send_proposal_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../models/wishList_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class PackageController extends BaseController{
  var orderid = ''.obs;
   @override
  void onInit() {
    super.onInit();
    fetchPayment();
    orderid.value = '';
  }

    Future<Map<String, dynamic>> fetchPayment() async {
     final url = RestApiClient().paymentPackage;
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){
      
      print(body);
        }
        
        
     return body;   
}

createOrder(id, context)async {
    final createOrder = RestApiClient().createOrder;
    print(createOrder);

    final response = await http.post(
                        Uri.parse(createOrder.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "package_id": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        orderid.value = data['message']['id'];
                        showSuccessSnackBar("Successfully added the package", context);
                        
                        
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                      Text("Failed");
                      showSnackBar("Some error occured", context);
                      }
                      print(data);
                      
                    }

                    paymentVerify(id,id1,id2, context)async {
    final paymentVerify = RestApiClient().verifypayment;
    print(paymentVerify);

    final response = await http.post(
                        Uri.parse(paymentVerify.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "razorpay_order_id": id.toString(),
                          "razorpay_payment_id": id1.toString(),
                          "razorpay_signature": id2.toString(),
                        }),
                      );
                      print(id);
                      print(id1);
                      print(id2);
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        
                        showSuccessSnackBar("Successfully added the package", context);
                        
                        
                      Text("success");  
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                      Text("Failed");
                      showSnackBar("Some error occured", context);
                      }
                      print(data);
                      
                    }
}