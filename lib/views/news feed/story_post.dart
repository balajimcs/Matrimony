
import 'dart:convert';
import 'dart:io';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:popup_banner/popup_banner.dart';
import 'package:thirumanam/controller/post_feed_controller.dart';
import 'package:thirumanam/controller/received_proposal_controller.dart';
import 'package:thirumanam/models/post_story_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/received_proprosal_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_colors.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';
import 'package:thirumanam/views/news%20feed/liked_by_page.dart';

class StroyPost extends StatefulWidget {
  @override
  State<StroyPost> createState() => StroyPostState();
}

class StroyPostState extends State<StroyPost> {

final controller = Get.find<PostFeedController>();
TextEditingController imageController = TextEditingController(text: '');
 final AppPreference appPreference = Get.find();

  @override
  void initState(){
    super.initState();
    controller.fetchPostFeed();
  }
List<File>? Image1 = [];
File? Image2;
PickedFile? _pickedFile;
 String? message = "";


XFile? image;

   int numberOfLikes = 10;

  int pageIndex = 0;

  void _onAlertPress() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    
                    Text('gallery'.tr),
                  ],
                ),
                onPressed: getGalleryImage,
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                   
                    Text('take_photo'.tr),
                  ],
                ),
                onPressed: getCameraImage,
              ),
            ],
          );
        });
  }

  Future getCameraImage() async {
    ImagePicker imagePicker = ImagePicker();
    var _pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    Image2 = File(_pickedFile!.path);
    Get.back();
        setState(() {
          Dialogs.materialDialog(
                                  msg: 'selected image',
                                  msgStyle: TextStyle(fontSize: 16, fontFamily: "Raleway"),
                                  // title: "Delete",
                                  color: Colors.white,
                                  context: context,
                                  dialogWidth: kIsWeb ? 0.3 : null,
                                  onClose: (value) =>
                                      print("returned value is '$value'"),
                                  actions: [
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                                  height: 170,
                                                  width: 140,
                                                  child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(29),
                                                        child: Image.file(Image2!),
                                                      
                                                  ),
                                                ),
                                                SizedBox(height: 15,),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Color(0xfff7892b)), 
    ), primary: Color(0xfff7892b)),

                                                onPressed: (){
                                                
                                                  uploadImage1();  
                                                
                                          }, child: Text('submit'.tr))
                                          ],
                                        ),
                                      ),

                                    
                                  ]);
        });
  
    
  }

   Future getGalleryImage() async {
     ImagePicker imagePicker = ImagePicker();
    var  _pickedFile =
        await imagePicker.pickMultiImage();
        if (_pickedFile != null) {
  // for (var i = 0; i < _pickedFile.length; i++) {
    Image1 = _pickedFile.map((image) => File(image.path)).cast<File>().toList();
    // Image1 = File(_pickedFile[i].path) as List<File>?;
    // Use the selected image here
  // }
    }
  setState(() {
           Dialogs.materialDialog(
                                  msg: 'selected image',
                                  msgStyle: TextStyle(fontSize: 16, fontFamily: "Raleway"),
                                  // title: "Delete",
                                  color: Colors.white,
                                  context: context,
                                  dialogWidth: kIsWeb ? 0.3 : null,
                                  onClose: (value) =>
                                      print("returned value is '$value'"),
                                  actions: [
                                      Container(
                                        height: 500,
                                        child: Column(
                                          children: [
                                             Expanded(
                                               child: GridView.builder(
                                                                     itemCount: Image1!.length,
                                                                    gridDelegate: 
                                                                       SliverGridDelegateWithFixedCrossAxisCount(
                                                                           crossAxisCount: 3),
                                                                       itemBuilder: (BuildContext context, int index) {
                                                                        return Image.file(File(Image1![index].path), 
                                                                     fit: BoxFit.cover,);
                                                                  }),
                                             ),
                                             
                                            // Container(
                                            //       height: 170,
                                            //       width: 140,
                                            //       child: ClipRRect(
                                            //             borderRadius:
                                            //                 BorderRadius.circular(29),
                                            //             child: Image.file(Image1[0]),
                                                      
                                            //       ),
                                            //     ),
                                                SizedBox(height: 15,),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Color(0xfff7892b)), 
    ), primary: Color(0xfff7892b)),

                                                onPressed: (){
                                                
                                                  uploadImage();  
                                                
                                          }, child: Text('submit'.tr))
                                          ],
                                        ),
                                      ),

                                    
                                  ]);
        });
  }
  Future<void> uploadImage1() async {
    final request =
        http.MultipartRequest("POST", Uri.parse("${URL}auth/uploadfile"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'imgUrl', Image2!.readAsBytes().asStream(), Image2!.lengthSync(),
        filename: Image2!.path.split("/").last));
    request.headers.addAll(headers);
    request.headers['x-access-token'] =
        appPreference.accessToken!;
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson["message"].toString();
    if (resJson != null) {
      if (resJson.isNotEmpty && resJson["status"].toString() != 410) {
        appPreference.isData = resJson["data"].toString();
        appPreference.Email = resJson["data"]["fileImageUrl"].toString();
        

        print("aaaaa: ${resJson["data"].toString()}");
        print("bbbbb: ${resJson["data"]["fileImageUrl"].toString()}");
        
        setState(() {
         Navigator.pop(context);
        });
        // Navigator.pop(context);
        print("balaji");
      } else {
        print("object1");
      }
    }
  }
