import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/models/detailed_filter_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class UpdateAppController extends BaseController {
  var checkError = false.obs;
  var buttonOne = false.obs;
  var buttonTwo = false.obs;
  var buttonOneString = ''.obs;
  var buttonTwoString = ''.obs;
  var title = ''.obs;
  var message = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    getProfile();
    // checkError.value = false;
    // buttonOne.value = false;
    // buttonTwo.value = false;
    // buttonOneString.value = '';
    // buttonTwoString.value = '';
    // title.value = '';
    // message.value = '';
  }

   getProfile() {
    http.get(
      RestApiClient().updateApp
    ).then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("getupdate Response: ${res.toString()}");
      if (res != null) {
        checkError.value = res['data']['check_error'];
      buttonOne.value = res['data']['button_one'];
      buttonTwo.value = res['data']['button_two'];
      buttonOneString.value = res['data']['button_one_name'];
      buttonTwoString.value = res['data']['button_two_name'];
      title.value = res['data']['Title'];
      message.value = res['data']['Message'];
      print(checkError.value);
      print("checkError.value");
      print(buttonOne.value);
      print("buttonOne.value");
      print(buttonTwo.value);
      print("buttonTwo.value");
      print(buttonOneString.value);
      print("buttonOneString.value");
      print(buttonTwoString.value);
      print("buttonTwoString.value");
      print(title.value);
      print("title.value");
     print(message.value);
     print("message.value");
        // appPreference.userId = res["data"]["customerDetails"]["user_obj_id"];
        // Get.toNamed(RouteNames.homePage);
      }
    });
  }
  // var updateAppModel = StreamController<Map<String, dynamic>>.broadcast();
  // Stream<Map<String, dynamic>> getUpdateAppModel() => updateAppModel.stream;
  //   fetchUpdateApp() {

  //   print('fetchUpdateApp');
  //   final url = Uri.parse(
  //       "${URL}auth/get-mobile-version");
  //     print(url);
  //   final response = await http.get(
  //     Uri.parse(url.toString())
  //   );

  //   final Map<String, dynamic> body = json.decode(response.body);

  //   if (response.statusCode == 200) {
  //     print(body);
  //     checkError.value = body['data']['check_error'];
  //     buttonOne.value = body['data']['button_one'];
  //     buttonTwo.value = body['data']['button_two'];
  //     buttonOneString.value = body['data']['button_one_name'];
  //     buttonTwoString.value = body['data']['button_two_name'];
  //     title.value = body['data']['Title'];
  //     message.value = body['data']['Message'];
  //     print(checkError.value);
  //     print("checkError.value");
  //     print(buttonOne.value);
  //     print("buttonOne.value");
  //     print(buttonTwo.value);
  //     print("buttonTwo.value");
  //     print(buttonOneString.value);
  //     print("buttonOneString.value");
  //     print(buttonTwoString.value);
  //     print("buttonTwoString.value");
  //     print(title.value);
  //     print("title.value");
  //    print(message.value);
  //    print("message.value");
      
  //   }
  //   return body;

  // }
}
