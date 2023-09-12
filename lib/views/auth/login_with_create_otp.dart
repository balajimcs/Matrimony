import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:thirumanam/controller/login_with_sent_controller.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/views/forgot%20password/verify_passowrd_otp.dart';
import 'package:validators/validators.dart';

import '../../controller/forgot_otp_controller.dart';
import '../../widget/quardentic_curve.dart';

class LoginWithCreateOtp extends StatefulWidget {
  const LoginWithCreateOtp({super.key});

  @override
  State<LoginWithCreateOtp> createState() => LoginWithCreateOtpState();
}

class LoginWithCreateOtpState extends State<LoginWithCreateOtp> {
  final controller = Get.find<LoginWithOtpController>();

  RegExp _email_phone = new RegExp(r'^(?:\d{10}|\w+@\w+\.\w{2,3})$');
  bool isEmailandPhone(String str) {
    return _email_phone.hasMatch(str);
  }

  bool isEmailCorrect = false;

  String mobileNumber = '';
  String verify = "LOGIN";
  bool enableBtn = false;
  bool isAPIcallProcess = false;

  @override
  void initState() {
    super.initState();
    mobileNumber = '';
    verify = "LOGIN";
  }

  @override
  Widget build(BuildContext context) {
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
                                          right: 200, top: 10, left: 30),
                                      child: Text('login_otp'.tr,
                                          style: GoogleFonts.nunito(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                                  color: Color(0xFF134FAF),
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700))),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 300),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10, top: 30),
                                          child: Text(
                                              'login_otp_content'.tr,
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
                                                style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                                controller:
                                                    controller.mobileController,
                                                decoration: InputDecoration(
                                                  fillColor: Color(0xffEAF12D),
                                                  filled: true,
                                                  hintText: 'email_phoneNo'.tr,
                                                  labelText: 'email_phoneNo'.tr,
                                                   hintStyle: TextStyle(fontFamily: "Raleway",),
                                                labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 3),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                                  suffixIcon: controller
                                                              .isEmailCorrect ==
                                                          false
                                                      ? Icon(
                                                          Icons.close_sharp,
                                                          color: Colors.red,
                                                        )
                                                      : controller.isEmailCorrect ==
                                                              "true"
                                                          ? Icon(
                                                              Icons.done,
                                                              color: Colors.green,
                                                            )
                                                          : Container(
                                                              width: 0,
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
                                                maxLines: 1,
                                                // maxLength: 10,
                                                style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                                controller:
                                                    controller.customerController,
                                                decoration: InputDecoration(
                                                  fillColor: Color(0xffEAF12D),
                                                  filled: true,
                                                  hintText: 'Customer Id',
                                                  labelText: 'Customer Id',
                                                   hintStyle: TextStyle(fontFamily: "Raleway",),
                                                labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 3),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                                  suffixIcon: controller
                                                              .isEmailCorrect ==
                                                          false
                                                      ? Icon(
                                                          Icons.close_sharp,
                                                          color: Colors.red,
                                                        )
                                                      : controller.isEmailCorrect ==
                                                              "true"
                                                          ? Icon(
                                                              Icons.done,
                                                              color: Colors.green,
                                                            )
                                                          : Container(
                                                              width: 0,
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
                                                height: 40,
                                              ),
                                              Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .checkInput(context);
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 15),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25)),
                                                        
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [Color(0xFF134FAF),Color(0xFF134FAF)])),
                                                    child: Text(
                                                      'submit'.tr,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                
                                                // child: FormHelper.submitButton(
                                                //   "Continue",
                                                //   () async {
                                                //     if (enableBtn && mobileNumber.length > 8) {
                                                //       setState(() {
                                                //         isAPIcallProcess = true;
                                                //       });
                
                                                //       ForgotOtpController.otpLogin(mobileNumber, verify).then((response) async {
                                                //         setState(() {
                                                //           isAPIcallProcess = false;
                                                //         });
                
                                                //         if (response.data != null) {
                
                                                //           Navigator.pushAndRemoveUntil(
                                                //             context,
                                                //             MaterialPageRoute(
                                                //               builder: (context) => VerifyPassowrdOtp(
                                                //                 mobileNo: mobileNumber,
                                                //               ),
                                                //             ),
                                                //             (route) => false,
                                                //           );
                                                //         }
                                                //       });
                                                //     }
                                                //   },
                                                //   btnColor: Color(0xfff7892b),
                                                //   borderColor: Color(0xfff7892b),
                                                //   // borderColor: HexColor("#78D0B1"),
                                                //   txtColor: Colors.white,
                                                //   borderRadius: 20,
                                                // ),
                                              ),
                                            ],
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
