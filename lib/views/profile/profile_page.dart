// import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:intl/intl.dart';
// import 'package:thirumanam/controller/register_controller.dart';
// import 'package:thirumanam/controller/update_controllers/address_update.dart';
// import 'package:thirumanam/controller/update_controllers/carrier_update.dart';
// import 'package:thirumanam/controller/update_controllers/family_update.dart';
// import 'package:thirumanam/controller/update_controllers/jathagam_update.dart';
// import 'package:thirumanam/controller/update_controllers/permement_address_update.dart';
// import 'package:thirumanam/controller/update_controllers/personal_update.dart';
// import 'package:thirumanam/resources/app_colors.dart';
// import 'package:thirumanam/views/profile/commons/my_info.dart';
// import 'package:thirumanam/views/profile/commons/opaque_image.dart';
// import 'package:thirumanam/views/profile/commons/profile_info_big_card.dart';
// import 'package:thirumanam/views/profile/commons/profile_info_card.dart';
// import 'package:thirumanam/views/profile/styleguide/colors.dart';
// import 'package:thirumanam/views/profile/styleguide/text_style.dart';
// import 'package:expansion_tile_card/expansion_tile_card.dart';

// import '../../controller/stepper_register_controller.dart';
// import '../../controller/update_controllers/communication_update.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     // final  = TextEditingController();
//     final controller = Get.find<CommunicationUpdateController>();
//     final controller1 = Get.find<AddressUpdateController>();
//     final controller2 = Get.find<PermenentAddressUpdateController>();
//     final controller3 = Get.find<PersonalUpdateController>();
//     final controller4 = Get.find<CarrierUpdateController>();
//     final controller5 = Get.find<JathagamUpdateController>();
//     final controller6 = Get.find<FamilyUpdateController>();
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Expanded(
//                 flex: 4,
//                 child: Stack(
//                   children: <Widget>[
//                     OpaqueImage(
//                       imageUrl: "https://lh3.googleusercontent.com/ogw/AOh-ky0hZdAOkIToEv-0GuZnQW4GcfUbCgNWK2ye7WMZAHM=s32-c-mo",
//                     ),
//                     SafeArea(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                                 Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Row(
//                                     children: [
//                                       InkWell(
//                                         onTap: (){

//                                         },
//                                         child: Container(
//                                           child: Icon(
//                                       Icons.arrow_circle_left_outlined,
//                                       color: Colors.white,
//                                       size: 32,
//                                     ),
                                    
//                                         )),
//                                         SizedBox(width: 10,),
//                                       Text(
//                                         "Profile",
//                                         textAlign: TextAlign.left,
//                                         style: titleStyle1,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
                            
//                             MyInfo(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 5,
//                 child: Container(
//                   padding: const EdgeInsets.only(top: 50),
//                   color: Colors.white,
//                   child: ListView(
//                     // scrollDirection: Axis.vertical,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: ExpansionTileCard(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
              
//               // key: cardB,
//               // expandedTextColor: Colors.red,
//               expandedColor: Colors.white.withOpacity(0.9),
//               leading: CircleAvatar(
//                 backgroundColor: Color(0xfff79c4f),
//                 child: Icon(CupertinoIcons.heart_circle, color: Colors.white,)),
              
//               title: Text('Communication Details'),
//               subtitle: Text('Edit Preference'),
//               children: <Widget>[
//                 Divider(
//                   thickness: 1.0,
//                   height: 1.0,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: Column(children: [
//                       CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Select Religion',
//                               items: const ['HINDU', 'No Religion'],
//                               controller: controller.Caste,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Select Community',
//                               items: const ['Nothing', 'No commucation'],
//                               controller: controller.CommunityController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Mother Tounge',
//                               items: const ['Tamil', 'English'],
//                               controller: controller.MotherToungeController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Caste',
//                               items: const ['No_Caste', 'BC'],
//                               controller: controller.CasteController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Sub-Caste',
//                               items: const ['No_sub_caste', 'Kammalar'],
//                               controller: controller.SubCasteController,
                              
//                             ),

//                             SizedBox(height: 20,),
//                             Row(
//                               children: [
//                                 InkWell(
//                                               onTap: () {
//                                                 // controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Cancel',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
//                                                 ),
//                                               ),
//                                             SizedBox(width: 10,),

//                                              InkWell(
//                                               onTap: () {
//                                                 controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
                                                  
//                                                 ),
//                                               ),
                                            
//                               ],
//                             ),
                            
                            
                            
//                     ],),
//                   ),

                  
//                 ),
//                 //
//               ],
//             ),
//           ),

//   SizedBox(height: 20,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: ExpansionTileCard(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               expandedColor: Colors.white.withOpacity(0.9),
//               // key: cardB,
//               // expandedTextColor: Colors.red,
//               leading: CircleAvatar(
//                 backgroundColor: Color(0xfff79c4f),
//                 child: Icon(CupertinoIcons.heart_circle, color: Colors.white,)),
//               title: Text('Communcation Address'),
//               subtitle: Text('Edit Preference'),
//               children: <Widget>[
//                 Divider(
//                   thickness: 1.0,
//                   height: 1.0,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: Column(
//                       children: [
                        
//                              TextFormField(
//                     controller: controller1.DoorNoController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey.shade100,
//                       filled: true,
//                       hintText: "Door no",
//                       labelText: "Door no",
//                       hintStyle: TextStyle(fontFamily: "nunto"),
//                       labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
                      
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.only(left: 20, right: 15),
//                         child: Icon(Icons.people, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextFormField(
//                     controller: controller1.StreetController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey.shade100,
//                       filled: true,
//                       hintText: "Street",
//                       labelText: "Street",
//                       hintStyle: TextStyle(fontFamily: "nunto"),
//                       labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.only(left: 20, right: 15),
//                         child: Icon(Icons.people, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextFormField(
//                     controller: controller1.AreaController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey.shade100,
//                       filled: true,
//                       hintText: "Area",
//                       labelText: "Area",
//                       hintStyle: TextStyle(fontFamily: "nunto"),
//                       labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.only(left: 20, right: 15),
//                         child: Icon(Icons.people, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'City',
//                               items: const ['Chennai', 'Maduari'],
//                               controller: controller1.CityController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                              CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'District',
//                               items: const ['Chennai', 'Maduari'],
//                               controller: controller1.DistrictController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                              CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'State',
//                               items: const ['Tamilnadu', 'Kerala'],
//                               controller: controller1.StateController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                              CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Country',
//                               items: const ['India', 'US'],
//                               controller: controller1.CountryController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Nationality',
//                               items: const ['Indian', 'American'],
//                               controller: controller1.NationalityController,
                              
//                             ),

//                              SizedBox(height: 20,),
//                             Row(
//                               children: [
//                                 InkWell(
//                                               onTap: () {
//                                                 // controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Cancel',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
//                                                 ),
//                                               ),
//                                             SizedBox(width: 10,),

//                                              InkWell(
//                                               onTap: () {
//                                                 controller1.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
                                                  
//                                                 ),
//                                               ),
                                            
//                               ],
//                             ),
                            
//                       ],
//                     ),
//                   ),

                  
//                 ),
                
//                 //
//               ],
//             ),
//           ),

// SizedBox(height: 20,),
//            Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: ExpansionTileCard(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               expandedColor: Colors.white.withOpacity(0.9),
//               // key: cardB,
//               // expandedTextColor: Colors.red,
//               leading: CircleAvatar(
//                 backgroundColor: Color(0xfff79c4f),
//                 child: Icon(CupertinoIcons.heart_circle, color: Colors.white,)),
//               title: Text('Permanent Address'),
//               subtitle: Text('Edit Preference'),
//               children: <Widget>[
//                 Divider(
//                   thickness: 1.0,
//                   height: 1.0,
//                 ),
                
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: Column(
//                       children: [
                        
//                              TextFormField(
//                     controller: controller2.DoorNoController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey.shade100,
//                       filled: true,
//                       hintText: "Door no",
//                       labelText: "Door no",
//                       hintStyle: TextStyle(fontFamily: "nunto"),
//                       labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
                      
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.only(left: 20, right: 15),
//                         child: Icon(Icons.people, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextFormField(
//                     controller: controller2.StreetController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey.shade100,
//                       filled: true,
//                       hintText: "Street",
//                       labelText: "Street",
//                       hintStyle: TextStyle(fontFamily: "nunto"),
//                       labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.only(left: 20, right: 15),
//                         child: Icon(Icons.people, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextFormField(
//                     controller: controller2.AreaController,
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey.shade100,
//                       filled: true,
//                       hintText: "Area",
//                       labelText: "Area",
//                       hintStyle: TextStyle(fontFamily: "nunto"),
//                       labelStyle: TextStyle(fontFamily: "nunto"),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.only(left: 20, right: 15),
//                         child: Icon(Icons.people, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'City',
//                               items: const ['Chennai', 'Maduari'],
//                               controller: controller2.CityController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                              CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'District',
//                               items: const ['Chennai', 'Maduari'],
//                               controller: controller2.DistrictController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                              CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'State',
//                               items: const ['Tamilnadu', 'Kerala'],
//                               controller: controller2.StateController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                              CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Country',
//                               items: const ['India', 'US'],
//                               controller: controller2.CountryController,
                              
//                             ),

//                              SizedBox(height: 20,),
//                             Row(
//                               children: [
//                                 InkWell(
//                                               onTap: () {
//                                                 // controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Cancel',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
//                                                 ),
//                                               ),
//                                             SizedBox(width: 10,),

//                                              InkWell(
//                                               onTap: () {
//                                                 controller2.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
                                                  
//                                                 ),
//                                               ),
                                            
//                               ],
//                             ),
//                       ],
//                     ),
//                   ),

                  
//                 ),
//                 //
//               ],
//             ),
//           ),
// SizedBox(height: 20,),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: ExpansionTileCard(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               // key: cardB,
//               expandedColor: Colors.white.withOpacity(0.9),
//               // expandedTextColor: Colors.red,
//               leading: CircleAvatar(
//                 backgroundColor: Color(0xfff79c4f),
//                 child: Icon(CupertinoIcons.heart_circle, color: Colors.white,)),
//               title: Text('Personal Details'),
//               subtitle: Text('Edit Preference'),
//               children: <Widget>[
//                 Divider(
//                   thickness: 1.0,
//                   height: 1.0,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: Column(children: [
//                       TextFormField(
//                   controller: controller3.HeightController,
//                  style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Height",
//                     labelText: "Height",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
                    
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: controller3.WieghtController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Weight",
//                     labelText: "Weight",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                  controller: controller3.HobbiesController,
//                  style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Hobbies",
//                     labelText: "Hobbies",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Skin Tone',
//                               items: const ['Fair', 'Medium', 'Light', 'Dark'],
//                               controller: controller3.SkinController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Diet',
//                               items: const ['Vegitarian', 'Non-Vegitarian'],
//                               controller: controller3.DeitController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Martial Details',
//                               items: const ['Single', 'Married', 'Divorce'],
//                               controller: controller3.MartialController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             TextFormField(
//                   controller: controller3.NoChildController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "No.of Children",
//                     labelText: "No.of Children",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: controller3.ChildStatusController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Children Status",
//                     labelText: "Children Status",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),

//                  SizedBox(height: 20,),
//                             Row(
//                               children: [
//                                 InkWell(
//                                               onTap: () {
//                                                 // controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Cancel',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
//                                                 ),
//                                               ),
//                                             SizedBox(width: 10,),

//                                              InkWell(
//                                               onTap: () {
//                                                 controller3.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
                                                  
//                                                 ),
//                                               ),
                                            
//                               ],
//                             ),

//                     ],),
//                   ),

                  
//                 ),
//                 //
//               ],
//             ),
//           ),

// SizedBox(height: 20,),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: ExpansionTileCard(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               expandedColor: Colors.white.withOpacity(0.9),
//               // key: cardB,
//               // expandedTextColor: Colors.red,

//               leading: CircleAvatar(
//                 backgroundColor: Color(0xfff79c4f),
//                 child: Icon(CupertinoIcons.heart_circle, color: Colors.white,)),
//               title: Text('Carrier & Working Details'),
//               subtitle: Text('Edit Preference'),
//               children: <Widget>[
//                 Divider(
//                   thickness: 1.0,
//                   height: 1.0,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: Column(
//                       children: [
//                          CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Educational Qualification',
//                               items: const ['B.E', 'B.Com', 'B.Sc'],
//                               controller: controller4.EducationController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Working thirumanam',
//                               items: const ['Chennai', 'Maduari', 'Banglore'],
//                               controller: controller4.WorkingInController,
                              
//                             ),
//                             SizedBox(height: 30,),

//                             TextFormField(
//                   controller: controller4.WorkingInController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Working as",
//                     labelText: "Working as",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: controller4.CompanyController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Company Details",
//                     labelText: "Company Details",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: controller4.IncomeController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Annual Income",
//                     labelText: "Annual Income",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),

//                  SizedBox(height: 20,),
//                             Row(
//                               children: [
//                                 InkWell(
//                                               onTap: () {
//                                                 // controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Cancel',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
//                                                 ),
//                                               ),
//                                             SizedBox(width: 10,),

//                                              InkWell(
//                                               onTap: () {
//                                                 controller4.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
                                                  
//                                                 ),
//                                               ),
                                            
//                               ],
//                             ),
//                       ],
//                     ),
//                   ),

                  
//                 ),
//                 //
//               ],
//             ),
//           ),
// SizedBox(height: 20,),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: ExpansionTileCard(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               expandedColor: Colors.white.withOpacity(0.9),
//               // key: cardB,
//               // expandedTextColor: Colors.red,
//               leading: CircleAvatar(
//                 backgroundColor: Color(0xfff79c4f),
//                 child: Icon(CupertinoIcons.heart_circle, color: Colors.white,)),
//               title: Text('Jathagam Details'),
//               subtitle: Text('Edit Preference'),
//               children: <Widget>[
//                 Divider(
//                   thickness: 1.0,
//                   height: 1.0,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: Column(children: [
                       
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Rasi',
//                               items: const [ 'Aries',
//                     'Taurus',
//                     'Gemini',
//                     'Cancer',
//                     'Leo',
//                     'Virgo',
//                     'Libra',
//                     'Scorpio',
//                     'Sagittarius',
//                     'Capricorn',
//                     'Aquarius',
//                     'Pisces'],
//                               controller: controller5.RasiController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Natchathiram',
//                               items: const [ 'Ashwini',
//                     'Bharani',
//                     'Krittika',
//                     'Rohini',
//                     'Mrighasira',
//                     'Ardra',
//                     'Punarvasu',
//                     'Pushya',
//                     'Ashlesha',
//                     'Magha',
//                     'Purva Phalguni',
//                     'Uttara Phalguni',
//                     'Hasta',
//                     'Chitra',
//                     'Swati',
//                     'Vishaka',],
//                               controller: controller5.NatchathiramController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Laknam',
//                               items: const ['Ashwini',
//                     'Bharani',
//                     'Krittika',
//                     'Rohini',
//                     'Mrighasira',
//                     'Ardra',
//                     'Punarvasu',
//                     'Pushya',
//                     'Ashlesha',
//                     'Magha',
//                     'Purva Phalguni',
//                     'Uttara Phalguni',
//                     'Hasta',
//                     'Chitra',
//                     'Swati',
//                     'Vishaka',],
//                               controller: controller5.LaknamController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Gothram',
//                               items: const ['Yes', 'No'],
//                               controller: controller5.GothramController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Kuladeivam',
//                               items: const ['Yes', 'No'],
//                               controller: controller5.KuladeivamController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Dosham',
//                               items: const ['Yes', 'No'],
//                               controller: controller5.DoshamController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             TextFormField(
//                   controller: controller5.DoshamDetailsController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "If Dosham Yes Details",
//                     labelText: "If Dosham Yes Details",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),

//                  SizedBox(height: 20,),
//                             Row(
//                               children: [
//                                 InkWell(
//                                               onTap: () {
//                                                 // controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Cancel',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
//                                                 ),
//                                               ),
//                                             SizedBox(width: 10,),

//                                              InkWell(
//                                               onTap: () {
//                                                 controller5.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
                                                  
//                                                 ),
//                                               ),
                                            
//                               ],
//                             ),
//                     ],),
//                   ),

                  
//                 ),
//                 //
//               ],
//             ),
//           ),

// SizedBox(height: 20,),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: ExpansionTileCard(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               // key: cardB,
//               expandedColor: Colors.white.withOpacity(0.9),
//               // expandedTextColor: Colors.red,
//               leading: CircleAvatar(
//                 backgroundColor: Color(0xfff79c4f),
//                 child: Icon(CupertinoIcons.heart_circle, color: Colors.white,)),
//               title: Text('Family Details'),
//               subtitle: Text('Edit Preference'),
//               children: <Widget>[
//                 Divider(
//                   thickness: 1.0,
//                   height: 1.0,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: Column(
//                       children:[
//                          TextFormField(
//                  controller: controller6.FatherNameController,
//                  style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Father Name",
//                     labelText: "Father Name",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: controller6.FatherOccupationController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Father Occupation",
//                     labelText: "Father Occupation",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: controller6.MotherNameController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Mother Name",
//                     labelText: "Mother Name",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: controller6.MotherOccupationController,
                  
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Mother Occupation",
//                     labelText: "Mother Occupation",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),

//                 CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter No of Brother',
//                               items: const ['0', '1'],
//                               controller: controller6.NoBroController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter No of Brother Married',
//                               items: const ['0', '1'],
//                               controller: controller6.BroMarryController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter No of Sister',
//                               items: const ['0', '1'],
//                               controller: controller6.NoSisController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter No of Sister Married',
//                               items: const ['0', '1'],
//                               controller: controller6.SisMarryController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Own Vehicle',
//                               items: const ['0', '1'],
//                               controller: controller6.OwnVechileController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Own House',
//                               items: const ['0', '1'],
//                               controller: controller6.OwnHouseController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Own Lands',
//                               items: const ['0', '1'],
//                               controller: controller6.OwnlandsController,
                              
//                             ),
//                             SizedBox(height: 30,),
//                             CustomDropdown(
                              
//                               fillColor: Colors.grey.withOpacity(0.2),
//                               // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                                 fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//                               hintText: 'Enter Own Flats',
//                               items: const ['0', '1'],
//                               controller: controller6.OwnFlatsController,
                              
//                             ),
//                             SizedBox(height: 30,),

//                             TextFormField(
//                   controller: controller6.ExpectationController,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey.shade100,
//                     filled: true,
//                     hintText: "Expectation",
//                     labelText: "Expectation",
//                     hintStyle: TextStyle(fontFamily: "nunto"),
//                     labelStyle: TextStyle(fontFamily: "nunto"),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 15),
//                       child: Icon(Icons.people, color: Colors.black),
//                     ),
//                   ),
//                 ),

//                  SizedBox(height: 20,),
//                             Row(
//                               children: [
//                                 InkWell(
//                                               onTap: () {
//                                                 // controller.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Cancel',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
//                                                 ),
//                                               ),
//                                             SizedBox(width: 10,),

//                                              InkWell(
//                                               onTap: () {
//                                                 controller6.checkInput(context);
//                                               },
//                                               child: Container(
//                                                 width: 100,
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: 10),
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(25)),
//                                                     boxShadow: <BoxShadow>[
//                                                       BoxShadow(
//                                                           color:
//                                                               Colors.grey.shade200,
//                                                           offset: Offset(2, 4),
//                                                           blurRadius: 5,
//                                                           spreadRadius: 2)
//                                                     ],
//                                                     gradient: LinearGradient(
//                                                         begin: Alignment.centerLeft,
//                                                         end: Alignment.centerRight,
//                                                         colors:
//                                                             [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                 child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
                                                    
                                                  
//                                                 ),
//                                               ),
                                            
//                               ],
//                             ),
//                       ],
//                     ),
//                   ),

                  
//                 ),
//                 //
//               ],
//             ),
            
//           ),
//           SizedBox(height: 20,),
//         ],
//       ),
// //                   
//                 ),
//               ),
//             ],
//           ),
         
//         ],
//       ),
      
//     );
//   }
// }