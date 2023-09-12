// if(food.isRequestSent == 0 && !(food.isRequestReceived == 1 || food.isRequestReceivedAccept ==1  || 
//                                                                         food.isRequestSentAccept == 1 || food.isRequestSentReject == 1 || food.isRequestReceivedReject ==1))...[
//                                                                             InkWell(
//                                                                                 onTap:
//                                                                                     () {
//                                                                                   // sentrequest
//                                                                                   Dialogs.materialDialog(
//                                                                                           useSafeArea: true,
//                                                                                           msg: "Sent Proposal",
//                                                                                           msgStyle: TextStyle(fontFamily: "Raleway",
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color(0xFF134FAF), fontSize: 25),
//                                                                                           color: Color(0xffEAF12D),
//                                                                                           context: Get.context!,
//                                                                                           dialogWidth: kIsWeb ? 0.3 : null,
//                                                                                           onClose: (value) =>
//                                                                                               print("returned value is '$value'"),
//                                                                                           actions: [
//                                                                                             SizedBox(
//                                                                                                 height: 120,
//                                                                                                 child: SingleChildScrollView(
//                                                                                                   child: Column(children: [
//                                                                                                     Container(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.black, fontSize: 17),),
//                                                                                                     ),
//                                                                                                      SizedBox(
//                                                                                                       height: 25,
//                                                                                                     ),
//                                                                                                     Padding(
//                                                                                                       padding: EdgeInsets.only(left: 50),
//                                                                                                       child: Column(
//                                                                                                                 children: [
//                                                                                                                   Row(
//                                                             children: [
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('cancel'.tr),
//                                                                 onPressed: (){
                                                                
//                                                                  Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                                 SizedBox(width: 35),
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('okay'.tr),
//                                                                 onPressed: (){
                                                                 
                                                                 
                                                                  
                                                                 
                                                                     
//                                                                   Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                             ],
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ]),
//                                                                                                 ))
//                                                                                           ]);
                                                                                  
//                                                                                 },
//                                                                                 child:
//                                                                                     Container(
//                                                                                   width:
//                                                                                       100,
//                                                                                   height:
//                                                                                       35,
//                                                                                   alignment:
//                                                                                       Alignment.center,
//                                                                                   decoration:
//                                                                                       BoxDecoration(
//                                                                                           borderRadius: BorderRadius.all(Radius.circular(
//                                                                                               25)),
//                                                                                           boxShadow: <
//                                                                                               BoxShadow>[
//                                                                                             BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                           ],
//                                                                                           gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
//                                                                                             Color(0xffEAF12D),
//                                                                                             Color(0xffEAF12D)
//                                                                                           ])),
//                                                                                   child:
//                                                                                       Text(
//                                                                                     'sent_proposal'.tr,
//                                                                                     style: TextStyle(
//                                                                                         fontSize: 12,
//                                                                                         fontWeight: FontWeight.bold,
//                                                                                         color: Color(0xFF134FAF)),
//                                                                                   ),
//                                                                                 ),
//                                                                               )
//                                                                         ]else if(food.isRequestSent == 1)...[
//                                                                           InkWell(
//                                                                                     onTap:
//                                                                                         () {
//                                                                                           Dialogs.materialDialog(
//                                                                                           useSafeArea: true,
//                                                                                           msg: "Withdraw",
//                                                                                           msgStyle: TextStyle(fontFamily: "Raleway",
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color(0xFF134FAF), fontSize: 25),
//                                                                                           color: Color(0xffEAF12D),
//                                                                                           context: Get.context!,
//                                                                                           dialogWidth: kIsWeb ? 0.3 : null,
//                                                                                           onClose: (value) =>
//                                                                                               print("returned value is '$value'"),
//                                                                                           actions: [
//                                                                                             SizedBox(
//                                                                                                 height: 120,
//                                                                                                 child: SingleChildScrollView(
//                                                                                                   child: Column(children: [
//                                                                                                     Container(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: Text('withdraw_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.black, fontSize: 17),),
//                                                                                                     ),
//                                                                                                      SizedBox(
//                                                                                                       height: 25,
//                                                                                                     ),
//                                                                                                     Padding(
//                                                                                                       padding: EdgeInsets.only(left: 50),
//                                                                                                       child: Column(
//                                                                                                                 children: [
//                                                                                                                   Row(
//                                                             children: [
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('cancel'.tr),
//                                                                 onPressed: (){
                                                                
