import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_font.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';

import '../controller/dashboard_controller.dart';
import '../models/data_model.dart';
import '../resources/app_routes.dart';

class HomeProfileCard extends GetView{
   
  String? title;
  List<HomeProfileModel>?dataModel;
  VoidCallback? onViewAllClicked;
  DashboardController? controller;
  
  int? catIndex;

  HomeProfileCard({this.title, this.dataModel, this.onViewAllClicked, this.controller, this.catIndex});

   void showDialogBox() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
		borderRadius: BorderRadius.circular(30),
	),
        backgroundColor: Color(0xffEAF12D),
      title: Text('Complete the profile!!', style: TextStyle(fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xFF134FAF), fontSize: 25)),
      actions: [
       SizedBox(
                                          height: 350,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Center(
                                                child: Image.asset('assets/images/wrong.gif'),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text("Complete the profile for make profile matched", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black, fontSize: 17),),
                                              ),
                                               SizedBox(
                                                height: 25,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: [
                                                    
                                                        MouseRegion(
                                                          cursor: SystemMouseCursors.basic,
                                                          
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Color(0xFF134FAF),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(10))),
                                                            ),
                                                            child: Text("Profile"),
                                                            onPressed: (){
                                                                                                              // controller.withdrawProposal(food.id, context);
                                                                                                              // print(controller.withdrawProposal(food.id, context));
                                                              
                                                              Get.back();
                                                              
                                                              
                                                             
                                                              // fetchWishListProposal("");
                                                            },
                                                          ),
                                                          
                                                        ),
                                                      
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ))
      ],
    ),
  );
    });
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          _renderHeader(title!, onViewAllClicked!),
          SizedBox(
            height: 12,
          ),
          dataModel!.length == 0 ? Container()
              : _renderList()
        ],
      ),
    );
  }

  Widget _renderHeader(String title, VoidCallback onViewAllClicked) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: AppFont.font,
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
         GestureDetector(
            onTap: () {
              onViewAllClicked();
            },
            child: Text(
                'View all',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _renderList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:dataModel!.length,
        itemBuilder: (BuildContext context, int index) {
          return renderSingleCard(index, context);
        }
      ),
    );
  }

  Widget renderSingleCard(int index, BuildContext cont){
    return InkWell(
      onTap: (){
        Get.to(() => DetailPage(idMatch: '${dataModel![index].userId}'));
    //       Navigator.push(  
    // context,  
    // MaterialPageRoute(builder: (context) => DetailPage(idMatch: food.userId,)));
      },
      child: Obx(() => 
        controller!.isLoading.value ? Center(
                    child: Container(
                        height: 80,
                        width: 80,
                        alignment: AlignmentDirectional.center,
                        child: Lottie.asset(
                          "assets/loading/heart.json",
                        )),
                  )
                      : Container(
            height: 250,
            width: 250,
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(width: 250,height: 250,
                child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(8),
                    child: dataModel![index].image!.isNotEmpty ?
                    CachedNetworkImage(
                      imageUrl: dataModel![index].image!,
                      fit: BoxFit.fill,
                      // placeholder: ,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ) : Image.network("https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg", fit: BoxFit.cover,)
          
                ),),
          
                Positioned(
                top: 10,
                right: 5,
                child: InkWell(
                  onTap: (){
                    
                    print("dataModel![index].isLiked! ${dataModel![index].isLiked!}");
                    if(dataModel![index].isLiked!){
                       Dialogs.materialDialog(
                                    useSafeArea: true,
                                    msg: "WishList",
                                    msgStyle: TextStyle(fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xFF134FAF), fontSize: 25),
                                    color: Color(0xffEAF12D),
                                    context: Get.context!,
                                    dialogWidth: kIsWeb ? 0.3 : null,
                                    onClose: (value) =>
                                        print("returned value is '$value'"),
                                    actions: [
                                      SizedBox(
                                          height: 120,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text('remove_wishlist_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black, fontSize: 17),),
                                              ),
                                               SizedBox(
                                                height: 25,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 50),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            primary: Color(0xFF134FAF),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(10))),
                                                          ),
                                                          child: Text('cancel'.tr),
                                                          onPressed: (){
                                                          
                                                           Get.back();
                                                            
                                                            
                                                           
                                                            // fetchWishListProposal("");
                                                          },
                                                        ),
                                                          SizedBox(width: 35),
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            primary: Color(0xFF134FAF),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(10))),
                                                          ),
                                                          child: Text('okay'.tr),
                                                          onPressed: (){
                                                           
                                           controller!.itemList.value[catIndex!].itemList![index].isLiked = false;
                      controller!.itemList.refresh();
                      controller!.removeWishListProposal(catIndex!, index, cont);
                                                            
           
                                                               
                                                            Get.back();
                                                            
                                                            
                                                           
                                                            // fetchWishListProposal("");
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ))
                                    ]);
                     
                    }else{
                      Dialogs.materialDialog(
                                    useSafeArea: true,
                                    msg: "WishList",
                                    msgStyle: TextStyle(fontFamily: "Raleway",
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xFF134FAF), fontSize: 25),
                                    color: Color(0xffEAF12D),
                                    context: Get.context!,
                                    dialogWidth: kIsWeb ? 0.3 : null,
                                    onClose: (value) =>
                                        print("returned value is '$value'"),
                                    actions: [
                                      SizedBox(
                                          height: 120,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text('wishlist_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black, fontSize: 17),),
                                              ),
                                               SizedBox(
                                                height: 25,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 50),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            primary: Color(0xFF134FAF),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(10))),
                                                          ),
                                                          child: Text('cancel'.tr),
                                                          onPressed: (){
                                                          
                                                          Get.back();
                                                            
                                                            
                                                           
                                                            // fetchWishListProposal("");
                                                          },
                                                        ),
                                                          SizedBox(width: 35),
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            primary: Color(0xFF134FAF),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(10))),
                                                          ),
                                                          child: Text('okay'.tr),
                                                          onPressed: (){
                                                           
                                                           
                                          controller!.itemList.value[catIndex!].itemList![index].isLiked = true;
                      controller!.itemList.refresh();
                      controller!.addWishListProposal(catIndex!, index, cont);
                                                            
           
                                                               
                                                            Get.back();
                                                            
                                                            
                                                           
                                                            // fetchWishListProposal("");
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ))
                                    ]);
                     
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(50),),
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(50),
                        child: SvgPicture.asset(
                          dataModel![index].isLiked! ? "assets/images/heart_filled.svg" : "assets/images/heart_not_filled.svg",
                          height: 30,
                          width: 30,
                        )),
                  ),
                )),
          
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(cont).size.width * 0.5,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8),),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Name: ${dataModel![index].name}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(color: AppColors.white, fontSize: 20, fontFamily: AppFont.font),),
                                SizedBox(height: 5,),
                                Text("Age: ${dataModel![index].age}",
                                  style: TextStyle(color: AppColors.white, fontSize: 18, fontFamily: AppFont.font),),
                                SizedBox(height: 5,),
                                Text("${dataModel![index].designation}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(color: AppColors.white, fontSize: 18, fontFamily: AppFont.font),),
          
                              ],
                            ),
      
                            // if(controller!.itemList.value[catIndex!].itemList![index].isRequestSent == 0 && !(controller!.itemList.value[catIndex!].itemList![index].isRequestReceived == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedAccept ==1  || 
                            //                                               controller!.itemList.value[catIndex!].itemList![index].isRequestSentAccept == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestSentReject == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedReject ==1))...[
                            //                                                   InkWell(
                            //                                                       onTap:
                            //                                                           () {
                            //                                                         // sentrequest
                            //                                                         Dialogs.materialDialog(
                            //                                                                 useSafeArea: true,
                            //                                                                 msg: "Sent Proposal",
                            //                                                                 msgStyle: TextStyle(fontFamily: "Raleway",
                            //                                     fontWeight: FontWeight.w500,
                            //                                     color: Color(0xFF134FAF), fontSize: 25),
                            //                                                                 color: Color(0xffEAF12D),
                            //                                                                 context: Get.context!,
                            //                                                                 dialogWidth: kIsWeb ? 0.3 : null,
                            //                                                                 onClose: (value) =>
                            //                                                                     print("returned value is '$value'"),
                            //                                                                 actions: [
                            //                                                                   SizedBox(
                            //                                                                       height: 120,
                            //                                                                       child: SingleChildScrollView(
                            //                                                                         child: Column(children: [
                            //                                                                           Container(
                            //                                                                             alignment: Alignment.center,
                            //                                                                             child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                            //                                       fontWeight: FontWeight.bold,
                            //                                       color: Colors.black, fontSize: 17),),
                            //                                                                           ),
                            //                                                                            SizedBox(
                            //                                                                             height: 25,
                            //                                                                           ),
                            //                                                                           Padding(
                            //                                                                             padding: EdgeInsets.only(left: 50),
                            //                                                                             child: Column(
                            //                                                                                       children: [
                            //                                                                                         Row(
                            //                                   children: [
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('cancel'.tr),
                            //                                       onPressed: (){
                                                                  
                            //                                        Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                       SizedBox(width: 35),
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('okay'.tr),
                            //                                       onPressed: (){
                                                                   
                                                                   
                            //                                         controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                            //                                         Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                   ],
                            //                                                                                         ),
                            //                                                                                       ],
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ]),
                            //                                                                       ))
                            //                                                                 ]);
                                                                                    
                            //                                                       },
                            //                                                       child:
                            //                                                           Container(
                            //                                                         width:
                            //                                                             100,
                            //                                                         height:
                            //                                                             35,
                            //                                                         alignment:
                            //                                                             Alignment.center,
                            //                                                         decoration:
                            //                                                             BoxDecoration(
                            //                                                                 borderRadius: BorderRadius.all(Radius.circular(
                            //                                                                     25)),
                                                                                            
                            //                                                                 gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                            //                                                                   Color(0xFF134FAF),
                            //                                                                   Color(0xFF134FAF)
                            //                                                                 ])),
                            //                                                         child:
                            //                                                             Text(
                            //                                                           'sent_proposal'.tr,
                            //                                                           style: TextStyle(
                            //                                                               fontSize: 12,
                            //                                                               fontWeight: FontWeight.bold,
                            //                                                               color: Colors.white),
                            //                                                         ),
                            //                                                       ),
                            //                                                     )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestSent == 1)...[
                            //                                                 InkWell(
                            //                                                           onTap:
                            //                                                               () {
                            //                                                                 Dialogs.materialDialog(
                            //                                                                 useSafeArea: true,
                            //                                                                 msg: "Withdraw",
                            //                                                                 msgStyle: TextStyle(fontFamily: "Raleway",
                            //                                     fontWeight: FontWeight.w500,
                            //                                     color: Color(0xFF134FAF), fontSize: 25),
                            //                                                                 color: Color(0xffEAF12D),
                            //                                                                 context: Get.context!,
                            //                                                                 dialogWidth: kIsWeb ? 0.3 : null,
                            //                                                                 onClose: (value) =>
                            //                                                                     print("returned value is '$value'"),
                            //                                                                 actions: [
                            //                                                                   SizedBox(
                            //                                                                       height: 120,
                            //                                                                       child: SingleChildScrollView(
                            //                                                                         child: Column(children: [
                            //                                                                           Container(
                            //                                                                             alignment: Alignment.center,
                            //                                                                             child: Text('withdraw_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                            //                                       fontWeight: FontWeight.bold,
                            //                                       color: Colors.black, fontSize: 17),),
                            //                                                                           ),
                            //                                                                            SizedBox(
                            //                                                                             height: 25,
                            //                                                                           ),
                            //                                                                           Padding(
                            //                                                                             padding: EdgeInsets.only(left: 50),
                            //                                                                             child: Column(
                            //                                                                                       children: [
                            //                                                                                         Row(
                            //                                   children: [
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('cancel'.tr),
                            //                                       onPressed: (){
                                                                  
                            //                                        Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                       SizedBox(width: 35),
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('okay'.tr),
                            //                                       onPressed: (){
                                                                   
                                                                   
                                                                                                 
                            //                                         controller!.withdrawProposal(catIndex!, index, cont);
                                                                   
                                                                       
                            //                                         Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                   ],
                            //                                                                                         ),
                            //                                                                                       ],
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ]),
                            //                                                                       ))
                            //                                                                 ]);
                                                                                   
                            //                                                           },
                            //                                                           child:
                            //                                                               Container(
                            //                                                             width:
                            //                                                                 100,
                            //                                                             height:
                            //                                                                 35,
                            //                                                             alignment:
                            //                                                                 Alignment.center,
                            //                                                             decoration:
                            //                                                                 BoxDecoration(
                            //                                                                     borderRadius: BorderRadius.all(Radius.circular(
                            //                                                                         25)),
                                                                                                
                            //                                                                     gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                            //                                                                       Color(0xFF134FAF),
                            //                                                                       Color(0xFF134FAF)
                            //                                                                     ])),
                            //                                                             child:
                            //                                                                 Text(
                            //                                                               'withdraw'.tr,
                            //                                                               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                             ),
                            //                                                           ),
                            //                                                         )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestSentAccept == 0 && !(controller!.itemList.value[catIndex!].itemList![index].isRequestReceived == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedAccept ==1  || 
                            //                                               controller!.itemList.value[catIndex!].itemList![index].isRequestSent == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestSentReject == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedReject ==1))...[
                            //                                                 InkWell(
                            //                                                       onTap:
                            //                                                           () {
                            //                                                         // sentrequest
                                                                                    
                            //                                                         controller!.sentRequestProposal(catIndex!, index, cont);
                            //                                                       },
                            //                                                       child:
                            //                                                           Container(
                            //                                                         width:
                            //                                                             100,
                            //                                                         height:
                            //                                                             35,
                            //                                                         alignment:
                            //                                                             Alignment.center,
                            //                                                         decoration:
                            //                                                             BoxDecoration(
                            //                                                                 borderRadius: BorderRadius.all(Radius.circular(
                            //                                                                     25)),
                                                                                            
                            //                                                                 gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                            //                                                                   Color(0xFF134FAF),
                            //                                                                   Color(0xFF134FAF)
                            //                                                                 ])),
                            //                                                         child:
                            //                                                             Text(
                            //                                                           'sent_proposal'.tr,
                            //                                                           style: TextStyle(
                            //                                                               fontSize: 12,
                            //                                                               fontWeight: FontWeight.bold,
                            //                                                               color: Colors.white),
                            //                                                        ),
                            //                                                       ),
                            //                                                      )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestSentAccept == 1)...[
                                                                            
                            //                                                 Row(
                            //                                                               children: [
                            //                                                                 InkWell(
                            //                                                                   onTap: () {
                            //                                                                     // friends
                            //                                                                     // controller.sendProposal(food.id, context);
                            //                                                                   },
                            //                                                                   child: Container(
                            //                                                                     width: 100,
                            //                                                                     height: 35,
                            //                                                                     alignment: Alignment.center,
                            //                                                                     decoration: BoxDecoration(
                            //                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                    
                            //                                                                         gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                     child: Text(
                            //                                                                       'friends'.tr,
                            //                                                                       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                     ),
                            //                                                                   ),
                            //                                                                 ),
                            //                                                                 SizedBox(
                            //                                                                   width: 15,
                            //                                                                 ),
                            //                                                                 InkWell(
                            //                                                                   onTap: () {
                                                                                                
                            //                                                                     // chat
                            //                                                                     // controller.sendProposal(food.id, context);
                            //                                                                   },
                            //                                                                   child: Container(
                            //                                                                     width: 60,
                            //                                                                     height: 35,
                            //                                                                     alignment: Alignment.center,
                            //                                                                     decoration: BoxDecoration(
                            //                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                    
                            //                                                                         gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                     child: Icon(Icons.chat_rounded, color: Colors.white)
                            //                                                                   ),
                            //                                                                 ),
                            //                                                               ],
                            //                                                             )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestSentReject == 0 && !(controller!.itemList.value[catIndex!].itemList![index].isRequestReceived == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedAccept ==1  || 
                            //                                               controller!.itemList.value[catIndex!].itemList![index].isRequestSentAccept == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestSent == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedReject ==1))...[
                            //                                                 InkWell(
                            //                                                                   onTap: () {
                            //                                                                     // sent request
                            //                                                                     controller!.sentRequestProposal(catIndex!, index, cont);
                            //                                                                   },
                            //                                                                   child: Container(
                            //                                                                     width: 100,
                            //                                                                     height: 35,
                            //                                                                     alignment: Alignment.center,
                            //                                                                     decoration: BoxDecoration(
                            //                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                    
                            //                                                                         gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                     child: Text(
                            //                                                                       'sent_proposal'.tr,
                            //                                                                       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                     ),
                            //                                                                   ),
                            //                                                                 )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestSentReject == 1)...[
                            //                                                 InkWell(
                            //                                                                   onTap: () {
                            //                                                                     Dialogs.materialDialog(
                            //                                                                 useSafeArea: true,
                            //                                                                 msg: "Sent Proposal",
                            //                                                                 msgStyle: TextStyle(fontFamily: "Raleway",
                            //                                     fontWeight: FontWeight.w500,
                            //                                     color: Color(0xFF134FAF), fontSize: 25),
                            //                                                                 color: Color(0xffEAF12D),
                            //                                                                 context: Get.context!,
                            //                                                                 dialogWidth: kIsWeb ? 0.3 : null,
                            //                                                                 onClose: (value) =>
                            //                                                                     print("returned value is '$value'"),
                            //                                                                 actions: [
                            //                                                                   SizedBox(
                            //                                                                       height: 120,
                            //                                                                       child: SingleChildScrollView(
                            //                                                                         child: Column(children: [
                            //                                                                           Container(
                            //                                                                             alignment: Alignment.center,
                            //                                                                             child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                            //                                       fontWeight: FontWeight.bold,
                            //                                       color: Colors.black, fontSize: 17),),
                            //                                                                           ),
                            //                                                                            SizedBox(
                            //                                                                             height: 25,
                            //                                                                           ),
                            //                                                                           Padding(
                            //                                                                             padding: EdgeInsets.only(left: 50),
                            //                                                                             child: Column(
                            //                                                                                       children: [
                            //                                                                                         Row(
                            //                                   children: [
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('cancel'.tr),
                            //                                       onPressed: (){
                                                                  
                            //                                        Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                       SizedBox(width: 35),
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('okay'.tr),
                            //                                       onPressed: (){
                                                                   
                                                                   
                                                                                                 
                            //                                         controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                            //                                         Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                   ],
                            //                                                                                         ),
                            //                                                                                       ],
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ]),
                            //                                                                       ))
                            //                                                                 ]);
                            //                                                                     // sent request
                                                                                               
                            //                                                                   },
                            //                                                                   child: Container(
                            //                                                                     width: 100,
                            //                                                                     height: 35,
                            //                                                                     alignment: Alignment.center,
                            //                                                                     decoration: BoxDecoration(
                            //                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                    
                            //                                                                         gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                     child: Text(
                            //                                                                       'sent_proposal'.tr,
                            //                                                                       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                     ),
                            //                                                                   ),
                            //                                                                 )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestReceived == 0 && !(controller!.itemList.value[catIndex!].itemList![index].isRequestSentReject == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedAccept ==1  || 
                            //                                               controller!.itemList.value[catIndex!].itemList![index].isRequestSentAccept == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestSent == 1 || controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedReject ==1))...[
                            //                                                 InkWell(
                            //                                                                   onTap: () {
                            //                                                                     Dialogs.materialDialog(
                            //                                                                 useSafeArea: true,
                            //                                                                 msg: "Sent Proposal",
                            //                                                                 msgStyle: TextStyle(fontFamily: "Raleway",
                            //                                     fontWeight: FontWeight.w500,
                            //                                     color: Color(0xFF134FAF), fontSize: 25),
                            //                                                                 color: Color(0xffEAF12D),
                            //                                                                 context: Get.context!,
                            //                                                                 dialogWidth: kIsWeb ? 0.3 : null,
                            //                                                                 onClose: (value) =>
                            //                                                                     print("returned value is '$value'"),
                            //                                                                 actions: [
                            //                                                                   SizedBox(
                            //                                                                       height: 120,
                            //                                                                       child: SingleChildScrollView(
                            //                                                                         child: Column(children: [
                            //                                                                           Container(
                            //                                                                             alignment: Alignment.center,
                            //                                                                             child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                            //                                       fontWeight: FontWeight.bold,
                            //                                       color: Colors.black, fontSize: 17),),
                            //                                                                           ),
                            //                                                                            SizedBox(
                            //                                                                             height: 25,
                            //                                                                           ),
                            //                                                                           Padding(
                            //                                                                             padding: EdgeInsets.only(left: 50),
                            //                                                                             child: Column(
                            //                                                                                       children: [
                            //                                                                                         Row(
                            //                                   children: [
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('cancel'.tr),
                            //                                       onPressed: (){
                                                                  
                            //                                        Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                       SizedBox(width: 35),
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('okay'.tr),
                            //                                       onPressed: (){
                                                                   
                                                                   
                                                                   
                            //                                            controller!.sentRequestProposal(catIndex!, index, cont);
                            //                                         Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                   ],
                            //                                                                                         ),
                            //                                                                                       ],
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ]),
                            //                                                                       ))
                            //                                                                 ]);
                            //                                                                     // sent request
                                                                                               
                            //                                                                   },
                            //                                                                   child: Container(
                            //                                                                     width: 100,
                            //                                                                     height: 35,
                            //                                                                     alignment: Alignment.center,
                            //                                                                     decoration: BoxDecoration(
                            //                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                    
                            //                                                                         gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                     child: Text(
                            //                                                                       'sent_proposal'.tr,
                            //                                                                       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                     ),
                            //                                                                   ),
                            //                                                                 )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestReceived == 1)...[
                            //                                                 Row(
                            //                                                                       children: [
                            //                                                                         InkWell(
                            //                                                                           onTap: () {
                            //                                                                              Dialogs.materialDialog(
                            //                                                                 useSafeArea: true,
                            //                                                                 msg: "Accept Proposal",
                            //                                                                 msgStyle: TextStyle(fontFamily: "Raleway",
                            //                                     fontWeight: FontWeight.w500,
                            //                                     color: Color(0xFF134FAF), fontSize: 25),
                            //                                                                 color: Color(0xffEAF12D),
                            //                                                                 context: Get.context!,
                            //                                                                 dialogWidth: kIsWeb ? 0.3 : null,
                            //                                                                 onClose: (value) =>
                            //                                                                     print("returned value is '$value'"),
                            //                                                                 actions: [
                            //                                                                   SizedBox(
                            //                                                                       height: 120,
                            //                                                                       child: SingleChildScrollView(
                            //                                                                         child: Column(children: [
                            //                                                                           Container(
                            //                                                                             alignment: Alignment.center,
                            //                                                                             child: Text('accept_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                            //                                       fontWeight: FontWeight.bold,
                            //                                       color: Colors.black, fontSize: 17),),
                            //                                                                           ),
                            //                                                                            SizedBox(
                            //                                                                             height: 25,
                            //                                                                           ),
                            //                                                                           Padding(
                            //                                                                             padding: EdgeInsets.only(left: 50),
                            //                                                                             child: Column(
                            //                                                                                       children: [
                            //                                                                                         Row(
                            //                                   children: [
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('cancel'.tr),
                            //                                       onPressed: (){
                                                                  
                            //                                        Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                       SizedBox(width: 35),
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('okay'.tr),
                            //                                       onPressed: (){
                                                                   
                                                                   
                                                                                                
                            //                                         controller!.acceptProposal(catIndex!, index, cont);
                                                                   
                                                                       
                            //                                         Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                   ],
                            //                                                                                         ),
                            //                                                                                       ],
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ]),
                            //                                                                       ))
                            //                                                                 ]);
                            //                                                                             // accept
                                                                                                        
                            //                                                                           },
                            //                                                                           child: Container(
                            //                                                                             width: 80,
                            //                                                                             height: 35,
                            //                                                                             alignment: Alignment.center,
                            //                                                                             decoration: BoxDecoration(
                            //                                                                                 borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                            
                            //                                                                                 gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                             child: Text(
                            //                                                                               'accept'.tr,
                            //                                                                               style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ),
                            //                                                                         SizedBox(
                            //                                                                           width: 15,
                            //                                                                         ),
                            //                                                                         InkWell(
                            //                                                                           onTap: () {
                            //                                                                              Dialogs.materialDialog(
                            //                                                                 useSafeArea: true,
                            //                                                                 msg: "Reject Proposal",
                            //                                                                 msgStyle: TextStyle(fontFamily: "Raleway",
                            //                                     fontWeight: FontWeight.w500,
                            //                                     color: Color(0xFF134FAF), fontSize: 25),
                            //                                                                 color: Color(0xffEAF12D),
                            //                                                                 context: Get.context!,
                            //                                                                 dialogWidth: kIsWeb ? 0.3 : null,
                            //                                                                 onClose: (value) =>
                            //                                                                     print("returned value is '$value'"),
                            //                                                                 actions: [
                            //                                                                   SizedBox(
                            //                                                                       height: 120,
                            //                                                                       child: SingleChildScrollView(
                            //                                                                         child: Column(children: [
                            //                                                                           Container(
                            //                                                                             alignment: Alignment.center,
                            //                                                                             child: Text('reject_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                            //                                       fontWeight: FontWeight.bold,
                            //                                       color: Colors.black, fontSize: 17),),
                            //                                                                           ),
                            //                                                                            SizedBox(
                            //                                                                             height: 25,
                            //                                                                           ),
                            //                                                                           Padding(
                            //                                                                             padding: EdgeInsets.only(left: 50),
                            //                                                                             child: Column(
                            //                                                                                       children: [
                            //                                                                                         Row(
                            //                                   children: [
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('cancel'.tr),
                            //                                       onPressed: (){
                                                                  
                            //                                        Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                       SizedBox(width: 35),
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('okay'.tr),
                            //                                       onPressed: (){
                                                                   
                                                                   
                            //                                                 controller!.rejectProposal(catIndex!, index, cont);                    
                                                                    
                                                                   
                                                                       
                            //                                         Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                   ],
                            //                                                                                         ),
                            //                                                                                       ],
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ]),
                            //                                                                       ))
                            //                                                                 ]);
                            //                                                                             // reject
                                                                                                       
                            //                                                                           },
                            //                                                                           child: Container(
                            //                                                                             width: 80,
                            //                                                                             height: 35,
                            //                                                                             alignment: Alignment.center,
                            //                                                                             decoration: BoxDecoration(
                            //                                                                                 borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                            
                            //                                                                                 gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                             child: Text(
                            //                                                                               'reject'.tr,
                            //                                                                               style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ),
                            //                                                                       ],
                            //                                                                     )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedAccept ==1)...[
                            //                                                  Row(
                            //                                                               children: [
                            //                                                                 InkWell(
                            //                                                                   onTap: () {
                            //                                                                     // friends
                            //                                                                     // controller.sendProposal(food.id, context);
                            //                                                                   },
                            //                                                                   child: Container(
                            //                                                                     width: 100,
                            //                                                                     height: 35,
                            //                                                                     alignment: Alignment.center,
                            //                                                                     decoration: BoxDecoration(
                            //                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                    
                            //                                                                         gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                     child: Text(
                            //                                                                       'friends',
                            //                                                                       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                     ),
                            //                                                                   ),
                            //                                                                 ),
                            //                                                                 SizedBox(
                            //                                                                   width: 15,
                            //                                                                 ),
                            //                                                                 InkWell(
                            //                                                                   onTap: () {
                            //                                                                         //  Get.toNamed(RouteNames.profileScreen);
                            //                                                                     // chat
                            //                                                                     // controller.sendProposal(food.id, context);
                            //                                                                   },
                            //                                                                   child: Container(
                            //                                                                     width: 60,
                            //                                                                     height: 35,
                            //                                                                     alignment: Alignment.center,
                            //                                                                     decoration: BoxDecoration(
                            //                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                    
                            //                                                                         gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                     child: Icon(Icons.chat_rounded, color: Colors.white)
                            //                                                                   ),
                            //                                                                 ),
                            //                                                               ],
                            //                                                             )
                            //                                               ]else if(controller!.itemList.value[catIndex!].itemList![index].isRequestReceivedReject ==1)...[
                            //                                                 InkWell(
                            //                                                                               onTap: () {
                            //                                                                                  Dialogs.materialDialog(
                            //                                                                 useSafeArea: true,
                            //                                                                 msg: "Sent Proposal",
                            //                                                                 msgStyle: TextStyle(fontFamily: "Raleway",
                            //                                     fontWeight: FontWeight.w500,
                            //                                     color: Color(0xFF134FAF), fontSize: 25),
                            //                                                                 color: Color(0xffEAF12D),
                            //                                                                 context: Get.context!,
                            //                                                                 dialogWidth: kIsWeb ? 0.3 : null,
                            //                                                                 onClose: (value) =>
                            //                                                                     print("returned value is '$value'"),
                            //                                                                 actions: [
                            //                                                                   SizedBox(
                            //                                                                       height: 120,
                            //                                                                       child: SingleChildScrollView(
                            //                                                                         child: Column(children: [
                            //                                                                           Container(
                            //                                                                             alignment: Alignment.center,
                            //                                                                             child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                            //                                       fontWeight: FontWeight.bold,
                            //                                       color: Colors.black, fontSize: 17),),
                            //                                                                           ),
                            //                                                                            SizedBox(
                            //                                                                             height: 25,
                            //                                                                           ),
                            //                                                                           Padding(
                            //                                                                             padding: EdgeInsets.only(left: 50),
                            //                                                                             child: Column(
                            //                                                                                       children: [
                            //                                                                                         Row(
                            //                                   children: [
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('cancel'.tr),
                            //                                       onPressed: (){
                                                                  
                            //                                        Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                       SizedBox(width: 35),
                            //                                     ElevatedButton(
                            //                                       style: ElevatedButton.styleFrom(
                            //                                         primary: Color(0xFF134FAF),
                            //                                         shape: RoundedRectangleBorder(
                            //                                             borderRadius:
                            //                                                 BorderRadius.all(
                            //                                                     Radius.circular(10))),
                            //                                       ),
                            //                                       child: Text('okay'.tr),
                            //                                       onPressed: (){
                                                                   
                                                                   
                            //                                                 controller!.sentRequestProposal(catIndex!, index, cont);                    
                                                                   
                                                                       
                            //                                         Get.back();
                                                                    
                                                                    
                                                                   
                            //                                         // fetchWishListProposal("");
                            //                                       },
                            //                                     ),
                            //                                   ],
                            //                                                                                         ),
                            //                                                                                       ],
                            //                                                                             ),
                            //                                                                           ),
                            //                                                                         ]),
                            //                                                                       ))
                            //                                                                 ]);
                            //                                                                                 // sent request
                                                                                                            
                            //                                                                               },
                            //                                                                               child: Container(
                            //                                                                                 width: 100,
                            //                                                                                 height: 35,
                            //                                                                                 alignment: Alignment.center,
                            //                                                                                 decoration: BoxDecoration(
                            //                                                                                     borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                                                
                            //                                                                                     gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF134FAF), Color(0xFF134FAF)])),
                            //                                                                                 child: Text(
                            //                                                                                   'sent_proposal'.tr,
                            //                                                                                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            //                                                                                 ),
                            //                                                                               ),
                            //                                                                             )
                            //                                               ]else...[
                            //                                                 Container()
                            //                                               ],
                                                                           
                            
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                !dataModel![index].sendProposal! && !(dataModel![index].sendacceptProposal! || dataModel![index].sendrejectProposal! ||
                                    dataModel![index].receiveProposal! || dataModel![index].receiveacceptProposal! || dataModel![index].receiverejectProposal!)?
                                
                                Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        if(controller!.percent.value <= 70){
                                          showDialogBox();
                                        }else{
                                      
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                    controller!.itemList.value[catIndex!].itemList![index].sendProposal = true;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                        }
                                        
                                          
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) 
                                : dataModel![index].sendProposal! ?
      
                                Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: (){
                                         Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Withdraw",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('withdraw_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                                                 
                                                                      controller!.itemList.value[catIndex!].itemList![index].sendProposal = false;
                                        controller!.itemList.refresh();
                                        // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                        controller!.withdrawProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                      
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.blue,
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Withdraw",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                          fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                )
                                 :
                                !dataModel![index].sendacceptProposal! && !(dataModel![index].sendProposal! || dataModel![index].sendrejectProposal! ||
                                    dataModel![index].receiveProposal! || dataModel![index].receiveacceptProposal! || dataModel![index].receiverejectProposal!) ?  
                                    Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                       
                                        
                                                                                    // sentrequest
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                     controller!.itemList.value[catIndex!].itemList![index].sendacceptProposal = true;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                         
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) 
                                : dataModel![index].sendacceptProposal! ?
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.green,
                                            borderRadius: BorderRadius.circular(5),),
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          child: Text("Friends",
                                            style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Chat",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  ),
                                ) 
                                : !dataModel![index].sendrejectProposal! && !(dataModel![index].sendProposal! || dataModel![index].sendacceptProposal! ||
                                    dataModel![index].receiveProposal! || dataModel![index].receiveacceptProposal! || dataModel![index].receiverejectProposal!) ?
                                    
                                   Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                       
                                                                                    // sentrequest
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                    controller!.itemList.value[catIndex!].itemList![index].sendrejectProposal = true;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                        
                                          
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) 
                                : dataModel![index].sendrejectProposal! ?
                                
                                 Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                       
                                        
                                                                                    // sentrequest
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                    controller!.itemList.value[catIndex!].itemList![index]..sendrejectProposal = false;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                         
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) : !dataModel![index].receiveProposal! && !(dataModel![index].sendProposal! || dataModel![index].sendacceptProposal! ||
                                    dataModel![index].sendrejectProposal! || dataModel![index].receiveacceptProposal! || dataModel![index].receiverejectProposal!) ?
                                    
                                    Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                       
                                        
                                                                                    // sentrequest
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                    controller!.itemList.value[catIndex!].itemList![index].receiveProposal = true;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                          
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) 
                                : dataModel![index].receiveProposal! ? 
                                
                                 Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Accept Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('accept_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                                                
                                                                    controller!.itemList.value[catIndex!].itemList![index].receiveProposal = false;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.acceptProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                          
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.green,
                                            borderRadius: BorderRadius.circular(5),),
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          child: Text("Accept",
                                            style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Reject Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('reject_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                            controller!.itemList.value[catIndex!].itemList![index].receiveProposal = false;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.rejectProposal(catIndex!, index, cont);                    
                                                                    
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                          
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.red,
                                            borderRadius: BorderRadius.circular(5),),
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          child: Text("Reject",
                                            style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) 
                                : !dataModel![index].receiveacceptProposal! && !(dataModel![index].sendProposal! || dataModel![index].sendacceptProposal! ||
                                    dataModel![index].sendrejectProposal! || dataModel![index].receiveProposal! || dataModel![index].receiverejectProposal!) ?
                                    
                                    Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                       
                                                                                    // sentrequest
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                    controller!.itemList.value[catIndex!].itemList![index].receiveacceptProposal = true;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                        
                                          
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) 
                                : dataModel![index].receiveacceptProposal! ?
                                
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.green,
                                            borderRadius: BorderRadius.circular(5),),
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          child: Text("Friends",
                                            style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Chat",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  ),
                                )  
                                : !dataModel![index].receiverejectProposal! && !(dataModel![index].sendProposal! || dataModel![index].sendacceptProposal! ||
                                    dataModel![index].sendrejectProposal! || dataModel![index].receiveProposal! || dataModel![index].receiveacceptProposal!) ?
                                    
                                    Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                       
                                          
                                                                                    // sentrequest
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                  controller!.itemList.value[catIndex!].itemList![index].receiverejectProposal = true;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                          
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) 
                                : dataModel![index].receiverejectProposal! ? 
                                Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                       
                                        
                                                                                    // sentrequest
                                                                                    Dialogs.materialDialog(
                                                                                            useSafeArea: true,
                                                                                            msg: "Sent Proposal",
                                                                                            msgStyle: TextStyle(fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w500,
                                                                color: Color(0xFF134FAF), fontSize: 25),
                                                                                            color: Color(0xffEAF12D),
                                                                                            context: Get.context!,
                                                                                            dialogWidth: kIsWeb ? 0.3 : null,
                                                                                            onClose: (value) =>
                                                                                                print("returned value is '$value'"),
                                                                                            actions: [
                                                                                              SizedBox(
                                                                                                  height: 120,
                                                                                                  child: SingleChildScrollView(
                                                                                                    child: Column(children: [
                                                                                                      Container(
                                                                                                        alignment: Alignment.center,
                                                                                                        child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black, fontSize: 17),),
                                                                                                      ),
                                                                                                       SizedBox(
                                                                                                        height: 25,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsets.only(left: 50),
                                                                                                        child: Column(
                                                                                                                  children: [
                                                                                                                    Row(
                                                              children: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('cancel'.tr),
                                                                  onPressed: (){
                                                                  
                                                                   Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                                  SizedBox(width: 35),
                                                                ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF134FAF),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(10))),
                                                                  ),
                                                                  child: Text('okay'.tr),
                                                                  onPressed: (){
                                                                   
                                                                   
                                                                     controller!.itemList.value[catIndex!].itemList![index].receiverejectProposal = false;
                                          controller!.itemList.refresh();
                                          // controller!.showSnackBar("Proposal sent successfully!!", cont);
                                          controller!.sentRequestProposal(catIndex!, index, cont);
                                                                   
                                                                       
                                                                    Get.back();
                                                                    
                                                                    
                                                                   
                                                                    // fetchWishListProposal("");
                                                                  },
                                                                ),
                                                              ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ]),
                                                                                                  ))
                                                                                            ]);
                                        
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors:
                                              AppColors.buttonColor),
                                          borderRadius: BorderRadius.circular(5),),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        child: Text("Send Proposal",
                                          style: TextStyle(color: AppColors.white, fontSize: 12, fontFamily: AppFont.font,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ) 
                                : Container(),
          
                              ],
                            )
                          ],
                        ),
                      ),
          
                    ),
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }

}