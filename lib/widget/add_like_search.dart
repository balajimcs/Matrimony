// import 'package:coolicons/coolicons.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:material_dialogs/material_dialogs.dart';
// import 'package:thirumanam/controller/post_feed_controller.dart';
// import 'package:thirumanam/controller/received_proposal_controller.dart';
// import 'package:thirumanam/controller/sent_proposal_controller.dart';
// import 'package:thirumanam/controller/wishlist_controller.dart';
// import 'package:thirumanam/models/add_like_model.dart';
// import 'package:thirumanam/models/received_proprosal_model.dart';
// import 'package:thirumanam/models/send_proposal_model.dart';
// import 'package:thirumanam/models/wishList_model.dart';

// class AddLikeSearchDelegate extends SearchDelegate{

//    @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       textTheme: TextTheme(

//         // Use this to change the query's text style
//         headline6: TextStyle(fontSize: 18.0, color: Color(0xFF134FAF)),
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.white,
//       ),
      
//       inputDecorationTheme: InputDecorationTheme(
        
//         border: InputBorder.none,
        
        
//         // Use this change the placeholder's text style
//         hintStyle: TextStyle(fontSize: 18.0, color: Color(0xFF134FAF)),
//       ),
//     );
//   }

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [
//       IconButton(onPressed: (){
//         query = "";
//       }, icon: Icon(Icons.close, color: Color(0xFF134FAF),))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return 
//       IconButton(onPressed: (){
//         Navigator.pop(context);
//       }, icon: Icon(Icons.arrow_back_ios, color: Color(0xFF134FAF),size: 20,));
    
//   }

// final controller = Get.find<PostFeedController>();


//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return Container(
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
                                        
//                                       }, icon: Icon(Icons.thumb_down_alt_rounded),iconSize: 65, )
                                      
                                      
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
      
            
//           ));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     return Center(
//       child: Text("Search Proposals", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),
//     );
//   }

// }