//                                                                  Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                                 SizedBox(width: 35),
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('okay'.tr),
//                                                                 onPressed: (){
                                                                 
                                                                 
                                                                                               
                                                                  
                                                                 
                                                                     
//                                                                   Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                             ],
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ]),
//                                                                                                 ))
//                                                                                           ]);
                                                                                 
//                                                                                     },
//                                                                                     child:
//                                                                                         Container(
//                                                                                       width:
//                                                                                           100,
//                                                                                       height:
//                                                                                           35,
//                                                                                       alignment:
//                                                                                           Alignment.center,
//                                                                                       decoration:
//                                                                                           BoxDecoration(
//                                                                                               borderRadius: BorderRadius.all(Radius.circular(
//                                                                                                   25)),
//                                                                                               boxShadow: <
//                                                                                                   BoxShadow>[
//                                                                                                 BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                               ],
//                                                                                               gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
//                                                                                                 Color(0xffEAF12D),
//                                                                                                 Color(0xffEAF12D)
//                                                                                               ])),
//                                                                                       child:
//                                                                                           Text(
//                                                                                         'withdraw'.tr,
//                                                                                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                       ),
//                                                                                     ),
//                                                                                   )
//                                                                         ]else if(food.isRequestSentAccept == 0 && !(food.isRequestReceived == 1 || food.isRequestReceivedAccept ==1  || 
//                                                                         food.isRequestSent == 1 || food.isRequestSentReject == 1 || food.isRequestReceivedReject ==1))...[
//                                                                           InkWell(
//                                                                                 onTap:
//                                                                                     () {
//                                                                                   // sentrequest
//                                                                                   controller
//                                                                     .sentRequestProposal(
//                                                                         food.userId, context);
//                                                                                 },
//                                                                                 child:
//                                                                                     Container(
//                                                                                   width:
//                                                                                       100,
//                                                                                   height:
//                                                                                       35,
//                                                                                   alignment:
//                                                                                       Alignment.center,
//                                                                                   decoration:
//                                                                                       BoxDecoration(
//                                                                                           borderRadius: BorderRadius.all(Radius.circular(
//                                                                                               25)),
//                                                                                           boxShadow: <
//                                                                                               BoxShadow>[
//                                                                                             BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                           ],
//                                                                                           gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
//                                                                                             Color(0xfff79c4f),
//                                                                                             Color(0xfff79c4f)
//                                                                                           ])),
//                                                                                   child:
//                                                                                       Text(
//                                                                                     'sent_proposal'.tr,
//                                                                                     style: TextStyle(
//                                                                                         fontSize: 12,
//                                                                                         fontWeight: FontWeight.bold,
//                                                                                         color: Colors.white),
//                                                                                  ),
//                                                                                 ),
//                                                                                )
//                                                                         ]else if(food.isRequestSentAccept == 1)...[
                                                                          
//                                                                           Row(
//                                                                                         children: [
//                                                                                           InkWell(
//                                                                                             onTap: () {
//                                                                                               // friends
//                                                                                               // controller.sendProposal(food.id, context);
//                                                                                             },
//                                                                                             child: Container(
//                                                                                               width: 100,
//                                                                                               height: 35,
//                                                                                               alignment: Alignment.center,
//                                                                                               decoration: BoxDecoration(
//                                                                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                   boxShadow: <BoxShadow>[
//                                                                                                     BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                   ],
//                                                                                                   gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                               child: Text(
//                                                                                                 'friends'.tr,
//                                                                                                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ),
//                                                                                           SizedBox(
//                                                                                             width: 15,
//                                                                                           ),
//                                                                                           InkWell(
//                                                                                             onTap: () {
                                                                                              
