import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/controller/update_controllers/profile_controller.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';
import 'package:thirumanam/views/profile_user/profile_menu.dart';
import 'package:getwidget/getwidget.dart';
import 'package:multiselect/multiselect.dart';

class PrivacyPage extends StatefulWidget {
  State<PrivacyPage> createState() => PrivacyPageState();
}

class PrivacyPageState extends State<PrivacyPage> {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    String dropdown;
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 4 / 7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF134FAF), Colors.black],
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 9.0),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
            ),
            Positioned(
              top: 20,
              left: 5,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Text(
                    "Privacy",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 90,
                left: 20,
                child: Column(
                  children: [
                  ],
                )),
          
      
            Positioned(
              top: 90,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child:  ListView(
                  scrollDirection: Axis.vertical,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4, left: 4),
                              child: Card(
                                 elevation: 50,
                                    shadowColor: Colors.white,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                
                                child: SizedBox(
                                  width: 380,
                                      height: 650,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15, top: 20),
                                              child: Text("Change Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Color(0xFF134FAF)),),
                                            ),
                                            SizedBox(height: 25,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),
                                              child: TextFormField(
                                          controller: controller.oldPassowrdController,
                                          style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 16),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.withOpacity(0.2),
                                            filled: true,
                                            hintText: "Old Password",
                                            labelText: "Old Password",
                                            hintStyle: TextStyle(fontFamily: "Raleway"),
                                            labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 18, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            
                                          
                                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.people, color: Color(0xFF134FAF)),
                                            ),
                                          ),
                                        ),
                                            ),
                                            SizedBox(height: 35,),
                                              Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),
                                              child: TextFormField(
                                          controller: controller.passowrdController,
                                          style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 16),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.withOpacity(0.2),
                                            filled: true,
                                            hintText: "New Password",
                                            labelText: "New Password",
                                            hintStyle: TextStyle(fontFamily: "Raleway"),
                                            labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 18, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            
                                          
                                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.people, color: Color(0xFF134FAF)),
                                            ),
                                          ),
                                        ),
                                            ),

                                            SizedBox(height: 35,),
                                              Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),
                                              child: TextFormField(
                                          controller: controller.conformPasswordController,
                                          style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 16),
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.withOpacity(0.2),
                                            filled: true,
                                            hintText: "Confirm Password",
                                            labelText: "Confirm Password",
                                            hintStyle: TextStyle(fontFamily: "Raleway"),
                                            labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 18, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            
                                          
                                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.people, color: Color(0xFF134FAF)),
                                            ),
                                          ),
                                        ),
                                            ),
                                            
                                            SizedBox(height: 35,),
                                             Padding(
                                               padding: const EdgeInsets.only(left: 130),
                                               child: InkWell(
                                                                                    onTap:
                                                                                        () {
                                                                                      controller.checkInputPassword(context);
                                                                                    },
                                                                                    child:
                                                                                        Container(
                                                                                      width:
                                                                                          125,
                                                                                      height:
                                                                                          35,
                                                                                      alignment:
                                                                                          Alignment.center,
                                                                                      decoration:
                                                                                          BoxDecoration(
                                                                                              borderRadius: BorderRadius.all(Radius.circular(
                                                                                                  25)),
                                                                                              
                                                                                              gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                                                                                                Color(0xffEAF12D), Color(0xffEAF12D)
                                                                                              ])),
                                                                                      child:
                                                                                          Text(
                                                                                        'Submit',
                                                                                        style: TextStyle(
                                                                                            fontSize: 14,
                                                                                            fontFamily: "Raleway",
                                                                                            fontWeight: FontWeight.bold,
                                                                                            color: Color(0xFF134FAF)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                             )
                                          ],
                                          
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    
                    ],
                
                  ),
                )
                 ),
            
          ],
        ),
      
    );
  }
}




