import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/add_like_model.dart';
import 'package:thirumanam/models/my_post_feed_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/post_story_model.dart';
import '../models/saved_feed_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';
import 'package:status_alert/status_alert.dart';

class PostFeedController extends BaseController {
  // List<postAddLikeModel> result = [];
  TextEditingController contentController = TextEditingController(text: '');
  String title = "AnAinfo";
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList = [];
// var allUserModel = postFeedModel().obs;
  TextEditingController imageController = TextEditingController(text: '');
  TextEditingController imageTypeController = TextEditingController(text: '');
  TextEditingController imageFormatController = TextEditingController(text: '');

   @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    // getAllReceiviedProposalAPI();
    fetchPostFeed();
    fetchMyPostFeed();
    fetchSavedPostFeed();
    // fetchaddLike('');
    // acceptProposal("propsal_id");
    // setDummyHomeData();
  }
var NewsFeedPageModel = StreamController<List<postFeedModel>>.broadcast();
  Stream<List<postFeedModel>> getFilteredModel() => NewsFeedPageModel.stream;

fetchPostFeed() async {
    final url = RestApiClient().getPostStory;
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
          // 
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){
     print("MyPostFeedPageModel000");

          }else{
            
            }
    
     NewsFeedPageModel.add(List<postFeedModel>.from(
        body["data"].map((x) => postFeedModel.fromJson(x))));   
    
  }


  var PostSavedPageModel = StreamController<List<SavedpostFeedModel>>.broadcast();
  Stream<List<SavedpostFeedModel>> getSavedPostModel() => PostSavedPageModel.stream;