//                                                                                               // chat
//                                                                                               // controller.sendProposal(food.id, context);
//                                                                                             },
//                                                                                             child: Container(
//                                                                                               width: 60,
//                                                                                               height: 35,
//                                                                                               alignment: Alignment.center,
//                                                                                               decoration: BoxDecoration(
//                                                                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                   boxShadow: <BoxShadow>[
//                                                                                                     BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                   ],
//                                                                                                   gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                               child: Icon(Icons.chat_rounded, color: Color(0xFF134FAF))
//                                                                                             ),
//                                                                                           ),
//                                                                                         ],
//                                                                                       )
//                                                                         ]else if(food.isRequestSentReject == 0 && !(food.isRequestReceived == 1 || food.isRequestReceivedAccept ==1  || 
//                                                                         food.isRequestSentAccept == 1 || food.isRequestSent == 1 || food.isRequestReceivedReject ==1))...[
//                                                                           InkWell(
//                                                                                             onTap: () {
//                                                                                               // sent request
//                                                                                               controller
//                                                                     .sentRequestProposal(
//                                                                         food.userId, context);
//                                                                                             },
//                                                                                             child: Container(
//                                                                                               width: 100,
//                                                                                               height: 35,
//                                                                                               alignment: Alignment.center,
//                                                                                               decoration: BoxDecoration(
//                                                                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                   boxShadow: <BoxShadow>[
//                                                                                                     BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                   ],
//                                                                                                   gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                               child: Text(
//                                                                                                 'sent_proposal'.tr,
//                                                                                                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                               ),
//                                                                                             ),
//                                                                                           )
//                                                                         ]else if(food.isRequestSentReject == 1)...[
//                                                                           InkWell(
//                                                                                             onTap: () {
//                                                                                               Dialogs.materialDialog(
//                                                                                           useSafeArea: true,
//                                                                                           msg: "Sent Proposal",
//                                                                                           msgStyle: TextStyle(fontFamily: "Raleway",
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color(0xFF134FAF), fontSize: 25),
//                                                                                           color: Color(0xffEAF12D),
//                                                                                           context: Get.context!,
//                                                                                           dialogWidth: kIsWeb ? 0.3 : null,
//                                                                                           onClose: (value) =>
//                                                                                               print("returned value is '$value'"),
//                                                                                           actions: [
//                                                                                             SizedBox(
//                                                                                                 height: 120,
//                                                                                                 child: SingleChildScrollView(
//                                                                                                   child: Column(children: [
//                                                                                                     Container(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.black, fontSize: 17),),
//                                                                                                     ),
//                                                                                                      SizedBox(
//                                                                                                       height: 25,
//                                                                                                     ),
//                                                                                                     Padding(
//                                                                                                       padding: EdgeInsets.only(left: 50),
//                                                                                                       child: Column(
//                                                                                                                 children: [
//                                                                                                                   Row(
//                                                             children: [
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('cancel'.tr),
//                                                                 onPressed: (){
                                                                
//                                                                  Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                                 SizedBox(width: 35),
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('okay'.tr),
//                                                                 onPressed: (){
                                                                 
                                                                 
                                                                                               
                                                                  
                                                                 
                                                                     
//                                                                   Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                             ],
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ]),
//                                                                                                 ))
//                                                                                           ]);
//                                                                                               // sent request
                                                                                             