// Dialogs.materialDialog(
//                               useSafeArea: true,
//                                 msg: 'Detailed Filter Search',
//                                 msgStyle: TextStyle(color: Color(0xFF134FAF)),
//                                 // title: "Delete",
//                                 color: Colors.white,
                                
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                     height: 500,
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 5, right: 180),
//                                             child: Text("Search by ID", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),),
//                                           ),
//                                           TextFormField(
//                     controller: SearchController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       fillColor: Colors.grey.withOpacity(0.2),
//                       filled: true,
//                       hintText: "Enter Matrimony ID",
//                       hintStyle: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                       // labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none
//                       ),
                    
                     
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xFF134FAF),
//                       shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//                     ),
//                             child: Text("Search"),
//                             onPressed: () {
                              
//                             },
//                           ),
//                    Container(
//                                           margin: EdgeInsets.symmetric(
//                                               vertical: 10),
//                                           child: Row(
//                                             children: <Widget>[
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                                   child: Divider(
//                                                     thickness: 1,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Text('or'),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                                   child: Divider(
//                                                     thickness: 1,
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Marital Status',
//                                             items: const [
//                                               'Never Married',
//                                               'Married'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Religion',
//                                             items: const [
//                                               'Hindu',
//                                               'Muslim',
//                                               'Christian'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Mother Tongue',
//                                             items: const [
//                                               'Tamil',
//                                               'Malayalam',
//                                               'Hindi'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Caste',
//                                             items: const [
//                                               'All',
//                                               'Vannar',
//                                               'Kammalar'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Physical Status',
//                                             items: const [
//                                               'Doesn\'t matter',
//                                               'Normal',
//                                               'Physically Challenged'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                            Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 10),
//                                             child: Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text("Location Details", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Country',
//                                             items: const ['India', 'US', 'Uk'],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
                                          
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'State',
//                                             items: const [
//                                               'TamilNadu',
//                                               'Kerala'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'District',
//                                             items: const [
//                                               'Madurai',
//                                               'Salem',
//                                               'Chennai'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'City',
//                                             items: const [
//                                               'Madurai',
//                                               'Salem',
//                                               'Chennai'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Resident Status',
//                                             items: const [
//                                               'Any',
//                                               'Citizen',
//                                               'Permanent Resident',
//                                               'Work Permit',
//                                               'Student Visa ',
//                                               'Temporary Visa '
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 10),
//                                             child: Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text("Education / Occupation / Annual Income Details", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Education',
//                                             items: const [
//                                               'Any',
//                                               'Any Bachelors thirumanam Engineering / Computer',
//                                               'Any Masters thirumanam Engineering / Computer',
//                                               'Any Bachelors thirumanam management',
//                                               'Any masters thirumanam management'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Employed In',
//                                             items: const [
//                                               'All',
//                                               'Government / PSU',
//                                               'private',
//                                               'Business',
//                                               'Defence',
//                                               'Self Employed',
//                                               'Not  Working'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Occupation',
//                                             items: const [
//                                               'Any',
//                                               'Administration',
//                                               'Agriculture',
//                                               'Airline',
//                                               'Banking & Finance'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Annual Income',
//                                             items: const [
//                                               '100000',
//                                               '200000',
//                                               '300000 ',
//                                               '400000',
//                                               '500000',
//                                               '600000',
//                                               '700000',
//                                               '800000',
//                                               '900000',
//                                               '1000000'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                            Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 10),
//                                             child: Align(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text("Horoscope Details", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Star',
//                                             items: const ['Any'],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Chevvai Dosham',
//                                             items: const [
//                                               'Yes',
//                                               'No',
//                                               'Doesn’t Matter'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom: 10, top: 5, right: 220),
//                                             child: Text("Habits", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),),
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Eating habits',
//                                             items: const [
//                                               'Any',
//                                               'vegetarian',
//                                               'Non-vegetarian',
//                                               'Eggetarian'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Drinking',
//                                             items: const [
//                                               'Any',
//                                               'Non-drinker',
//                                               'light/social drinker',
//                                               'Regular drinker'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                                           SizedBox(
//                                             height: 10,
//                                           ),
//                                           CustomDropdown(
//                                             fillColor:
//                                                 Colors.grey.withOpacity(0.2),
//                                             // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                             fieldSuffixIcon: Icon(
//                                               Icons.arrow_drop_down_circle,
//                                               color: Colors.blue,
//                                             ),
//                                             hintText: 'Smoking',
//                                             items: const [
//                                               'Any',
//                                               'Non-smoker',
//                                               'light/social smoker',
//                                               'Regular smoker'
//                                             ],
//                                             controller: SearchController,
//                                           ),
//                   //                         Padding(
//                   //                           padding: const EdgeInsets.only(bottom: 10, top: 10),
//                   //                           child: Align(
//                   //                             alignment: Alignment.centerLeft,
//                   //                             child: Text("Search using keywords", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),)),
//                   //                         ),
//                   //                          Padding(
//                   //                           padding: const EdgeInsets.only(bottom: 10),
//                   //                           child: Align(
//                   //                             alignment: Alignment.centerLeft,
//                   //                             child: Text("keywords are searched against the profile description of a member", style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.black),)),
//                   //                         ),
//                   //                         TextFormField(
//                   //   controller: SearchController,
//                   //   style: TextStyle(color: Colors.black),
//                   //   decoration: InputDecoration(
//                   //     contentPadding: EdgeInsets.only(right: 10, left: 10),
//                   //     fillColor: Colors.grey.withOpacity(0.2),
//                   //     filled: true,
//                   //     hintText: "Enter Keywords",
//                   //     hintStyle: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                   //     // labelStyle: TextStyle(fontFamily: "nunto"),
//                   //     border: OutlineInputBorder(
//                   //       borderRadius: BorderRadius.circular(10),
//                   //       borderSide: BorderSide.none
//                   //     ),
                    
                     
//                   //   ),
//                   // ),
//                   //                         DropDownMultiSelect(
                                              
