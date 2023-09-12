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

class CommunicationRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController DoorNoController = TextEditingController(text: '');
  TextEditingController StreetController = TextEditingController(text: '');
  TextEditingController AreaController = TextEditingController(text: '');
  TextEditingController DoorNo1Controller = TextEditingController(text: '');
  TextEditingController Street1Controller = TextEditingController(text: '');
  TextEditingController Area1Controller = TextEditingController(text: '');
  TextEditingController Country1Controller = TextEditingController(text: '');
  TextEditingController State1Controller = TextEditingController(text: '');
  TextEditingController Disctrict1Controller = TextEditingController(text: '');
  TextEditingController City1Controller = TextEditingController(text: '');
  TextEditingController Country2Controller = TextEditingController(text: '');
  TextEditingController State2Controller = TextEditingController(text: '');
  TextEditingController Disctrict2Controller = TextEditingController(text: '');
  TextEditingController City2Controller = TextEditingController(text: '');
 
  checkInput(context){
  if(DoorNoController.text.isEmpty){
    showSnackBar("Enter Door Number", context);
  }else if(StreetController.text.isEmpty){
    showSnackBar("Enter Street Name", context);
  }else if(controller.dropdownValue37 == null){
    showSnackBar("Select the resident status values", context);
  }else if(controller.dropdownValue41 == null){
    showSnackBar("Select the resident status values", context);
  }else if(AreaController.text.isEmpty){
    showSnackBar("Enter Area Name", context);
  }else if(DoorNo1Controller.text.isEmpty){
    showSnackBar("Enter Door Number", context);
  }else if(Street1Controller.text.isEmpty){
    showSnackBar("Enter Street Name", context);
  }else if(Area1Controller.text.isEmpty){
    showSnackBar("Enter Area Name", context);
  }else if(Country1Controller.text.isEmpty){
    showSnackBar("Enter Country Name", context);
  }else if(State1Controller.text.isEmpty){
    showSnackBar("Enter State Name", context);
  }else if(Disctrict1Controller.text.isEmpty){
    showSnackBar("Enter District Name", context);
  }else if(City1Controller.text.isEmpty){
    showSnackBar("Enter City Name", context);
  }else if(Country2Controller.text.isEmpty){
    showSnackBar("Enter Country Name", context);
  }else if(State2Controller.text.isEmpty){
    showSnackBar("Enter State Name", context);
  }else if(Disctrict2Controller.text.isEmpty){
    showSnackBar("Enter District Name", context);
  }else if(City2Controller.text.isEmpty){
    showSnackBar("Enter City Name", context);
  }else{
      print("objecaaat");
      print(communicationRegisterAPI(context));
      communicationRegisterAPI(context);
      // registerAPI(context);
  }
  
}

communicationRegisterAPI(context) async {
  final data = {"door_no": DoorNoController.text, "street": StreetController.text, "area": AreaController.text, "city": City1Controller.text, "district":Disctrict1Controller.text
  ,"state": State1Controller.text, "country": Country1Controller.text, "nationality": controller.dropdownValue11, "current_nationality":controller.dropdownValue36,"resident_status":controller.dropdownValue41};
  final data1 = {"door_no": DoorNo1Controller.text, "street": Street1Controller.text, "area": Area1Controller.text, "city": City2Controller.text, "district":Disctrict2Controller.text
  ,"state": State2Controller.text, "country": Country2Controller.text,"resident_status":controller.dropdownValue37, "nationality": controller.dropdownValue42, "current_nationality":controller.dropdownValue43};
  final params ={ "communication_detials":data,"permanent_address":data1, "userMobileNo":controller.mobileNumberController.text };
  print("Communication Address API Params: ${params}");
  
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
       controller.currentStep.value = 3;
          print(controller.currentStep.value = 3);
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
  //   print("Communication Address: ${res.toString()}");
  //   if (res != null) {
  //     if (res.isNotEmpty && res["status"].toString() != 410) {
  //         appPreference.accessToken = res["data"].toString();
  //         controller.currentStep.value = 3;
  //         print(controller.currentStep.value = 3);
  //         // Get.toNamed(RouteNames.welcome);
  //         showSuccessSnackBar("Address Details verified Succesfully", context);
  //         print("balaji");
  //     }else{
  //       showSnackBar(res["message"].toString(), context);
  //       print("object1");
  //     }
  //   }
  // });

}

}