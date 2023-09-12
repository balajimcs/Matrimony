import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thirumanam/controller/change_password_controller.dart';
import 'package:validators/validators.dart';

import '../../widget/quardentic_curve.dart';
import '../auth/login_page.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePassword> {
  RegExp _email_phone = new RegExp(r'^(?:\d{10}|\w+@\w+\.\w{2,3})$');
  bool isEmailandPhone(String str) {
    return _email_phone.hasMatch(str);
  }

  bool isEmailCorrect = false;
  bool _secureText = true;
  bool _secureText1 = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
      _secureText1 = !_secureText1;
    });
  }
final controller = Get.find<ChangepasswordController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/Group 10.png'),
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
                              Navigator.pop(context);
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
                                      padding: EdgeInsets.only(
                                          right: 200, bottom: 50, left: 30),
                                      child: Text('change_password'.tr,
                                          style: GoogleFonts.nunito(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                                  color: Color(0xFF134FAF),
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700))),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 250),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Text(
                                              'change_content'.tr,
                                              style: GoogleFonts.nunito(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                      color: Color(0xFF134FAF),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 25),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                maxLines: 1,
                                                // maxLength: 10,
                                                controller:controller.controller.mobileController,
                                                style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                                decoration: InputDecoration(
                                                  fillColor: Color(0xffEAF12D),
                                                  filled: true,
                                                  hintText: 'email_phoneNo'.tr,
                                                  labelText: 'email_phoneNo'.tr,
                                                  
                                                 hintStyle: TextStyle(fontFamily: "Raleway",),
                                              labelStyle: TextStyle(fontFamily: "Raleway",fontSize: 19,color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
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
                                                    child: Icon(
                                                        Icons.verified_outlined,
                                                        color: Color(0xFF134FAF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              TextFormField(
                                                controller: controller.passowrdController,
                                                style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                                //     validator: (e) {
                                                //   if (e!.isEmpty) {
                                                //     return "Password Can't be Empty";
                                                //   }
                                                // },
                                                // obscureText: _secureText,
                                                // onSaved: (e) => password = e!,
                                            
                                                    obscureText: _secureText,
                                                decoration: InputDecoration(
                                                  fillColor: Color(0xffEAF12D),
                                                  filled: true,
                                                  hintText: 'password'.tr,
                                                  labelText: 'password'.tr,
                                                  hintStyle: TextStyle(fontFamily: "Raleway",),
                                              labelStyle: TextStyle(fontFamily: "Raleway",fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
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
                                              SizedBox(
                                                height: 30,
                                              ),
                                              TextFormField(
                                                controller: controller.conformPasswordController,
                                                //     validator: (e) {
                                                //   if (e!.isEmpty) {
                                                //     return "Password Can't be Empty";
                                                //   }
                                                // },
                                                // obscureText: _secureText,
                                                // onSaved: (e) => password = e!,
                                              style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                                  obscureText: _secureText1,
                                                decoration: InputDecoration(
                                                  fillColor: Color(0xffEAF12D),
                                                  filled: true,
                                                  hintText: 'confirm_password'.tr,
                                                  labelText: 'confirm_password'.tr,
                                                  hintStyle: TextStyle(fontFamily: "Raleway",),
                                              labelStyle: TextStyle(fontFamily: "Raleway",fontSize: 19,color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
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
                          icon: Icon(_secureText1
                              ? Icons.visibility_off
                              : Icons.visibility, color: Color(0xFF134FAF),),
                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(60.0),
                                          child: InkWell(
                                            onTap: () {
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
                                                  
                                                  gradient: LinearGradient(
                                                      begin: Alignment.centerLeft,
                                                      end: Alignment.centerRight,
                                                      colors: [
                                                        Color(0xFF134FAF),
                                                        Color(0xFF134FAF)
                                                      ])),
                                              child: Text(
                                                'submit'.tr,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
