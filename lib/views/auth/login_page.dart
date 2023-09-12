import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirumanam/app_localization.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/controller/register_controller.dart';
import 'package:validators/validators.dart';

import '../../widget/quardentic_curve.dart';

class LoginAuth extends StatefulWidget {
  @override
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final List<String> languages = ['english', 'tamil'];
  final controller = Get.find<RegisterController>();
  final controller1 = Get.find<LocalizationService>();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  void buttonPressed() {
  // Log button press event
  analytics.logEvent(
    name: 'Tamilvivaham',
    parameters: {
      'button_id': 'Tamilvivaham',
    },
  );
}

  final _key = new GlobalKey<FormState>();
   bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  check() {

  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          
         decoration: BoxDecoration(
              image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/Group 3.png'),
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
                      
                      // Text("data", style: TextStyle(color: Colors.black, fontSize: 20),),
                      // Image(image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"), width: 10,),
                      Container(
                        color: Colors.black,
                        width: 10,
                        height: 10,
                      ),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              SystemNavigator.pop();
                            },
                           child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 0, top: 10, bottom: 10),
                                    child: Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                
                      //stack overlaps widgets
                      Opacity(
                        //semi red clippath with more height and with 0.5 opacity
                        opacity: 0.5,
                        child: ClipPath(
                          clipper: WaveClipper(), //set our custom wave clipper
                          child: Container(
                            color: Color(0xffEAF12D),
                            height: 630,
                          ),
                        ),
                      ),
                
                      ClipPath(
                        //upper clippath with less height
                        clipper: WaveClipper(), //set our custom wave clipper.
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
                                              SizedBox(width: 170,),
                                              SizedBox(
                                            height: 70,
                                            width: 160,
                                            child: DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Language',
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
                        padding: EdgeInsets.only(left: 3, right: 3),
                        child: Icon(Icons.language, color: Color(0xFF134FAF)),
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
                    value: Get.locale?.languageCode,
                    onChanged: (lang) async {
                      controller1.changeLocale(lang!);
                    },
                    items: languages.map<DropdownMenuItem<String>>((String lang) {
                      return DropdownMenuItem(
                       value: lang,
      child: Text(lang.toUpperCase()),
                      );
                    }).toList(),
                  ),
                                          ),
                                    ],
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 25,left: 22),
                                      child: SingleChildScrollView(
                                        child: Row(
                                          children: [
                                            Text('login'.tr,
                                               style: TextStyle(color: Color(0xFF134FAF) ,fontFamily: "Raleway", fontSize: 30, fontWeight: FontWeight.bold),),
                                                    SizedBox(width: 10,),
                                                    Image.asset(("assets/images/2029711.png"),width: 30, height: 30, color: Color(0xFF134FAF)),
                                          
                                          
//                                           DropdownButton   (
//                                             icon: Icon(Icons.language),
//       //                                       decoration: InputDecoration(
//       //   prefixIcon: Icon(Icons.language),
//       //   border: OutlineInputBorder(
//       //     borderSide: BorderSide(
//       //       color: Colors.grey.shade400,
//       //       width: 1.0,
//       //     ),
//       //   ),
//       // ),
//   value: Get.locale?.languageCode,
//   onChanged: (lang) => controller1.changeLocale(lang!),
//   items: languages.map<DropdownMenuItem<String>>((String lang) {
//     return DropdownMenuItem<String>(
//       value: lang,
//       child: Text(lang.toUpperCase()),
//     );
//   }).toList(),
// ),
                                          ],
                                          
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 10, top: 20),
                                    child: Form(
                                      key: _key,
                                      child: Column(
                                        children: [
                                          TextField(
                                           controller: controller.emailController,
                                            style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                            decoration: InputDecoration(
                                              
                                              hintText: 'customer_id'.tr,
                                              labelText: 'customer_id'.tr,
                                              hintStyle: TextStyle(fontFamily: "Raleway",),
                                              labelStyle: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 19),      
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(width: 1.5),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 3),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              // contentPadding:
                                              // const EdgeInsetsDirectional.only(
                                              //     start: 20, end: 10),
                                              // suffixIcon: controller.isEmailCorrect == "false"
                                              //     ? Icon(
                                              //         Icons.close_sharp,
                                              //         color: Colors.red,
                                              //       )
                                              //     :  controller.isEmailCorrect == "true"?
                                              //         Icon(
                                              //         Icons.done,
                                              //         color: Colors.green,
                                              //       ) : Container(width: 0,),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, right: 15),
                                                child: Icon(Icons.login_rounded,
                                                    color: Color(0xFF134FAF)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          TextField(
                                            controller: controller.passwordController,
                                            style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                            obscureText: _secureText,
                                            decoration: InputDecoration(
                                              hintText: 'password'.tr,
                                              labelText: 'password'.tr,
                                              hintStyle: TextStyle(fontFamily: "Raleway",),
                                              labelStyle: TextStyle(color: Color(0xFF134FAF),fontFamily: "Raleway", fontSize: 19),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 1.5),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xFF134FAF), width: 3),
                                                  
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, right: 15),
                                                child: Icon(Icons.password,
                                                    color: Color(0xFF134FAF)),
                                              ),
                                              suffixIcon: IconButton(
                          onPressed: showHide,
                          icon: Icon(_secureText
                              ? Icons.visibility_off
                              : Icons.visibility, color: Color(0xFF134FAF),),
                        ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          InkWell(
                                            onTap: () {
                                              buttonPressed();
                                              controller.checkInput(context);
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(25)),
                                                  boxShadow: <BoxShadow>[
                                                   
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin: Alignment.centerLeft,
                                                      end: Alignment.centerRight,
                                                      colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                                              child: Text(
                                                'login'.tr,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white, fontFamily: "Raleway",),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                               Get.toNamed(RouteNames.forgotPassword);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              alignment: Alignment.centerRight,
                                              child: Text('fog_password'.tr,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Raleway",
                                                      fontWeight: FontWeight.w500)),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                    child: Divider(
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                ),
                                                Text('or', style: TextStyle(fontFamily: "Raleway",),),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                    child: Divider(
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(RouteNames.register);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              padding: EdgeInsets.all(7),
                                              alignment: Alignment.bottomCenter,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'don\'t_have_acc'.tr,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Raleway",),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'register'.tr,
                                                    style: TextStyle(
                                                        color: Color(0xFF134FAF),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600, fontFamily: "Raleway",),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                           Container(
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                    child: Divider(
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                ),
                                                Text('or'),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                    child: Divider(
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:18),
                                            child: InkWell(
                                              onTap: () {
                                                Get.toNamed(RouteNames.loginwithotp);
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'login_with_otp'.tr,
                                                      style: TextStyle(
                                                        color: Color(0xFF134FAF),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600, fontFamily: "Raleway",),
                                                    ),
                                                    
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          
                                        ],
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
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
