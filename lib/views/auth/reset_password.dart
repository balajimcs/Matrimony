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
import 'package:thirumanam/controller/reset_password_controller.dart';
import 'package:validators/validators.dart';

import '../../widget/quardentic_curve.dart';
import '../auth/login_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  RegExp _email_phone = new RegExp(r'^(?:\d{10}|\w+@\w+\.\w{2,3})$');
  bool isEmailandPhone(String str) {
    return _email_phone.hasMatch(str);
  }

  bool isEmailCorrect = false;
  bool _secureText = true;
  bool? remember = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
final controller = Get.find<ResetpasswordController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"),
                  fit: BoxFit.cover)),
          child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RotatedBox(
                quarterTurns: -2,
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
                          color: Colors.white,
                          height: 630,
                        ),
                      ),
                    ),

                    ClipPath(
                      //upper clippath with less height
                      clipper: WaveClipper(), //set our custom wave clipper.
                      child: Container(
                        padding: EdgeInsets.only(bottom: 50),
                        color: Colors.white,
                        height: 610,
                        alignment: Alignment.center,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 250),
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    child: StepProgressIndicator(
                                      totalSteps: 10,
                                      currentStep: 6,
                                      selectedColor: Colors.grey,
                                      unselectedColor: Colors.blue,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: 200, bottom: 50, left: 30),
                                    child: Text('reset_password'.tr,
                                        style: GoogleFonts.nunito(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700))),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 300),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: Text(
                                            'reset_content'.tr,
                                            style: GoogleFonts.nunito(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 25),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              obscureText: _secureText,
                                              controller: controller.oldPassowrdController,
                                              //     validator: (e) {
                                              //   if (e!.isEmpty) {
                                              //     return "Password Can't be Empty";
                                              //   }
                                              // },
                                              // obscureText: _secureText,
                                              // onSaved: (e) => password = e!,
                                              // style: TextStyle(),

                                              decoration: InputDecoration(
                                                fillColor: Colors.grey.shade100,
                                                filled: true,
                                                hintText: "OldPassword",
                                                labelText: "OldPassword",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, right: 15),
                                                  child: Icon(Icons.password,
                                                      color: Colors.black),
                                                ),
                                                
                                                suffixIcon: IconButton(
                                                  onPressed: showHide,
                                                  icon: Icon(_secureText
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextFormField(
                                              obscureText: _secureText,
                                              controller: controller.passowrdController,
                                              //     validator: (e) {
                                              //   if (e!.isEmpty) {
                                              //     return "Password Can't be Empty";
                                              //   }
                                              // },
                                              // obscureText: _secureText,
                                              // onSaved: (e) => password = e!,
                                              style: TextStyle(),

                                              decoration: InputDecoration(
                                                fillColor: Colors.grey.shade100,
                                                filled: true,
                                                hintText: "Password",
                                                labelText: "Password",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, right: 15),
                                                  child: Icon(Icons.password,
                                                      color: Colors.black),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: showHide,
                                                  icon: Icon(_secureText
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextFormField(
                                              obscureText: _secureText,
                                              controller: controller.conformPasswordController,
                                              //     validator: (e) {
                                              //   if (e!.isEmpty) {
                                              //     return "Password Can't be Empty";
                                              //   }
                                              // },
                                              // obscureText: _secureText,
                                              // onSaved: (e) => password = e!,
                                              style: TextStyle(),

                                              decoration: InputDecoration(
                                                fillColor: Colors.grey.shade100,
                                                filled: true,
                                                hintText: "Confirm Password",
                                                labelText: "Confirm Password",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, right: 15),
                                                  child: Icon(Icons.password,
                                                      color: Colors.black),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: showHide,
                                                  icon: Icon(_secureText
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
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
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade200,
                                                      offset: Offset(2, 4),
                                                      blurRadius: 5,
                                                      spreadRadius: 2)
                                                ],
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Color(0xfffbb448),
                                                      Color(0xfff7892b)
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
    );
  }
}
