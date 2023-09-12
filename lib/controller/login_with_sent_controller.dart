import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class LoginWithOtpController extends BaseController{

var isEmailCorrect = "".obs;
TextEditingController mobileController = TextEditingController(text: '');
TextEditingController customerController = TextEditingController(text: '');
String verify = "LOGIN";
bool validatePhoneNumber(String phoneNumber) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(phoneNumber);
}
checkInput(context){
  if(mobileController.text.isEmpty){
    showSnackBar("Enter email address/phone number", context);
  
  }else if(customerController.text.isEmpty){
    
    showSnackBar("Enter Customer Id", context);  
      }else if(isEmail(mobileController.text) || validatePhoneNumber(mobileController.text)){
        LoginWithOtpAPI(context);
      
      }else{
    showSnackBar("Enter Customer Id or email address/phone number", context);
  }
}

LoginWithOtpAPI(context) async {
  final params = {"emailphone": mobileController.text, "verification_for":verify, "customer_id": customerController.text
          };
          
  print("Login With Otp API Params: ${params}");
  http.post(
      RestApiClient().loginWithOtp,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Login With Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.isData = res["data"].toString();
          showSuccessSnackBar(res["message"], context);
          
          print("Token: ${res["data"].toString()}");
          
          Get.toNamed(RouteNames.loginwithverifyotp);
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}