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


class PermenentAddressUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController DoorNoController = TextEditingController(text: '');
  TextEditingController StreetController = TextEditingController(text: '');
  TextEditingController AreaController = TextEditingController(text: '');
  TextEditingController CityController = TextEditingController(text: '');
  TextEditingController DistrictController = TextEditingController(text: '');
  TextEditingController StateController = TextEditingController(text: '');
  TextEditingController CountryController = TextEditingController(text: '');
 
  String currentNationality = "Indian";
  var residentStatus = "STUDENT VISA";
  String nationality = "Indian";
 
 
  
 
  checkInput(context){
      print("objecaaat");
      print(PermenentUpdateControllerRegisterAPI(context));
      PermenentUpdateControllerRegisterAPI(context);
  
}

PermenentUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":appPreference.accessToken!};
  final params = {"door_no": DoorNoController.text, "street": StreetController.text, "area": AreaController.text, "city": CityController.text, "district":DistrictController.text
  ,"state": StateController.text, "country": CountryController.text, "nationality": nationality, "current_nationality": currentNationality, "resident_status": residentStatus};
  
  print("Permenent Address API Params: ${params}");
   final response = await http.post(
      RestApiClient().permenentAddressEdit,
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