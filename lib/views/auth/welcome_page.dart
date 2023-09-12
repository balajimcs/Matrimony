
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../controller/update_app_controller.dart';
import '../../utils/api_config.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // final controller = Get.find<UpdateAppController>();
  @override
  void initState(){
    checkVersion();
    // controller.getProfile();
    super.initState();
  }
  
    
      

    
  
  
   void checkVersion() async {
     http.get(
      RestApiClient().updateApp
    ).then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("getupdate Response: ${res.toString()}");
      if (res != null) {
        print(res['data']['check_error']);
      print(res['data']['button_one']);
      print(res['data']['button_two']);
      print(res['data']['button_one_name']);
      print(res['data']['button_two_name']);
      print(res['data']['Title']);
      print(res['data']['Message']);
        if(res['data']['check_error'] == true){
      print("deva");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          
           barrierDismissible: false, 
          context: context,
          builder: (BuildContext context) {
            
            return GestureDetector(
                onTap: (){
            
                },
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                  title: Text('${res['data']['Title']}' ,style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18)),
                  content: Text('${res['data']['Message']}' ,style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 14)),
                  actions: [
                   Container(
                    
                      child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                                height: 500,
                                width: 600,
                                alignment: AlignmentDirectional.center,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Lottie.asset(
                                        "assets/loading/updateapp.json",
                                      ),
                                    ),
                                    
                                    
                                   
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30, left: 35),
                                      child:  Row(
                        children: [
                          if(res['data']['button_one'] == true)...[
                            Center(
                              child: InkWell(
                              onTap: (){
                                Get.back();
                                // launchPlayStore(value.appURL.toString());
                              },
                              child: Center(
                                child: Container(
                                            width: 100,
                                            padding: EdgeInsets.symmetric(vertical: 13),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              border: Border.all(color: Color(0xFF134FAF), width: 2),
                                              color: Colors.white
                                            ),
                                            child: Text(
                                              '${res['data']['button_one_name']}',style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 15),
                                            ),
                                ),
                              ),
                          ),
                            ),
                          ]else...[
                            Container(),
                          ],
                          
                          SizedBox(width: 30,),
                          if(res['data']['button_two'] == true)...[
                            InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Center(
                              child: Container(
                                          width: 100,
                                          padding: EdgeInsets.symmetric(vertical: 13),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            border: Border.all(color: Color(0xFF134FAF), width: 2),
                                            color: Colors.white
                                          ),
                                          child: Text(
                                            '${res['data']['button_two_name']}',style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 15),
                                          ),
                              ),
                            ),
                          ),
                          ]else...[
                            Container(),
                          ],
                          
                        ],
                      ),
                    ),
                  
                                    
                                  ],
                                )
                                
                                ),
                                
                    ),
                      
                      
                    ),
                  ],
                ),
              );
          },
          
      );
      });
      
  
    }else{
      print("TamilViavaham");
    }


      }});
    
    
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.login);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFF134FAF)),
        child: Text(
          'login'.tr,
          style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: "Raleway",),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.register);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          
          color: Colors.white
        ),
        child: Text(
          'reg_Now'.tr,
          style: TextStyle(fontSize: 20, color: Color(0xFF134FAF),fontFamily: "Raleway",),
        ),
      ),
    );
  }

  
  Widget _title() {
    return Container(
      height: 250,
      width: 250,
      child: Image.asset('assets/images/Group 159.png'
      
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SingleChildScrollView(
        child:Container(
          
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            
            decoration: BoxDecoration(
              gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      Colors.blueGrey,
    ],
  ),
              image: DecorationImage(
                image: new AssetImage("assets/images/eee.jpg"),
              fit: BoxFit.cover,
               colorFilter: ColorFilter.mode(
      Colors.black,
      
      BlendMode.overlay,
    ),
   
              ),
              
            ),
            child: Column(
              
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 130, top: 200),
                  child: Align(
                    
                    child: _title()),
                ),
                SizedBox(
                  height: 80,
                ),
                _submitButton(),
                SizedBox(
                  height: 20,
                ),
                _signUpButton(),
                SizedBox(
                  height: 20,
                ),
                // _label()
              ],
            ),
          ),
      ),
    );
  }
}