import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/models/Borker_model.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:thirumanam/views/auth/register_page.dart';
import 'package:validators/validators.dart';
import 'package:flutter_countries/flutter_countries.dart';
import '../resources/app_routes.dart';
import '../utils/api_config.dart';

class StepperRegisterController extends BaseController{
  
  var isEmailCorrect = "".obs;
  var currentStep = 0.obs;

 

  
  @override
  void onInit() {
    super.onInit();
 fetchBorkerDetailsPage('');
  }
  
  String verify = "MOBILE_REGISTRATION";
  String countryCodeController = "+91";
  String countryCodeController1 = "+91";
  TextEditingController otpController = TextEditingController(text: '');
  TextEditingController otp1Controller = TextEditingController(text: '');
  TextEditingController referalCodeController = TextEditingController(text: '');
TextEditingController firstNameController = TextEditingController(text: '');
TextEditingController lastNameController = TextEditingController(text: '');
TextEditingController countryCodePickerController = TextEditingController(text: '');
TextEditingController nickNameController = TextEditingController(text: '');
TextEditingController dobController = TextEditingController(text: '');
TextEditingController ageController = TextEditingController(text: '');
TextEditingController mobileNumberController = TextEditingController(text: '');
TextEditingController additionalMobileNumberController = TextEditingController(text: '');
TextEditingController emailController = TextEditingController(text: '');
TextEditingController passwordController = TextEditingController(text: '');
TextEditingController confirmPassowrdController = TextEditingController(text: '');
TextEditingController natonalityController = TextEditingController(text: '');
TextEditingController currentNatonalityController = TextEditingController(text: '');
TextEditingController residentStatus = TextEditingController(text: '');
TextEditingController natonality1Controller = TextEditingController(text: '');
TextEditingController currentNatonality1Controller = TextEditingController(text: '');
TextEditingController residentStatus1 = TextEditingController(text: '');
//  final TextEditingController mobileController = TextEditingController(text: '');
 var dropdownValue;
 
 var  dropdownValue0 = "CUSTOMER";
 var dropdownValue1;
 var dropdownValue44;

  var dropdownValue2;
  var dropdownValue3;
  var dropdownValue4;
  var dropdownValue5;
  var dropdownValue6;

  String dropdownValue7 = '';
  var dropdownValue8 = 'Chennai';
  String dropdownValue9 = '';
  String dropdownValue10 = '';
  var dropdownValue11 = 'Indian';

  var dropdownValue12 = 'Chennai';
  var dropdownValue13 = 'Chennai';
  var dropdownValue14 = 'Tamilnadu';
  var dropdownValue15 = 'India';

  
  var dropdownValue17;
  var dropdownValue18;
  var dropdownValue19;
  
  var dropdownValue20;
  String dropdownValue21 = 'Chennai';

  var dropdownValue22;
  var dropdownValue23;
  var dropdownValue24;
  String dropdownValue25 = 'Yes';
  String dropdownValue26 = 'Yes';
  String dropdownValue27 = 'Yes';

  String dropdownValue28 = '0';
  String dropdownValue29 = '0';
  String dropdownValue30 = '0';
  String dropdownValue31 = '0';
  String dropdownValue32 = '0';
  String dropdownValue33 = '0';
  String dropdownValue34 = '0';
  String dropdownValue35 = '0';

  String dropdownValue36 = 'Indian';
  var dropdownValue37;
  var dropdownValue38;
  var dropdownValue39;
  var dropdownValue40 = 'No';
  var dropdownValue41;
  String dropdownValue42 = 'Indian';
  String dropdownValue43 = 'Indian';
  var dropdownValue45;
  var dropdownValue46;
  String ReferralCode = "No";
  bool showTextField = false;
  List<String> baba = ["aa", "bb", "cc", "dd"];


