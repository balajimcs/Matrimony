import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thirumanam/controller/communication_register.dart';
import 'package:thirumanam/controller/dropdown_controller.dart';
import 'package:thirumanam/controller/search_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/models/admin_data_model.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/models/dropdown_model.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/views/auth/country.dart';
import 'package:thirumanam/views/auth/country3.dart';
import '../../controller/address_register_controller.dart';
import '../../controller/carrier_deatils_controller.dart';
import '../../controller/family_details_controller.dart';
import '../../controller/jathagam_details_controller.dart';
import '../../controller/personal_details_controller.dart';
import 'package:http/http.dart' as http;
import 'package:csc_picker/csc_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';

bool flag = true && false;

class RegisterAuth extends StatefulWidget {
  @override
  _RegisterAuthState createState() => _RegisterAuthState();
}

class _RegisterAuthState extends State<RegisterAuth> {
  String countryCodeController = "+91";
  final AppPreference appPreference = Get.find();
  bool _showDetails = false;
  AdminDataModel adminDataModel = AdminDataModel();
  @override
  void initState() {
    super.initState();
    controller.fetchBorkerDetailsPage('');
    countryCodeController = "+91";
    mobileNumber = '';

    verify = "MOBILE_REGISTRATION";
    _loadCounter();
    setState(() {
      appPreference.verified == false;
    });
  }

  
  List categoryItemlist = [];

  var dropdownvalue;

  FilterOptions? selectedIndex;
  List<FilterOptions>? optionsList;

  int? index;
  var liveSel = FilterOptions().obs;

  String one = "";
  String one1 = "";
  String one2 = "";
  String one3 = "";

  final newfilter = Get.find<DropDownController>();
  final controller = Get.find<StepperRegisterController>();

  final controller1 = Get.find<AdresssRegisterController>();
  final controller2 = Get.find<CommunicationRegisterController>();
  final controller3 = Get.find<PersonalRegisterController>();
  final controller4 = Get.find<CarrierRegisterController>();
  final controller5 = Get.find<JathgamRegisterController>();
  final controller6 = Get.find<FamilyRegisterController>();

  


  String mobileNumber = '';
  String verify = "FORGOT_PASSWORD";

  _loadCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      flag = (preferences.getBool('verified') ?? true && false) as bool;
      print(flag);
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool isCompleted = false;

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  // pickcountry1() {

  // };

