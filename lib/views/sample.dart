// import 'dart:async';
// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:coolicons/coolicons.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:material_dialogs/material_dialogs.dart';
// import 'package:multiselect/multiselect.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:thirumanam/controller/base_controller.dart';
// import 'package:thirumanam/controller/detailed_filter_controller.dart';
// import 'package:thirumanam/preferences/app_preference.dart';
// import 'package:thirumanam/utils/api_config.dart';
// // import 'package:thirumanam/controller/detailed_page_controller.dart';
// import 'package:thirumanam/utils/constants.dart';
// import 'package:thirumanam/views/profile/commons/profile_info_card.dart';
// import 'package:thirumanam/views/profile/styleguide/text_style.dart';

// import '../../controller/dashboard_controller.dart';
// import '../../controller/register_controller.dart';
// import '../../controller/update_controllers/horoscopic_controller.dart';
// import '../../resources/app_routes.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class PDFDetailPage extends StatefulWidget {
//   String idMatch = "";
//   PDFDetailPage({Key? Key, required this.idMatch});
//   @override
//   PDFDetailPageState createState() => PDFDetailPageState();
// }

// class PDFDetailPageState extends State<PDFDetailPage> {
//   final controller1 = Get.find<DashboardController>();
//   void showDialogBox() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//   Get.dialog(
//     AlertDialog(
//       shape: RoundedRectangleBorder(
// 		borderRadius: BorderRadius.circular(30),
// 	),
//         backgroundColor: Color(0xffEAF12D),
//       title: Text('Complete the profile!!', style: TextStyle(fontFamily: "Raleway",
//                                                         fontWeight: FontWeight.w500,
//                                                         color: Color(0xFF134FAF), fontSize: 25)),
//       actions: [
//        SizedBox(
//                                           height: 350,
//                                           child: SingleChildScrollView(
//                                             child: Column(children: [
//                                               Center(
//                                                 child: Image.asset('assets/images/wrong.gif'),
//                                               ),
//                                               Container(
//                                                 alignment: Alignment.center,
//                                                 child: Text("Complete the profile for make profile matched", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black, fontSize: 17),),
//                                               ),
//                                                SizedBox(
//                                                 height: 25,
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.only(right: 20),
//                                                 child: Column(
//                                                   children: [
                                                    
//                                                         MouseRegion(
//                                                           cursor: SystemMouseCursors.basic,
                                                          
//                                                           child: ElevatedButton(
//                                                             style: ElevatedButton.styleFrom(
//                                                               primary: Color(0xFF134FAF),
//                                                               shape: RoundedRectangleBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius.all(
//                                                                           Radius.circular(10))),
//                                                             ),
//                                                             child: Text("Profile"),
//                                                             onPressed: (){
//                                                                                                               // controller.withdrawProposal(food.id, context);
//                                                                                                               // print(controller.withdrawProposal(food.id, context));
                                                              
//                                                               Get.back();
                                                              
                                                              
                                                             
//                                                               // fetchWishListProposal("");
//                                                             },
//                                                           ),
                                                          
//                                                         ),
                                                      
//                                                   ],
//                                                 ),
//                                               ),
//                                             ]),
//                                           ))
//       ],
//     ),
//   );
//     });
// }
//   final AppPreference appPreference = Get.find();
//   loginToast(String toast) {
//     return Fluttertoast.showToast(
//         msg: toast,
        
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 3,
//         backgroundColor:
//             toast == "Login Sucessfull" ? Colors.green : Colors.green,
//         textColor: Colors.white);
//   }

// // final controller = Get.find<DetailedPageController>();
//   final controller7 = Get.find<HoroScopicController>();
//   @override
//   void initState(){
//     super.initState();
//     fetchMyDetailedPage();
//   }

//    var detailFilterModel = StreamController<Map<String, dynamic>>.broadcast();
//   Stream<Map<String, dynamic>> getFilteredModel() => detailFilterModel.stream;
//   fetchMyDetailedPage() async {
//     final url = Uri.parse("${URL}auth/specific-user-details/${widget.idMatch}");
//     print(url);

//     final response =
//         await http.get(Uri.parse(url.toString()), headers: <String, String>{
//       "Content-Type": "application/json",
//       'x-access-token':
//           appPreference.accessToken!
//     });

//     final Map<String, dynamic> body = json.decode(response.body);
//     print(body);
//     if (response.statusCode == 200) {
    
//     }
//     detailFilterModel.add(body);
//   }

//   addWishListProposal(id, context) async {
//     final addWishlistUrl = RestApiClient().addWishlist;
//     print(addWishlistUrl);

//     final response = await http.post(
//       Uri.parse(addWishlistUrl.toString()),
//       headers: <String, String>{
//         'Content-type': 'application/json; charset=UTF-8',
//         'x-access-token':
//             appPreference.accessToken!,
//       },
//       body: jsonEncode(<String, String>{
//         "wishuserId": id.toString(),
//       }),
//     );
//     print(response.body);
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('added_wishlist'.tr, style: TextStyle(color: Colors.black),),
//           backgroundColor: Colors.green,
//         ),
//       );
//       fetchMyDetailedPage();

//       Text("success");
//     } else if (response.statusCode == 410) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(data["message"], style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
      
//     } else {
//       Text("Failed");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('some_error'.tr, style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
      
//     }
//     print(data);
//   }

//   removeWishListProposal(id, context) async {
//     final removeWishlistUrl = RestApiClient().removeWishlist;
//     print(removeWishlistUrl);

//     final response = await http.post(
//       Uri.parse(removeWishlistUrl.toString()),
//       headers: <String, String>{
//         'Content-type': 'application/json; charset=UTF-8',
//         'x-access-token':
//             appPreference.accessToken!,
//       },
//       body: jsonEncode(<String, String>{
//         "wishuserId": id.toString(),
//       }),
//     );
//     print(response.body);
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       // _popupMessage = 'Successfully removed to wishlist';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('remove_wishlist'.tr, style: TextStyle(color: Colors.black),),
//           backgroundColor: Colors.green,
//         ),
//       );
      
//       fetchMyDetailedPage();

//       // showSuccessSnackBar("Successfully withdraw the request", context);
//       Text("success");
//     } else if (response.statusCode == 410) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(data["message"], style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
      
//     } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('some_error'.tr, style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//       Text("Failed");
//     }

//     print(data);
//   }

//   withdrawProposal(id, context) async {
//     final withdrawUrl = RestApiClient().withdrawProposal;
//     print(withdrawUrl);

//     final response = await http.post(
//       Uri.parse(withdrawUrl.toString()),
//       headers: <String, String>{
//         'Content-type': 'application/json; charset=UTF-8',
//         'x-access-token':
//             appPreference.accessToken!,
//       },
//       body: jsonEncode(<String, String>{
//         "propsal_id": id,
//       }),
//     );
//     print(response.body);
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('withdraw_request'.tr, style: TextStyle(color: Colors.black),),
//           backgroundColor: Colors.green,
//         ),
//       );
//       fetchMyDetailedPage();

//       Text("success");
//     } else if (response.statusCode == 410) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(data["message"], style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );

//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('some_error'.tr, style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//       Text("Failed");
//     }
//     print(data);
//   }

//   sentRequestProposal(id, context) async {
//     final sentRequestUrl = RestApiClient().sendRequestProposal;
//     print(sentRequestUrl);

