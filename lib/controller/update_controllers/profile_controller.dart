import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';


class ProfileController extends BaseController{
  String verify = "CHANGE_DETAIL";
  String countryCodeController = "+91";
  TextEditingController otpController = TextEditingController(text: '');
  TextEditingController otp1Controller = TextEditingController(text: '');
  TextEditingController referalCodeController = TextEditingController(text: '');
TextEditingController firstNameController = TextEditingController(text: '');
TextEditingController lastNameController = TextEditingController(text: '');
TextEditingController nickNameController = TextEditingController(text: '');
TextEditingController dobController = TextEditingController(text: '');
TextEditingController ageController = TextEditingController(text: '');
TextEditingController mobileNumberController = TextEditingController(text: '');
TextEditingController emailController = TextEditingController(text: '');
TextEditingController passwordController = TextEditingController(text: '');
TextEditingController confirmPassowrdController = TextEditingController(text: '');
 TextEditingController MobileNo = TextEditingController(text: '');
 TextEditingController CurrentMobileNo = TextEditingController(text: '');
 TextEditingController EmailId = TextEditingController(text: '');
 TextEditingController CurrentEmailId = TextEditingController(text: '');
 TextEditingController ActivateAccount = TextEditingController(text: ''); 
 var dropdown = "Brown";

 TextEditingController oldPassowrdController = TextEditingController(text: '');
TextEditingController passowrdController = TextEditingController(text: '');
TextEditingController conformPasswordController = TextEditingController(text: '');
TextEditingController NameController = TextEditingController(text: '');
TextEditingController EmailIdController = TextEditingController(text: '');
TextEditingController MobileNoController = TextEditingController(text: '');
TextEditingController MessageController = TextEditingController(text: '');

