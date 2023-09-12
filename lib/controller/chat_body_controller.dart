import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/models/chat_one_chat_model.dart';
import 'package:thirumanam/models/proposal_model.dart';
import 'package:thirumanam/models/send_proposal_model.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/utils/utils.dart';
import '../models/chat_main_model.dart';
import '../models/received_proprosal_model.dart';
import '../views/auth/register_page.dart';
import 'base_controller.dart';

class ChatBodyController extends BaseController{
  String channelId = "";
  TextEditingController msgController = TextEditingController(text: '');
   @override
  void onInit() {
    super.onInit();
    
    // isLoading.value = true;
    fetchChatBody();
    fetchChatOne();
  }
  
List<ChatMainModel> result = [];
var ChatBodyModel = StreamController<List<ChatMainModel>>.broadcast();
  Stream<List<ChatMainModel>> getFilteredModel() => ChatBodyModel.stream;

    fetchChatBody() async {
     final url = Uri.parse("${URL}auth/get-chat-higher-details");
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){

       
  
    }
    ChatBodyModel.add(List<ChatMainModel>.from(
        body["data"].map((x) => ChatMainModel.fromJson(x))));   
}

var ChatoneModel = StreamController<List<ChatOnetoOneModel>>.broadcast();
  Stream<List<ChatOnetoOneModel>> getchatoneModel() => ChatoneModel.stream;

    fetchChatOne() async {
     final url = Uri.parse("${URL}auth/get-detailed-chat-msgs?channel_id=640f0c8f52a1413ed76f7ccf");
    print(url);

    final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
    if(response.statusCode == 200){
       var jsonData = json.decode(response.body);
       
       
  
    }
    ChatoneModel.add(List<ChatOnetoOneModel>.from(
        body["data"].map((x) => ChatOnetoOneModel.fromJson(x))));   
}

chatpost(id, context)async {
    final rejectUrl = Uri.parse("${URL}auth/post-message");
    print(rejectUrl);

    final response = await http.post(
                        Uri.parse(rejectUrl.toString()),
                        headers: <String, String>{
                          'Content-type': 'application/json; charset=UTF-8',
                          'x-access-token':
                              appPreference.accessToken!,
                        },
                        body: jsonEncode(<String, String>{
                          "channel_id": id.toString(),
                          "message_type": "TEXT",
                          "msg": msgController.text,
                          "reaction_type": "ANGRY",
                          "message_status": "DELIVERED",
                        }),
                      );
                      print(response.body);
                      final data = jsonDecode(response.body);
                      if (response.statusCode == 200) {
                        showSuccessSnackBar(data["message"], context);
                         msgController.text = '';
                        fetchChatOne();
                        msgController.clear(); 
                      }else if(response.statusCode == 410){
                        showSnackBar(data["message"], context);
                        
                      }else{
                      Text("Failed");
                      }
                      print(data);
                      
                    }
}