//     final response = await http.post(
//       Uri.parse(sentRequestUrl.toString()),
//       headers: <String, String>{
//         'Content-type': 'application/json; charset=UTF-8',
//         'x-access-token':
//             appPreference.accessToken!,
//       },
//       body: jsonEncode(<String, String>{"request_for": id, "message": "hi"}),
//     );
//     print(response.body);
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('sent_request'.tr, style: TextStyle(color: Colors.black),),
//           backgroundColor: Colors.green,
//         ),
//       );
//       fetchMyDetailedPage();

//       Text("success");
//     } else if (response.statusCode == 410) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(data["message"], style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('some_error'.tr, style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//       Text("Failed");
//     }
//     print(data);
//   }

//   acceptProposal(id, context) async {
//     // update([() => isLoader.value = true]);

//     final acceptUrl = RestApiClient().acceptProposal;
//     print(acceptUrl);

//     final response = await http.post(
//       Uri.parse(acceptUrl.toString()),
//       headers: <String, String>{
//         'Content-type': 'application/json; charset=UTF-8',
//         'x-access-token':
//             appPreference.accessToken!,
//       },
//       body: jsonEncode(<String, String>{
//         "propsal_id": id.toString(),
//       }),
//     );
//     print(response.body);
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('accept_request'.tr, style: TextStyle(color: Colors.black),),
//           backgroundColor: Colors.green,
//         ),
//       );
      
//       fetchMyDetailedPage();

//       Text("success");
//     } else if (response.statusCode == 410) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(data["message"], style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('some_error'.tr, style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//     print(data);
//   }

//   rejectProposal(id, context) async {
//     final rejectUrl = RestApiClient().rejectProposal;
//     print(rejectUrl);

//     final response = await http.post(
//       Uri.parse(rejectUrl.toString()),
//       headers: <String, String>{
//         'Content-type': 'application/json; charset=UTF-8',
//         'x-access-token':
//             appPreference.accessToken!,
//       },
//       body: jsonEncode(<String, String>{
//         "propsal_id": id.toString(),
//       }),
//     );
//     print(response.body);
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('reject_request'.tr, style: TextStyle(color: Colors.black),),
//           backgroundColor: Colors.green,
//         ),
//       );
      
//       fetchMyDetailedPage();

//       Text("success");
//     } else if (response.statusCode == 410) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(data["message"], style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } else {
      
// ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('some_error'.tr, style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//     print(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final  = TextEditingController();

//     return MaterialApp(
//        theme: ThemeData(
//         pageTransitionsTheme: PageTransitionsTheme(
//           builders: {
//             TargetPlatform.android: MyCustomPageTransitionBuilder(),
//             TargetPlatform.iOS: MyCustomPageTransitionBuilder(),
//           },
//         ),
//       ),
//       home: StreamBuilder<Map<String, dynamic>>(
//           stream: getFilteredModel(),
//           builder: (context, snapshot) {
//             final users = snapshot.data.toString();
    
//             // final user = users;
    
//             print(users);
    
//             // print(snapshot);
    