  @override
  Widget build(BuildContext context) {
    // controller.dropdownValue.value = selectedIndex!;
     
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/Group 6.png'),
            fit: BoxFit.fill,
          )),
          child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RotatedBox(
                  quarterTurns: -2,
                  child: SingleChildScrollView(
                    child: Container(
                      // padding: EdgeInsets.only(top: 100),

                      child: Stack(
                        children: <Widget>[
                          RotatedBox(
                            quarterTurns: 2,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 0, top: 10, bottom: 10),
                                    child: Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                  ),

                                  // Align(
                                  //   alignment: Alignment.topCenter,
                                  //   child: Image.asset('assets/images/aaa.jpg', width: 500,height: 300, fit: BoxFit.fill,))
                                ),
                              ),
                            ),
                          ),

                          //stack overlaps widgets
                          Opacity(
                            //semi red clippath with more height and with 0.5 opacity
                            opacity: 0.5,
                            child: ClipPath(
                              clipper:
                                  WaveClipper(), //set our custom wave clipper
                              child: Container(
                                color: Color(0xffEAF12D),
                                height: 630,
                              ),
                            ),
                          ),

                          ClipPath(
                            //upper clippath with less height
                            clipper:
                                WaveClipper(), //set our custom wave clipper.
                            child: Container(
                              padding: EdgeInsets.only(bottom: 50),
                              color: Color(0xffEAF12D),
                              height: 610,
                              alignment: Alignment.center,
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 0,
                                                      top: 10,
                                                      bottom: 10),
                                                  child: Icon(
                                                    Icons
                                                        .arrow_circle_left_outlined,
                                                    color: Colors.black,
                                                    size: 32,
                                                  ),
                                                ),

                                                // Align(
                                                //   alignment: Alignment.topCenter,
                                                //   child: Image.asset('assets/images/aaa.jpg', width: 500,height: 300, fit: BoxFit.fill,))
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 230),
                                            child: Container(
                                              width: 100,
                                              height: 50,
                                              child: StepProgressIndicator(
                                                totalSteps: 7,
                                                currentStep: 3,
                                                selectedColor: Colors.grey,
                                                unselectedColor:
                                                    Color(0xFF134FAF),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, right: 150, left: 30),
                                              child: Text('register'.tr,
                                                  style: TextStyle(
                                                      fontFamily: "Raleway",
                                                      fontSize: 25,
                                                      color: Color(0xFF134FAF),
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(RouteNames.login);
                                              // fetchPostFeed();
                                            },
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text('go_to_login'.tr,
                                                    style: TextStyle(
                                                        fontFamily: "Raleway",
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xFF134FAF),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ),
                                        ],
                                      ),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary: Color(0xFF134FAF)),
                                        ),
                                        child: Container(
                                          child: Form(
                                            key: _formKey,
                                            child: Obx(() => Stepper(
                                              // controlsBuilder: (context, ControlsDetails details)
                                              type: StepperType.vertical,
                                              physics: ScrollPhysics(),

                                              steps: getStep(),
                                              currentStep:
                                                  controller.currentStep.value,
                                              onStepContinue: () {
                                                final isLastStep =
                                                    controller.currentStep.value ==
                                                        getStep().length - 1;
                                                final isFrstStep =
                                                    controller.currentStep.value == 0;
                                                final issecondStep =
                                                    controller.currentStep.value == 1;
                                                final isthirdStep =
                                                    controller.currentStep.value == 2;
                                                final isFouth =
                                                    controller.currentStep.value == 3;
                                                final isFifthStep =
                                                    controller.currentStep.value == 4;
                                                final isSixthStep =
                                                    controller.currentStep.value == 5;

                                                if (isLastStep) {
                                                  controller6
                                                      .checkInput(context);
                                                } else if (isFrstStep) {
                                                  controller
                                                      .checkInput(context);
                                                  print("object");
                                                } else if (issecondStep) {
                                                        controller1
                                                      .checkInput(context);
                    
                                                  print("object");
                                                } else if (isthirdStep) {
                                                  controller2
                                                      .checkInput(context);
                                                  print("object");
                                                } else if (isFouth) {
                                                  controller3
                                                      .checkInput(context);
                                                  print("object");
                                                } else if (isFifthStep) {
                                                  controller4
                                                      .checkInput(context);

                                                  print("object");
                                                } else if (isSixthStep) {
                                                  controller5
                                                      .checkInput(context);
                                                  print("object");
                                                } else {
                                                  print(isFrstStep);
                                                 
                                                }
                                              },
                                              onStepTapped: (step) => setState(
                                                  () => controller.currentStep.value =
                                                      step),
                                              onStepCancel: controller
                                                          .currentStep ==
                                                      0
                                                  ? null
                                                  : () => setState(() =>
                                                      controller.currentStep.value -=
                                                          1),

                                              controlsBuilder: ((BuildContext
                                                      context,
                                                  ControlsDetails controls,
                                                  {VoidCallback? onStepContinue,
                                                  VoidCallback? onStepCancel}) {
                                                final isLastStep =
                                                    controller.currentStep.value ==
                                                        getStep().length - 1;
                                                return Container(
                                                  margin:
                                                      EdgeInsets.only(top: 50),
                                                  child: Row(
                                                    children: [
                                                      if (controller
                                                              .currentStep !=
                                                          0)
                                                        ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color(0xFF134FAF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0))),
                                                            onPressed: controls
                                                                .onStepCancel,
                                                            child: Text(
                                                              'back'.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Raleway",
                                                              ),
                                                            )),
                                                      SizedBox(
                                                        width: 12,
                                                      ),
                                                      
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              primary: Color(0xFF134FAF),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0))),
                                                          onPressed: controls
                                                              .onStepContinue,
                                                          child: Text(
                                                            isLastStep
                                                                ? 'confirm'.tr
                                                                : 'next'.tr,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Raleway"),
                                                          )),
                                                    ],
                                                  ),
                                                );
                                              }),
                                              //  controlsBuilder: (BuildContext context, ControlsDetails details)
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getStep() => [
    
        Step(
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.currentStep.value >= 0,
          title: Text(
            'basic_inform'.tr,
            style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF134FAF)),
          ),
          content: Form(
            // key: _key,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
               
          
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'profile_for'.tr,
                      hintText: 'profile_for'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[16].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[16].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[16].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[16].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[16].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[16].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[16].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Profile For").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.firstNameController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'firstname'.tr,
                    labelText: 'firstname'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    suffixIcon: controller.isEmailCorrect == "false"
                        ? Icon(
                            Icons.close_sharp,
                            color: Colors.red,
                          )
                        : controller.isEmailCorrect == "true"
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Container(
                                width: 0,
                              ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.lastNameController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'lastname'.tr,
                    labelText: 'lastname'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: controller.isEmailCorrect == "false"
                        ? Icon(
                            Icons.close_sharp,
                            color: Colors.red,
                          )
                        : controller.isEmailCorrect == "true"
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Container(
                                width: 0,
                              ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.nickNameController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'nickname'.tr,
                    labelText: 'nickname'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: controller.isEmailCorrect == "false"
                        ? Icon(
                            Icons.close_sharp,
                            color: Colors.red,
                          )
                        : controller.isEmailCorrect == "true"
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Container(
                                width: 0,
                              ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'gender'.tr,
                      hintText: 'gender'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[7].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue1 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[7].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[7].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[7].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[7].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[7].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[7].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Gender").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
          //       Obx(() => newfilter.isLoading.value ? Container() :
          //         DropdownButtonFormField(
          //           isExpanded: true,
          //           style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
          //           decoration: InputDecoration(
          //             labelText: 'age'.tr,
          //             hintText: 'age'.tr,
          //             labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
          //             // hintText: "aa",
          //             enabledBorder: OutlineInputBorder(
          //               //<-- SEE HERE
          //               borderRadius: BorderRadius.circular(15),
          //               borderSide: BorderSide(color: Colors.black),
          //             ),
          //             focusedBorder: OutlineInputBorder(
          //               //<-- SEE HERE
          //               borderRadius: BorderRadius.circular(10),
          //               borderSide: BorderSide(color: Colors.black),
          //             ),
          //             prefixIcon: Padding(
          //               padding: EdgeInsets.only(left: 20, right: 15),
          //               child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
          //             ),
          //             filled: true,
          //             // fillColor: Colors.white,
          //             fillColor: Color(0xffEAF12D),
          //           ),
          //           icon: Icon(
          //             Icons.arrow_drop_down_circle,
          //             color: Color(0xFF134FAF),
          //           ),
          //           dropdownColor: Colors.grey.shade100,
          //           borderRadius: BorderRadius.circular(20),
          //           value: newfilter.filterCatList.value[1].filterOptions![0],
          //           // validator: (value) => value == null
          //           //                           ? 'field required'
          //           //                           : null,
          //           // hint: Text('Enter team'),
                    
          //           onChanged: (newValue) async {
          //             print(newValue!.options);
          //             controller.dropdownValue44 = newValue.options;
          //             int? ind;
          //             List<FilterOptions>? temp = newfilter.filterCatList.value[1].filterOptions?.where((element) => element.isSelected!).toList();
          // if(temp!.length > 0){
          //   ind = newfilter.filterCatList.value[1].filterOptions?.indexOf(temp.first);
          //   temp.first.isSelected = false;
          //   newfilter.filterCatList.value[1].filterOptions?.removeAt(ind!);
          //   newfilter.filterCatList.value[1].filterOptions?.insert(ind!, temp.first);
          // }
          // ind = newfilter.filterCatList.value[1].filterOptions?.indexOf(newValue);
          // newfilter.filterCatList.value[1].filterOptions?[ind!].isSelected = true;
          // newfilter.filterCatList.refresh();
                        
                      
          //           },
          //           items: newfilter.filterCatList.value.where((element) => element.category == "Age").first.filterOptions!.map((FilterOptions option) {
          //             return DropdownMenuItem(
          //               child: new Text(
          //                 option.options!,
          //               ),
          //               value: option,
          //             );
          //           }).toList(),
          //         ),
          //       ),
               
          //       SizedBox(
          //         height: 30,
          //       ),
                TextField(
                  controller: controller.dobController,
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'date_Birth'.tr,
                    labelText: 'date_Birth'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold, fontSize: 19),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: controller.isEmailCorrect == "false"
                        ? Icon(
                            Icons.close_sharp,
                            color: Colors.red,
                          )
                        : controller.isEmailCorrect == "true"
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Container(
                                width: 0,
                              ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.date_range, color: Color(0xFF134FAF)),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2018),
                        firstDate: DateTime(
                            1980), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      if (kDebugMode) {
                        print(pickedDate);
                      } //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                           Duration difference = DateTime.now().difference(pickedDate);
      int age = (difference.inDays / 365).floor();
      String ageText = '$age'; // Format age text however you like
                      if (kDebugMode) {
                        print(formattedDate);
                      } //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement
                      setState(() {
                        controller.dobController.text = formattedDate; //set output date to TextField value.
                        controller.ageController.text = ageText;
                      });
                    } else {
                      if (kDebugMode) {
                        print("Date is not selected");
                      }
                    }
                  },
                ),
                
                
               
                
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  readOnly: true,
                  controller: controller.ageController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    labelText: 'age'.tr,
                    hintText: 'age'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.mobileNumberController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    labelText: 'mobile_number'.tr,
                    hintText: 'mobile_number'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Obx(()=>
                    controller.isVerified.value == false
                        ? Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5.0, top: 8.0, bottom: 8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF134FAF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                child: Text(
                                  'sent_otp'.tr,
                                  style: TextStyle(fontFamily: "Raleway"),
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //     controller.isphoneLoading.value == false ? const CircularProgressIndicator() : controller.createPhoneInput(context)
                                  //   ;
                                  // });
                                    controller.createPhoneInput(context);
                                  
                                },
                              ),
                            ),
                          )
                        : Container(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, top: 8.0, bottom: 8.0),
                                child: Icon(
                                  Icons.verified_rounded,
                                  color: Color(0xFF134FAF),
                                )),
                          ),
                    ),
                    prefixIcon: Container(
                      // color: Colors.grey.withOpacity(0.8),
                      
                      child:  CountryCodePicker(
          onChanged: (value) {
            setState(() {
              controller.countryCodeController = value.dialCode!;
              print(controller.countryCodeController);
            });
          },
          initialSelection: controller.countryCodeController,
          showFlagMain: false,
          showFlagDialog: true,
          textStyle: TextStyle(fontSize: 16, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
        ),
                     
                    ),
                  ),
                ),
                 SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.additionalMobileNumberController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    labelText: 'additional_mobile'.tr,
                    hintText: 'additional_mobile'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    prefixIcon: Container(
                      // color: Colors.grey.withOpacity(0.8),
                     
                      child:  CountryCodePicker(
          onChanged: (value) {
            setState(() {
              controller.countryCodeController1 = value.dialCode!;
              print(controller.countryCodeController1);
            });
          },
          initialSelection: controller.countryCodeController1,
          showFlagMain: false,
          showFlagDialog: true,
          textStyle: TextStyle(fontSize: 16, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
        ),
                      
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.emailController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'email',
                    labelText: 'email',

                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    suffixIcon: Obx(()=>
                    controller.isEmailVerified.value == false
                        ? Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5.0, top: 8.0, bottom: 8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF134FAF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                child: Text(
                                  'sent_otp'.tr,
                                  style: TextStyle(fontFamily: "Raleway"),
                                ),
                                onPressed: () {
                                  print(flag);
                                  // print(controller.veri);
                                  print("111");
                                  controller.forgotEmailInput(context);
                                },
                              ),
                            ),
                          )
                        : Container(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 5.0, top: 8.0, bottom: 8.0),
                                child: Icon(
                                  Icons.verified_rounded,
                                  color: Color(0xFF134FAF),
                                )),
                          ),
                    ),  
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: email.value ?Colors.green:Colors.red )
                    // ),
                    // suffixIcon: Icon(Icons.done, color: email.value ?Colors.green:Colors.black ),

                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.email, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'password'.tr,
                    labelText: 'password'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.password, color: Color(0xFF134FAF)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF134FAF),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller.confirmPassowrdController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'confirm_password'.tr,
                    labelText: 'confirm_password'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.password, color: Color(0xFF134FAF)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF134FAF),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'Did you have referral code',
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Color(0xffEAF12D),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue40,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.ReferralCode = newValue1!;
                      controller.showTextField = controller.ReferralCode == 'Yes';
                    });
                  },
                  items: <String>['No', 'Yes']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Visibility(
                  visible: controller.showTextField,
                  child: TextFormField(
                    controller: controller.referalCodeController,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                    decoration: InputDecoration(
                      fillColor: Color(0xffEAF12D),
                      filled: true,
                      hintText: 'referal_code'.tr,
                      labelText: 'referal_code'.tr,
                      hintStyle: TextStyle(fontFamily: "Raleway"),
                      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5.0, top: 8.0, bottom: 8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF134FAF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                child: Text(
                                  'check'.tr,
                                  style: TextStyle(fontFamily: "Raleway"),
                                ),
                                onPressed: () {
                                  print("111");
                                  setState(() {
                                      _showDetails = !_showDetails;
                                  });
                                },
                              ),
                            ),
                          ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Color(0xFF134FAF)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:20),
                 Visibility(
          visible: _showDetails,
          child: FutureBuilder<Map<String, dynamic>>(
            future: controller.fetchBorkerDetailsPage(controller.referalCodeController.text),
       builder: (context, snapshot) {
            final users = snapshot.data.toString();
    
            // final user = users;
    
            print(users);
    
            // print(snapshot);
    
            if (snapshot.connectionState == ConnectionState.done) {
              // print(snapshot.data);
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child:  Center(
            child: Container(
                height: 80,
                width: 80,
                alignment: AlignmentDirectional.center,
                child: Lottie.asset(
                  "assets/loading/heart.json",
                )),
          ),);
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('some_error'.tr));
                } else {
                  print("snapshot.data");
                  print(snapshot.data);
                  return _buildProductCard(snapshot.data);
                }
            }
          }
          ),
        ),
              ],
            ),
          ),
        ),
        Step(
            state: controller.currentStep.value > 1
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep.value >= 1,
            title: Text(
              'Community Details',
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF134FAF)),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style:  TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'religion'.tr,
                      hintText: 'religion'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[2].filterOptions![1],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue2 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[2].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[2].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[2].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[2].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[2].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[2].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Religion").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                 SizedBox(
                  height: 30,
                ),
                 Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'caste'.tr,
                      hintText: 'caste'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[3].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue3 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[3].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[3].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[3].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[3].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[3].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[3].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Caste").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller1.SubCasteController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'sub_caste'.tr,
                    labelText: 'sub_caste'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    
                  ),
                ),
                 
                SizedBox(
                  height: 30,
                ),

                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'community'.tr,
                      hintText: 'community'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[4].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue5 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[4].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[4].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[4].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[4].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[4].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[4].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Community").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                
                SizedBox(
                  height: 30,
                ),
                 Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'mother_tongue'.tr,
                      hintText: 'mother_tongue'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[6].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue6 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[6].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[6].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[6].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[6].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[6].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[6].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "MotherTongue").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                
               
                
              ],
            )),
        Step(
            state: controller.currentStep.value > 2
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep.value >= 2,
            title: Text(
              'address_details'.tr,
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF134FAF)),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                      text: 'communication_address'.tr,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF134FAF)),
                    ))),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller2.DoorNoController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'door_no'.tr,
                    labelText: 'door_no'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller2.StreetController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'street'.tr,
                    labelText: 'street'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller2.AreaController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'area'.tr,
                    labelText: 'area'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CountryStateCityPicker(
                  country: controller2.Country1Controller,
                  state: controller2.State1Controller,
                  city: controller2.City1Controller,
                  distict: controller2.Disctrict1Controller,
                  // district: controller.nickNameController,4

                  textFieldInputBorder: OutlineInputBorder(
                    gapPadding: 20,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'nationality'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Color(0xffEAF12D),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue11,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue11 = newValue1!;
                     
                    });
                  },
                  items: <String>['Indian', 'American', 'United Arab Emirates']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'current_nationality'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Color(0xffEAF12D),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue36,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue36 = newValue1!;
                      
                    });
                  },
                  items: <String>['Indian', 'American', 'United Arab Emirates']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                      isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'resident_status'.tr,
                      hintText: 'resident_status'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[15].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue41 = newValue.options;
                      
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[15].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[15].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[15].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[15].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[15].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[15].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "ResidentStatus").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
               
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                                  onTap: (){
                                   var door = controller2.DoorNoController.text;
                                   var street = controller2.StreetController.text;
                                   var area = controller2.AreaController.text;
                                   var country = controller2.Country1Controller.text;
                                   var state = controller2.State1Controller.text;
                                   var district = controller2.Disctrict1Controller.text;
                                   var city = controller2.City1Controller.text;
                                   

                                   controller2.DoorNo1Controller.text = door;
                                   controller2.Street1Controller.text = street;
                                   controller2.Area1Controller.text = area;
                                   controller2.Country2Controller.text = country;
                                   controller2.State2Controller.text = state;
                                   controller2.Disctrict2Controller.text = district;
                                   controller2.City2Controller.text = city;
                                   
                                  }, 
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.all(5.0),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF134FAF),
                                      border: Border.all(color: Colors.grey, width: 1.5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "same",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                                        'same_address'.tr,
                                        style: TextStyle(
                                          fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black),
                                      ),
                  ],
                ),
                 SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                      text: 'permanent_address'.tr,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF134FAF)),
                    ))),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller2.DoorNo1Controller,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'door_no'.tr,
                    labelText: 'door_no'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller2.Street1Controller,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'street'.tr,
                    labelText: 'street'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller2.Area1Controller,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'area'.tr,
                    labelText: 'area'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CountryStateCityPicker(
                  country: controller2.Country2Controller,
                  state: controller2.State2Controller,
                  city: controller2.City2Controller,
                  distict: controller2.Disctrict2Controller,
                  // district: controller.nickNameController,4

                  textFieldInputBorder: OutlineInputBorder(
                    gapPadding: 20,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'nationality'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Color(0xffEAF12D),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue42,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue42 = newValue1!;
                    });
                  },
                  items: <String>['Indian', 'American', 'United Arab Emirates']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'current_nationality'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Color(0xffEAF12D),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue43,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue43 = newValue1!;
                    });
                  },
                  items: <String>['Indian', 'American', 'United Arab Emirates']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'resident_status'.tr,
                      hintText: 'resident_status'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[15].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue37 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[15].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[15].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[15].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[15].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[15].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[15].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "ResidentStatus").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                
              ],
            )),

        // ------------

        Step(
            state: controller.currentStep.value > 3
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep.value >= 3,
            title: Text(
              'personal_details'.tr,
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF134FAF)),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.HeightController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'height'.tr,
                    labelText: 'height'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.WeightController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'weight'.tr,
                    labelText: 'weight'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.HobbiesController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'hobbies'.tr,
                    labelText: 'hobbies'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'skin_tone'.tr,
                      hintText: 'skin_tone'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[8].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue17 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[8].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[8].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[8].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[8].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[8].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[8].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Skintone").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                 Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'diet'.tr,
                      hintText: 'diet'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[9].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue18 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[9].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[9].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[9].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[9].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[9].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[9].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Diet").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'martial_status'.tr,
                      hintText: 'martial_status'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[5].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue19 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[5].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[5].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[5].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[5].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[5].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[5].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Marital Status").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                 SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller3.NoChildernController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'no_of_child'.tr,
                    labelText: 'no_of_child'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: controller3.livingDetailsController,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                    decoration: InputDecoration(
                      fillColor: Color(0xffEAF12D),
                      filled: true,
                      hintText: 'living_with_details'.tr,
                      labelText: 'living_with_details'.tr,
                      hintStyle: TextStyle(fontFamily: "Raleway"),
                      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Color(0xFF134FAF)),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'drinking'.tr,
                      hintText: 'drinking'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[19].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue38 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[19].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[19].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[19].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[19].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[19].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[19].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Drinking").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'smoking'.tr,
                      hintText: 'smoking'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[20].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue39 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[20].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[20].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[20].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[20].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[20].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[20].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Smoking").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'physical_status'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Color(0xffEAF12D),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller.dropdownValue40,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller.dropdownValue40 = newValue1!;
                      controller3.showTextField = controller.dropdownValue40 == 'Yes';
                    });
                  },
                  items: <String>['No', 'Yes']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                
                 SizedBox(
                  height: 30,
                ),
                Visibility(
                    visible: controller3.showTextField,
                    
                    child: TextFormField(
                      controller: controller3.physicalStatusController,
                      style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                      decoration: InputDecoration(
                        fillColor: Color(0xffEAF12D),
                        filled: true,
                        hintText: 'physical_status_detalis'.tr,
                        labelText: 'physical_status_detalis'.tr,
                        hintStyle: TextStyle(fontFamily: "Raleway"),
                        labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20, right: 15),
                          child: Icon(Icons.people, color: Color(0xFF134FAF)),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: controller3.otherLanguagesController,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                    decoration: InputDecoration(
                      fillColor: Color(0xffEAF12D),
                      filled: true,
                      hintText: 'other_languages'.tr,
                      labelText: 'other_languages'.tr,
                      hintStyle: TextStyle(fontFamily: "Raleway"),
                      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Color(0xFF134FAF)),
                      ),
                    ),
                  ),
                 
              ],
            )),

        Step(
            state: controller.currentStep.value > 4
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep.value >= 4,
            title: Text(
              'carrier_details'.tr,
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF134FAF)),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
               
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'education_qual'.tr,
                      hintText: 'education_qual'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[10].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue20 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[10].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[10].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[10].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[10].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[10].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[10].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Education").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                 SizedBox(
                  height: 30,
                ),
               TextFormField(
                  controller: controller4.educationDetailsController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'education_details'.tr,
                    labelText: 'education_details'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
               
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'occupation'.tr,
                      hintText:  'occupation'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[23].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue45 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[23].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[23].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[23].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[23].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[23].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[23].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "occupation").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'working_in'.tr,
                      hintText:  'working_in'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[17].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue46 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[17].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[17].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[17].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[17].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[17].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[17].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Working In").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
              //  TextFormField(
              //     controller: controller4.WorkingInController,
              //     style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
              //     decoration: InputDecoration(
              //       fillColor: Color(0xffEAF12D),
              //       filled: true,
              //       hintText: 'working_in'.tr,
              //       labelText: 'working_in'.tr,
              //       hintStyle: TextStyle(fontFamily: "Raleway"),
              //       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       prefixIcon: Padding(
              //         padding: EdgeInsets.only(left: 20, right: 15),
              //         child: Icon(Icons.people, color: Color(0xFF134FAF)),
              //       ),
              //     ),
              //   ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller4.WorkingAsController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'working_as'.tr,
                    labelText: 'working_as'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller4.CompanydetailsController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'company_details'.tr,
                    labelText: 'company_details'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 30,
                ),
               TextFormField(
                  controller: controller4.WorkingDetailsController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'working_details'.tr,
                    labelText: 'working_details'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller4.AnnualIcome,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'annual_income'.tr,
                    labelText: 'annual_income'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
              ],
            )),

        Step(
            state: controller.currentStep.value > 5
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep.value >= 5,
            title: Text(
              'jathagam_details'.tr,
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF134FAF)),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'rasi'.tr,
                      hintText: 'rasi'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[11].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue22 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[11].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[11].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[11].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[11].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[11].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[11].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Rasi").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
               Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'nactchathiram'.tr,
                      hintText: 'nactchathiram'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[13].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue23 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[13].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[13].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[13].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[13].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[13].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[13].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Natchathiram").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'laknam'.tr,
                      hintText: 'laknam'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Color(0xffEAF12D),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList.value[12].filterOptions![0],
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller.dropdownValue24 = newValue.options;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[12].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[12].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[12].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[12].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[12].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[12].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Laknam").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller5.GothramController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'gothram'.tr,
                    labelText: 'gothram'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller5.KuladeivamController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'kuladeivam'.tr,
                    labelText: 'kuladeivam'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                
                SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'dosham'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Color(0xffEAF12D),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller5.Dosham,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller5.Dosham = newValue1!;
                      controller5.showTextField = controller5.Dosham == 'Yes';
                    });
                  },
                  items: <String>['No', 'Yes']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
               SizedBox(
                  height: 30,
                ),
                Visibility(
                  visible: controller5.showTextField,
                  child: TextFormField(
                    controller: controller5.DoshamDetailsController,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                    decoration: InputDecoration(
                      fillColor: Color(0xffEAF12D),
                      filled: true,
                      hintText: 'dosham_details'.tr,
                      labelText: 'dosham_details'.tr,
                      hintStyle: TextStyle(fontFamily: "Raleway"),
                      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Color(0xFF134FAF)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CountryStateCityPicker1(
                  country: controller5.placebirthcountryController,
                  state: controller5.placebirthstateController,
                  // city: controller5.placebirthcityController,
                  distict: controller5.placebirthcityController,

                  textFieldInputBorder: OutlineInputBorder(
                    gapPadding: 20,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ), 
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller5.timebirthController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                   readOnly: true,
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      print(pickedTime
                                          .format(context)); //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
                                      //converting to DateTime so that we can further format on different pattern.
                                      print(
                                          parsedTime); //output 1970-01-01 22:53:00.000
                                      String formattedTime =
                                          DateFormat('HH:mm:ss')
                                              .format(parsedTime);
                                      print(formattedTime); //output 14:59:00
                                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                                      setState(() {
                                        controller5.timebirthController.text =
                                            pickedTime.format(
                                                context); //set the value of text field.
                                      });
                                    } else {
                                      print("Time is not selected");
                                    }
                                  },
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'time_birth'.tr,
                    labelText: 'time_birth'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
              ],
            )),

        Step(
            isActive: controller.currentStep.value >= 6,
            title: Text(
              'family_details'.tr,
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF134FAF)),
            ),
            content: Column(
              children: [
                
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.FatherNameController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'father_name'.tr,
                    labelText: 'father_name'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.FatherOccupationController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'father_occupation'.tr,
                    labelText: 'father_occupation'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.MotherNameController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'mother_name'.tr,
                    labelText: 'mother_name'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.MotherOccupationController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'mother_occupation'.tr,
                    labelText: 'mother_occupation'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.NoBrotherController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'no_bro'.tr,
                    labelText: 'no_bro'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.NoBrotherMarriedController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'no_bro_married'.tr,
                    labelText: 'no_bro_married'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.NoSisterController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'no_sis'.tr,
                    labelText: 'no_sis'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
               TextFormField(
                  controller: controller6.NoSisterMarriedController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'no_sis_married'.tr,
                    labelText: 'no_sis_married'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.ownVechileController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'own_vechile'.tr,
                    labelText: 'own_vechile'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.ownHouseController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'own_house'.tr,
                    labelText: 'own_house'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.ownLandsController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'own_lands'.tr,
                    labelText: 'own_lands'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.ownFlatsController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'own_flats'.tr,
                    labelText: 'own_flats'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.aboutMeController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'about_me'.tr,
                    labelText: 'about_me'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.AboutFamilyController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'about_family'.tr,
                    labelText: 'about_family'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: controller6.ExpectationController,
                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                  decoration: InputDecoration(
                    fillColor: Color(0xffEAF12D),
                    filled: true,
                    hintText: 'expectation'.tr,
                    labelText: 'expectation'.tr,
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.people, color: Color(0xFF134FAF)),
                    ),
                  ),
                ),
                 
              ],
            )),
      ];
       Widget _buildProductCard(product) {
        
        return Card(
                                              elevation: 50,
                                              // shadowColor: Colors.white,
                                              color: Color(0xFF134FAF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: SizedBox(
                                                width: 380,
                                                height: 240,
                                                child: 
                                                    Row(
                                                      
                                                      children: [
                                                        if(product['status'] == 200)...[
                                                          Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets.only(
                                                                        
                                                                        right: 5, top: 28),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment.topLeft,
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        height: 130,
                                                                        width: 100,
                                                                        child: ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius
                                                                                  .circular(
                                                                                      29),
                                                                          child: Image(
                                                                            image: NetworkImage(
                                                                                "https://www.linkpicture.com/q/imgUrl-1679487773014-1.jpg"),
                                                                            fit: BoxFit
                                                                                .cover,
                                                                            width: 100,
                                                                            height: 130,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 6,
                                                                      ),
                                                                      Align(
                                                                        alignment: Alignment
                                                                            .centerLeft,
                                                                        child: Padding(
                                                                          padding:
                                                                              const EdgeInsets
                                                                                      .only(
                                                                                  left:
                                                                                      25),
                                                                          child: Row(
                                                                            children: [
                                                                              Icon(
                                                                                Icons
                                                                                    .verified_rounded,
                                                                                color: Colors
                                                                                    .green,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 6,
                                                                              ),
                                                                              Text(
                                                                                'verified'.tr,
                                                                                style: TextStyle(
                                                                                    fontSize:
                                                                                        13,
                                                                                    fontWeight:
                                                                                        FontWeight
                                                                                            .bold,
                                                                                    fontFamily:
                                                                                        "Raleway",
                                                                                    color: Colors
                                                                                        .white),
                                                                              ),
                                                            
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          
                                                        Expanded(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 35),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                                  "${product['data']['personal_details']['first_name']} ${product['data']['personal_details']['last_name']}",
                                                                                  style: TextStyle(
                                                                                      fontSize:
                                                                                          15,
                                                                                      fontWeight:
                                                                                          FontWeight
                                                                                              .bold,
                                                                                      fontFamily:
                                                                                          "Raleway",
                                                                                      color: Colors
                                                                                          .white),
                                                                                ),
                                                                                SizedBox(height: 8,),
                                                                                Text(
                                                                                  "ID - QWERTY123",
                                                                                  style: TextStyle(
                                                                                      fontSize:
                                                                                          15,
                                                                                      fontWeight:
                                                                                          FontWeight
                                                                                              .bold,
                                                                                      fontFamily:
                                                                                          "Raleway",
                                                                                      color: Colors
                                                                                          .white),
                                                                                ),
                                                                                SizedBox(height: 8,),
                                                                                Text(
                                                                                  "8940284208",
                                                                                  style: TextStyle(
                                                                                      fontSize:
                                                                                          15,
                                                                                      fontWeight:
                                                                                          FontWeight
                                                                                              .bold,
                                                                                      fontFamily:
                                                                                          "Raleway",
                                                                                      color: Colors
                                                                                          .white),
                                                                                ),
                                                                                SizedBox(height: 8,),
                                                                                Text(
                                                                                  "35/17, Gandhiji Street",
                                                                                  style: TextStyle(
                                                                                      fontSize:
                                                                                          15,
                                                                                      fontWeight:
                                                                                          FontWeight
                                                                                              .bold,
                                                                                      fontFamily:
                                                                                          "Raleway",
                                                                                      color: Colors
                                                                                          .white),
                                                                                ),
                                                                                SizedBox(height: 8,),
                                                                                Text(
                                                                                  "Thirumangalam, Maduari",
                                                                                  style: TextStyle(
                                                                                      fontSize:
                                                                                          15,
                                                                                      fontWeight:
                                                                                          FontWeight
                                                                                              .bold,
                                                                                      fontFamily:
                                                                                          "Raleway",
                                                                                      color: Colors
                                                                                          .white),
                                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        ]else if(product['status'] == 410)...[
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 45),
                                                            child: Center(
                                                                child: Text(
                                                                                      "Broker not found \n             or              \n Check the code",
                                                                                      style: TextStyle(
                                                                                          fontSize:
                                                                                              25,
                                                                                          fontWeight:
                                                                                              FontWeight
                                                                                                  .bold,
                                                                                          fontFamily:
                                                                                              "Raleway",
                                                                                          color: Colors
                                                                                              .white),
                                                                                    ),
                                                              ),
                                                          ), 
                                                        ]else...[
                                                         Padding(
                                                            padding: const EdgeInsets.only(left: 45),
                                                            child: Center(
                                                                child: Text(
                                                                                      "Broker not found \n             or              \n Check the code",
                                                                                      style: TextStyle(
                                                                                          fontSize:
                                                                                              25,
                                                                                          fontWeight:
                                                                                              FontWeight
                                                                                                  .bold,
                                                                                          fontFamily:
                                                                                              "Raleway",
                                                                                          color: Colors
                                                                                              .white),
                                                                                    ),
                                                              ),
                                                          ), 
                                                        ],
                                                             
                                                         
                                                      ],
                                                    ),
                                                    
                                                 ));
       }
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