fetchSavedPostFeed() async {
    final url = RestApiClient().getAllPostStory;
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
          
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){
     
      print("MyPostFeedPageModel111");
          }else{
            
            }
    
     PostSavedPageModel.add(List<SavedpostFeedModel>.from(
        body["data"].map((x) => SavedpostFeedModel.fromJson(x))));   
    
  }

  var MyPostFeedPageModel = StreamController<List<myPostFeedModel>>.broadcast();
  Stream<List<myPostFeedModel>> getMyPostModel() => MyPostFeedPageModel.stream;

  fetchMyPostFeed() async {
    print("MyPostFeedPageModel");
    final url = RestApiClient().myPostStory;
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){
      print("MyPostFeedPageModel"); 
          }
     MyPostFeedPageModel.add(List<myPostFeedModel>.from(
        body["data"].map((x) => myPostFeedModel.fromJson(x))));   
    
  }

  checkInput(context) {
    if(contentController.text.isEmpty){
    showSnackBar("Fill the content", context);
  
  }else{
    PostFeedAPI(context);
    }
  }

  PostFeedAPI(context) async {
    List<Map> carOptionJson = [];
    List<String> urls = appPreference.Email.toString().split(",");
    for (var i = 0; i < urls.length; i++) {
      CarJson carJson = CarJson(urls[i], "IMAGE", "image/png");
  carOptionJson.add(carJson.TojsonData());
    // CarJson carJson = new CarJson(appPreference.Email.toString(), "IMAGE", "image/png");
    // carOptionJson.add(carJson.TojsonData());
    }

    final params = {
      "title": "Harry Potter",
      "content": "one of the best movie",
      "attachements": [
        {
          'attachement_url':
              "https://c4.wallpaperflare.com/wallpaper/808/87/756/son-goku-dragon-ball-ultra-instinct-dragon-ball-super-white-hair-hd-wallpaper-preview.jpg",
          "attachement_type": "IMAGE",
          "attachement_format": ".jpg"
        }
      ]
    };

    final headers = <String, String>{
      "x-access-token":
          appPreference.accessToken!,
      "Content-Type": "application/json",
    };
    print("Verify Otp API Params: ${params}");

    http
        .post(RestApiClient().postStory,
            body: jsonEncode({
              "title": "",
              "content": contentController.text,
              "attachements": carOptionJson
            }),
            headers: headers)
        .then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("Verify Otp Response: ${res.toString()}");
      if (res != null) {
        if (res.isNotEmpty && res["status"] != 410) {
          appPreference.isData = res["data"].toString();
          contentController.clear();
          print(res["data"].toString());
          showSuccessSnackBar("Post feed upload Succesfully", context);
           StatusAlert.show(
      context,
      duration: Duration(seconds: 4),
      title: 'Post Feed',
      subtitle: 'successFully posted',
      configuration: IconConfiguration(icon: Icons.done),
      maxWidth: 260,
      
    );
    fetchPostFeed();
          // Get.toNamed(RouteNames.changePassword);
          
        } else {
          showSnackBar(res["message"].toString(), context);
        }
      }
    });
   
  }
   void selectedImages() async{
    final List<XFile>? selectedImages = (await _picker.pickImage(source: ImageSource.gallery)) as List<XFile>?;
    if(selectedImages!.isNotEmpty){
      print(selectedImages);
    _imageFileList!.addAll(selectedImages);
    
    
    }
    
    print("Image List Length: "+ _imageFileList!.length.toString());
  }

   addLike(id, context) async {
    final addLikeUrl = Uri.parse("${URL}auth/addlike");
    print(addLikeUrl);

    final response = await http.post(
                        Uri.parse(addLikeUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "newFeedId": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                        StatusAlert.show(
      context,
      duration: Duration(seconds: 4),
      title: 'Add Like',
      subtitle: 'you liked the post',
      configuration: IconConfiguration(icon: Icons.done),
      maxWidth: 260,
      
    );
    fetchPostFeed();
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                      showSnackBar(data["message"], context);
                      }
                      
                      
                    }

                    disAddLike(id, context) async {
    final disAddLikeUrl = Uri.parse("${URL}auth/dislike");
    print(disAddLikeUrl);

    final response = await http.post(
                        Uri.parse(disAddLikeUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "newFeedId": id.toString(),
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                        StatusAlert.show(
      context,
      duration: Duration(seconds: 4),
      title: 'Add DisLike',
      subtitle: 'you disliked the post',
      configuration: IconConfiguration(icon: Icons.done),
      maxWidth: 260,
      
    );
    fetchPostFeed();
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                      showSnackBar(data["message"], context);
                      }
                      
                      
                    }

                    addSave(id, idFeed, context) async {
    final addSaveUrl = Uri.parse("${URL}auth/save-post");
    print(addSaveUrl);

    final response = await http.post(
                        Uri.parse(addSaveUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          
                          "newFeedId": id.toString(),
                          "feed_posted_user_obj_id": idFeed.toString()
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                        StatusAlert.show(
      context,
      duration: Duration(seconds: 4),
      title: 'Save post',
      subtitle: 'you saved the post',
      configuration: IconConfiguration(icon: Icons.done),
      maxWidth: 260,
      
    );
    fetchPostFeed();
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                      }else{
                      showSnackBar(data["message"], context);
                      }
                      
                      
                    }

  //                   Future<List<postAddLikeModel>> fetchaddLike(String? query) async {
  //   final url = RestApiClient().getPostStory;
  //   print(url);

  //   final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
  //     "Content-Type": "application/json",
  //     'x-access-token':
  //         appPreference.accessToken!
  //   });

  //   final Map<String, dynamic> body = json.decode(response.body);
  //   if(response.statusCode == 200){
     
  //       result = List<postAddLikeModel>.from(
  //       body["data"].map((x) => postAddLikeModel.fromJson(x)));
        
  //       if(query != null){
  //         result = result.where((element) => element.firstName!.toLowerCase().contains(query.toLowerCase())).toList();
  //         result = result.where((element) => element.lastName!.toLowerCase().contains(query.toLowerCase())).toList();
          
  //         // result = result.where((element) => element.age.toString().contains(query.toString())).toList();
  //       }else{
  //         print("api error");

  //       }
    
  //      return result;
  //     // appPreference.accessToken = body["data"];
        
  //         }else{
  //           
  //         }
         

  //   print(body);
    
  //   // isLoading.value = false;
  //   // return body.map<receiviedProprosalModel>((data) => receiviedProprosalModel.fromJson(data)).toList(); 
  //    return List<postAddLikeModel>.from(
  //       body["data"].map((x) => postAddLikeModel.fromJson(x)));   
    
  // }
}

class CarJson {
  String aUrl, aType, aformat;
  CarJson(this.aUrl, this.aType, this.aformat);
  Map<String, dynamic> TojsonData() {
    var map = new Map<String, dynamic>();
    map["attachement_url"] = aUrl;
    map["attachement_type"] = aType;
    map["attachement_format"] = aformat;
    return map;
  }
}

//   Future<Map<String, dynamic>?> _uploadImage(XFile image) async {
//     setState(() {
//       pr.show();
//     });
//     print(apiUrl);

//     final mimeTypeData =
//         lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');

//     // Intilize the multipart request
//     final imageUploadRequest = http.MultipartRequest('POST', apiUrl);

//     // Attach the file thirumanam the request
//     final file = await http.MultipartFile.fromPath('image', image.path);
//     print(file);
//     // Explicitly pass the extension of the image with request body
//     // Since image_picker has some bugs due which it mixes up
//     // image extension with file name like this filenamejpge
//     // Which creates some problem at the server side to manage
//     // or verify the file extension

// //    imageUploadRequest.fields['ext'] = mimeTypeData[1];

//     imageUploadRequest.files.add(file);
//     print(file);
//     imageUploadRequest.headers['Content-type'] = 'application/json';
//     imageUploadRequest.headers['Accept'] = 'application/json';
//     // imageUploadRequest.headers['authorization'] =
//     //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjMwNzIzYTRiNTkyMGI2ZWQ0YTVjOWY5IiwiaWF0IjoxNjYyMjA1NzYwLCJleHAiOjE2NjIyMjM3NjB9.FrYr-8XxiLwujFERdE4ESE7_N-oTSTKqqhcM4xN_8nM';

//     imageUploadRequest.fields['username'] = username;
//     imageUploadRequest.fields['email'] = email;
//     imageUploadRequest.fields['phoneNumber'] = phoneNumber;
//     imageUploadRequest.fields['password'] = password;
//     imageUploadRequest.fields['houseNo'] = houseNo;
//     imageUploadRequest.fields['streetName'] = streetName;
//     imageUploadRequest.fields['city'] = city;
//     imageUploadRequest.fields['landMark'] = landMark;
//     imageUploadRequest.fields['pincode'] = pincode;
//     imageUploadRequest.fields['bikeNumber'] = bikeNumber;
//     imageUploadRequest.fields['bikeName'] = bikeName;
//     imageUploadRequest.fields['image'] = image.toString();

//     try {
//       final streamedResponse = await imageUploadRequest.send();
//       final response = await http.Response.fromStream(streamedResponse);
//       if (response.statusCode != 200) {
//         return null;
//       }
//       print(imageUploadRequest);
//       print(streamedResponse);
//       print(response.body);
//       final Map<String, dynamic> responseData = json.decode(response.body);
//       _resetState();
//       return responseData;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }


  



 