  checkInput(context){
  if(firstNameController.text.isEmpty){
    showSnackBar("Enter First Name", context);
  }else if(lastNameController.text.isEmpty){
    showSnackBar("Enter Last Name", context);
  }else if(dropdownValue == null){
    showSnackBar("Select the profile for value", context);
  }else if(dropdownValue1 == null){
    showSnackBar("Select the Gender value", context);
  }else if(dobController.text.isEmpty){
    showSnackBar("Enter Date of Birth", context);
  }else if(mobileNumberController.text.isEmpty){
    showSnackBar("Enter Mobile Number", context);
  }else if(passwordController.text.isEmpty){
    showSnackBar("Enter Password", context);
  }else if(confirmPassowrdController.text.isEmpty){
    showSnackBar("Enter Confirm Password", context);
  }
  else if(isEmail(emailController.text)){
    
  if(passwordController.text.isEmpty){
    showSnackBar("Password must atleast contain 6 and one Special characters", context);
  }else if(confirmPassowrdController.text.isEmpty){
    showSnackBar("Password must atleast contain 6 and one Special characters", context);
  }else{
      
      registerAPI(context);
      
  }
  }
  else{
    showSnackBar("Please check the fields", context);
    }
  
}

registerAPI(context) async {
  final data = {"ProfileFor": dropdownValue ,"referal_code":referalCodeController.text,
  "MobileNo": mobileNumberController.text,"CountryCode": countryCodeController
  ,"Email": emailController.text,"password": passwordController.text,"confirm_password": confirmPassowrdController.text
  ,"FirstName": firstNameController.text,"lastName": lastNameController.text,"NickName": nickNameController.text
  ,"Gender": dropdownValue1,"Age": ageController.text,"DOB": dobController.text,"OptionalMobileNo":additionalMobileNumberController.text};
  final params ={ "basic":data};
  print(emailController.text);
  print("Register API Params: ${params}");
  final response = await http.post(
      RestApiClient().register,
      headers: <String, String>{

        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
          currentStep.value = 1;
          showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }
 
}
var isEmailVerified = false.obs;
forgotEmailInput(context){
  if(emailController.text.isEmpty){
    showSnackBar("Enter email address", context);
  
  }else if(isEmail(emailController.text)){
      forgotEmailAPI(context);

      }else{
    showSnackBar("Enter vaild email address", context);
  }
}

forgotEmailAPI(context) async {
  final params = {"email": emailController.text, "verification_for":verify
          };
          
  print("Forgot Password API Params: ${params}");
  http.post(
      RestApiClient().otpCreate,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Forgot Password Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        String verify = "MOBILE_REGISTRATION";
        String mobileNumber = '';
        showSuccessSnackBar(res["message"], context);
          // appPreference.accessToken = res["data"];
          Dialogs.materialDialog(
                                  msg: 'Enter the otp code for verification.\nYou can either phone or email verification.',
                                  // title: "Delete",
                                  color: Colors.white,
                                  context: context,
                                  dialogWidth: kIsWeb ? 0.3 : null,
                                  onClose: (value) =>
                                      print("returned value is '$value'"),
                                  actions: [
                                    
                                    Column(
                                      children: [
                                        TextFormField(
                                          controller: emailController,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Email",
                                            labelText: "Email",
                                            hintStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.email,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: otpController,
                                        style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Otp",
                                            labelText: "Otp",
                                            hintStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.verified,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        IconsButton(
                                          onPressed: () {
                                            verifyEmailInput(context);
                                          },
                                          text: "Verify",
                                          iconData: Icons.verified,
                                          color: Colors.green,
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ]);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

verifyEmailInput(context){
      verifyEmailAPI(context);
  
}

verifyEmailAPI(context) async {
  final params = {"otp": otpController.text, "verification_for":verify, "email": emailController.text};
          
  print("Verify Otp API Params: ${params}");
  http.post(
      RestApiClient().verifyOtp,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Verify Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
          // appPreference.accessToken = res["data"];
          isEmailVerified.value = true;
          Navigator.pop(context);
          showSuccessSnackBar(res["message"], context);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

var isVerified = false.obs;

createPhoneInput(context){
  if(mobileNumberController.text.isEmpty){
    showSnackBar("Enter phone number", context);
  
  }else if(isNumeric(mobileNumberController.text)){
      createPhoneAPI(context);

      }else{
    showSnackBar("Enter vaild phone Number", context);
  }
}

createPhoneAPI(context) async {
  final params = {"mobile_number": mobileNumberController.text, "verification_for":verify
          };
          
  print("create otp API Params: ${params}");
  http.post(
      RestApiClient().otpCreate,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("create otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        appPreference.verified = res["data"]["verified"];
          print("Verified: ${res["data"]["verified"]}");
        String verify = "MOBILE_REGISTRATION";
        String mobileNumber = '';
        showSuccessSnackBar(res["message"], context);
          // appPreference.accessToken = res["data"];
          Dialogs.materialDialog(
                                  msg: 'Enter the otp code for verification.\nYou can either phone or email verification.',
                                  // title: "Delete",
                                  msgStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                  color: Colors.white,
                                  context: context,
                                  dialogWidth: kIsWeb ? 0.3 : null,
                                  onClose: (value) =>
                                      print("returned value is '$value'"),
                                  actions: [
                                    
                                    Column(
                                      children: [
                                        TextFormField(
                                          controller: mobileNumberController,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Phone Number",
                                            labelText: "Phone Number ",
                                            hintStyle:
                                                TextStyle(
                                                    
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.phone,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: otp1Controller,
                                        style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Otp",
                                            labelText: "Otp",
                                            hintStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            labelStyle:
                                                TextStyle(fontFamily: "nunto"),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.verified,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        IconsButton(
                                          onPressed: () {
                                            verifyPhoneInput(context);
                                          },
                                          text: "Verify",
                                          iconData: Icons.verified,
                                          color: Colors.green,
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ]);
          
      }else{
        showSnackBar(res["message"], context);
        
      }
    }
  });

}

verifyPhoneInput(context){
  
      verifyPhoneAPI(context);
  
}

verifyPhoneAPI(context) async {
  final params = {"otp": otp1Controller.text, "verification_for":verify, "mobile_number": mobileNumberController.text};
          
  print("Verify Otp API Params: ${params}");
  http.post(
      RestApiClient().verifyOtp,
      body: params).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("Verify Otp Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"] != 410) {
        appPreference.verified = res["data"]["verified"];
        isVerified.value = true;
          print("Verified: ${res["data"]["verified"]}");
          
          // isphoneLoading.value = true;
           Navigator.pop(context);
          showSuccessSnackBar(res["message"], context);
          
      }else{
        showSnackBar(res["message"], context);
        print("object1");
        
      }
    }
  });

}



Future<Map<String, dynamic>> fetchBorkerDetailsPage(String? id) async {
    final url = Uri.parse("${URL}auth/get-broker-details?referal_code=${id}");
    
    final response =
        await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      print("balaji");
    }
    return body;
  }


}