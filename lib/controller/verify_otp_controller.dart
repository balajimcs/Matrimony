import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class verifyOtpController extends BaseController{

var isEmailCorrect = "".obs;
final controller = Get.find<ForgotOtpController>();
TextEditingController otpController = TextEditingController(text: '');
String verify = "FORGOT_PASSWORD";
bool validatePhoneNumber(String phoneNumber) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(phoneNumber);
}
checkInput(context){
  if(otpController.text.isEmpty){
    showSnackBar("Enter otp number", context);
  
  }else if(controller.mobileController.text.isEmpty){
      showSnackBar("Enter email address/phone number", context);
  }else if(isEmail(controller.mobileController.text) || validatePhoneNumber(controller.mobileController.text)){
    if(otpController.text.length < 3){
      showSnackBar("Opt must contain 4 characters", context);
    }else{
      verifyOtpAPI(context);
    }
      }else{
    showSnackBar("Enter vaild otp number", context);
  }
}

verifyOtpAPI(context) async {
  final params = {"otp": otpController.text, "verification_for":verify, "emailphone": controller.mobileController.text};
          
  print("Verify Otp API Params: ${params}");
  final response = await http.post(
      RestApiClient().verifyOtp,
      headers: <String, String>{

        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
       
            Get.toNamed(RouteNames.changePassword);
          // Get.toNamed(RouteNames.welcome);
           showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

  
}
 

}