import 'dart:async';
import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:thirumanam/controller/package_controller.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/models/payment_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:thirumanam/models/wishList_model.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_dimen.dart';
import 'package:thirumanam/resources/app_font.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';
import 'package:thirumanam/widget/search_recevied.dart';
import 'package:http/http.dart' as http;
import '../../controller/dashboard_controller.dart';
import '../../controller/search_detailed_filter_controller.dart';
import '../../resources/app_colors.dart';
import '../../utils/api_config.dart';
import 'package:lottie/lottie.dart';

class UpdateApp extends StatefulWidget {
   @override
  UpdateAppState createState() => UpdateAppState();
}

class UpdateAppState extends State<UpdateApp> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body:  Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*4/7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF134FAF), Colors.black],
                  ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/7.7),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white.withOpacity(0.9)
              ),
            ),
            Positioned(
              top: 20,
              left: 5,
              child: Row(
                children: [
                  IconButton(
                    onPressed:()=> Navigator.pop(context),
                                icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 25,),
                  ),
                   Text(
                'Update App',
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
              ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                
        child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                            height: 600,
                            width: 600,
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Lottie.asset(
                                    "assets/loading/updateapp.json",
                                  ),
                                ),
                                Text("Update the app for more features", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black, fontSize: 20),),
                                
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Expanded(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                              textDirection: TextDirection.ltr,
                                              maxLines: 10,
                                      "Please update app version ", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.grey, fontSize: 17),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: InkWell(
      onTap: () {
        
        
      },
      child: Row(
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(vertical: 13),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF134FAF), width: 2),
              color: Colors.white
            ),
            child: Text(
              'Update App',
              style: TextStyle(fontSize: 20, color: Color(0xFF134FAF)),
            ),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(vertical: 13),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xFF134FAF), width: 2),
              color: Colors.white
            ),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 20, color: Color(0xFF134FAF)),
            ),
          ),
        ],
      ),
    ),
                                ),
                              ],
                            )
                            
                            ),
                            
                ),
        
        
      ),
            )
          ],
        ),
      );
      
    
    
  }
 
}