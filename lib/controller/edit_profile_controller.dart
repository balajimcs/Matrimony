import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/models/all_users_model.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:http/http.dart' as http;

import '../models/home_user_model.dart';
import '../utils/api_config.dart';

class DashboardController extends BaseController{
 

  var allUserModel = HomeUserModel().obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getAllUsersAPI();
    // setDummyHomeData();
  }

  getAllUsersAPI(){
    http.get(
        RestApiClient().detailedPage,
        headers: {
          "x-access-token": appPreference.accessToken!
        }).then((value) {
      print("Detailed Response: ${value.body}");
      final res = jsonDecode(value.body);
      if(res["success"]== 1){
          allUserModel.value = HomeUserModel.fromJson(res);
      }
      isLoading.value = false;
    });
  }
}