import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class ResetpasswordController extends BaseController{

var isEmailCorrect = "".obs;
TextEditingController oldPassowrdController = TextEditingController(text: '');
TextEditingController passowrdController = TextEditingController(text: '');
TextEditingController conformPasswordController = TextEditingController(text: '');
  
checkInput(context){
  if(oldPassowrdController.text.isEmpty){
    showSnackBar("Enter old password", context);
 
  } else if(passowrdController.text.isEmpty){
    showSnackBar("Enter password", context);
  }else if(conformPasswordController.text.isEmpty){
    showSnackBar("Enter conform password", context);
  }else{
    resetPasswordAPI(context);
  }
}

resetPasswordAPI(context) async {
  final params = jsonEncode({"oldpassword": oldPassowrdController.text, "password":passowrdController.text, "confirm_password":conformPasswordController.text
          });
  final headers = {"x-access-token":appPreference.accessToken!, 'Content-type': 'application/json; charset=UTF-8',};        
  print("Reset Password API Params: ${params}");
  http.post(
      RestApiClient().resetPassword,
      body: params, headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Reset Password Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
        // appPreference.verified = res['data']["verified"];
        //   print("Verified: ${res['data']["verified"]}");
        //   // appPreference.accessToken = res["data"];
          appPreference.isData = res["data"].toString();
           showSuccessSnackBar(res["message"], context);
          
          print("Token: ${res["data"].toString()}");
          
          Get.toNamed(RouteNames.login);
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}