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

class PersonalRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController HeightController = TextEditingController(text: '');
  TextEditingController WeightController = TextEditingController(text: '');
  TextEditingController HobbiesController = TextEditingController(text: '');
  TextEditingController physicalStatusController = TextEditingController(text: '');
  TextEditingController livingDetailsController = TextEditingController(text: '');
  TextEditingController otherLanguagesController = TextEditingController(text: '');
  TextEditingController NoChildernController = TextEditingController(text: '');
  var living = "No";
  bool showTextField1 = false;
  
  bool showTextField = false;
  
  checkInput(context){
  if(HeightController.text.isEmpty){
    showSnackBar("Enter Height", context);
  }else if(WeightController.text.isEmpty){
    showSnackBar("Enter Weight", context);
  }else if(livingDetailsController.text.isEmpty){
    showSnackBar("Enter no of living status", context);
  }else if(HobbiesController.text.isEmpty){
    showSnackBar("Enter Hobbies", context);
  }else if(NoChildernController.text.isEmpty){
    showSnackBar("Enter no of children", context);
  }else if(controller.dropdownValue18 == null){
    showSnackBar("Select the Deit value", context);
  }else if(controller.dropdownValue19 == null){
    showSnackBar("Select the marital status value", context);
  }else if(controller.dropdownValue17 == null){
    showSnackBar("Select the skin tone value", context);
  }else if(controller.dropdownValue38 == null){
    showSnackBar("Select the drinking value", context);
  }else if(controller.dropdownValue39 == null){
    showSnackBar("Select the smoking value", context);
  }else if(controller.dropdownValue40 == null){
    showSnackBar("Select the physical status value", context);
  }else{
      print("objecaaat");
      print(personalRegisterAPI(context));
      personalRegisterAPI(context);
      // registerAPI(context);
  }
  
}

personalRegisterAPI(context) async {
  final data = {"hobbies": HobbiesController.text, "diet": controller.dropdownValue18, "height": HeightController.text, "weight": WeightController.text, "marital_details":controller.dropdownValue19
  ,"no_of_children": NoChildernController.text, "skin_tone": controller.dropdownValue17, "drinking": controller.dropdownValue38, "smoking":controller.dropdownValue39, 
  "physical_status":controller.dropdownValue40, "physical_status_details": physicalStatusController.text ,  "no_of_children_living_with_you": livingDetailsController.text,
  "other_languages": otherLanguagesController.text, };
  final params ={ "personal_details":data, "userMobileNo":"${controller.mobileNumberController.text}"};
  // ${controller.emailController.text}
  print("Personal Address API Params: ${params}");

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
       controller.currentStep.value = 4;
        print(controller.currentStep.value = 4);
          // Get.toNamed(RouteNames.welcome);
          showSuccessSnackBar(data["message"].toString(), context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"].toString(), context);
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
  //   print("Personal Address: ${res.toString()}");
  //   if (res != null) {
  //     if (res.isNotEmpty && res["status"].toString() != 410) {
  //         appPreference.accessToken = res["data"].toString();
  //         controller.currentStep.value = 4;
  //         print(controller.currentStep.value = 4);
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