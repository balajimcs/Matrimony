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


class FamilyUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController FatherNameController = TextEditingController(text: '');
  TextEditingController FatherOccupationController = TextEditingController(text: '');
  TextEditingController MotherNameController = TextEditingController(text: '');
  TextEditingController MotherOccupationController = TextEditingController(text: '');
  TextEditingController NoBroController = TextEditingController(text: '');
  TextEditingController BroMarryController = TextEditingController(text: '');
  TextEditingController NoSisController = TextEditingController(text: '');
  TextEditingController SisMarryController = TextEditingController(text: '');
  TextEditingController OwnVechileController = TextEditingController(text: '');
  TextEditingController OwnHouseController = TextEditingController(text: '');
  TextEditingController OwnlandsController = TextEditingController(text: '');
  TextEditingController OwnFlatsController = TextEditingController(text: '');
  TextEditingController ExpectationController = TextEditingController(text: '');
  TextEditingController AboutController = TextEditingController(text: '');
  TextEditingController AboutFamilyController = TextEditingController(text: '');
 
 
  checkInput(context){
      print("objecaaat");
      print(FamilyUpdateControllerRegisterAPI(context));
      FamilyUpdateControllerRegisterAPI(context);
  
}

FamilyUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":appPreference.accessToken!};
   final params = {"father_name": FatherNameController.text, "father_occupation": FatherOccupationController.text, "mother_name": MotherNameController.text, "mother_occupation": MotherOccupationController.text, "no_of_bro":NoBroController.text
  ,"no_of_bro_married": BroMarryController.text, "no_of_sis": NoSisController.text, "no_of_sis_married": SisMarryController.text, "own_vehicle": OwnVechileController.text, "own_house": OwnHouseController.text,"own_lands":OwnlandsController.text, "own_flats":OwnFlatsController.text, "expectation":ExpectationController.text, "about_me":AboutController.text, "about_family": AboutFamilyController.text};
  
  print("Family Address API Params: ${params}");
  final response = await http.post(
      RestApiClient().familyEdit,
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