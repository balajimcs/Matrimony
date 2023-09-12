import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import '../utils/api_config.dart';

class SplashController extends BaseController{

  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  checkLogin(){

    Future.delayed(Duration(seconds: 2)).then((value) {
      if(appPreference.accessToken != null && appPreference.accessToken!.isEmpty){
        Get.toNamed(RouteNames.welcome);
        
      }else{
        // print("Token: ${appPreference.accessToken!.replaceAll(appPreference.accessToken!, "")}");
        getProfile();
        // Get.toNamed(RouteNames.dashboard);
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
        if (res.isNotEmpty && res["status"] != 410) {
        appPreference.userId = res["data"]["customerDetails"]["user_obj_id"];
        
        Get.toNamed(RouteNames.homePage);
        }else{
          Get.toNamed(RouteNames.welcome);
        }
      }
    });
  }
}

