// import 'dart:async';

// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:coolicons/coolicons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:material_dialogs/material_dialogs.dart';
// import 'package:thirumanam/controller/post_feed_controller.dart';
// import 'package:thirumanam/controller/received_proposal_controller.dart';
// import 'package:thirumanam/controller/wishlist_controller.dart';
// import 'package:thirumanam/models/add_like_model.dart';
// import 'package:thirumanam/models/proposal_model.dart';
// import 'package:thirumanam/models/received_proprosal_model.dart';
// import 'package:thirumanam/models/wishList_model.dart';
// import 'package:thirumanam/resources/app_routes.dart';
// import 'package:thirumanam/widget/add_like_search.dart';
// import 'package:thirumanam/widget/search_recevied.dart';
// import 'package:thirumanam/widget/wishlist_search_delegate.dart';

// import '../../controller/search_detailed_filter_controller.dart';


// class LikedBy extends StatefulWidget {
//   LikedBy({Key? Key, required this.idMatch});
//   String idMatch;
//    @override
//   LikedByState createState() => LikedByState();
// }

// class LikedByState extends State<LikedBy> {
//     final controller = Get.find<PostFeedController>();
//      TextEditingController SearchController = TextEditingController(text: '');
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RefreshIndicator(
//          color: Colors.white,
// backgroundColor: Colors.orangeAccent,
// displacement: 200,
// strokeWidth: 4,
// triggerMode: RefreshIndicatorTriggerMode.onEdge,
//         onRefresh: () { 
            
//           return Future((){
            
//             setState(() {
               
//               controller.fetchaddLike('');
//             });
//           });
    
//          },
//         child: Stack(
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height*4/7,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [Color(0xFF134FAF), Colors.black],
//                   ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4.4),
//               width: double.infinity,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//                 color: Colors.white.withOpacity(0.9)
//               ),
//             ),
//             Positioned(
//               top: 20,
//               left: 5,
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed:()=> Navigator.pop(context),
//                                 icon: Icon(Icons.arrow_back,
//                     color: Colors.white,
//                     size: 25,),
//                   ),
//                    Text(
//                 "Likes",
//                 style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
//               ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 90,
//               left: 20,
//               child: Column(
//                 children: [
//                   Container(
//           width: 350,
//           height: 40,
//           decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(20)),
//           child: Center(
//             child: TextField(
                                  
//                                   controller: SearchController,
//                                   onTap: () {
                                   
//                                     showSearch(
//                                         context: context,
//                                         delegate: AddLikeSearchDelegate());
//                                   },
//                                   decoration: InputDecoration(
//                                       prefixIcon: const Icon(
//                                         Icons.search,
//                                         color: Color(0xFF134FAF),
//                                       ),
//                                       suffixIcon: IconButton(
//                                         icon: const Icon(Icons.clear),
//                                         onPressed: SearchController.clear,
//                                       ),
//                                       hintText: 'Search Proposal',
//                                       hintStyle: TextStyle(color: Color(0xFF134FAF)),
//                                       border: InputBorder.none),
//                                 ),
//           ),
//         ),
//         //  Padding(
//         //               padding: const EdgeInsets.only(right: 100),
//         //               child: Row(
//         //                 children: [
//         //                   Text("Sort by:",
//         //                       style: TextStyle(
//         //                           fontSize: 16,
//         //                           fontWeight: FontWeight.bold,
//         //                           fontFamily: "Raleway",
//         //                           color: Colors.white)),
//         //                   SizedBox(
//         //                     width: 10,
//         //                   ),
//         //                   TextButton(
//         //                     onPressed: () {
//         //                       Dialogs.materialDialog(
//         //                             useSafeArea: true,
//         //                             msg: 'Search by Recently Added',
//         //                             msgStyle: TextStyle(fontFamily: "Raleway",
//         //                                                 fontWeight: FontWeight.bold,
//         //                                                 color: Color(0xFF134FAF)),
//         //                             // title: "Delete",
//         //                             color: Colors.white,
//         //                             context: context,
//         //                             dialogWidth: kIsWeb ? 0.3 : null,
//         //                             onClose: (value) =>
//         //                                 print("returned value is '$value'"),
//         //                             actions: [
//         //                               SizedBox(
//         //                                   height: 120,
//         //                                   child: SingleChildScrollView(
//         //                                     child: Column(children: [
                                              
                                             
//         //                                       CustomDropdown(
//         //                                         fillColor:
//         //                                             Colors.grey.withOpacity(0.2),
//         //                                         // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
//         //                                         fieldSuffixIcon: Icon(
//         //                                           Icons.arrow_drop_down_circle,
//         //                                           color: Colors.blue,
//         //                                         ),
//         //                                         hintText: 'Recently Added',
//         //                                         items: const [
//         //                                           'recently_added',
//         //                                         ],
//         //                                          onChanged: (value) {
//         //                                           controller.Recently = value;
//         //                                           print(value);
//         //                                         },
//         //                                         controller: controller.RecentlyController,
//         //                                       ),
//         //                                        SizedBox(
//         //                                         height: 20,
//         //                                       ),
//         //                                       ElevatedButton(
//         //                                         style: ElevatedButton.styleFrom(
//         //                                           primary: Color(0xFF134FAF),
//         //                                           shape: RoundedRectangleBorder(
//         //                                               borderRadius:
//         //                                                   BorderRadius.all(
//         //                                                       Radius.circular(20))),
//         //                                         ),
//         //                                         child: Text("Search"),
//         //                                         onPressed: () {
//         //                                           setState(() {
//         //                                             controller.fetchFood('');  
//         //                                           });
//         //                                            controller.RecentlyController.clear();
//         //                                            controller.name1Controller.clear();
                                                  
//         //                                           Get.back();
//         //                                         },
//         //                                       ),
//         //                                     ]),
//         //                                   ))
//         //                             ]);
//         //                     },
//         //                     child: Row(
//         //                       children: [
//         //                         Text("Search by filter",
//         //                             style: TextStyle(
//         //                                 fontSize: 16,
//         //                                 fontWeight: FontWeight.bold,
//         //                                 fontFamily: "Raleway",
//         //                                 color: Colors.white)),
//         //                         SizedBox(
//         //                           width: 5,
//         //                         ),
//         //                         Icon(
//         //                           Icons.arrow_drop_down_rounded,
//         //                           color: Colors.white,
//         //                         )
//         //                       ],
//         //                     ),
//         //                   )
//         //                 ],
//         //               ),
//         //             ),
//                 ],
//               )
//             ),
//             // Positioned(
//             //   top: 135,
//             //   left: 20,
//             //   child: Container(
//             //     height: 100,
//             //     width: MediaQuery.of(context).size.width,
//             //     child: Text("dd"),
//             //   ),
//             // ),
//             Positioned(
//               top: 150,
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Container(
//           child: FutureBuilder<List<postAddLikeModel>>(
//             future: controller.fetchaddLike(''),
//             builder: (context, snapshot){
//               if (snapshot.connectionState == ConnectionState.done) {
//                           // print(snapshot.data);
//                         }
//                         switch (snapshot.connectionState) {
//                           case ConnectionState.waiting:
//                             return Center(child:  Center(
//           child: Container(
//               height: 80,
//               width: 80,
//               alignment: AlignmentDirectional.center,
//               child: Lottie.asset(
//                 "assets/loading/heart.json",
//               )),
//         ),);
//                           default:
//                             if (snapshot.hasError) {
//                               return Center(child: Text('Some error occurred!'));
//                             } else {
//                               print("snapshot.data");
//                               print(snapshot.data);
            
//             var foodList = snapshot.data;
//             print(foodList);
//             print("foodList");
//             return foodList!.length == 0 ? Container(child: Center(child: Text("There are no likes", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),): 
            
//             ListView.builder(
//               itemCount: foodList.length,
//               itemBuilder: (BuildContext context, int index){
//                 var food = foodList[index];
//                 String convertToAgo(DateTime input){
//   Duration diff = DateTime.now().difference(input);
  
//   if(diff.inDays >= 1){
//     return '${diff.inDays} day(s) ago';
//   } else if(diff.inHours >= 1){
//     return '${diff.inHours} hour(s) ago';
//   } else if(diff.inMinutes >= 1){
//     return '${diff.inMinutes} minute(s) ago';
//   } else if (diff.inSeconds >= 1){
//     return '${diff.inSeconds} second(s) ago';
//   } else {
//     return 'just now';
//   }
// }

// DateTime time1 = DateTime.parse("${food.time}");
//   print(time1);
//               return Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 25, left: 13, right: 13),
//                 child: Card(
//                      elevation: 50,
//             shadowColor: Colors.white,
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//                     child: SizedBox(
//                       width: 380,
//                       height: 120,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 8),
//                         child: Container(
//                         // height: 80,  
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 18, left: 10),
//                                 child: CircleAvatar(
//                         // backgroundColor: Colors.black,
//                         radius: 30,
//                         child: CircleAvatar(
//                           radius: 30,
//                           backgroundImage: NetworkImage(
//                             "${food.attachements!.length != 0 ? food.attachements![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}"))),
//                               ),
//                             SizedBox(width: 10,),
//                             Padding(
//                               padding: EdgeInsets.only(top: 22, left: 11),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 // mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
                                    
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Text("${food.firstName} ${food.lastName}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
//                                      Padding(
//                                       padding: EdgeInsets.only(top: 5),
//                                       child: Text(convertToAgo(time1), style: TextStyle(fontSize: 13,color: Colors.grey, fontWeight: FontWeight.bold, fontFamily: "Raleway"),)),
//                                   ],
//                                 ),
//                             ),
                            
                            
//                             InkWell(
//                                 onTap: (){
//                                   },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 15, left: 65),
//                                   child: Column(
//                                     children: [
//                                       IconButton(onPressed: (){
                                        
//                                       }, icon: Icon(CupertinoIcons.hand_thumbsdown_fill),iconSize: 30, color: Color(0xFF134FAF),)
                                      
                                      
//                                     ],
//                                   ),
//                                 ),
//                               ),
                            
                            
                       
                            
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
                  
//                 ),
//               ),
//             );
//             }); 
//              }
//                         }
          
//             }
      
            
//           )),
//             )
//           ],
//         ),
//       ),
      
//     );
    
//   }
// }