//                                                                                             },
//                                                                                             child: Container(
//                                                                                               width: 100,
//                                                                                               height: 35,
//                                                                                               alignment: Alignment.center,
//                                                                                               decoration: BoxDecoration(
//                                                                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                   boxShadow: <BoxShadow>[
//                                                                                                     BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                   ],
//                                                                                                   gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                               child: Text(
//                                                                                                 'sent_proposal'.tr,
//                                                                                                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                               ),
//                                                                                             ),
//                                                                                           )
//                                                                         ]else if(food.isRequestReceived == 0 && !(food.isRequestSentReject == 1 || food.isRequestReceivedAccept ==1  || 
//                                                                         food.isRequestSentAccept == 1 || food.isRequestSent == 1 || food.isRequestReceivedReject ==1))...[
//                                                                           InkWell(
//                                                                                             onTap: () {
//                                                                                               Dialogs.materialDialog(
//                                                                                           useSafeArea: true,
//                                                                                           msg: "Sent Proposal",
//                                                                                           msgStyle: TextStyle(fontFamily: "Raleway",
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color(0xFF134FAF), fontSize: 25),
//                                                                                           color: Color(0xffEAF12D),
//                                                                                           context: Get.context!,
//                                                                                           dialogWidth: kIsWeb ? 0.3 : null,
//                                                                                           onClose: (value) =>
//                                                                                               print("returned value is '$value'"),
//                                                                                           actions: [
//                                                                                             SizedBox(
//                                                                                                 height: 120,
//                                                                                                 child: SingleChildScrollView(
//                                                                                                   child: Column(children: [
//                                                                                                     Container(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.black, fontSize: 17),),
//                                                                                                     ),
//                                                                                                      SizedBox(
//                                                                                                       height: 25,
//                                                                                                     ),
//                                                                                                     Padding(
//                                                                                                       padding: EdgeInsets.only(left: 50),
//                                                                                                       child: Column(
//                                                                                                                 children: [
//                                                                                                                   Row(
//                                                             children: [
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('cancel'.tr),
//                                                                 onPressed: (){
                                                                
//                                                                  Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                                 SizedBox(width: 35),
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('okay'.tr),
//                                                                 onPressed: (){
                                                                 
                                                                 
                                                                 
                                                                     
//                                                                   Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                             ],
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ]),
//                                                                                                 ))
//                                                                                           ]);
//                                                                                               // sent request
                                                                                             
//                                                                                             },
//                                                                                             child: Container(
//                                                                                               width: 100,
//                                                                                               height: 35,
//                                                                                               alignment: Alignment.center,
//                                                                                               decoration: BoxDecoration(
//                                                                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                   boxShadow: <BoxShadow>[
//                                                                                                     BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                   ],
//                                                                                                   gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
//                                                                                               child: Text(
//                                                                                                 'sent_proposal'.tr,
//                                                                                                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
//                                                                                               ),
//                                                                                             ),
//                                                                                           )
//                                                                         ]else if(food.isRequestReceived == 1)...[
//                                                                           Row(
//                                                                                                 children: [
//                                                                                                   InkWell(
//                                                                                                     onTap: () {
//                                                                                                        Dialogs.materialDialog(
//                                                                                           useSafeArea: true,
//                                                                                           msg: "Accept Proposal",
//                                                                                           msgStyle: TextStyle(fontFamily: "Raleway",
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color(0xFF134FAF), fontSize: 25),
//                                                                                           color: Color(0xffEAF12D),
//                                                                                           context: Get.context!,
//                                                                                           dialogWidth: kIsWeb ? 0.3 : null,
//                                                                                           onClose: (value) =>
//                                                                                               print("returned value is '$value'"),
//                                                                                           actions: [
//                                                                                             SizedBox(
//                                                                                                 height: 120,
//                                                                                                 child: SingleChildScrollView(
//                                                                                                   child: Column(children: [
//                                                                                                     Container(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: Text('accept_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.black, fontSize: 17),),
//                                                                                                     ),
//                                                                                                      SizedBox(
//                                                                                                       height: 25,
//                                                                                                     ),
//                                                                                                     Padding(
//                                                                                                       padding: EdgeInsets.only(left: 50),
//                                                                                                       child: Column(
//                                                                                                                 children: [
//                                                                                                                   Row(
//                                                             children: [
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('cancel'.tr),
//                                                                 onPressed: (){
                                                                