List<String> imageUrls = [];
  Future<void> uploadImage() async {
    final request =
        http.MultipartRequest("POST", Uri.parse("${URL}auth/multiple-file-upload"));
    final headers = {"Content-type": "multipart/form-data"};
    Image1!.forEach((file) {
  request.files.add(http.MultipartFile(
    'imgUrl', 
    file.readAsBytes().asStream(), 
    file.lengthSync(),
    filename: file.path.split("/").last
  ));
});
    request.headers.addAll(headers);
    request.headers['x-access-token'] =
        appPreference.accessToken!;
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson["message"].toString();
    print(message);
    if (resJson != null) {
      if (resJson.isNotEmpty && resJson["status"].toString() != 410) {
        appPreference.isData = resJson["data"].toString();
        for (var i = 0; i < resJson["data"].length; i++) {
        String imageUrl = resJson["data"][i]["fileImageUrl"].toString();
        imageUrls.add(imageUrl);
      }
        appPreference.Email = imageUrls.join(",");
        
        
        print("aaaaa: ${resJson["data"].toString()}");
        print("bbbbb: ${imageUrls.join(",")}");
        
        setState(() {
         Navigator.pop(context);
        });
        
        print("balaji");
      } else {
        print("object1");
      }
    }
  }
  // Future<void> uploadImage() async{



  //    final request = http.MultipartRequest(
  //       "POST", Uri.parse("${URL}auth/uploadfile"));
  //   final headers = {"Content-type": "multipart/form-data"};
  //   request.files.add(http.MultipartFile('imgUrl',
  //       Image1!.readAsBytes().asStream(), Image1!.lengthSync(),
  //       filename: Image1!.path.split("/").last));
  //   request.headers.addAll(headers);
  //    request.headers['x-access-token'] =
  //       appPreference.accessToken!;
  //   final response = await request.send();
  //   http.Response res = await http.Response.fromStream(response);
  //   final resJson = jsonDecode(res.body);
  //   message = resJson["message"].toString();
  //    if (resJson != null) {
  //     if (resJson.isNotEmpty && resJson["status"].toString() != 410) {
  //         appPreference.isData = resJson["data"].toString();
  //         appPreference.Email = resJson["data"]["fileImageUrl"].toString();
          
  //         print("aaaaa: ${resJson["data"].toString()}");
  //         print("bbbbb: ${resJson["data"]["fileImageUrl"].toString()}");
  //         print("currentStep = 1");
  //         setState(() {
  //           Navigator.pop(context);  
  //         });  
          
          
  //         // showSuccessSnackBar("Basic Details verified Succesfully", context);
  //         print("balaji");
  //     }else{
        
  //       // showSuccessSnackBar(resJson["message"].toString(), context);
  //       print("object1");
  //     }
  //   }
  // }

  
  void _showPopupMenu() async {
      await showMenu(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFF134FAF),
        context: context,
        
        position: RelativeRect.fromLTRB(200, 40, 10, 10),
        items: [
          
          PopupMenuItem(
           
            value: 1,
            child: InkWell(
              onTap: (){
                Get.toNamed(RouteNames.savedPostFeed);
              },
              child: Text('saved_post'.tr, style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "Raleway"),),
            ),
          ),
          
          PopupMenuItem(
            
             value: 2,
            child: InkWell(
              onTap: (){
                setState(() {
                  Get.toNamed(RouteNames.myPostFeed);  
                });
                
              },
              child: Text('my_post_feed'.tr,style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "Raleway"),),
            ),
          ),
          
        ],
        elevation: 8.0,
      ).then((value){

// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null 


      if(value!=null)
       print(value);

       });
    }
 

   Future<Map<String, dynamic>> fetchMyDetailedPage() async {
     final url = Uri.parse("${URL}auth/myprofile");
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){


      // appPreference.accessToken = body["data"];
        print("balaji");
          }
    print(body);
    
    // isLoading.value = false;
    // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList(); 
     return body;   
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
            future: fetchMyDetailedPage(),
            builder: (context, snapshot) {
              final users = snapshot.data.toString();
              
              // final user = users;

              print(users);

              // print(snapshot);

              if (snapshot.connectionState == ConnectionState.done) {
                // print(snapshot.data);
              }
                  if (snapshot.hasError) {
                    return Center(child: Text('some_error'.tr));
                  } else {
                    print("snapshot.data");
                    print(snapshot.data);
                    return _buildProductCard(snapshot.data);
                  }
              
            });   
  }
    
    Widget _buildProductCard(product){ 
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
backgroundColor: Colors.orangeAccent,
displacement: 200,
strokeWidth: 4,
triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () { 
          return controller.fetchPostFeed();
         },
        child: Stack(
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
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.9),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white.withOpacity(0.9)),
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
                    'post_story'.tr,
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                  ),
                  SizedBox(width: 205,),
                  InkWell(
                    onTap: (){
                      _showPopupMenu();
                    },
                    child: Icon(Icons.menu, color: Colors.white,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 10, right: 20),
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 40,
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg")),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            width: 80,
                            child: TextField(
                              
                              // maxLines: 2,
                              controller: controller.contentController,
                              style: TextStyle(
                                  color: Color(0xFF134FAF), fontFamily: "Raleway"),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5)),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "What\'s on your mind?",
                                hintStyle: TextStyle(
                                    color: Color(0xFF134FAF), fontFamily: "Raleway"),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        width: 1.5, color: Color(0xFF134FAF))),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    // thickness: 0.5,
                  ),
                  // SizedBox(height: 10,),
                  Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 55,),
                          InkWell(
                            onTap: (){
                              
                              _onAlertPress();
                              
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                border: Border.all(color: Color(0xffEAF12D), width: 1.5),
                              ),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo_camera_back_rounded,
                                    color: Color(0xffEAF12D),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'photo'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Raleway",
                                        color: Color(0xffEAF12D)),
                                  )
                                ],
                              ),
                            ),
                          ),
      
                          // CircleAvatar(
                          //         backgroundImage: image == null
                          //             ? Image.network(
                          //                     'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
                          //                 .image
                          //             : FileImage(File(image!.path.toString())) as FileImage,
                          //         // backgroundImage: _image == null
                          //         //     ? NetworkImage(
                          //         //         'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
                          //         //     : FileImage(_image),
                          //         radius: 15.0,
                          //       ),
                          SizedBox(
                            width: 120,
                          ),
                          InkWell(
                            onTap: (){
                              // controller.contentController.clear();
                              controller.checkInput(context);
                            }, 
                            child: Container(
                              width: 70,
                              margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Color(0xffEAF12D),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                border: Border.all(color: Colors.grey, width: 1.5),
                              ),
                              child: Center(
                                child: Text(
                                  'post'.tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      color: Color(0xFF134FAF)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // GridView.builder(
                      //   itemCount: controller._imageFileList.toString().length,
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (BuildContext context, int index){
                        
                      //   return Image.file(File(controller._imageFileList!));
                      // })
                    ],
                  ),
                ],
              ),
            ),
      
            // Positioned(
            //   top: 135,
            //   left: 20,
            //   child: Container(
            //     height: 100,
            //     width: MediaQuery.of(context).size.width,
            //     child: Text("dd"),
            //   ),
            // ),
      
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                child: StreamBuilder<List<postFeedModel>>(
                  stream: controller.getFilteredModel(),
                   initialData: [],
                  builder: (context, snapshot){
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
                                return Center(child: Text('some_error'.tr));
                              } else {
                                print("snapshot.data");
                                print(snapshot.data);
      
                  var foodList = snapshot.data;
                  print(foodList);
                  print("foodList");
                return  foodList!.length == 0
                                  ? Container(
                                      child: Center(
                                        child: Text('my_post_didnt'.tr,  style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),
                                      ),
                                    )
                                  : ListView.builder(
                    itemCount: foodList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var food = foodList[index];
                       var count = '${food.likedBy!.isNotEmpty ? food.likedBy!.length : 0}';
                       print("aaaaaaaa: ${count}"); 
      
                       String convertToAgo(DateTime input) {
          Duration diff = DateTime.now().difference(input);
      
          if (diff.inDays >= 1) {
        return '${diff.inDays} day ago';
          } else if (diff.inHours >= 1) {
        return '${diff.inHours} hour ago';
          } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minute ago';
          } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} second ago';
          } else {
        return 'just now';
          }
        }
        DateFormat format = DateFormat("yyyy-MM-dd");
        DateTime time1 = format.parse("${food.time}");
        print(time1);
        // print("${food.customerDetails![0].userAttachements!.length != 0 ? food.customerDetails![0].userAttachements![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}");
                        return InkWell(
                          onTap: (){
                            Navigator.push(  
          context,  
          MaterialPageRoute(builder: (context) => DetailPage(idMatch: "${food.userId}")));
                          },
                          child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.white,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SizedBox(
                              width: 380,
                              height: 500,
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20, right: 20),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: CircleAvatar(
                                                radius: 25,
                                                backgroundImage: NetworkImage(
                                                    "${food.userAttachements!.isNotEmpty ? food.userAttachements![0].url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}")),
                                          // && food.customerDetails![0].userAttachements!.length != 0
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20, right: 15),
                                          child:  Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  // food.attachements![0].attachement_type
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    maxLines: 2, 
                                                    "${food.firstName!.isNotEmpty ? food.firstName : ""} ${food.lastName!.isNotEmpty ? food.lastName : ""}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                                  SizedBox(height: 7,),
                                                Row(
                                                  children: [
                                                    Text(convertToAgo(time1), style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),),
                                                    
                                                    SizedBox(width: 90,),
                                        
                                                  ],
                                                ),
                                                
                                              ],
                                            ),
                                          ),
                                        food.postSaved == 0 ? InkWell(
                                          onTap: (){
                                           controller.addSave(food.id, "${food.userId!.isNotEmpty ? food.userId : ""}", context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 75, right: 10),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                       
                                                        child:  Icon(Icons.bookmark, color: Colors.grey,)
                                                                          
                                                      ),
                                            ),
                                          ),
                                        ) : food.postSaved == 1 ? InkWell(
                                          onTap: (){
                                            
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 75, right: 10),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                       
                                                        child:  Icon(Icons.bookmark, color: Color(0xFF134FAF),)
                                                                          
                                                      ),
                                            ),
                                          ),
                                        ) : Container() 
                                         
                                      ],
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 23, right: 23),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                strutStyle: StrutStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "Raleway"),
                                                text: TextSpan(
                                                    style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Colors.black),
                                                    text: "${food.content != null ? food.content : ""}"),
                                              ),
                              ),
                            ),
                                      
                                  //  Text(convertToAgo(time1), style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: InkWell(
                                      onTap: (){
                                         Dialogs.materialDialog(
                                              color: Colors.white,
                                              context: context,
                                              dialogWidth: kIsWeb ? 0.3 : null,
                                              onClose: (value) => print(
                                                  "returned value is '$value'"),
                                              actions: [
                                                SizedBox(
                                                  height: 300,
                                                  child: Container(
                                                            
                                                            width: double.infinity,
                                                            height: 250.0,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(25.0),
                                                              
                                                              image: DecorationImage(
                                                                image: NetworkImage('${food.attachements != null && food.attachements!.length != 0 ? food.attachements![0].attachement_url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}'),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                              ),
                                                  )]);
      //                                       PopupBanner(
                                          
      //                                         height: 300,
                                          
      //   context: context,
      //   images: [
      //    '${food.attachements!.length != 0 ? food.attachements![0].attachement_url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}'
      //   ],
      //   dotsAlignment: Alignment.bottomCenter,
        
      //   dotsColorActive: Colors.blue,
      //   dotsColorInactive: Colors.grey.withOpacity(0.5),
      //   onClick: (index) {
      //     debugPrint("CLICKED $index");
      //   },
      // ).show();
                                      },
                                      child: Container(
                                                            margin: EdgeInsets.all(10.0),
                                                            width: double.infinity,
                                                            height: 250.0,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(25.0),
                                                              
                                                              image: DecorationImage(
                                                                image: NetworkImage('${food.attachements != null && food.attachements!.length != 0 ? food.attachements![0].attachement_url : "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg"}'),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                              ),
                                    ),
                                  ),
                                          
                        
                                  // Padding(
                                  //   padding: const EdgeInsets.only(bottom: 10),
                                  //   child: Align(
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text("content", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway", ),)),
                                  // ),
                                  
                                //                       Padding(
                                //                         padding: const EdgeInsets.only(bottom: 40),
                                //                         child: Container(
                                //                           decoration: BoxDecoration(
                                //                             borderRadius: BorderRadius.all(Radius.circular(50)),
                                //                           ),
                                //   height: 300,
                                //   width: 320,
                                //   child: Image(image: NetworkImage("${
                                //     food.attachements! == 0 ? Container(child: Center(child: Text("Proposal didn't add any images", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),):
                                //     food.attachements![0].attachement_url }")),
                                //   // child: PageView(
                                    
                                //   //   children: _demo,
                                    
                                //   //   onPageChanged: (index){
                                //   //       setState(() {
                                //   //         pageIndex=index;
                                //   //       });
                                //   //   },
                                //   // ),
                                // ),
                                //                       ),
                                // CarouselIndicator(
                                //   color: Colors.blue,
                                //   activeColor: Colors.black,
                                //   count: _demo.length,
                                //   index: pageIndex,
                                // ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(top:25), 
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Padding(
                                                                  padding: const EdgeInsets.only(left: 25, top:10),
                                                                  child: Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child:Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: (){
                                                                           controller.addLike(food.id, context);
                                                                          },
                                                                          child: Icon(CupertinoIcons.hand_thumbsup_fill, color: Color(0xFF134FAF),)
                                                                        ),
                                                                        SizedBox(width: 5,),
                                                                        Text(count.toString(),style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway",color: Colors.grey ),)
                                                                      // 
                                                                      ],
                                                                    ),
                                                                  ),
                                              ),
                                              SizedBox(width: 140,),
                                              Padding(
                                                                  padding: const EdgeInsets.only(top:10),
                                                                  child:Row(
                                                                    children: [
                                                                      Icon(CupertinoIcons.hand_thumbsup, color: Color(0xFF134FAF),),
                                                                      SizedBox(width: 5,),
                                                                      Text("Liked by ${food.likedBy!.length != 0 ? food.likedBy![0].name : "😔😔😔"}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Raleway",color: Colors.grey ),),
                                                                    // 
                                                                    ],
                                                                  )),
                                              
                                            ],
                                          ),
                                        )
                                  
                                ],
                              ),
                            ),
                          ),
                          
                                            ),
                        );
                      
                     
                    });
                              }
                          }
                  }
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
