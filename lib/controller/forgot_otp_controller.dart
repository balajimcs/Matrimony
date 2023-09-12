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

class ForgotOtpController extends BaseController{

var isEmailCorrect = "".obs;
TextEditingController mobileController = TextEditingController(text: '');
String verify = "FORGOT_PASSWORD";
bool validatePhoneNumber(String phoneNumber) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(phoneNumber);
}
checkInput(context){
  if(mobileController.text.isEmpty){
    showSnackBar("Enter email address/phone number", context);
  
  }else if(isEmail(mobileController.text) || validatePhoneNumber(mobileController.text)){
    
      forgotOtpAPI(context);
      }else{
    showSnackBar("Enter vaild email address/phone number", context);
  }
}

forgotOtpAPI(context) async {
  final params = {"emailphone": mobileController.text, "verification_for":verify
          };
          
  print("Forgot Password API Params: ${params}");
   final response = await http.post(
      RestApiClient().otpCreate,
      headers: <String, String>{

        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
       
           Get.toNamed(RouteNames.verifyPassowrd);
          // Get.toNamed(RouteNames.welcome);
           showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

  
}
  
}