//                   //                             decoration: InputDecoration(
//                   //                               contentPadding: EdgeInsets.only(right: 10, left: 10),
//                   //                               filled: true,
//                   //                               hintText: 'Select profile',
//                   //                             hintStyle: TextStyle(color: Colors.grey),
//                   //                               border: OutlineInputBorder(

//                   //       borderRadius: BorderRadius.circular(10),
//                   //       borderSide: BorderSide.none
//                   //     ),
                      
//                   //                               fillColor:
//                   //                                 Colors.grey.withOpacity(0.2),
//                   //                                 suffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,size: 18,)
//                   //                             ),
//                   //                             onChanged: (List<String> x) {
//                   //                               setState(() {
//                   //                                 selected = x;
//                   //                               });
//                   //                             },
//                   //                             options: ['With photo', 'With Horoscope', 'Online right now', 'Premium members'],
//                   //                             selectedValues: selected,
//                   //                             whenEmpty: '',
                                              
                                              
//                   //                           ),
                                          
//                   //                         Align(
//                   //                             alignment: Alignment.topCenter,
//                   //                             child: DropDownMultiSelect(
                                                    
//                   //                                   decoration: InputDecoration(
//                   //                                     contentPadding: EdgeInsets.only(right: 10, left: 10),
//                   //                                     filled: true,
//                   //                                     hintText: 'Select don\'t show',
//                   //                                   hintStyle: TextStyle(color: Colors.grey),
//                   //                                     border: OutlineInputBorder(
                                            
//                   //                                                   borderRadius: BorderRadius.circular(10),
//                   //                                                   borderSide: BorderSide.none
//                   //                                                 ),
                                                                  
//                   //                                     fillColor:
//                   //                                       Colors.grey.withOpacity(0.2),
//                   //                                       suffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,size: 18,)
//                   //                                   ),
//                   //                                   onChanged: (List<String> x) {
//                   //                                     setState(() {
//                   //                                       selected = x;
//                   //                                     });
//                   //                                   },
//                   //                                   options: ['Ignored Profiles', 'Profiles already contacted', 'Viewed Profile', 'Shortlisted profiles'],
//                   //                                   selectedValues: selected,
//                   //                                   whenEmpty: '',
                                                    
                                                    
//                   //                                 ),
//                   //                           ),
                                          
                                          
//                                              SizedBox(height: 10,),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xFF134FAF),
//                       shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//                     ),
//                             child: Text("Search"),
//                             onPressed: () {
                              
//                             },
//                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ]);