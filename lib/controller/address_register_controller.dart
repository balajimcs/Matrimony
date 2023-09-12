import 'dart:convert';

import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';

import '../resources/app_routes.dart';
import '../utils/api_config.dart';

class AdresssRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController SubCasteController = TextEditingController(text: '');



  checkInput(context){
    if(controller.dropdownValue2 == null){
      showSnackBar("Select the religion values", context);
    }else if(controller.dropdownValue5 == null){
      showSnackBar("Select the community values", context);
    }else if(controller.dropdownValue6 == null){
      showSnackBar("Select the mother tongue values", context);
    }else if(controller.dropdownValue3 == null){
      showSnackBar("Select the caste values", context);
    }else if(SubCasteController.text.isEmpty){
      showSnackBar("fill the sub caste", context);
    }else{
      print("objecaaat");
      print(adresssRegisterAPI(context));
      adresssRegisterAPI(context);
    }

      // registerAPI(context);
  
  
}

adresssRegisterAPI(context) async {
  final data = {"caste": controller.dropdownValue3,
    "community": controller.dropdownValue5,
    "mother_tongue": controller.dropdownValue6,
    "religion": controller.dropdownValue2,
    "sub_caste": SubCasteController.text};
   
  final params ={"religion_community":data, "userMobileNo":controller.mobileNumberController.text};
  print("Address API Params: ${params}");

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

         controller.currentStep.value = 2;
         print(controller.currentStep.value = 2);


          showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

  // http.post(
  //     RestApiClient().registerUpdate,
  //     body: jsonEncode(params)).then((value) {
  //   Map<String,dynamic> res = jsonDecode(value.body);
  //   print("value");
  //   print(value);
  //   print("Address Response: ${res.toString()}");
    
  //   if (res != null) {
  //     print("balajiaaaaa");
  //     if (res.isNotEmpty && res["status"].toString() != 410) {
  //         appPreference.accessToken = res["data"].toString();
          
  //         controller.currentStep.value.value = 2;
  //         print(controller.currentStep.value.value = 2);
  //         print("balaji");
  //     }else{
        
  //         showSnackBar(res["message"], context);
  //       print("object1");
  //     }
  //   }
  // });

}

}