//                                                                  Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                                 SizedBox(width: 35),
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('okay'.tr),
//                                                                 onPressed: (){
                                                                 
                                                                 
                                                                                              
                                                                  
                                                                 
                                                                     
//                                                                   Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                             ],
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ]),
//                                                                                                 ))
//                                                                                           ]);
//                                                                                                       // accept
                                                                                                      
//                                                                                                     },
//                                                                                                     child: Container(
//                                                                                                       width: 80,
//                                                                                                       height: 35,
//                                                                                                       alignment: Alignment.center,
//                                                                                                       decoration: BoxDecoration(
//                                                                                                           borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                           boxShadow: <BoxShadow>[
//                                                                                                             BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                           ],
//                                                                                                           gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                                       child: Text(
//                                                                                                         'accept'.tr,
//                                                                                                         style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                   SizedBox(
//                                                                                                     width: 15,
//                                                                                                   ),
//                                                                                                   InkWell(
//                                                                                                     onTap: () {
//                                                                                                        Dialogs.materialDialog(
//                                                                                           useSafeArea: true,
//                                                                                           msg: "Reject Proposal",
//                                                                                           msgStyle: TextStyle(fontFamily: "Raleway",
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color(0xFF134FAF), fontSize: 25),
//                                                                                           color: Color(0xffEAF12D),
//                                                                                           context: Get.context!,
//                                                                                           dialogWidth: kIsWeb ? 0.3 : null,
//                                                                                           onClose: (value) =>
//                                                                                               print("returned value is '$value'"),
//                                                                                           actions: [
//                                                                                             SizedBox(
//                                                                                                 height: 120,
//                                                                                                 child: SingleChildScrollView(
//                                                                                                   child: Column(children: [
//                                                                                                     Container(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: Text('reject_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.black, fontSize: 17),),
//                                                                                                     ),
//                                                                                                      SizedBox(
//                                                                                                       height: 25,
//                                                                                                     ),
//                                                                                                     Padding(
//                                                                                                       padding: EdgeInsets.only(left: 50),
//                                                                                                       child: Column(
//                                                                                                                 children: [
//                                                                                                                   Row(
//                                                             children: [
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('cancel'.tr),
//                                                                 onPressed: (){
                                                                
//                                                                  Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                                 SizedBox(width: 35),
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('okay'.tr),
//                                                                 onPressed: (){
                                                                 
                                                                 
                                                                                              
                                                                  
                                                                 
                                                                     
//                                                                   Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                             ],
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ]),
//                                                                                                 ))
//                                                                                           ]);
//                                                                                                       // reject
                                                                                                     
