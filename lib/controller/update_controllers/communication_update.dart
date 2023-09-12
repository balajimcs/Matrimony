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


class CommunicationUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController SubCasteController = TextEditingController(text: '');
  var imageUrl;
  var attachemnts;
  var Caste = "Vellalar";
  var Community = "BC";
  var MotherTongue = "TAMIL";
  var Religion = "HINDU";
 
  checkInput(context){
      print("objecaaat");
      print(CommunicationUpdateControllerRegisterAPI(context));
      CommunicationUpdateControllerRegisterAPI(context);
  
}

CommunicationUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":appPreference.accessToken!};
  final params = {"religion": Religion, "community": Community, "mother_tongue": MotherTongue, "caste": Caste, "sub_caste":SubCasteController.text
  };
  
  print("Communication Address API Params: ${params}");
   final response = await http.post(
      RestApiClient().communcationEdit,
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