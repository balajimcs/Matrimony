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

class ChangepasswordController extends BaseController{

var isEmailCorrect = "".obs;
final controller = Get.find<ForgotOtpController>();

TextEditingController passowrdController = TextEditingController(text: '');
TextEditingController conformPasswordController = TextEditingController(text: '');


  
checkInput(context){
  if(passowrdController.text.isEmpty){
    showSnackBar("Enter password", context);
  }else if(conformPasswordController.text.isEmpty){
    showSnackBar("Enter conform password", context);
  }else{
    forgotOtpAPI(context);
  }
}


forgotOtpAPI(context) async {
  final params = {"emailphone": controller.mobileController.text, "password":passowrdController.text, "confirm_password":conformPasswordController.text
          };
          
  print("Forgot Password API Params: ${params}");
  final response = await http.post(
      RestApiClient().forgotPassword,
      headers: <String, String>{

        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
       
            Get.toNamed(RouteNames.login);
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