//             if (snapshot.connectionState == ConnectionState.done) {
//               // print(snapshot.data);
//             }
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return Center(child:  Center(
//             child: Container(
//                 height: 80,
//                 width: 80,
//                 alignment: AlignmentDirectional.center,
//                 child: Lottie.asset(
//                   "assets/loading/heart.json",
//                 )),
//           ),);
//               default:
//                 if (snapshot.hasError) {
//                   return Center(child: Text('some_error'.tr));
//                 } else {
//                   print("snapshot.data");
//                   print(snapshot.data);
//                   return _buildProductCard(snapshot.data);
//                 }
//             }
//           }),
//     );
//   }

//   Widget _buildProductCard(product) {
//     print(product.length.toString());
//     print(
//         "aaaa: ${product == null ? product["data"]['customerDetails']["attachments"][0]["url"] : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}");
//     final screenHeight = MediaQuery.of(context).size.height;
//     return pdf.addPage(
//   pw.Page(
//     build: (pw.Context context) {
    
//    return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Expanded(
//                 flex: 3,
//                 child: Stack(
//                   children: <Widget>[
//                     // ${product['data']['customerDetails']  != null ? product['data']['customerDetails']["attachments"]["url"] : ""}
//                     OpaqueImage(
//                       imageUrl:
//                           "${product["data"]['customerDetails']["attachments"]!.length != 0 ? product["data"]['customerDetails']["attachments"][0]["url"] : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}",
//                     ),
//                     //             CarouselSlider(

//                     //               options: CarouselOptions(autoPlay: true,
//                     //   autoPlayAnimationDuration: Duration(seconds: 5),
//                     //   height: MediaQuery.of(context).size.height * 0.60,),

//                     //   items: <Widget>[
//                     //     for (var i = 0; i < product["data"]['customerDetails']["attachments"].length; i++)
//                     //       Container(
//                     //           margin: const EdgeInsets.only(top: 20.0, left: 20.0),
//                     //           decoration: BoxDecoration(
//                     //             image: DecorationImage(
//                     //               image: NetworkImage(product["data"]['customerDetails']["attachments"][i]["url"]),
//                     //               fit: BoxFit.fitHeight,
//                     //             ),
//                     //             // border:
//                     //             //     Border.all(color: Theme.of(context).accentColor),
//                     //             borderRadius: BorderRadius.circular(32.0),
//                     //           ),
//                     //         ),
//                     //   ],
//                     // ),
//                     SafeArea(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Row(
//                                 children: [
//                                   InkWell(
//                                       onTap: () {
//                                         Get.back();
//                                       },
//                                       child: Container(
//                                         child: Icon(
//                                           Icons.arrow_circle_left_outlined,
//                                           color: Colors.white,
//                                           size: 32,
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 110),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
                                  
//                                       Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["first_name"] : "----"} ${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["last_name"] : "----"} | ${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["age"] : "----"}",
//                                             style: TextStyle(
//                                                 fontFamily: "Raleway",
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           )),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.placemark,
//                                             color: Colors.white,
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           Text(
//                                             "${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["area"] : "----"}, ${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["city"] : "----"}",
//                                             style: TextStyle(
//                                                 fontFamily: "Raleway",
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
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
//                   padding: const EdgeInsets.only(top: 60),
//                   color: Colors.grey.withOpacity(0.5),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: Card(
//                             elevation: 50,
//                             shadowColor: Colors.white,
//                             color: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: SizedBox(
//                               width: 85,
//                               height: MediaQuery.of(context).size.height,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 15, right: 5, left: 5),
//                                 child: Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         Dialogs.materialDialog(
//                                             msg:
//                                                 'community_view'.tr,
//                                                 msgStyle: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black,
//                                             ),
//                                             // title: "Delete",
//                                             color: Colors.white,
//                                             context: context,
//                                             dialogWidth: kIsWeb ? 0.3 : null,
//                                             onClose: (value) => print(
//                                                 "returned value is '$value'"),
//                                             actions: [
//                                               SizedBox(
//                                                 height: 300,
//                                                 child: Column(
//                                                   children: [
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Card(
//                                                       elevation: 50,
//                                                       shadowColor: Colors.white,
//                                                       color: Colors.white,
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10.0),
//                                                       ),
//                                                       child: SizedBox(
//                                                         width: 280,
//                                                         height: 40,
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 20),
//                                                           child:
//                                                               SingleChildScrollView(
//                                                             scrollDirection:
//                                                                 Axis.horizontal,
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'religion'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["religion"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Card(
//                                                       elevation: 50,
//                                                       shadowColor: Colors.white,
//                                                       color: Colors.white,
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10.0),
//                                                       ),
//                                                       child: SizedBox(
//                                                         width: 280,
//                                                         height: 40,
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 20),
//                                                           child:
//                                                               SingleChildScrollView(
//                                                             scrollDirection:
//                                                                 Axis.horizontal,
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'caste'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   overflow:
//                                                                       TextOverflow
//                                                                           .fade,
//                                                                   '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["caste"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Card(
//                                                       elevation: 50,
//                                                       shadowColor: Colors.white,
//                                                       color: Colors.white,
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10.0),
//                                                       ),
//                                                       child: SizedBox(
//                                                         width: 280,
//                                                         height: 40,
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 20),
//                                                           child:
//                                                               SingleChildScrollView(
//                                                             scrollDirection:
//                                                                 Axis.horizontal,
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'sub_caste'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["sub_caste"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Card(
//                                                       elevation: 50,
//                                                       shadowColor: Colors.white,
//                                                       color: Colors.white,
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10.0),
//                                                       ),
//                                                       child: SizedBox(
//                                                         width: 280,
//                                                         height: 40,
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 20),
//                                                           child:
//                                                               SingleChildScrollView(
//                                                             scrollDirection:
//                                                                 Axis.horizontal,
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'community'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["community"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Card(
//                                                       elevation: 50,
//                                                       shadowColor: Colors.white,
//                                                       color: Colors.white,
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10.0),
//                                                       ),
//                                                       child: SizedBox(
//                                                         width: 280,
//                                                         height: 40,
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 20),
//                                                           child:
//                                                               SingleChildScrollView(
//                                                             scrollDirection:
//                                                                 Axis.horizontal,
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'mother_tongue'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   '${product['data']['customerDetails']["religion_community"] != null ? product['data']['customerDetails']["religion_community"]["mother_tongue"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ]);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Icon(
//                                             Icons.speaker_group_rounded,
//                                             color: Color(0xFF134FAF),
//                                           ),
//                                           SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           Text(
//                                             'community'.tr,
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 30,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Dialogs.materialDialog(
//                                             msg:
//                                                 'address_view'.tr,
//                                                 msgStyle: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black,
//                                             ),
//                                             // title: "Delete",
//                                             color: Colors.white,
//                                             context: context,
//                                             dialogWidth: kIsWeb ? 0.3 : null,
//                                             onClose: (value) => print(
//                                                 "returned value is '$value'"),
//                                             actions: [
//                                               if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               SizedBox(
//                                                 height: 400,
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'street'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     overflow:
//                                                                         TextOverflow
//                                                                             .fade,
//                                                                     '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["door_no"] : "----"}, ${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["street"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'area'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["area"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'city1'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["city"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'district1'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["district"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'state1'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["state"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'country1'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["country"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'nationality'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["nationality"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'current_nationality'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["communication_detials"] != null ? product['data']['customerDetails']["communication_detials"]["current_nationality"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'resident_status'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["permanent_address"] != null ? product['data']['customerDetails']["permanent_address"]["resident_status"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]else...[
//                                                    SizedBox(
//                                                 height: 90,
//                                                 child: SingleChildScrollView(
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.all(15.0),
//                                                     child: Column(
//                                                       children: [
                                                        
//                                                         Center(
//                                                           child: Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )
//                                                 )
//                                                 ],
//                                             ]);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Icon(Icons.house_rounded,
//                                               color: Color(0xFF134FAF)),
//                                           SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           Text(
//                                             'address'.tr,
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 30,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
                                        
//                                         Dialogs.materialDialog(
//                                             msg:
//                                                 'personal_view'.tr,
//                                                 msgStyle: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black,
//                                             ),
//                                             // title: "Delete",
//                                             color: Colors.white,
//                                             context: context,
//                                             dialogWidth: kIsWeb ? 0.3 : null,
//                                             onClose: (value) => print(
//                                                 "returned value is '$value'"),
//                                             actions: [
//                                               if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               SizedBox(
//                                                 height: 430,
                                                
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     children: [
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'diet'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["diet"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'martial_status'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["marital_details"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'skin_tone'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["skin_tone"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'height'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["height"]} cm',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'weight'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["weight"]} kg',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'hobbies'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["hobbies"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'no_of_child'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["no_of_children"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'child_status'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["children_status"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'physical_status'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["physical_status"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'drinking'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["drinking"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'smoking'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["smoking"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'description'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["personal_details"] != null ? "----" : product['data']['customerDetails']["personal_details"]["description"]}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]else...[
//                                                    SizedBox(
//                                                 height: 90,
//                                                 child: SingleChildScrollView(
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.all(15.0),
//                                                     child: Column(
//                                                       children: [
                                                        
//                                                         Center(
//                                                           child: Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )
//                                                 )
//                                                 ],
                                              
//                                             ]);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Icon(Icons.person_rounded,
//                                               color: Color(0xFF134FAF)),
//                                           SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           Text(
//                                             'personal'.tr,
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 30,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Dialogs.materialDialog(
//                                             msg:
//                                                 'carrier_view'.tr,
//                                                 msgStyle: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black,
//                                             ),
//                                             // title: "Delete",
//                                             color: Colors.white,
//                                             context: context,
//                                             dialogWidth: kIsWeb ? 0.3 : null,
//                                             onClose: (value) => print(
//                                                 "returned value is '$value'"),
//                                             actions: [
//                                               if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               SizedBox(
//                                                 height: 300,
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'education_qual'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["educational_qualification"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'working_in'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_in"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'working_as'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_as"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'company_details'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["company_details"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'annual_income'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '₹ ${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["annual_income"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]else...[
//                                               SizedBox(
//                                                 height: 90,
//                                                 child: SingleChildScrollView(
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.all(15.0),
//                                                     child: Column(
//                                                       children: [
                                                        
//                                                         Center(
//                                                           child: Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )
//                                                 )
//                                              ],
                                              
//                                             ]);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Icon(Icons.work,
//                                               color: Color(0xFF134FAF)),
//                                           SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           Text(
//                                             'carrier'.tr,
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 30,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Dialogs.materialDialog(
//                                             msg:
//                                                 'jathagam_view'.tr,
//                                                 msgStyle: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black,
//                                             ),
//                                             // title: "Delete",
//                                             color: Colors.white,
//                                             context: context,
//                                             dialogWidth: kIsWeb ? 0.3 : null,
//                                             onClose: (value) => print(
//                                                 "returned value is '$value'"),
//                                             actions: [
//                                                if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               SizedBox(
//                                                 height: 400,
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'rasi'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["rasi"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'nactchathiram'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["natchathiram"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'laknam'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["laknam"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'gothram'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["gothram"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'kuladeivam'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["kuladeivam"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'dosham'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["dosham"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'dosham_details'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["dosham_details"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'place_birth'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["place_of_birth"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'time_birth'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["jathagam_details"] != null ? product['data']['customerDetails']["jathagam_details"]["time_of_birth"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]else...[
//                                               SizedBox(
//                                                 height: 90,
//                                                 child: SingleChildScrollView(
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.all(15.0),
//                                                     child: Column(
//                                                       children: [
                                                        
//                                                         Center(
//                                                           child: Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )
//                                                 )
//                                              ],
//                                             ]);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Icon(Icons.note_alt_rounded,
//                                               color: Color(0xFF134FAF)),
//                                           SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           Text(
//                                             'jathagam'.tr,
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Dialogs.materialDialog(
//                                             msg:
//                                                 'Proposal Family detailed view',
//                                                 msgStyle: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black,
//                                             ),
//                                             // title: "Delete",
//                                             color: Colors.white,
//                                             context: context,
//                                             dialogWidth: kIsWeb ? 0.3 : null,
//                                             onClose: (value) => print(
//                                                 "returned value is '$value'"),
//                                             actions: [
//                                                if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               SizedBox(
//                                                 height: 500,
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'father_name'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["father_name"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'mother_name'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["mother_name"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'father_occupation'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["father_occupation"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'mother_occupation'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["mother_occupation"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'no_bro'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_bro"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'no_bro_married'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_bro_married"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'no_sis'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_sis"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'no_sis_married'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["no_of_sis_married"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'own_vechile'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_vehicle"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'own_house'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_house"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'own_lands'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_lands"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child: Row(
//                                                               children: [
//                                                                 Text(
//                                                                   'own_flats'.tr,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 7,
//                                                                 ),
//                                                                 Text(
//                                                                   '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["own_flats"] : "----"}',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           13.0,
//                                                                       fontFamily:
//                                                                           "Raleway",
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'expectation'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["expectation"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'about_me'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["about_me"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]else...[
//                                               SizedBox(
//                                                 height: 90,
//                                                 child: SingleChildScrollView(
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.all(15.0),
//                                                     child: Column(
//                                                       children: [
                                                        
//                                                         Center(
//                                                           child: Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )
//                                                 )
//                                              ],
//                                             ]);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Icon(Icons.family_restroom_rounded,
//                                               color: Color(0xFF134FAF)),
//                                           SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           Text(
//                                             'family'.tr,
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Card(
//                           elevation: 50,
//                           shadowColor: Colors.white,
//                           color: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           child: SizedBox(
//                             width: 275,
//                             height: MediaQuery.of(context).size.height,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 30, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         '${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_as"] : "----"} | ${product['data']['customerDetails']["carrier_and_working_details"] != null ? product['data']['customerDetails']["carrier_and_working_details"]["working_in"] : "----"}',
//                                         style: TextStyle(
//                                             fontSize: 15.0,
//                                             fontFamily: "Raleway",
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 25, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'about_family'.tr,
//                                         style: TextStyle(
//                                           color: Color(0xFF134FAF),
//                                             fontSize: 19.0,
//                                             fontFamily: "Raleway",
//                                             fontWeight: FontWeight.w900),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 15, left: 20, right: 6),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Column(
//                                         children: [
//                                           if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["about_family"] : "----"}',
//                                             style: TextStyle(
//                                               fontSize: 14.0,
//                                               fontFamily: "Raleway",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                             ]else...[
                                              
//                                                       Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                       fontSize: 14.0,
//                                                       fontFamily: "Raleway",
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
                                                   
//                                             ],
                                          
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 25, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'about_her'.tr,
//                                         style: TextStyle(
//                                           color: Color(0xFF134FAF),
//                                             fontSize: 19.0,
//                                             fontFamily: "Raleway",
//                                             fontWeight: FontWeight.w900),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 15, left: 20, right: 6),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Column(
//                                         children: [
//                                          if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["about_me"] : "----"}',
//                                             style: TextStyle(
//                                               fontSize: 14.0,
//                                               fontFamily: "Raleway",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                             ]else...[
//                                                Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                       fontSize: 14.0,
//                                                       fontFamily: "Raleway",
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                             ],
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 25, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
                                        
//                                         'about_expectation'.tr,
//                                         style: TextStyle(
//                                           color: Color(0xFF134FAF),
//                                             fontSize: 19.0,
//                                             fontFamily: "Raleway",
//                                             fontWeight: FontWeight.w900),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 15, left: 20, right: 6),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Column(
//                                         children: [
//                                           if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                               Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             '${product['data']['customerDetails']["family_details"] != null ? product['data']['customerDetails']["family_details"]["expectation"] : "----"}',
//                                             style: TextStyle(
//                                               fontSize: 14.0,
//                                               fontFamily: "Raleway",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                             ]else...[
//                                                Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                       fontSize: 14.0,
//                                                       fontFamily: "Raleway",
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                             ],
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 25, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'about_habits'.tr,
//                                         style: TextStyle(
//                                           color: Color(0xFF134FAF),
//                                             fontSize: 19.0,
//                                             fontFamily: "Raleway",
//                                             fontWeight: FontWeight.w900),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(left: 10, right: 6),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: SingleChildScrollView(
//                                         child: Column(
//                                           children: [
//                                             SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                         Card(
//                                                           elevation: 50,
//                                                           shadowColor:
//                                                               Colors.white,
//                                                           color: Colors.white,
//                                                           shape:
//                                                               RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10.0),
//                                                           ),
//                                                           child: SizedBox(
//                                                             width: 280,
//                                                             height: 100,
//                                                             child: Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                           .only(
//                                                                       left: 10),
//                                                               child: Column(
//                                                                 children: [
//                                                                   if(product['data']["requestSentAcceptDetails"] == 1 ||
//                                             product['data']["requestRecievedAcceptDetails"] == 1)...[
//                                                Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         'drinking'.tr,
//                                                                         style: TextStyle(
//                                                                             fontSize:
//                                                                                 13.0,
//                                                                             fontFamily:
//                                                                                 "Raleway",
//                                                                             fontWeight:
//                                                                                 FontWeight
//                                                                                     .bold),
//                                                                       ),
//                                                                       SizedBox(
//                                                                         width: 7,
//                                                                       ),
//                                                                       Text(
//                                                                         "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["drinking"] : "----"}",
//                                                                         style: TextStyle(
//                                                                             fontSize:
//                                                                                 13.0,
//                                                                             fontFamily:
//                                                                                 "Raleway",
//                                                                             fontWeight:
//                                                                                 FontWeight
//                                                                                     .bold),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                    SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                                   Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         'smoking'.tr,
//                                                                         style: TextStyle(
//                                                                             fontSize:
//                                                                                 13.0,
//                                                                             fontFamily:
//                                                                                 "Raleway",
//                                                                             fontWeight:
//                                                                                 FontWeight
//                                                                                     .bold),
//                                                                       ),
//                                                                       SizedBox(
//                                                                         width: 7,
//                                                                       ),
//                                                                       Text(
//                                                                        "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["smoking"] : "----"}",
//                                                                         style: TextStyle(
//                                                                             fontSize:
//                                                                                 13.0,
//                                                                             fontFamily:
//                                                                                 "Raleway",
//                                                                             fontWeight:
//                                                                                 FontWeight
//                                                                                     .bold),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                    SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                                   SingleChildScrollView(
//                                                                     scrollDirection: Axis.horizontal,
//                                                                     child: Row(
//                                                                       children: [
//                                                                         Text(
//                                                                           'other_languages'.tr,
//                                                                           style: TextStyle(
//                                                                               fontSize:
//                                                                                   13.0,
//                                                                               fontFamily:
//                                                                                   "Raleway",
//                                                                               fontWeight:
//                                                                                   FontWeight
//                                                                                       .bold),
//                                                                         ),
//                                                                         SizedBox(
//                                                                           width: 7,
//                                                                         ),
//                                                                         Text(
//                                                                            "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["other_languages"] : "----"}",
//                                                                           style: TextStyle(
//                                                                               fontSize:
//                                                                                   13.0,
//                                                                               fontFamily:
//                                                                                   "Raleway",
//                                                                               fontWeight:
//                                                                                   FontWeight
//                                                                                       .bold),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                    SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                                   SingleChildScrollView(
//                                                                     scrollDirection: Axis.horizontal,
//                                                                     child: Row(
//                                                                       children: [
//                                                                         Text(
//                                                                           'hobbies'.tr,
//                                                                           style: TextStyle(
//                                                                               fontSize:
//                                                                                   13.0,
//                                                                               fontFamily:
//                                                                                   "Raleway",
//                                                                               fontWeight:
//                                                                                   FontWeight
//                                                                                       .bold),
//                                                                         ),
//                                                                         SizedBox(
//                                                                           width: 7,
//                                                                         ),
//                                                                         Text(
//                                                                           "${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["hobbies"] : "----"}",
//                                                                           style: TextStyle(
//                                                                               fontSize:
//                                                                                   13.0,
//                                                                               fontFamily:
//                                                                                   "Raleway",
//                                                                               fontWeight:
//                                                                                   FontWeight
//                                                                                       .bold),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                             ]else...[
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top:15),
//                                                   child: Center(
//                                                     child: Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             textDirection: TextDirection.ltr,
//                                             maxLines: 10,
//                                             'lock'.tr,
//                                             style: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.grey,
//                                             ),
//                                             softWrap: false,
//                                           ),
//                                                   ),
//                                                 ),
//                                             ],
                                                                 
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 25, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.person,
//                                             color: Color(0xFF134FAF),
//                                             size: 20,
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Text(
//                                             'Profile created by ${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["profile_for"] : "----"}',
//                                             style: TextStyle(
//                                                 fontSize: 14.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap:(){
//                                       Dialogs.materialDialog(
//                                             msg:
//                                                 'contact_info'.tr,
//                                                 msgStyle: TextStyle(
//                                                           fontSize: 14.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight: FontWeight.bold,
//                                                           color: Colors.black,
//                                             ),
//                                             // title: "Delete",
//                                             color: Colors.white,
//                                             context: context,
//                                             dialogWidth: kIsWeb ? 0.3 : null,
//                                             onClose: (value) => print(
//                                                 "returned value is '$value'"),
//                                             actions: [
//                                                SizedBox(
//                                                 height: 150,
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'phone_no'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     overflow:
//                                                                         TextOverflow
//                                                                             .fade,
//                                                                     '${product['data'] != null && product['data']['userDetails'] != null && product['data']['userDetails']["auth_details"] != null ? product['data']['userDetails']["auth_details"]["mobile_number"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
                                                      
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Card(
//                                                         elevation: 50,
//                                                         shadowColor:
//                                                             Colors.white,
//                                                         color: Colors.white,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                         ),
//                                                         child: SizedBox(
//                                                           width: 280,
//                                                           height: 40,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 20),
//                                                             child:
//                                                                 SingleChildScrollView(
//                                                               scrollDirection:
//                                                                   Axis.horizontal,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     'email'.tr,
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     width: 7,
//                                                                   ),
//                                                                   Text(
//                                                                     overflow:
//                                                                         TextOverflow
//                                                                             .fade,
//                                                                     '${product['data'] != null && product['data']['userDetails'] != null && product['data']['userDetails']["auth_details"] != null ? product['data']['userDetails']["auth_details"]["email"] : "----"}',
//                                                                     style: TextStyle(
//                                                                         fontSize:
//                                                                             13.0,
//                                                                         fontFamily:
//                                                                             "Raleway",
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       ],),),),
//                                             ]);
//                                     },
//                                     child: Padding(
//                                       padding:
//                                           const EdgeInsets.only(top: 15, left: 20),
//                                       child: Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Row(
//                                           children: [
//                                             Icon(
//                                               Icons.contact_phone_rounded,
//                                               color: Color(0xFF134FAF),
//                                               size: 20,
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text(
//                                               'contact_info1'.tr,
//                                               style: TextStyle(
//                                                   fontSize: 14.0,
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 10, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.heat_pump_rounded,
//                                             color: Color(0xFF134FAF),
//                                             size: 20,
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Text(
//                                             '${product['data']['customerDetails']["personal_details"] != null ? product['data']['customerDetails']["personal_details"]["marital_details"] : "----"}',
//                                             style: TextStyle(
//                                                 fontSize: 14.0,
//                                                 fontFamily: "Raleway",
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 10, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.heat_pump_rounded,
//                                             color: Color(0xFF134FAF),
//                                             size: 20,
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Row(
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   showModalBottomSheet(
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                                 20.0),
//                                                       ),
//                                                       isScrollControlled: true,
//                                                       context: context,
//                                                       builder: (BuildContext bc) {
//                                                         return Container(
//                                                             child: new Wrap(
//                                                                 children: <
//                                                                     Widget>[
//                                                               Align(
//                                                                 alignment: Alignment
//                                                                     .centerLeft,
//                                                                 child: Padding(
//                                                                     padding:
//                                                                         const EdgeInsets
//                                                                             .symmetric(
//                                                                       horizontal:
//                                                                           8.0,
//                                                                       vertical:
//                                                                           8.0,
//                                                                     ),
//                                                                     child:
//                                                                         SingleChildScrollView(
//                                                                       child:
//                                                                           Stack(
//                                                                         children: [
//                                                                           Center(
//                                                                             child:
//                                                                                 Column(children: <Widget>[
//                                                                               Container(
//                                                                                 padding: EdgeInsets.all(10),
//                                                                                 child: Table(
//                                                                                   defaultColumnWidth: FixedColumnWidth(85.0),
//                                                                                   defaultVerticalAlignment: TableCellVerticalAlignment.top,
//                                                                                   border: TableBorder.all(color: Color(0xFF134FAF), style: BorderStyle.solid, width: 3.5),
//                                                                                   children: [
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'a'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["A"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["A"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'b'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["B"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["B"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'c'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["C"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["C"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'd'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["D"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["D"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'e'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["E"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["E"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'f'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["F"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["F"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'g'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["G"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["G"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'h'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["H"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["H"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'i'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["I"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["I"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'j'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["J"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["J"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'k'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["K"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["K"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'l'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["rasi"]["L"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["rasi"]["L"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ]),
//                                                                           ),
//                                                                           Positioned(
//                                                                             top:
//                                                                                 110,
//                                                                             right:
//                                                                                 102.5,
//                                                                             child:
//                                                                                 Container(
//                                                                               height:
//                                                                                   200.0,
//                                                                               width:
//                                                                                   170.0,
//                                                                               color:
//                                                                                   Colors.transparent,
//                                                                               child: Container(
//                                                                                   decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0xFF134FAF), width: 3)),
//                                                                                   child: new Center(
//                                                                                     child: new Text(
//                                                                                       'raasi'.tr,
//                                                                                       style: TextStyle(fontFamily: "Raleway", fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
//                                                                                     ),
//                                                                                   )),
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     )),
//                                                               ),
//                                                             ]));
//                                                       });
//                                                   //                                       SlidingUpPanel(
//                                                   //   panel: Center(
//                                                   //     child: Text("This is the sliding Widget"),
//                                                   //   ),
//                                                   //   body: Center(
//                                                   //     child: Text("This is the Widget behind the sliding panel"),
//                                                   //   ),
//                                                   // );
//                                                   //  Dialogs.materialDialog(
//                                                   // msg:
//                                                   //     'Proposal Community detailed view',
//                                                   // // title: "Delete",
//                                                   // color: Colors.white,
//                                                   // context: context,
//                                                   // dialogWidth: kIsWeb ? 0.1 : null,
//                                                   // onClose: (value) => print(
//                                                   //     "returned value is '$value'"),
//                                                   // actions: [
//                                                   //   SizedBox(
//                                                   //     height: 300,)]);
//                                                 },
//                                                 child: Text(
//                                                   'raasi_horoscopic'.tr,
//                                                   style: TextStyle(
//                                                       fontSize: 14.0,
//                                                       fontFamily: "Raleway",
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 10, left: 20),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.heat_pump_rounded,
//                                             color: Color(0xFF134FAF),
//                                             size: 20,
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Row(
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   showModalBottomSheet(
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                                 20.0),
//                                                       ),
//                                                       isScrollControlled: true,
//                                                       context: context,
//                                                       builder: (BuildContext bc) {
//                                                         return Container(
//                                                             child: new Wrap(
//                                                                 children: <
//                                                                     Widget>[
//                                                               Align(
//                                                                 alignment: Alignment
//                                                                     .centerLeft,
//                                                                 child: Padding(
//                                                                     padding:
//                                                                         const EdgeInsets
//                                                                             .symmetric(
//                                                                       horizontal:
//                                                                           8.0,
//                                                                       vertical:
//                                                                           8.0,
//                                                                     ),
//                                                                     child:
//                                                                         SingleChildScrollView(
//                                                                       child:
//                                                                           Stack(
//                                                                         children: [
//                                                                           Center(
//                                                                             child:
//                                                                                 Column(children: <Widget>[
//                                                                               Container(
//                                                                                 padding: EdgeInsets.all(10),
//                                                                                 child: Table(
//                                                                                   defaultColumnWidth: FixedColumnWidth(85.0),
//                                                                                   defaultVerticalAlignment: TableCellVerticalAlignment.top,
//                                                                                   border: TableBorder.all(color: Color(0xFF134FAF), style: BorderStyle.solid, width: 3.5),
//                                                                                   children: [
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'a'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["A"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["A"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'b'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["B"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["B"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'c'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["C"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["C"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'd'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["D"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["D"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'e'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["E"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["E"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'f'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["F"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["F"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'g'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["G"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["G"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(child: SizedBox.shrink()),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'h'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["H"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["H"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                     TableRow(children: [
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'i'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["I"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["I"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'j'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["J"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["J"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'k'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["K"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["K"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       TableCell(
//                                                                                         child: Column(
//                                                                                           children: [
//                                                                                             Container(
//                                                                                               child: SingleChildScrollView(
//                                                                                                 scrollDirection: Axis.horizontal,
//                                                                                                 child: Row(
//                                                                                                   children: [
//                                                                                                     Padding(
//                                                                                                         padding: const EdgeInsets.only(bottom: 55, left: 10),
//                                                                                                         child: Container(
//                                                                                                           height: 20,
//                                                                                                           width: 20,
//                                                                                                           decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
//                                                                                                               //more than 50% of width makes circle
                            
//                                                                                                               ),
//                                                                                                           child: Center(
//                                                                                                             child: Text(
//                                                                                                               'l'.tr,
//                                                                                                               style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         )),
//                                                                                                     Align(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: SizedBox(
//                                                                                                         height: 100,
//                                                                                                         width: 100,
//                                                                                                         child: Padding(
//                                                                                                           padding: const EdgeInsets.only(top: 30),
//                                                                                                           child: Text(
//                                                                                                             '${product['data']['customerDetails']["horoscope"]["second"]["L"].join("\n" + " ") != null ? product['data']['customerDetails']["horoscope"]["second"]["L"].join("\n" + " ") : ""}',
//                                                                                                             style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ],
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ]),
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ]),
//                                                                           ),
//                                                                           Positioned(
//                                                                             top:
//                                                                                 110,
//                                                                             right:
//                                                                                 102.5,
//                                                                             child:
//                                                                                 Container(
//                                                                               height:
//                                                                                   200.0,
//                                                                               width:
//                                                                                   170.0,
//                                                                               color:
//                                                                                   Colors.transparent,
//                                                                               child: Container(
//                                                                                   decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0xFF134FAF), width: 3)),
//                                                                                   child: new Center(
//                                                                                     child: new Text(
//                                                                                       'amsam'.tr,
//                                                                                       style: TextStyle(fontFamily: "Raleway", fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
//                                                                                     ),
//                                                                                   )),
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     )),
//                                                               ),
//                                                             ]));
//                                                       });
//                                                   //                                       SlidingUpPanel(
//                                                   //   panel: Center(
//                                                   //     child: Text("This is the sliding Widget"),
//                                                   //   ),
//                                                   //   body: Center(
//                                                   //     child: Text("This is the Widget behind the sliding panel"),
//                                                   //   ),
//                                                   // );
//                                                   //  Dialogs.materialDialog(
//                                                   // msg:
//                                                   //     'Proposal Community detailed view',
//                                                   // // title: "Delete",
//                                                   // color: Colors.white,
//                                                   // context: context,
//                                                   // dialogWidth: kIsWeb ? 0.1 : null,
//                                                   // onClose: (value) => print(
//                                                   //     "returned value is '$value'"),
//                                                   // actions: [
//                                                   //   SizedBox(
//                                                   //     height: 300,)]);
//                                                 },
//                                                 child: Text(
//                                                   'amsam_horoscopic'.tr,
//                                                   style: TextStyle(
//                                                       fontSize: 14.0,
//                                                       fontFamily: "Raleway",
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 20, left: 10, right: 10),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Card(
//                                         elevation: 50,
//                                         // shadowColor: Color(0xFF134FAF),
//                                         color: Color(0xFF134FAF),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                         ),
//                                         child: SizedBox(
//                                           width: 275,
//                                           height: 80,
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top: 20, left: 20),
//                                                 child: Column(
//                                                   children: [
//                                                     Align(
//                                                       alignment:
//                                                           Alignment.centerLeft,
//                                                       child: Text(
//                                                         'jathagam_available'.tr,
//                                                         style: TextStyle(
//                                                             fontSize: 13.0,
//                                                             fontFamily: "Raleway",
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color: Colors.white),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Text(
//                                                       'download_jathagam'.tr,
//                                                       style: TextStyle(
//                                                           fontSize: 16.0,
//                                                           fontFamily: "Raleway",
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Icon(
//                                                 CupertinoIcons
//                                                     .cloud_download_fill,
//                                                 color: Colors.white,
//                                                 size: 40,
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             top: screenHeight * (4 / 9) - 200 / 2,
//             left: 10,
//             right: 10,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Card(
//                 elevation: 50,
//                 shadowColor: Colors.white,
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: SizedBox(
//                   width: 10,
//                   height: 80,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       if (product['data']['requestSentDetails'] == 0 &&
//                           !(product['data']['requestSentAcceptDetails'] == 1 ||
//                               product['data']['requestSentRejectDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedRejectDetails'] ==
//                                   1)) ...[
//                         InkWell(
//                           onTap: () {
//                             if(controller1.percent.value <= 70){
//                                                                               showDialogBox();
//                                                                             }else{
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'sent_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'sent_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         sentRequestProposal(
//                                                             product['data'][
//                                                                     'customerDetails']
//                                                                 ['user_obj_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                                                                             }
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestSentDetails'] == 1 &&
//                           !(product['data']['requestSentAcceptDetails'] == 1 ||
//                               product['data']['requestSentRejectDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedRejectDetails'] ==
//                                   1)) ...[
//                         InkWell(
//                           onTap: () {
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'withdraw_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'withdraw_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         withdrawProposal(
//                                                             product['data'][
//                                                                     'profileRequestStatus']
//                                                                 ['_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_remove_sharp,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'withdraw'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestSentAcceptDetails'] == 0 &&
//                           !(product['data']['requestSentDetails'] == 1 ||
//                               product['data']['requestSentRejectDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedRejectDetails'] ==
//                                   1)) ...[
//                         InkWell(
//                           onTap: () {
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'sent_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'sent_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         sentRequestProposal(
//                                                             product['data'][
//                                                                     'customerDetails']
//                                                                 ['user_obj_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestSentAcceptDetails'] == 1 &&
//                           !(product['data']['requestSentDetails'] == 1 ||
//                               product['data']['requestSentRejectDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedRejectDetails'] ==
//                                   1)) ...[
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                     child: Column(
//                                   children: [
//                                     Icon(Icons.people,
//                                         color: Color(0xFF134FAF)),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'friends'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ],
//                                 )),
//                               ),
//                             ),
//                             SizedBox(width: 55),
//                             InkWell(
//                               onTap: () {},
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                     child: Column(
//                                   children: [
//                                     Icon(Ionicons.chatbubbles_outline,
//                                         color: Color(0xFF134FAF)),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'chat'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ],
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ] else if (product['data']['requestSentRejectDetails'] == 0 &&
//                           !(product['data']['requestSentAcceptDetails'] == 1 ||
//                               product['data']['requestSentDetails'] == 1 ||
//                               product['data']['requestRecievedDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedRejectDetails'] ==
//                                   1)) ...[
//                         InkWell(
//                           onTap: () {
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'sent_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'sent_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         sentRequestProposal(
//                                                             product['data'][
//                                                                     'customerDetails']
//                                                                 ['user_obj_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestSentRejectDetails'] == 1 &&
//                           !(product['data']['requestSentAcceptDetails'] == 1 ||
//                               product['data']['requestSentDetails'] == 1 ||
//                               product['data']['requestRecievedDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedRejectDetails'] ==
//                                   1)) ...[
//                         InkWell(
//                           onTap: () {
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'sent_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'sent_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         sentRequestProposal(
//                                                             product['data'][
//                                                                     'customerDetails']
//                                                                 ['user_obj_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestRecievedDetails'] == 0 &&
//                           !(product['data']['requestSentAcceptDetails'] == 1 ||
//                               product['data']['requestSentRejectDetails'] ==
//                                   1 ||
//                               product['data']['requestSentDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] ==
//                                   1 ||
//                               product['data']['requestRecievedRejectDetails'] ==
//                                   1)) ...[
//                         InkWell(
//                           onTap: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestRecievedDetails'] == 1 &&
//                           !(product['data']['requestSentAcceptDetails'] == 1 ||
//                               product['data']['requestSentRejectDetails'] == 1 ||
//                               product['data']['requestSentDetails'] == 1 ||
//                               product['data']['requestRecievedAcceptDetails'] == 1 ||
//                               product['data']['requestRecievedRejectDetails'] == 1)) ...[
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Dialogs.materialDialog(
//                                     useSafeArea: true,
//                                     msg: 'accept_proposal'.tr,
//                                     msgStyle: TextStyle(
//                                         fontFamily: "Raleway",
//                                         fontWeight: FontWeight.w500,
//                                         color: Color(0xFF134FAF),
//                                         fontSize: 25),
//                                     color: Color(0xffEAF12D),
//                                     context: context,
//                                     dialogWidth: kIsWeb ? 0.3 : null,
//                                     onClose: (value) =>
//                                         print("returned value is '$value'"),
//                                     actions: [
//                                       SizedBox(
//                                           height: 120,
//                                           child: SingleChildScrollView(
//                                             child: Column(children: [
//                                               Container(
//                                                 alignment: Alignment.center,
//                                                 child: Text(
//                                                   'accept_pop'.tr,
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontFamily: "Raleway",
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                       fontSize: 17),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 25,
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     EdgeInsets.only(left: 50),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('cancel'.tr),
//                                                           onPressed: () {
//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                         SizedBox(width: 35),
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('okay'.tr),
//                                                           onPressed: () {
//                                                             acceptProposal(
//                                                                 product['data'][
//                                                                         'profileRequestStatus']
//                                                                     ['_id'],
//                                                                 context);

//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ]),
//                                           ))
//                                     ]);
//                               },
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                     child: Column(
//                                   children: [
//                                     Icon(Coolicons.circle_check_outline,
//                                         color: Color(0xFF134FAF)),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'accept'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ],
//                                 )),
//                               ),
//                             ),
//                             SizedBox(width: 55),
//                             InkWell(
//                               onTap: () {
//                                 Dialogs.materialDialog(
//                                     useSafeArea: true,
//                                     msg: 'reject_proposal'.tr,
//                                     msgStyle: TextStyle(
//                                         fontFamily: "Raleway",
//                                         fontWeight: FontWeight.w500,
//                                         color: Color(0xFF134FAF),
//                                         fontSize: 25),
//                                     color: Color(0xffEAF12D),
//                                     context: context,
//                                     dialogWidth: kIsWeb ? 0.3 : null,
//                                     onClose: (value) =>
//                                         print("returned value is '$value'"),
//                                     actions: [
//                                       SizedBox(
//                                           height: 120,
//                                           child: SingleChildScrollView(
//                                             child: Column(children: [
//                                               Container(
//                                                 alignment: Alignment.center,
//                                                 child: Text(
//                                                   'reject_pop'.tr,
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontFamily: "Raleway",
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                       fontSize: 17),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 25,
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     EdgeInsets.only(left: 50),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('cancel'.tr),
//                                                           onPressed: () {
//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                         SizedBox(width: 35),
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('okay'.tr),
//                                                           onPressed: () {
//                                                             rejectProposal(
//                                                                 product['data'][
//                                                                         'profileRequestStatus']
//                                                                     ['_id'],
//                                                                 context);

//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ]),
//                                           ))
//                                     ]);
//                               },
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                     child: Column(
//                                   children: [
//                                     Icon(Coolicons.off_outline_close,
//                                         color: Color(0xFF134FAF)),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'reject'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ],
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ] else if (product['data']['requestRecievedAcceptDetails'] == 0 && !(product['data']['requestSentAcceptDetails'] == 1 || product['data']['requestSentRejectDetails'] == 1 || product['data']['requestRecievedDetails'] == 1 || product['data']['requestSentDetails'] == 1 || product['data']['requestRecievedRejectDetails'] == 1)) ...[
//                         InkWell(
//                           onTap: () {
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'sent_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'sent_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         sentRequestProposal(
//                                                             product['data'][
//                                                                     'customerDetails']
//                                                                 ['user_obj_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestRecievedAcceptDetails'] == 1 && !(product['data']['requestSentAcceptDetails'] == 1 || product['data']['requestSentRejectDetails'] == 1 || product['data']['requestRecievedDetails'] == 1 || product['data']['requestSentDetails'] == 1 || product['data']['requestRecievedRejectDetails'] == 1)) ...[
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                     child: Column(
//                                   children: [
//                                     Icon(Icons.people,
//                                         color: Color(0xFF134FAF)),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'friends'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ],
//                                 )),
//                               ),
//                             ),
//                             SizedBox(width: 55),
//                             InkWell(
//                               onTap: () {},
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                     child: Column(
//                                   children: [
//                                     Icon(Ionicons.chatbubbles_outline,
//                                         color: Color(0xFF134FAF)),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'chat'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ],
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ] else if (product['data']['requestRecievedRejectDetails'] == 0 && !(product['data']['requestSentAcceptDetails'] == 1 || product['data']['requestSentRejectDetails'] == 1 || product['data']['requestRecievedDetails'] == 1 || product['data']['requestRecievedAcceptDetails'] == 1 || product['data']['requestSentDetails'] == 1)) ...[
//                         InkWell(
//                           onTap: () {
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'sent_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'sent_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         sentRequestProposal(
//                                                             product['data'][
//                                                                     'customerDetails']
//                                                                 ['user_obj_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else if (product['data']['requestRecievedRejectDetails'] == 1 && !(product['data']['requestSentAcceptDetails'] == 1 || product['data']['requestSentRejectDetails'] == 1 || product['data']['requestRecievedDetails'] == 1 || product['data']['requestRecievedAcceptDetails'] == 1 || product['data']['requestSentDetails'] == 1)) ...[
//                         InkWell(
//                           onTap: () {
//                             Dialogs.materialDialog(
//                                 useSafeArea: true,
//                                 msg: 'sent_proposal'.tr,
//                                 msgStyle: TextStyle(
//                                     fontFamily: "Raleway",
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF134FAF),
//                                     fontSize: 25),
//                                 color: Color(0xffEAF12D),
//                                 context: context,
//                                 dialogWidth: kIsWeb ? 0.3 : null,
//                                 onClose: (value) =>
//                                     print("returned value is '$value'"),
//                                 actions: [
//                                   SizedBox(
//                                       height: 120,
//                                       child: SingleChildScrollView(
//                                         child: Column(children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'sent_pop'.tr,
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: "Raleway",
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 17),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 50),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('cancel'.tr),
//                                                       onPressed: () {
//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                     SizedBox(width: 35),
//                                                     ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         primary:
//                                                             Color(0xFF134FAF),
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                       ),
//                                                       child: Text('okay'.tr),
//                                                       onPressed: () {
//                                                         sentRequestProposal(
//                                                             product['data'][
//                                                                     'customerDetails']
//                                                                 ['user_obj_id'],
//                                                             context);

//                                                         Navigator.pop(context);

//                                                         // fetchWishListProposal("");
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                       ))
//                                 ]);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 10, right: 10),
//                             child: Container(
//                                 child: Column(
//                               children: [
//                                 Icon(Ionicons.person_circle_outline,
//                                     color: Color(0xFF134FAF)),
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Text(
//                                   'sent_proposal'.tr,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontFamily: "Raleway",
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             )),
//                           ),
//                         ),
//                       ] else ...[
//                         Container()
//                       ],

//                       // Padding(
//                       //   padding: const EdgeInsets.only(top: 10, right: 10),
//                       //   child: Container(
//                       //       child: Column(
//                       //     children: [
//                       //       Icon(Ionicons.chatbox, color: Color(0xFF134FAF)),
//                       //       SizedBox(
//                       //         height: 10.0,
//                       //       ),
//                       //       Text(
//                       //         "chat now",
//                       //         style: TextStyle(
//                       //             fontSize: 16.0,
//                       //             fontFamily: "Raleway",
//                       //             fontWeight: FontWeight.bold),
//                       //       )
//                       //     ],
//                       //   )),
//                       // ),
//                       product['data']['isProfileWhishlisted'] == 0
//                           ? InkWell(
//                               onTap: () {
//                                 Dialogs.materialDialog(
//                                     useSafeArea: true,
//                                     msg: 'wishlist'.tr,
//                                     msgStyle: TextStyle(
//                                         fontFamily: "Raleway",
//                                         fontWeight: FontWeight.w500,
//                                         color: Color(0xFF134FAF),
//                                         fontSize: 25),
//                                     color: Color(0xffEAF12D),
//                                     context: context,
//                                     dialogWidth: kIsWeb ? 0.3 : null,
//                                     onClose: (value) =>
//                                         print("returned value is '$value'"),
//                                     actions: [
//                                       SizedBox(
//                                           height: 120,
//                                           child: SingleChildScrollView(
//                                             child: Column(children: [
//                                               Container(
//                                                 alignment: Alignment.center,
//                                                 child: Text(
//                                                   'wishlist_pop'.tr,
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontFamily: "Raleway",
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                       fontSize: 17),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 25,
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     EdgeInsets.only(left: 50),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('cancel'.tr),
//                                                           onPressed: () {
//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                         SizedBox(width: 35),
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('okay'.tr),
//                                                           onPressed: () {
//                                                             addWishListProposal(
//                                                                 product['data'][
//                                                                         'customerDetails']
//                                                                     [
//                                                                     'user_obj_id'],
//                                                                 context);

//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ]),
//                                           ))
//                                     ]);
//                               },
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                   child: Column(children: [
//                                     Icon(
//                                       CupertinoIcons.heart_fill,
//                                       color: Colors.grey,
//                                     ),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'wishlist'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ]),
//                                 ),
//                               ),
//                             )
//                           : InkWell(
//                               onTap: () {
//                                 Dialogs.materialDialog(
//                                     useSafeArea: true,
//                                     msg: 'wishlist'.tr,
//                                     msgStyle: TextStyle(
//                                         fontFamily: "Raleway",
//                                         fontWeight: FontWeight.w500,
//                                         color: Color(0xFF134FAF),
//                                         fontSize: 25),
//                                     color: Color(0xffEAF12D),
//                                     context: context,
//                                     dialogWidth: kIsWeb ? 0.3 : null,
//                                     onClose: (value) =>
//                                         print("returned value is '$value'"),
//                                     actions: [
//                                       SizedBox(
//                                           height: 120,
//                                           child: SingleChildScrollView(
//                                             child: Column(children: [
//                                               Container(
//                                                 alignment: Alignment.center,
//                                                 child: Text(
//                                                   'remove_wishlist_pop'.tr,
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontFamily: "Raleway",
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                       fontSize: 17),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 25,
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     EdgeInsets.only(left: 50),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('cancel'.tr),
//                                                           onPressed: () {
//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                         SizedBox(width: 35),
//                                                         ElevatedButton(
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             primary: Color(
//                                                                 0xFF134FAF),
//                                                             shape: RoundedRectangleBorder(
//                                                                 borderRadius: BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             10))),
//                                                           ),
//                                                           child: Text('okay'.tr),
//                                                           onPressed: () {
//                                                             removeWishListProposal(
//                                                                 product['data']['ProfileWhishlistedDetails']['_id'],
//                                                                 context);

//                                                             Navigator.pop(
//                                                                 context);

//                                                             // fetchWishListProposal("");
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ]),
//                                           ))
//                                     ]);
//                               },
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, right: 10),
//                                 child: Container(
//                                   child: Column(children: [
//                                     Icon(
//                                       CupertinoIcons.heart_fill,
//                                       color: Color(0xFF134FAF),
//                                     ),
//                                     SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       'wishlist'.tr,
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           fontFamily: "Raleway",
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ]),
//                                 ),
//                               ),
//                             ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Card(

//             //    elevation: 50,
//             //             shadowColor: Colors.white,
//             //             color: Colors.white,
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(20.0),
//             //             ),
//             //     child: SizedBox(
//             //       width: 150,
//             //       child: Padding(
//             //         padding:EdgeInsets.all(30.0),
//             //         child: Row(
//             //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //           children: [
//             //             Container(
//             //               child:Column(
//             //                 children: [
//             //                   Icon(Ionicons.person_add_outline),
//             //                   SizedBox(height: 5.0,),
//             //                   Text("sent proposal",
//             //                   style: TextStyle(
//             //                     fontSize: 15.0,
//             //                   ),)
//             //                 ],
//             //               )
//             //             ),

//             //             Container(
//             //               child: Column(
//             //               children: [
//             //                 Icon(Ionicons.heart_circle),
//             //                 SizedBox(height: 5.0,),
//             //                 Text('wishlist',
//             //                   style: TextStyle(
//             //                     fontSize: 15.0,
//             //                   ),)
//             //               ]),
//             //             ),

//             //           ],
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//           ),
//         ],
//       ),
//     );
//     }));
//   }
// }


// class MyCustomPageTransitionBuilder extends PageTransitionsBuilder {
//   @override
//   Widget buildTransitions<T>(
//     Route<T> route,
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: const Offset(1.0, 0.0),
//         end: Offset.zero,
//       ).animate(animation),
//       child: Container(
//         color: Colors.white, // Set the background color here
//         child: child,
//       ),
//     );
//   }
// }