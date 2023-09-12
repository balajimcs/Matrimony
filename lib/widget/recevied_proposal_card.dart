// import 'package:coolicons/coolicons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:thirumanam/models/proposal_model.dart';
// import 'package:thirumanam/resources/app_colors.dart';
// import 'package:thirumanam/resources/app_font.dart';

// import '../models/data_model.dart';

// class ReceviedProposalCard extends GetView{

//   List<ProposalProfileModel>?dataModel;
  
//   ReceviedProposalCard({this.dataModel});

//    String convertToAgo(DateTime input){
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

// DateTime time1 = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8),
//       child: Column(
//         children: [
//           // _renderHeader(title!, onViewAllClicked!),
//           // SizedBox(
//           //   height: 12,
//           // ),
//           dataModel!.length == 0 ? Container()
//               : _renderList()
//         ],
//       ),
//     );
//   }

//   // Widget _renderHeader(String title, VoidCallback onViewAllClicked) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: <Widget>[
//   //         Text(
//   //           title,
//   //           style: const TextStyle(
//   //             fontSize: 20.0,
//   //             fontFamily: AppFont.font,
//   //             color: AppColors.textColor,
//   //             fontWeight: FontWeight.w500,
//   //           ),
//   //         ),
//   //        GestureDetector(
//   //           onTap: () {
//   //             onViewAllClicked();
//   //           },
//   //           child: Text(
//   //               'View all',
//   //               style: const TextStyle(
//   //                 fontSize: 16.0,
//   //                 color: AppColors.primaryColor,
//   //                 fontWeight: FontWeight.w500,
//   //               ),
//   //             ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget _renderList() {
//     return SizedBox(
//       height: 300,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount:dataModel!.length,
//         itemBuilder: (BuildContext context, int index) {
//           return renderSingleCard(index);
//         }
//       ),
//     );
//   }

//   Widget renderSingleCard(int index){
//     return Center(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 25, left: 13, right: 13),
//               child: Card(
//                    elevation: 50,
//           shadowColor: Colors.white,
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(20.0),
//   ),
//                   child: SizedBox(
//                     width: 380,
//                     height: 120,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: Container(
//                       // height: 80,  
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                       // backgroundColor: Colors.black,
//                       radius: 25,
//                       child: CircleAvatar(
//                         radius: 25,
//                         backgroundImage: NetworkImage(dataModel![index].image!))),
//                           SizedBox(width: 10,),
//                           Padding(
//                             padding: EdgeInsets.only(top: 22, left: 11),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               // mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
                                  
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text("Name: ${dataModel![index].name}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 5),
//                                     child: Text("Age: {age}", style: TextStyle(fontSize: 15,  fontWeight: FontWeight.bold, fontFamily: "Raleway"),)),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 5),
//                                     child: Text(convertToAgo(time1), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Raleway"),)),
//                                 ],
//                               ),
//                           ),
                          
//                           SizedBox(width: 40,),
//                           InkWell(
//                               onTap: (){
//                                 // print(controller.acceptProposal(foodList["data"][index]["_id"].toString()));
//                                 // controller.acceptProposal(id: foodList["data"][index]["_id"].toString());
//                                 // print(controller.allUserModel.value.data![1].personalDetails?.firstName);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 30, right: 10),
//                                 child: Column(
//                                   children: [
//                                     Icon(Coolicons.circle_check_outline, size: 30,color: Colors.green,),
//                                     SizedBox(height: 5,),
//                                     Text("Accept", style: TextStyle(color: Colors.grey, fontSize: 14),)
//                                   ],
//                                 ),
//                               ),
//                             ),
                          
                          
                     
//                           SizedBox(width: 17,),
//                           InkWell(
//                             onTap: (){
//                               // controller.rejectProposal(id: foodList["data"][index]["_id"].toString());
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 30),
//                               child: Column(
//                                 children: [
//                                   Icon(Coolicons.off_outline_close, size: 30,color: Colors.grey,),
//                                   SizedBox(height: 5,),
//                                   Text("Decline",style: TextStyle(color: Colors.grey, fontSize: 14),)
//                                 ],
//                               ),
//                             ),
//                           ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
                
//               ),
//             ),
//           );
//   }

// }