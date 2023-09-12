import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/login_with_sent_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class LoginWithVerifyOtpController extends BaseController{

var isEmailCorrect = "".obs;

TextEditingController otpController = TextEditingController(text: '');

final controller = Get.find<LoginWithOtpController>();


checkInput(context){
  if(otpController.text.isEmpty){
    showSnackBar("Enter otp", context);
      
      }else if(isNumeric(otpController.text)){
        
      LoginWithVerifyOtpAPI(context);
      }else{
    showSnackBar("Enter four digits otp", context);
  }
}

LoginWithVerifyOtpAPI(context) async {
  final params = {"emailphone": controller.mobileController.text, "otp":otpController.text
          };
          
  print("Login With Verify Otp API Params: ${params}");
  http.post(
      RestApiClient().loginWithVerifyOtp,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Login With Verify Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.isData = res["data"].toString();
           getProfile();
          showSuccessSnackBar(res["message"], context);
          
          print("Token: ${res["data"].toString()}");
          
          print("object");
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

getProfile() {
    http.get(
      RestApiClient().detailedPage,
      headers: {
        // appPreference.accessToken!
        "x-access-token": appPreference.accessToken!
      },
    ).then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("getProfile Response: ${res.toString()}");
      if (res != null) {
        appPreference.userId = res["data"]["customerDetails"]["user_obj_id"];
        Get.toNamed(RouteNames.homePage);
      }
    });
  }

}