import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';
import 'base_controller.dart';
import 'dashboard_controller.dart';

class RegisterController extends BaseController{
var isEmailCorrect = "".obs;
var secureText = true.obs;
bool validatePhoneNumber(String phoneNumber) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(phoneNumber);
}

bool validatePassword(String password) {
  String pattern =
      r'^(?=.*?[a-zA-Z0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(password);
}

TextEditingController emailController = TextEditingController(text: '');
TextEditingController passwordController = TextEditingController(text: '');


checkInput(context){
  
  
  if(emailController.text.isEmpty){
    showSnackBar("Enter customer id", context);
  }else if(passwordController.text.isEmpty){
    showSnackBar("Enter password", context);
    }else{
        loginAPI(context);

    }
}

  loginAPI(context) async {
    final params = {"customer_id": emailController.text,
      "password": passwordController.text};
    print("Login API Params: ${params}");
    http.post(
        RestApiClient().login,
        body: params).then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("Login Response: ${res.toString()}");
      if (res != null) {
        if (res.isNotEmpty && res["status"] != 410) {
          appPreference.accessToken = res["data"]['token'];
          showSuccessSnackBar(res["message"], context);
          print("Token: ${res["data"]['token']}");
          if (res["data"]["user"]["is_paid"] == true){
            getProfile();
          }else{
            Get.toNamed(RouteNames.PricingAdmin);
          }

          
          

        } else {
          

          showSnackBar(res["message"], context);
          if (res["message"] == "Account is Waiting for Admin Approval"){
            Get.toNamed(RouteNames.adminApproval);
          }
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