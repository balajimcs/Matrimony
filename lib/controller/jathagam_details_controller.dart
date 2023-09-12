import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';

import '../resources/app_routes.dart';
import '../utils/api_config.dart';

class JathgamRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController GothramController = TextEditingController(text: '');
  TextEditingController KuladeivamController = TextEditingController(text: '');
  TextEditingController DoshamController = TextEditingController(text: '');
  TextEditingController DoshamDetailsController = TextEditingController(text: '');
  TextEditingController placebirthcountryController = TextEditingController(text: '');
  TextEditingController placebirthstateController = TextEditingController(text: '');
  TextEditingController placebirthcityController = TextEditingController(text: '');
  TextEditingController timebirthController = TextEditingController(text: '');
  var Dosham = "No";
  bool showTextField = false;
  checkInput(context){
  if(placebirthcountryController.text.isEmpty){
    showSnackBar("Enter place of birth country", context);
  }else if(placebirthstateController.text.isEmpty){
    showSnackBar("Enter place of birth state", context);
  }else if(placebirthcityController.text.isEmpty){
    showSnackBar("Enter place of birth city", context);
  }else if(timebirthController.text.isEmpty){
    showSnackBar("Enter time of birth", context);
  }else if(controller.dropdownValue22 == null){
    showSnackBar("Select the rasi", context);
  }else if(controller.dropdownValue23 == null){
    showSnackBar("Select the natachthiram", context);
  }else{
      print("objecaaat");
      print(JathgamRegisterAPI(context));
      JathgamRegisterAPI(context);
      // registerAPI(context);
  }
  
}

JathgamRegisterAPI(context) async {
  final data = {"rasi": controller.dropdownValue22, "natchathiram": controller.dropdownValue23, "laknam": controller.dropdownValue24, "gothram": GothramController.text, "kuladeivam":KuladeivamController.text
  ,"dosham": Dosham, "dosham_details": DoshamDetailsController.text,"place_of_birth_country": placebirthcountryController.text,"place_of_birth_state": placebirthstateController.text,"place_of_birth_city": placebirthcityController.text, "time_of_birth":timebirthController.text};
  final params ={ "jathagam_details":data, "userMobileNo": controller.mobileNumberController.text};
  
  print("Jathgam Address API Params: ${params}");

  final response = await http.post(
      RestApiClient().registerUpdate,
      headers: <String, String>{

        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
       controller.currentStep.value = 6;
        print(controller.currentStep.value = 6);
          // Get.toNamed(RouteNames.welcome);
          showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

  // http.post(
  //     RestApiClient().registerUpdate,
  //     body: jsonEncode(params), headers: headers).then((value) {
  //   Map<String,dynamic> res = jsonDecode(value.body);
  //   print("value");
  //   print(value);
  //   print("Jathgam Address: ${res.toString()}");
  //   if (res != null) {
  //     if (res.isNotEmpty && res["status"].toString() != 410) {
  //         appPreference.accessToken = res["data"].toString();
  //         controller.currentStep.value = 6;
  //         print(controller.currentStep.value = 6);
  //         // Get.toNamed(RouteNames.welcome);
  //         print("balaji");
  //     }else{
  //       showSnackBar(res["message"].toString(), context);
  //       print("object1");
  //     }
  //   }
  // });

}

}