 @override
  void onInit() {
    super.onInit();
    fetchMyDetailedPage();
  }
  
checkInputPassword(context){
  if(oldPassowrdController.text.isEmpty){
    showSnackBar("Enter old password", context);
 
  } else if(passowrdController.text.isEmpty){
    showSnackBar("Enter password", context);
  }else if(conformPasswordController.text.isEmpty){
    showSnackBar("Enter conform password", context);
  }else{
    resetPasswordAPI(context);
  }
}

resetPasswordAPI(context) async {
  final params = {"oldpassword": oldPassowrdController.text, "password":passowrdController.text, "confirm_password":conformPasswordController.text
          };
  
  print("Reset Password API Params: ${params}");
  final response = await http.post(
      RestApiClient().resetPassword,
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
        oldPassowrdController.clear();
        passowrdController.clear();
        conformPasswordController.clear();
	Get.toNamed(RouteNames.login);
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}
 
  checkInput(context){
      ChangeMobileNoAPI(context);
  
}

ChangeMobileNoAPI(context) async {
  
  final params = {"mobile_number":MobileNo.text, "country_code": countryCodeController};
  
  print("Change Mobile API Params: ${params}");
   final response = await http.post(
      RestApiClient().changeMobile,
      headers: <String, String>{
        "x-access-token": appPreference.accessToken!,
        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
           showSuccessSnackBar(datas["message"], context);
           MobileNo.clear();
      fetchMyDetailedPage();
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}


 checkInput1(context){
      ChangeEmailIdAPI(context);
  
}

ChangeEmailIdAPI(context) async {
  
  final params = {"email":EmailId.text};
  
  print("Change Email API Params: ${params}");
   final response = await http.post(
      RestApiClient().changeEmail,
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
            fetchMyDetailedPage();
            EmailId.clear();
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}


checkInput2(context){
      ActivateAccountAPI(context);
  
}

ActivateAccountAPI(context) async {
  
  final params = {"emailphone":ActivateAccount.text};
  
  print("Activate Account API Params: ${params}");
   final response = await http.post(
      RestApiClient().accountActivate,
      
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
           showSuccessSnackBar(datas["message"], context);
      Get.toNamed(RouteNames.login);
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}

checkInput3(context){
      DeActivateAccountAPI(context);
  
}

DeActivateAccountAPI(context) async {
   
  
  
   final response = await http.post(
      RestApiClient().accountAccountdeactive,
       headers: <String, String>{
        "x-access-token":appPreference.accessToken!,
        "Content-Type": "application/json",
      },
      );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
           showSuccessSnackBar(datas["message"], context);
        Get.toNamed(RouteNames.login);
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}


checkInput4(context){
      ContactUsAPI(context);
  
}

ContactUsAPI(context) async {
  final params = {"name": NameController.text, "mobile_number": MobileNoController.text, "email": EmailIdController.text, "message": MessageController.text};
  
  
   final response = await http.post(
      RestApiClient().contactUs,
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
           NameController.clear();
           MobileNoController.clear();
           EmailIdController.clear();
           MessageController.clear();
      Get.toNamed(RouteNames.profileScreen);
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}


var isEmailVerified = false.obs;
forgotEmailInput(context){
  if(EmailId.text.isEmpty){
    showSnackBar("Enter email address", context);
  
  }else if(isEmail(EmailId.text)){
      forgotEmailAPI(context);

      }else{
    showSnackBar("Enter vaild email address", context);
  }
}

forgotEmailAPI(context) async {
  final params = {"email": EmailId.text, "verification_for":verify
          };
  
  print("Change email otp API Params: ${params}");
  final response = await http.post(
      RestApiClient().otpCreate,
      headers: <String, String>{
        "x-access-token":appPreference.accessToken!,
        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     
        showSuccessSnackBar(datas["message"], context);
      Dialogs.materialDialog(
                                  msg: 'Enter the otp code for verification',
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
                                          controller: EmailId,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Email",
                                            labelText: "Email",
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
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}

verifyEmailInput(context){
      verifyEmailAPI(context);
  
}

verifyEmailAPI(context) async {
  final params = {"otp": otpController.text, "verification_for":verify, "email": EmailId.text};
  
  print("verifyPhone API Params: ${params}");
  final response = await http.post(
      RestApiClient().verifyOtp,
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

        isEmailVerified.value = true;
        otpController.clear();
        Navigator.pop(context);
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}

var isVerified = false.obs;

createPhoneInput(context){
  if(MobileNo.text.isEmpty){
    showSnackBar("Enter phone number", context);
  
  }else if(isNumeric(MobileNo.text)){
      createPhoneAPI(context);

      }else{
    showSnackBar("Enter vaild phone Number", context);
  }
}

createPhoneAPI(context) async {
  final headers = {"x-access-token":appPreference.accessToken!};
  final params = {"mobile_number": MobileNo.text, "verification_for":verify
          };
  
  print("Address Address API Params: ${params}");
  final response = await http.post(
      RestApiClient().otpCreate,
      headers: <String, String>{
        "x-access-token":appPreference.accessToken!,
        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     String verify = "CHANGE_DETAIL";
        String mobileNumber = '';
        showSuccessSnackBar(datas["message"], context);
      Dialogs.materialDialog(
                                  msg: 'Enter the otp code for verification',
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
                                          controller: MobileNo,
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
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}


verifyPhoneInput(context){
  
      verifyPhoneAPI(context);
  
}

verifyPhoneAPI(context) async {
  final params = {"otp": otp1Controller.text, "verification_for":verify, "mobile_number": MobileNo.text};
  
  print("verifyPhone API Params: ${params}");
  final response = await http.post(
      RestApiClient().verifyOtp,
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

        isVerified.value = true;
        otp1Controller.clear();
        Navigator.pop(context);
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

}



 Future<Map<String, dynamic>> fetchMyDetailedPage() async {
    final url = Uri.parse("${URL}auth/myprofile");
    print(url);

    final response =
        await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      CurrentEmailId.text = body["data"]["userDetails"]["auth_details"]["email"];
      CurrentMobileNo.text = body["data"]["userDetails"]["auth_details"]["mobile_number"];
      
      print("balaji");
    }
    print(body);

    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList();
    return body;
  }
 
  

}