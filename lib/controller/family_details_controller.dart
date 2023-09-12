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

class FamilyRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController FatherNameController = TextEditingController(text: '');
  TextEditingController FatherOccupationController = TextEditingController(text: '');
  TextEditingController MotherNameController = TextEditingController(text: '');
  TextEditingController MotherOccupationController = TextEditingController(text: '');
  TextEditingController ExpectationController = TextEditingController(text: '');
  TextEditingController aboutMeController = TextEditingController(text: '');
  TextEditingController NoBrotherController = TextEditingController(text: '');
  TextEditingController NoBrotherMarriedController = TextEditingController(text: '');
  TextEditingController NoSisterController = TextEditingController(text: '');
  TextEditingController NoSisterMarriedController = TextEditingController(text: '');
  TextEditingController ownVechileController = TextEditingController(text: '');
  TextEditingController ownHouseController = TextEditingController(text: '');
  TextEditingController ownLandsController = TextEditingController(text: '');
  TextEditingController ownFlatsController = TextEditingController(text: '');
  TextEditingController AboutFamilyController = TextEditingController(text: '');
 
  checkInput(context){
  if(FatherNameController.text.isEmpty){
    showSnackBar("Enter Father Name", context);
  }else if(FatherOccupationController.text.isEmpty){
    showSnackBar("Enter Father Occupation", context);
  }else if(MotherNameController.text.isEmpty){
    showSnackBar("Enter Mother Name", context);
  }else if(MotherOccupationController.text.isEmpty){
    showSnackBar("Enter Mother Occupation", context);
  }else if(NoBrotherController.text.isEmpty){
    showSnackBar("Enter no brother", context);
  }else if(NoBrotherMarriedController.text.isEmpty){
    showSnackBar("Enter no brother married", context);
  }else if(NoSisterController.text.isEmpty){
    showSnackBar("Enter no sister", context);
  }else if(NoSisterMarriedController.text.isEmpty){
    showSnackBar("Enter no sister married", context);
  }else if(ownFlatsController.text.isEmpty){
    showSnackBar("Enter own flats", context);
  }else if(ownHouseController.text.isEmpty){
    showSnackBar("Enter own house", context);
  }else if(ownLandsController.text.isEmpty){
    showSnackBar("Enter own lands", context);
  }else if(ownVechileController.text.isEmpty){
    showSnackBar("Enter own vechile", context);
  }else{
      print("objecaaat");
      print(FamilyRegisterAPI(context));
      FamilyRegisterAPI(context);
      // registerAPI(context);
  }
  
}

FamilyRegisterAPI(context) async {
  final data = {"father_name": FatherNameController.text, "father_occupation": FatherOccupationController.text, "mother_name": MotherNameController.text, "mother_occupation": MotherOccupationController.text, "no_of_bro":NoBrotherController.text
  ,"no_of_bro_married": NoBrotherMarriedController.text, "no_of_sis": NoSisterController.text, "no_of_sis_married": NoSisterMarriedController.text, "own_vehicle": ownVechileController.text, "own_house": ownHouseController.text,"own_lands":ownLandsController.text, "own_flats":ownFlatsController.text, "expectation":ExpectationController.text, "about_me": aboutMeController.text
  ,"about_family":AboutFamilyController.text};
  final params ={ "family_details":data, "userMobileNo":controller.mobileNumberController.text};
  // controller.emailController.text
  print("Family Address API Params: ${params}");

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
       
           Get.toNamed(RouteNames.login);
          // Get.toNamed(RouteNames.welcome);
          showSuccessSnackBar(datas["message"], context);
          // showSuccessSnackBar("Family Details verified Succesfully", context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"].toString(), context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

  // http.post(
  //     RestApiClient().registerUpdate,
  //     body: jsonEncode(params), headers: headers).then((value) {
  //   Map<String,dynamic> res = jsonDecode(value.body);
  //   print("value");
  //   print(value);
  //   print("Family Address: ${res.toString()}");
  //   if (res != null) {
  //     if (res.isNotEmpty && res["status"].toString() != 410) {
  //         appPreference.accessToken = res["data"].toString();
  //         Get.toNamed(RouteNames.login);
  //         print("balaji");
  //     }else{
  //       showSnackBar(res["message"].toString(), context);
  //       print("object1");
  //     }
  //   }
  // });

}

}