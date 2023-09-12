import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';


class PersonalUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController HeightController = TextEditingController(text: '');
  TextEditingController WieghtController = TextEditingController(text: '');
  TextEditingController HobbiesController = TextEditingController(text: '');
  TextEditingController NoChildController = TextEditingController(text: '');
  TextEditingController FirstNameController = TextEditingController(text: '');
  TextEditingController LastNameController = TextEditingController(text: '');
  TextEditingController NickNameController = TextEditingController(text: '');
  TextEditingController DobController = TextEditingController(text: '');
  TextEditingController physicalStatusController = TextEditingController(text: '');
  TextEditingController livingDetailsController = TextEditingController(text: '');
  TextEditingController otherLanguagesController = TextEditingController(text: '');

  var name = "";
  var name1 = "";
  var skinTone = "Brown";
  var deit = "Vegitarian";
  var maritalStatus = "Single";
  var drinking = "Non-Drinker";
  var smoking = "Non-Smoker";
  var physicalStatus = "No";
  var age = "25";
  var gender = "MALE";
  bool showTextField = false;
  bool showTextField1 = false;

  checkInput(context){
      print("objecaaat");
      print(PersonalUpdateControllerRegisterAPI(context));
      PersonalUpdateControllerRegisterAPI(context);
  
}

PersonalUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":appPreference.accessToken!};
  final params = {"height": HeightController.text, "weight": WieghtController.text, "hobbies": HobbiesController.text, "diet": deit, "skin_tone":skinTone
  ,"marital_details": maritalStatus, "no_of_children": NoChildController.text, 
  "drinking": drinking, "smoking": smoking,  "physical_status": physicalStatus,
  "first_name": FirstNameController.text,"last_name": LastNameController.text,"nick_name": NickNameController.text
  ,"gender": gender,"age": age,"DOB": DobController.text, "physical_status_details": physicalStatusController.text ,  "no_of_children_living_with_you": livingDetailsController.text,
  "other_languages": otherLanguagesController.text};
  
  print("Personal Address API Params: ${params}");
   final response = await http.post(
      RestApiClient().personalEdit,
      headers: <String, String>{
        "x-access-token":appPreference.accessToken!,
        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
           showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}
 
  

}