//                                                                                                     },
//                                                                                                     child: Container(
//                                                                                                       width: 80,
//                                                                                                       height: 35,
//                                                                                                       alignment: Alignment.center,
//                                                                                                       decoration: BoxDecoration(
//                                                                                                           borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                           boxShadow: <BoxShadow>[
//                                                                                                             BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                           ],
//                                                                                                           gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                                       child: Text(
//                                                                                                         'reject'.tr,
//                                                                                                         style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 ],
//                                                                                               )
//                                                                         ]else if(food.isRequestReceivedAccept ==1)...[
//                                                                            Row(
//                                                                                         children: [
//                                                                                           InkWell(
//                                                                                             onTap: () {
//                                                                                               // friends
//                                                                                               // controller.sendProposal(food.id, context);
//                                                                                             },
//                                                                                             child: Container(
//                                                                                               width: 100,
//                                                                                               height: 35,
//                                                                                               alignment: Alignment.center,
//                                                                                               decoration: BoxDecoration(
//                                                                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                   boxShadow: <BoxShadow>[
//                                                                                                     BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                   ],
//                                                                                                   gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                               child: Text(
//                                                                                                 'friends',
//                                                                                                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ),
//                                                                                           SizedBox(
//                                                                                             width: 15,
//                                                                                           ),
//                                                                                           InkWell(
//                                                                                             onTap: () {
//                                                                                                    Get.toNamed(RouteNames.profileScreen);
//                                                                                               // chat
//                                                                                               // controller.sendProposal(food.id, context);
//                                                                                             },
//                                                                                             child: Container(
//                                                                                               width: 60,
//                                                                                               height: 35,
//                                                                                               alignment: Alignment.center,
//                                                                                               decoration: BoxDecoration(
//                                                                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                   boxShadow: <BoxShadow>[
//                                                                                                     BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                   ],
//                                                                                                   gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                               child: Icon(Icons.chat_rounded, color: Color(0xFF134FAF))
//                                                                                             ),
//                                                                                           ),
//                                                                                         ],
//                                                                                       )
//                                                                         ]else if(food.isRequestReceivedReject ==1)...[
//                                                                           InkWell(
//                                                                                                         onTap: () {
//                                                                                                            Dialogs.materialDialog(
//                                                                                           useSafeArea: true,
//                                                                                           msg: "Sent Proposal",
//                                                                                           msgStyle: TextStyle(fontFamily: "Raleway",
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color(0xFF134FAF), fontSize: 25),
//                                                                                           color: Color(0xffEAF12D),
//                                                                                           context: Get.context!,
//                                                                                           dialogWidth: kIsWeb ? 0.3 : null,
//                                                                                           onClose: (value) =>
//                                                                                               print("returned value is '$value'"),
//                                                                                           actions: [
//                                                                                             SizedBox(
//                                                                                                 height: 120,
//                                                                                                 child: SingleChildScrollView(
//                                                                                                   child: Column(children: [
//                                                                                                     Container(
//                                                                                                       alignment: Alignment.center,
//                                                                                                       child: Text('sent_pop'.tr, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Raleway",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.black, fontSize: 17),),
//                                                                                                     ),
//                                                                                                      SizedBox(
//                                                                                                       height: 25,
//                                                                                                     ),
//                                                                                                     Padding(
//                                                                                                       padding: EdgeInsets.only(left: 50),
//                                                                                                       child: Column(
//                                                                                                                 children: [
//                                                                                                                   Row(
//                                                             children: [
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('cancel'.tr),
//                                                                 onPressed: (){
                                                                
//                                                                  Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                                 SizedBox(width: 35),
//                                                               ElevatedButton(
//                                                                 style: ElevatedButton.styleFrom(
//                                                                   primary: Color(0xFF134FAF),
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(10))),
//                                                                 ),
//                                                                 child: Text('okay'.tr),
//                                                                 onPressed: (){
                                                                 
                                                                 
                                                                                              
                                                                 
                                                                     
//                                                                   Get.Back();
                                                                  
                                                                  
                                                                 
//                                                                   // fetchWishListProposal("");
//                                                                 },
//                                                               ),
//                                                             ],
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                       ),
//                                                                                                     ),
//                                                                                                   ]),
//                                                                                                 ))
//                                                                                           ]);
//                                                                                                           // sent request
                                                                                                          
//                                                                                                         },
//                                                                                                         child: Container(
//                                                                                                           width: 100,
//                                                                                                           height: 35,
//                                                                                                           alignment: Alignment.center,
//                                                                                                           decoration: BoxDecoration(
//                                                                                                               borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                                               boxShadow: <BoxShadow>[
//                                                                                                                 BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
//                                                                                                               ],
//                                                                                                               gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffEAF12D), Color(0xffEAF12D)])),
//                                                                                                           child: Text(
//                                                                                                             'sent_proposal'.tr,
//                                                                                                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF134FAF)),
//                                                                                                           ),
//                                                                                                         ),
//                                                                                                       )
//                                                                         ]else...[
//                                                                           Container()
//                                                                         ]
                                                                         