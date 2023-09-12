import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thirumanam/controller/chat_body_controller.dart';
import 'package:thirumanam/models/chat_main_model.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:thirumanam/models/chat_one_chat_model.dart';
import 'package:thirumanam/preferences/app_preference.dart';

import '../../utils/constants.dart';

class ChatHomePage extends StatefulWidget {
  @override
  _ChatHomePageState createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  final controller = Get.find<ChatBodyController>();
  final AppPreference appPreference = Get.find();
  String details = "";
  // int index = 0;
  @override
  void initState() {
    super.initState();
    controller.fetchChatBody();

    String token = appPreference.accessToken!;

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    details = payload['details'];
    print(payload);
    print(details);

    // }
  }

  // UserInvolved? getOppositeDetails(List<ChatMainModel> users) {
  //     print(getOppositeDetails(users));
  //     for(int i = 0; i > users.length; i++ ){
  //       for(int j = 0; j > users[i].userInvolved!.length; j++ ){
  //         if(users[i].userInvolved?[j].id != details){
  //           return users[i].userInvolved![j];
  //         }else{
  //           return null;
  //         }
  //     }
  //     }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF134FAF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        "Chat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Raleway"),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 500,
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: TextField(
                                      onTap: () {},
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color: Color(0xFF134FAF),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.clear),
                                            onPressed: () {},
                                          ),
                                          hintText: 'Search Proposal',
                                          hintStyle: TextStyle(
                                              color: Color(0xFF134FAF)),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                color: Colors.white,
              ),
              child: StreamBuilder<List<ChatMainModel>>(
                  stream: controller.getFilteredModel(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // print(snapshot.data);
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: Center(
                            child: Container(
                                height: 80,
                                width: 80,
                                alignment: AlignmentDirectional.center,
                                child: Lottie.asset(
                                  "assets/loading/heart.json",
                                )),
                          ),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Center(child: Text('Some error occurred!'));
                        } else {
                          print("snapshot.data");
                          print(snapshot.data);

                          List<ChatMainModel> foodList = snapshot.data!;

                          print(foodList);
                          print("foodList");

                          return foodList.length == 0
                              ? Container(
                                  child: Center(
                                    child: Text(
                                      "Chat user are empty",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  itemCount: foodList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var food = foodList[index];
                                    print(details);
                                    print(foodList.length);

                                    var oppositeUser =
                                        food.userInvolved!.firstWhere(
                                      (user) => user.id != details,
                                      orElse: () => UserInvolved(
                                          id: '',
                                          firstNmae: '',
                                          lastName: '',
                                          time: '',
                                          attachemnt: [],count: 0),
                                    );
                                    var oppositeUser1 =
                                        food.userInvolved!.firstWhere(
                                      (user) => user.id == details,
                                      orElse: () => UserInvolved(
                                          id: '',
                                          firstNmae: '',
                                          lastName: '',
                                          time: '',
                                          attachemnt: [],count: 0),
                                    );
                                    print(oppositeUser.id);
                                    if (oppositeUser.id != '') {
                                      String convertToAgo(DateTime input) {
                                        Duration diff =
                                            DateTime.now().difference(input);

                                        if (diff.inDays >= 1) {
                                          return '${diff.inDays} day ago';
                                        } else if (diff.inHours >= 1) {
                                          return '${diff.inHours} hour ago';
                                        } else if (diff.inMinutes >= 1) {
                                          return '${diff.inMinutes} min ago';
                                        } else if (diff.inSeconds >= 1) {
                                          return '${diff.inSeconds} sec ago';
                                        } else {
                                          return 'just now';
                                        }
                                      }

                                      DateTime time1 = DateTime.parse(
                                          "${oppositeUser.time!.isNotEmpty ? oppositeUser.time : ""}");
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatPage(channelId: food.id.toString(),firstName: oppositeUser.firstNmae!, lastName: oppositeUser.lastName!),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            elevation: 0,
                                            shadowColor: Colors.white,
                                            color: Colors.white,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                    // backgroundColor: Colors.black,
                                                    radius: 30,
                                                    child: CircleAvatar(
                                                        radius: 30,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "${oppositeUser != null && oppositeUser.attachemnt != null && oppositeUser.attachemnt?.length != 0 ? oppositeUser.attachemnt![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}"))),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '${oppositeUser.firstNmae} ${oppositeUser.lastName}',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF134FAF),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Raleway"),
                                                          ),
                                                          Text(
                                                            convertToAgo(time1),
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Raleway"),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'hi',
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                                color: Colors.grey,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Raleway"),
                                                          ),
                                                            Container(
                                                                                                          height: 20,
                                                                                                          width: 20,
                                                                                                          decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                              //more than 50% of width makes circle
                            
                                                                                                              ),
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              "${oppositeUser.count}",
                                                                                                              style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                            ),
                                                                                                          ),
                                                                                                        )
                                                          
                                                          
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                    ;
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  });
                        }
                    }
                  }),
            )),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
   String channelId = "";
   String firstName = "";
   String lastName = "";
    
  //  String profileAttachment = "";
   ChatPage({Key? Key, required this.channelId, required this.firstName, required this.lastName});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
    var ChatoneModel = StreamController<List<ChatOnetoOneModel>>.broadcast();
  Stream<List<ChatOnetoOneModel>> getchatoneModel() => ChatoneModel.stream;

    fetchChatOne() async {
      try{
     final url = Uri.parse("${URL}auth/get-detailed-chat-msgs?channel_id=${widget.channelId}");
    print(url);

    final response = await http.get(Uri.parse(url.toString(),), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){

         
      
    }
    ChatoneModel.add(List<ChatOnetoOneModel>.from(
        body["data"].map((x) => ChatOnetoOneModel.fromJson(x)))); 
      }catch(e){
         print('Error fetching chat one: $e');
      }  
}
  final controller = Get.find<ChatBodyController>();
  final AppPreference appPreference = Get.find();
  String details = "";
  @override
  void initState(){
    super.initState();
    Timer.periodic(Duration(seconds: 1), (_) => fetchChatOne());
    
    controller.fetchChatBody();
    String token = appPreference.accessToken!;

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    details = payload['details'];
    print(payload);
    print(details);
  }

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                       IconButton(
                    onPressed:(){
                      Navigator.pop(context);
                      } ,
                                icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 25,),
                  ),
                   Text(
                "${widget.firstName} ${widget.lastName}",
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
              ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                      color: Colors.white,
                    ),
                    child: StreamBuilder<List<ChatOnetoOneModel>>(
            stream: getchatoneModel().asBroadcastStream(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List<ChatOnetoOneModel>> snapshot){
              if (snapshot.connectionState == ConnectionState.done) {
                          // print(snapshot.data);
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(child:  Center(
          child: Container(
              height: 80,
              width: 80,
              alignment: AlignmentDirectional.center,
              child: Lottie.asset(
                "assets/loading/heart.json",
              )),
        ),);
                          default:
                            if (snapshot.hasError) {
                              return Center(child: Text('Some error occurred!'));
                            } else {
                              print("snapshot.data");
                              print(snapshot.data);
            
            List<ChatOnetoOneModel> foodList = snapshot.data!;
            print(foodList);
            print("foodList");
            return foodList.length == 0 ? Container(child: Center(child: Text("No Chats", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),): 
            
                     ListView.builder(
                       reverse: true,
              scrollDirection: Axis.vertical,
              itemCount: foodList.length,
              // physics: ScrollPhysics(),
              // shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                var food = foodList[index];
                 
                 final isMe = food.userId == details;
                // var oppositeUser =
                //                         food.(user) => user.userId != details;
                //  var CurrentUser =
                //                         foodList.firstWhere(
                //                       (user) => user.userId == details);                     
                                   
                                    // print('cur: ${CurrentUser.userId}');
                
                
                                     
                                    
                      
                String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} days ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hours ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} seconds ago';
    } else {
      return 'now';
    }
  }

  DateTime time1 = DateTime.parse("${food.createdAt}");
              return  ListView(
                shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
                        children: [
                          if (food.userId == details)...[
                            _itemChat(
                            avatar:
                                '${food.userAttachment!.length != 0 ? food.userAttachment![0].url : 'https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg' }',
                            chat: 1,
                            message:
                                '${food.msg}',
                            time: convertToAgo(time1),
                          ),
                          ]else...[
                            _itemChat(
                            chat: 0,
                            time: convertToAgo(time1),
                            message: '${food.msg}',
                            
                            avatar:
                                '${food.userAttachment!.length != 0 ? food.userAttachment![0].url : 'https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg' }',
                          ),
                          ]
                          
                          
                          
                        ],
                
              );
             
              },
              
                            );
                  }
                        }
          
            }
      
            
          )
                  ),
                ),
                SizedBox(
                  height: 120,
                )
              ],
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  color: Colors.white,
                  child: TextField(
                    controller: controller.msgController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      suffixIcon: 
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.indigo),
                            padding: EdgeInsets.all(14),
                            child: InkWell(
                              onTap: (){
                               controller.chatpost(widget.channelId, context);
                              },
                              child: Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                      labelStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 0 = Send
  // 1 = Recieved
  _itemChat({int? chat, String? avatar, message, time}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        avatar != null
            ? Avatar(
                image: avatar,
                size: 30,
              )
            : Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),
              ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Text('$message', style: TextStyle(fontSize: 13,color: Color(0xFF134FAF), fontWeight: FontWeight.w900, fontFamily: "Raleway"),),
          ),
        ),
        chat == 1
            ? Text(
                '$time',
                style: TextStyle(fontSize: 10,color: Colors.indigo.shade100, fontWeight: FontWeight.w900, fontFamily: "Raleway"),
              )
            : Text(
                '$time',
                style: TextStyle(fontSize: 10,color: Colors.indigo.shade100, fontWeight: FontWeight.w900, fontFamily: "Raleway"),
              ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;
  Avatar({this.image, this.size = 10, this.margin = const EdgeInsets.all(0)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
