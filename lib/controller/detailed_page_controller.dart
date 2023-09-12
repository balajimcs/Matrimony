import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:status_alert/status_alert.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/post_story_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class DetailedController extends BaseController {
  TextEditingController contentController = TextEditingController(text: '');
  final wishcontroller = Get.find<WishListController>();
  String title = "AnAinfo";
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList = [];
// var allUserModel = postFeedModel().obs;
  TextEditingController imageController = TextEditingController(text: '');
  TextEditingController imageTypeController = TextEditingController(text: '');
  TextEditingController imageFormatController = TextEditingController(text: '');


  var isPhotoValid = false.obs;

  
MakeAsProfileAPI(context, int? order) async {
  final params = {"order": order};
          
  print("MakeAsProfile API Params: ${params}");
   final response = await http.post(
      RestApiClient().MakeAsProfile,
      headers: <String, String>{
        "x-access-token":
          appPreference.accessToken!,
        "Content-Type": "application/json",
        
      },
      body: jsonEncode(params),
    );

    print(response.body);
    Map<String,dynamic> datas = jsonDecode(response.body);

    if (response.statusCode == 200) {
     appPreference.isData = datas["data"].toString();
       
          // Get.toNamed(RouteNames.welcome);
          StatusAlert.show(
      context,
      duration: Duration(seconds: 4),
      title: 'Upload Picture',
      subtitle: 'Upload SuccessFully',
      configuration: IconConfiguration(icon: Icons.done),
      maxWidth: 260,
      
    );
      wishcontroller.fetchMyDetailedPage();
      Navigator.pop(context);
          // Get.toNamed(RouteNames.changePassword);
          // showSuccessSnackBar(datas["message"], context);
      
    } else if (response.statusCode == 410) {
      showSnackBar(datas["message"], context);
      // showSnackBar("Please completed basic details", context);
    } else {
      showSnackBar(datas["message"].toString(), context);
    }

  
}

  checkInput(context) {
    PostFeedAPI(context);
  }

  PostFeedAPI(context) async {
    List<Map> carOptionJson = [];
    List<String> urls = appPreference.Email.toString().split(",");
for (var i = 0; i < urls.length; i++) {
  CarJson carJson = CarJson(urls[i], (appPreference.Order! + 1).toString());
  carOptionJson.add(carJson.TojsonData());
}
    // CarJson carJson = new CarJson(appPreference.Email.toString(), (appPreference.Order! + 1).toString());
    // carOptionJson.add(carJson.TojsonData());

    

    final headers = <String, String>{
      "x-access-token":
          appPreference.accessToken!,
      "Content-Type": "application/json",
    };


    http
        .post(RestApiClient().addPhoto,
            body: jsonEncode({
              "attachments": carOptionJson
            }),
            headers: headers)
        .then((value) {
      Map<String, dynamic> res = jsonDecode(value.body);
      print("Verify Otp Response: ${res.toString()}");
      if (res != null) {
        if (res.isNotEmpty && res["status"] != 410) {
          appPreference.isData = res["data"].toString();
          final lastAttachment = res["data"]["attachments"].last;
          appPreference.Order = lastAttachment["order"] ?? 0;

          isPhotoValid.value = true;
          print("appPreference.Order");
          print(appPreference.Order);
          print(res["data"].toString());
           StatusAlert.show(
      context,
      duration: Duration(seconds: 4),
      title: 'Upload Picture',
      subtitle: 'Upload SuccessFully',
      configuration: IconConfiguration(icon: Icons.done),
      maxWidth: 260,
      
    );
      wishcontroller.fetchMyDetailedPage();
          // Get.toNamed(RouteNames.changePassword);
          showSuccessSnackBar(res["message"], context);
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
}

class CarJson {
  String aUrl, aOrder;
  CarJson(this.aUrl, this.aOrder);
  Map<String, dynamic> TojsonData() {
    var map = new Map<String, dynamic>();
    map["url"] = aUrl;
    map["order"] = aOrder;
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



 