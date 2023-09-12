import 'dart:convert';
import 'dart:io';
import 'package:age_calculator/age_calculator.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:multiselect/multiselect.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thirumanam/controller/address_register_controller.dart';
import 'package:thirumanam/controller/carrier_deatils_controller.dart';
import 'package:thirumanam/controller/dashboard_controller.dart';
import 'package:thirumanam/controller/detailed_page_controller.dart';
import 'package:thirumanam/controller/dropdown_controller.dart';
import 'package:thirumanam/controller/family_details_controller.dart';
import 'package:thirumanam/controller/update_controllers/carrier_update.dart';
import 'package:thirumanam/controller/update_controllers/jathagam_update.dart';
import 'package:thirumanam/controller/update_controllers/personal_update.dart';
import 'package:thirumanam/controller/wishlist_controller.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/preferences/app_preference.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/constants.dart';
import 'package:thirumanam/views/auth/country4.dart';
import 'package:thirumanam/views/profile/commons/my_info.dart';
import 'package:thirumanam/views/profile/commons/opaque_image.dart';
import 'package:thirumanam/views/profile/commons/profile2.dart';
import 'package:thirumanam/views/profile/commons/profile_info_card.dart';
import 'package:thirumanam/views/profile/commons/radial_progress.dart';
import 'package:thirumanam/views/profile/commons/rounded_image.dart';
import 'package:thirumanam/views/profile/styleguide/text_style.dart';

import '../../controller/communication_register.dart';
import '../../controller/jathagam_details_controller.dart';
import '../../controller/personal_details_controller.dart';
import '../../controller/stepper_register_controller.dart';
import '../../controller/update_controllers/address_update.dart';
import '../../controller/update_controllers/communication_update.dart';
import '../../controller/update_controllers/family_update.dart';
import '../../controller/update_controllers/horoscopic_controller.dart';
import '../../controller/update_controllers/permement_address_update.dart';
import '../../models/admin_data_model.dart';
import '../../models/all_users_model.dart';
import '../../utils/api_config.dart';
import '../auth/country1.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  State<ProfileEditPage> createState() => ProfileEditPageState();
}

class ProfileEditPageState extends State<ProfileEditPage> {
  final AppPreference appPreference = Get.find();
  final detailed = Get.find<DetailedController>();
  final dashBoard = Get.find<DashboardController>();
  final wishcontroller = Get.find<WishListController>();
  final newfilter = Get.find<DropDownController>();
  final _formKey = GlobalKey<FormState>();
  var imageUrl;
  var attachemnts;
  double stepper = 0.0;
  var urlCount;
  
  List<File>? Image1 = [];
  // List<File>? Image2 = [];
  File? Image2;
  // File Image2 = File("path/to/image");
  PickedFile? _pickedFile;
   String? message = "";

    @override
  void initState() {
    frameFilterData();
    stepper = 0.0;
    urlCount = 1;
    wishcontroller.profileattachemnts.value;
    controller3.name.toString();
    attachemnts = "https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg";
    super.initState();
  }

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
    var _pickedFile = await imagePicker.pickMultiImage();
    if (_pickedFile != null) {
  // for (var i = 0; i < _pickedFile.length; i++) {
    Image1 = _pickedFile.map((image) => File(image.path)).cast<File>().toList();
    // Image1 = File(_pickedFile[i].path) as List<File>?;
    // Use the selected image here
  // }
    }
    // Image1 = File(_pickedFile!.path);
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
         detailed.checkInput(context);
          
          
    
          wishcontroller.fetchWishListProposal();
          wishcontroller.fetchMyDetailedPage();
        });
        Navigator.pop(context);
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
         detailed.checkInput(context);
          
          
    
          wishcontroller.fetchWishListProposal();
          wishcontroller.fetchMyDetailedPage();
        });
        Navigator.pop(context);
        print("balaji");
      } else {
        print("object1");
      }
    }
  }

  var load = false.obs;
  
  final GlobalKey<ExpansionTileCardState> card1 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card2 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card3 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card4 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card5 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card6 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card7 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card8 = new GlobalKey();

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor:
            toast == "Login Sucessfull" ? Colors.green : Colors.red,
        textColor: Colors.white);
  }

  final controller = Get.find<CommunicationUpdateController>();
  final controller1 = Get.find<AddressUpdateController>();
  final controller2 = Get.find<PermenentAddressUpdateController>();
  final controller3 = Get.find<PersonalUpdateController>();
  final controller4 = Get.find<CarrierUpdateController>();
  final controller5 = Get.find<JathagamUpdateController>();
  final controller6 = Get.find<FamilyUpdateController>();
  final controller7 = Get.find<HoroScopicController>();



    Future<Map<String, dynamic>> fetchMyDetailedPage() async {
     final url = Uri.parse("${URL}auth/myOwnProfile");
    print(url);

    final response =
        await http.get(Uri.parse(url.toString()), headers: <String, String>{
      "Content-Type": "application/json",
      'x-access-token':
          appPreference.accessToken!
    });

    final Map<String, dynamic> body = json.decode(response.body);
     
    if(response.statusCode == 200){
      
       
      
      // int index = 0;
      // var caste = newfilter.filterCatList.value[2].filterOptions!.where((element) => element.options == body["data"]["customerDetails"]["religion_community"]["religion"],).toList();
      // print("Religion: ${caste.length}");
      // // if(caste.length > 0){
      // //   index = newfilter.filterCatList.value[3].filterOptions!.indexOf(caste.first);
      // //   newfilter.filterCatList.value[3].filterOptions![index].isSelected = true;
      // //   newfilter.filterCatList.refresh;
      // //
      // // }

      // // appPreference.accessToken = body["data"];
        print("balaji");
          }
    print(body);

     return body;
}
  var filterCatList = <FilterData>[].obs;
  AdminDataModel adminDataModel = AdminDataModel();

  frameFilterData() async{



    load.value = true;

    http.get(
        RestApiClient().adminData,
        ).then((value) async {
      print("Admin Data Response: ${value.body}");
      final res = jsonDecode(value.body);
      if (res["success"] == 1) {
        Future.delayed(const Duration(milliseconds: 500), () {
          adminDataModel = AdminDataModel.fromJson(res);

          var pickcountry1 = adminDataModel.data?.where((element) => element.categoryName == "RELIGION").first.subCat?.asMap().forEach((index, element1) {
            var pickcountry1 = element1.subCategoryName;
          });

          FilterData model1 = FilterData(
              category: "Looking For",
              catId: 1,
              isCatSel: false,
              filterOptions: [
                FilterOptions(
                    options: "Bride",
                    optionId: 2,
                    isSelected: false
                ),
                FilterOptions(
                    options: "Groom",
                    optionId: 3,
                    isSelected: false
                ),
              ]
          );
          filterCatList.value.add(model1);
          FilterData model2 = FilterData(
              category: "Age",
              catId: 2,
              isCatSel: false,
              filterOptions: [
                for(int i= 18; i < 60; i++)
                  FilterOptions(
                      options: "${i}",
                      optionId: i-14,
                      isSelected: false
                  ),
              ]
          );
          filterCatList.value.add(model2);
          FilterData model3 = FilterData(
              category: "Religion",
              catId: 3,
              isCatSel: false);
          List<FilterOptions> filterOption = [];
          adminDataModel.data?.where((element) => element.categoryName == "RELIGION").first.subCat?.asMap().forEach((index, element1) {
            filterOption.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model3.filterOptions = filterOption;
          filterCatList.value.add(model3);

          FilterData model4 = FilterData(
              category: "Caste",
              catId: 4,
              isCatSel: false);
          List<FilterOptions> filterOption1 = [];

          adminDataModel.data?.where((element) => element.categoryName == "CASTE").first.subCat?.asMap().forEach((index, element1) {
            filterOption1.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model4.filterOptions = filterOption1;
          filterCatList.value.add(model4);
          FilterData model5 = FilterData(
              category: "Community",
              catId: 5,
              isCatSel: false);
          List<FilterOptions> filterOption2 = [];
          adminDataModel.data?.where((element) => element.categoryName == "COMMUNITY").first.subCat?.asMap().forEach((index, element1) {
            filterOption2.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model5.filterOptions = filterOption2;
          filterCatList.value.add(model5);

          FilterData model6 = FilterData(
              category: "Marital Status",
              catId: 6,
              isCatSel: false,
              filterOptions: [
                FilterOptions(
                    options: "Single",
                    optionId: 1,
                    isSelected: false
                ),
                FilterOptions(
                    options: "Married",
                    optionId: 2,
                    isSelected: false
                ),
                FilterOptions(
                    options: "Widowed",
                    optionId: 3,
                    isSelected: false
                ),
                FilterOptions(
                    options: "Divorced",
                    optionId: 4,
                    isSelected: false
                ),
                FilterOptions(
                    options: "Separated",
                    optionId: 5,
                    isSelected: false
                ),
              ]
          );
          filterCatList.value.add(model6);

          FilterData model7 = FilterData(
              category: "MotherTongue",
              catId: 7,
              isCatSel: false);
          List<FilterOptions> filterOption3 = [];
          adminDataModel.data?.where((element) => element.categoryName == "MOTHERTONGUE").first.subCat?.asMap().forEach((index, element1) {
            filterOption3.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model7.filterOptions = filterOption3;
          filterCatList.value.add(model7);

          FilterData model8 = FilterData(
              category: "Gender",
              catId: 8,
              isCatSel: false);
          List<FilterOptions> filterOption4 = [];
          adminDataModel.data?.where((element) => element.categoryName == "GENDER").first.subCat?.asMap().forEach((index, element1) {
            filterOption4.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model8.filterOptions = filterOption4;
          filterCatList.value.add(model8);

          FilterData model9 = FilterData(
              category: "Skintone",
              catId: 9,
              isCatSel: false);
          List<FilterOptions> filterOption5 = [];
          adminDataModel.data?.where((element) => element.categoryName == "SKINTONE").first.subCat?.asMap().forEach((index, element1) {
            filterOption5.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model9.filterOptions = filterOption5;
          filterCatList.value.add(model9);

          FilterData model10 = FilterData(
              category: "Diet",
              catId: 10,
              isCatSel: false);
          List<FilterOptions> filterOption6 = [];
          adminDataModel.data?.where((element) => element.categoryName == "DIET").first.subCat?.asMap().forEach((index, element1) {
            filterOption6.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model10.filterOptions = filterOption6;
          filterCatList.value.add(model10);

          FilterData model11 = FilterData(
              category: "Education",
              catId: 11,
              isCatSel: false);
          List<FilterOptions> filterOption7 = [];
          adminDataModel.data?.where((element) => element.categoryName == "EDUCATION").first.subCat?.asMap().forEach((index, element1) {
            filterOption7.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model11.filterOptions = filterOption7;
          filterCatList.value.add(model11);

          FilterData model12 = FilterData(
              category: "Rasi",
              catId: 12,
              isCatSel: false);
          List<FilterOptions> filterOption8 = [];
          adminDataModel.data?.where((element) => element.categoryName == "RASI").first.subCat?.asMap().forEach((index, element1) {
            filterOption8.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model12.filterOptions = filterOption8;
          filterCatList.value.add(model12);

          FilterData model13 = FilterData(
              category: "Laknam",
              catId: 13,
              isCatSel: false);
          List<FilterOptions> filterOption9 = [];
          adminDataModel.data?.where((element) => element.categoryName == "LAKNAM").first.subCat?.asMap().forEach((index, element1) {
            filterOption9.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model13.filterOptions = filterOption9;
          filterCatList.value.add(model13);

          FilterData model14 = FilterData(
              category: "Natchathiram",
              catId: 14,
              isCatSel: false);
          List<FilterOptions> filterOption10 = [];
          adminDataModel.data?.where((element) => element.categoryName == "NATCHATHIRAM").first.subCat?.asMap().forEach((index, element1) {
            filterOption10.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model14.filterOptions = filterOption10;
          filterCatList.value.add(model14);

          FilterData model15 = FilterData(
              category: "Subcaste",
              catId: 15,
              isCatSel: false);
          List<FilterOptions> filterOption11 = [];
          adminDataModel.data?.where((element) => element.categoryName == "RELIGION").first.subCat?.asMap().forEach((index, element1) {
            filterOption11.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model15.filterOptions = filterOption11;
          filterCatList.value.add(model15);

          FilterData model16 = FilterData(
              category: "ResidentStatus",
              catId: 16,
              isCatSel: false);
          List<FilterOptions> filterOption12 = [];
          adminDataModel.data?.where((element) => element.categoryName == "RESIDENTSTATUS").first.subCat?.asMap().forEach((index, element1) {
            filterOption12.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model16.filterOptions = filterOption12;
          filterCatList.value.add(model16);

          FilterData model17 = FilterData(
              category: "Profile For",
              catId: 17,
              isCatSel: false);
          List<FilterOptions> filterOption13 = [];
          adminDataModel.data?.where((element) => element.categoryName == "PROFILE_FOR").first.subCat?.asMap().forEach((index, element1) {
            filterOption13.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model17.filterOptions = filterOption13;
          filterCatList.value.add(model17);


          FilterData model18 = FilterData(
              category: "Working In",
              catId: 18,
              isCatSel: false);
          List<FilterOptions> filterOption14 = [];
          adminDataModel.data?.where((element) => element.categoryName == "WORKINGIN").first.subCat?.asMap().forEach((index, element1) {
            filterOption14.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model18.filterOptions = filterOption14;
          filterCatList.value.add(model18);

          FilterData model19 = FilterData(
              category: "Education",
              catId: 19,
              isCatSel: false);
          List<FilterOptions> filterOption15 = [];
          adminDataModel.data?.where((element) => element.categoryName == "EDUCATION").first.subCat?.asMap().forEach((index, element1) {
            filterOption15.add(
              FilterOptions(
                  options: element1.subCategoryName,
                  optionId: index,
                  isSelected: false
              ),);
          });
          model19.filterOptions = filterOption15;
          filterCatList.value.add(model19);

          FilterData model20 = FilterData(
            category: "Drinking",
            catId: 20,
            isCatSel: false);
        List<FilterOptions> filterOption16 = [];
        adminDataModel.data?.where((element) => element.categoryName == "DRINKING").first.subCat?.asMap().forEach((index, element1) {
          filterOption16.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model20.filterOptions = filterOption16;
        filterCatList.value.add(model20);

         FilterData model21 = FilterData(
            category: "Smoking",
            catId: 21,
            isCatSel: false);
        List<FilterOptions> filterOption17 = [];
        adminDataModel.data?.where((element) => element.categoryName == "SMOKING").first.subCat?.asMap().forEach((index, element1) {
          filterOption17.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model21.filterOptions = filterOption17;
        filterCatList.value.add(model21);

         FilterData model22 = FilterData(
            category: "Physical Status",
            catId: 22,
            isCatSel: false);
        List<FilterOptions> filterOption18 = [];
        adminDataModel.data?.where((element) => element.categoryName == "PHYSICAL_STATUS").first.subCat?.asMap().forEach((index, element1) {
          filterOption18.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model22.filterOptions = filterOption18;
        filterCatList.value.add(model22);

         FilterData model23 = FilterData(
            category: "a",
            catId: 23,
            isCatSel: false);
        List<FilterOptions> filterOption19 = [];
        adminDataModel.data?.where((element) => element.categoryName == "A").first.subCat?.asMap().forEach((index, element1) {
          filterOption19.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model23.filterOptions = filterOption19;
        filterCatList.value.add(model23);
        
        FilterData model24 = FilterData(
            category: "occupation",
            catId: 24,
            isCatSel: false);
        List<FilterOptions> filterOption20 = [];
        adminDataModel.data?.where((element) => element.categoryName == "OCCUPATION").first.subCat?.asMap().forEach((index, element1) {
          filterOption20.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model24.filterOptions = filterOption20;
        filterCatList.value.add(model24);

        });
      }

      final url = Uri.parse("${URL}auth/myprofile");
      print(url);

      final response = await http.get(Uri.parse(url.toString()), headers: <String, String>{
        "Content-Type": "application/json",
        'x-access-token':
        appPreference.accessToken!
      });

      product = json.decode(response.body);
      print(product);
      if(response.statusCode == 200){
         Future.delayed(const Duration(milliseconds: 500), () {
          // controller2.nationality = "${product['data']['customerDetails']["communication_detials"]["nationality"] ?? ""}";
          // controller1.nationality = "${product['data']['customerDetails']["communication_detials"]["nationality"] ?? ""}";
          // controller2.currentNationality = "${product['data']['customerDetails']["communication_detials"]["current_nationality"] ?? ""}";
          // controller1.currentNationality = "${product['data']['customerDetails']["communication_detials"]["current_nationality"] ?? ""}";
          // controller3.physicalStatus = "${product['data']['customerDetails']["personal_details"]["physical_status"] ?? ""}";
          // controller5.dosham = "${product['data']['customerDetails']["jathagam_details"]["dosham"] ?? ""}";
      
      // print(controller2.nationality);
      controller.SubCasteController.text = "${product['data']['customerDetails']["religion_community"]["sub_caste"] ?? ""}";
      print(controller.SubCasteController.text);
        
      controller1.DoorNoController.text = "${product['data']['customerDetails']["communication_detials"]["door_no"] ?? ""}";
      print(controller1.DoorNoController.text);
      controller1.StreetController.text = "${product['data']['customerDetails']["communication_detials"]["street"] ?? ""}";
      controller1.AreaController.text = "${product['data']['customerDetails']["communication_detials"]["area"] ?? ""}";
      controller1.CountryController.text = "${product['data']['customerDetails']["communication_detials"]["country"] ?? ""}";
      controller1.StateController.text = "${product['data']['customerDetails']["communication_detials"]["state"] ?? ""}";
      controller1.DistrictController.text = "${product['data']['customerDetails']["communication_detials"]["district"] ?? ""}";
      controller1.CityController.text = "${product['data']['customerDetails']["communication_detials"]["city"] ?? ""}";
      // //
      controller2.DoorNoController.text = "${product['data']['customerDetails']["permanent_address"]["door_no"] ?? ""}";
      controller2.StreetController.text = "${product['data']['customerDetails']["permanent_address"]["street"] ?? ""}";
      controller2.AreaController.text = "${product['data']['customerDetails']["permanent_address"]["area"] ?? ""}";
      controller2.CountryController.text = "${product['data']['customerDetails']["permanent_address"]["country"] ?? ""}";
      controller2.StateController.text = "${product['data']['customerDetails']["permanent_address"]["state"] ?? ""}";
      controller2.DistrictController.text = "${product['data']['customerDetails']["permanent_address"]["district"] ?? ""}";
      controller2.CityController.text = "${product['data']['customerDetails']["permanent_address"]["city"] ?? ""}";
      
      // // 
      
      controller3.HeightController.text = "${product['data']['customerDetails']["personal_details"]["height"] ?? ""}";
      controller3.WieghtController.text = "${product['data']['customerDetails']["personal_details"]["weight"] ?? ""}";
      controller3.HobbiesController.text = "${product['data']['customerDetails']["personal_details"]["hobbies"] ?? ""}";
      controller3.NoChildController.text = "${product['data']['customerDetails']["personal_details"]["no_of_children"] ?? ""}";
      controller3.FirstNameController.text = "${product['data']['customerDetails']["personal_details"]["first_name"] ?? ""}";
      controller3.LastNameController.text = "${product['data']['customerDetails']["personal_details"]["last_name"] ?? ""}";
      controller3.NickNameController.text = "${product['data']['customerDetails']["personal_details"]["nick_name"] ?? ""}";
      controller3.DobController.text = "${product['data']['customerDetails']["personal_details"]["DOB"] ?? ""}";
      controller3.physicalStatusController.text = "${product['data']['customerDetails']["personal_details"]["physical_status_details"] ?? ""}";
      controller3.livingDetailsController.text = "${product['data']['customerDetails']["personal_details"]["no_of_children_living_with_you"] ?? ""}";
      controller3.otherLanguagesController.text = "${product['data']['customerDetails']["personal_details"]["other_languages"] ?? ""}";
      // 
     
      // 
      controller4.educationDetailsController.text = "${product['data']['customerDetails']["carrier_and_working_details"]["educational_details"] ?? ""}";
      controller4.WorkingDetailsController.text = "${product['data']['customerDetails']["carrier_and_working_details"]["working_details"] ?? ""}";
      // controller4.WorkingInController.text = "${product['data']['customerDetails']["carrier_and_working_details"]["working_in"] ?? ""}";
      controller4.WorkingAsController.text = "${product['data']['customerDetails']["carrier_and_working_details"]["working_as"] ?? ""}";
      controller4.CompanyController.text = "${product['data']['customerDetails']["carrier_and_working_details"]["company_details"] ?? ""}";
      controller4.IncomeController.text = "${product['data']['customerDetails']["carrier_and_working_details"]["annual_income"] ?? ""}";
      // 
      controller5.GothramController.text = "${product['data']['customerDetails']["jathagam_details"]["gothram"] ?? ""}";
      controller5.KuladeivamController.text = "${product['data']['customerDetails']["jathagam_details"]["kuladeivam"] ?? ""}";
      controller5.DoshamDetailsController.text = "${product['data']['customerDetails']["jathagam_details"]["dosham_details"] ?? ""}";
      controller5.PlaceCountryController.text = "${product['data']['customerDetails']["jathagam_details"]["place_of_birth_country"] ?? ""}";
      controller5.PlaceStateController.text = "${product['data']['customerDetails']["jathagam_details"]["place_of_birth_state"] ?? ""}";
      controller5.PlaceCityController.text = "${product['data']['customerDetails']["jathagam_details"]["place_of_birth_city"] ?? ""}";
      controller5.TimeController.text = "${product['data']['customerDetails']["jathagam_details"]["time_of_birth"] ?? ""}";
      // 
      controller6.FatherNameController.text = "${product['data']['customerDetails']["family_details"]["father_name"] ?? ""}";
      controller6.FatherOccupationController.text = "${product['data']['customerDetails']["family_details"]["father_occupation"] ?? ""}";
      controller6.MotherNameController.text = "${product['data']['customerDetails']["family_details"]["mother_name"] ?? ""}";
      controller6.MotherOccupationController.text = "${product['data']['customerDetails']["family_details"]["mother_occupation"] ?? ""}";
      controller6.NoBroController.text = "${product['data']['customerDetails']["family_details"]["no_of_bro"] ?? ""}";
      controller6.BroMarryController.text = "${product['data']['customerDetails']["family_details"]["no_of_bro_married"] ?? ""}";
      controller6.NoSisController.text = "${product['data']['customerDetails']["family_details"]["no_of_sis"] ?? ""}";
      controller6.SisMarryController.text = "${product['data']['customerDetails']["family_details"]["no_of_sis_married"] ?? ""}";
      controller6.OwnVechileController.text = "${product['data']['customerDetails']["family_details"]["own_vehicle"] ?? ""}";
      controller6.OwnHouseController.text = "${product['data']['customerDetails']["family_details"]["own_house"] ?? ""}";
      controller6.OwnFlatsController.text = "${product['data']['customerDetails']["family_details"]["own_flats"] ?? ""}";
      controller6.OwnlandsController.text = "${product['data']['customerDetails']["family_details"]["own_lands"] ?? ""}";
      controller6.ExpectationController.text = "${product['data']['customerDetails']["family_details"]["expectation"] ?? ""}";
      controller6.AboutController.text = "${product['data']['customerDetails']["family_details"]["about_me"] ?? ""}";
      controller6.AboutFamilyController.text = "${product['data']['customerDetails']["family_details"]["about_family"] ?? ""}";
      // 
      controller7.Rselected = ["${product['data']['customerDetails']["horoscope"]["rasi"]["A"].join("\n" + " ") ?? []}"];
      controller7.Rselected1 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["B"].join("\n" + " ") ?? []}"];
      controller7.Rselected2 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["C"].join("\n" + " ") ?? []}"];
      controller7.Rselected3 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["D"].join("\n" + " ") ?? []}"];
      controller7.Rselected4 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["E"].join("\n" + " ") ?? []}"];
      controller7.Rselected5 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["F"].join("\n" + " ") ?? []}"];
      controller7.Rselected6 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["G"].join("\n" + " ") ?? []}"];
      controller7.Rselected7 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["H"].join("\n" + " ") ?? []}"];
      controller7.Rselected8 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["I"].join("\n" + " ") ?? []}"];
      controller7.Rselected9 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["J"].join("\n" + " ") ?? []}"];
      controller7.Rselected10 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["K"].join("\n" + " ") ?? []}"];
      controller7.Rselected11 = ["${product['data']['customerDetails']["horoscope"]["rasi"]["K"].join("\n" + " ") ?? []}"];
      // 
      controller7.Aselected = ["${product['data']['customerDetails']["horoscope"]["second"]["A"].join("\n" + " ") ?? []}"];
      controller7.Aselected1 = ["${product['data']['customerDetails']["horoscope"]["second"]["B"].join("\n" + " ") ?? []}"];
      controller7.Aselected2 = ["${product['data']['customerDetails']["horoscope"]["second"]["C"].join("\n" + " ") ?? []}"];
      controller7.Aselected3 = ["${product['data']['customerDetails']["horoscope"]["second"]["D"].join("\n" + " ") ?? []}"];
      controller7.Aselected4 = ["${product['data']['customerDetails']["horoscope"]["second"]["E"].join("\n" + " ") ?? []}"];
      controller7.Aselected5 = ["${product['data']['customerDetails']["horoscope"]["second"]["F"].join("\n" + " ") ?? []}"];
      controller7.Aselected6 = ["${product['data']['customerDetails']["horoscope"]["second"]["G"].join("\n" + " ") ?? []}"];
      controller7.Aselected7 = ["${product['data']['customerDetails']["horoscope"]["second"]["H"].join("\n" + " ") ?? []}"];
      controller7.Aselected8 = ["${product['data']['customerDetails']["horoscope"]["second"]["I"].join("\n" + " ") ?? []}"];
      controller7.Aselected9 = ["${product['data']['customerDetails']["horoscope"]["second"]["J"].join("\n" + " ") ?? []}"];
      controller7.Aselected10 = ["${product['data']['customerDetails']["horoscope"]["second"]["K"].join("\n" + " ") ?? []}"];
      controller7.Aselected11 = ["${product['data']['customerDetails']["horoscope"]["second"]["K"].join("\n" + " ") ?? []}"];
      
      print(controller7.Rselected);
      
      
      

        int index = 0;
        var religion = newfilter.filterCatList.value[2].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["religion_community"]["religion"],).toList();

        if(religion.length > 0){
          print("Religion: ${religion.first.options}");
          index = newfilter.filterCatList.value[2].filterOptions!.indexOf(religion.first);
          newfilter.filterCatList.value[2].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[2].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var caste = newfilter.filterCatList.value[3].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["religion_community"]["caste"],).toList();

        if(caste.length > 0){
          print("caste: ${caste.first.options}");
          index = newfilter.filterCatList.value[3].filterOptions!.indexOf(caste.first);
          newfilter.filterCatList.value[3].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[3].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var community = newfilter.filterCatList.value[4].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["religion_community"]["community"],).toList();

        if(community.length > 0){
          print("community: ${community.first.options}");
          index = newfilter.filterCatList.value[4].filterOptions!.indexOf(community.first);
          newfilter.filterCatList.value[4].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[4].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var mother = newfilter.filterCatList.value[6].filterOptions!.where((element) => element.options.toString().toLowerCase() == product["data"]["customerDetails"]["religion_community"]["mother_tongue"].toString().toLowerCase(),).toList();

        if(mother.length > 0){
          print("mother_tongue: ${mother.first.options}");
          index = newfilter.filterCatList.value[6].filterOptions!.indexOf(mother.first);
          newfilter.filterCatList.value[6].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[6].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }
         var subCaste = newfilter.filterCatList.value[14].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["religion_community"]["sub_caste"],).toList();

        if(subCaste.length > 0){
          print("Subcaste: ${subCaste.first.options}");
          index = newfilter.filterCatList.value[14].filterOptions!.indexOf(subCaste.first);
          newfilter.filterCatList.value[14].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[14].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

         var residentStatus = newfilter.filterCatList.value[15].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["permanent_address"]["resident_status"],).toList();

        if(residentStatus.length > 0){
          print("residentStatus: ${residentStatus.first.options}");
          index = newfilter.filterCatList.value[15].filterOptions!.indexOf(residentStatus.first);
          newfilter.filterCatList.value[15].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[15].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

         var skinTone = newfilter.filterCatList.value[8].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["skin_tone"],).toList();

        if(skinTone.length > 0){
          print("skinTone: ${skinTone.first.options}");
          index = newfilter.filterCatList.value[8].filterOptions!.indexOf(skinTone.first);
          newfilter.filterCatList.value[8].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[8].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var diet = newfilter.filterCatList.value[9].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["diet"],).toList();

        if(diet.length > 0){
          print("diet: ${diet.first.options}");
          index = newfilter.filterCatList.value[9].filterOptions!.indexOf(diet.first);
          newfilter.filterCatList.value[9].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[9].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var maritalStatus = newfilter.filterCatList.value[5].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["marital_details"],).toList();

        if(maritalStatus.length > 0){
          print("maritalStatus: ${maritalStatus.first.options}");
          index = newfilter.filterCatList.value[5].filterOptions!.indexOf(maritalStatus.first);
          newfilter.filterCatList.value[5].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[5].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var drinking = newfilter.filterCatList.value[19].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["drinking"],).toList();

        if(drinking.length > 0){
          print("drinking: ${drinking.first.options}");
          index = newfilter.filterCatList.value[19].filterOptions!.indexOf(drinking.first);
          newfilter.filterCatList.value[19].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[19].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var smoking = newfilter.filterCatList.value[20].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["smoking"],).toList();

        if(smoking.length > 0){
          print("smoking: ${smoking.first.options}");
          index = newfilter.filterCatList.value[20].filterOptions!.indexOf(smoking.first);
          newfilter.filterCatList.value[20].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[20].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var physicalStatus = newfilter.filterCatList.value[21].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["physical_status"],).toList();

        if(physicalStatus.length > 0){
          print("physicalStatus: ${physicalStatus.first.options}");
          index = newfilter.filterCatList.value[21].filterOptions!.indexOf(physicalStatus.first);
          newfilter.filterCatList.value[21].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[21].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

         var gender = newfilter.filterCatList.value[7].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["gender"],).toList();

        if(gender.length > 0){
          print("gender: ${gender.first.options}");
          index = newfilter.filterCatList.value[7].filterOptions!.indexOf(gender.first);
          newfilter.filterCatList.value[7].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[7].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

         var age = newfilter.filterCatList.value[1].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["personal_details"]["age"],).toList();

        if(age.length > 0){
          print("age: ${age.first.options}");
          index = newfilter.filterCatList.value[1].filterOptions!.indexOf(age.first);
          newfilter.filterCatList.value[1].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[1].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var education = newfilter.filterCatList.value[10].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["carrier_and_working_details"]["educational_qualification"],).toList();

        if(education.length > 0){
          print("education: ${education.first.options}");
          index = newfilter.filterCatList.value[10].filterOptions!.indexOf(education.first);
          newfilter.filterCatList.value[10].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[10].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var rasi = newfilter.filterCatList.value[11].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["jathagam_details"]["rasi"],).toList();

        if(rasi.length > 0){
          print("rasi: ${rasi.first.options}");
          index = newfilter.filterCatList.value[11].filterOptions!.indexOf(rasi.first);
          newfilter.filterCatList.value[11].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[11].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var natchathiram = newfilter.filterCatList.value[13].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["jathagam_details"]["natchathiram"],).toList();

        if(natchathiram.length > 0){
          print("natchathiram: ${natchathiram.first.options}");
          index = newfilter.filterCatList.value[13].filterOptions!.indexOf(natchathiram.first);
          newfilter.filterCatList.value[13].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[13].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var laknam = newfilter.filterCatList.value[12].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["jathagam_details"]["laknam"],).toList();

        if(laknam.length > 0){
          print("laknam: ${laknam.first.options}");
          index = newfilter.filterCatList.value[12].filterOptions!.indexOf(laknam.first);
          newfilter.filterCatList.value[12].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[12].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var occupation = newfilter.filterCatList.value[23].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["carrier_and_working_details"]["occupation"],).toList();

        if(occupation.length > 0){
          print("occupation: ${occupation.first.options}");
          index = newfilter.filterCatList.value[23].filterOptions!.indexOf(occupation.first);
          newfilter.filterCatList.value[23].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[23].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        var workingIn = newfilter.filterCatList.value[17].filterOptions!.where((element) => element.options == product["data"]["customerDetails"]["carrier_and_working_details"]["working_in"],).toList();

        if(workingIn.length > 0){
          print("workingIn: ${workingIn.first.options}");
          index = newfilter.filterCatList.value[17].filterOptions!.indexOf(workingIn.first);
          newfilter.filterCatList.value[17].filterOptions![index].isSelected = true;
          // newfilter.filterCatList.refresh;
        }else{
          newfilter.filterCatList.value[17].filterOptions![0].isSelected = true;
          // newfilter.filterCatList.refresh;
        }

        
        //  var doorNo = controller1.DoorNoController.value = product["data"]["customerDetails"]["religion_community"]["mother_tongue"].toString().toLowerCase() as TextEditingValue;
        // appPreference.accessToken = body["data"];
        print("balaji");
      });
      }
      

        });
  
    load.value = false;



  }
    

  @override
  Widget build(BuildContext context) {
   return Obx(() => load.value ? CircularProgressIndicator()
      : _buildProductCard() );
              
    
    // return Obx(() => load.value ? CircularProgressIndicator()
    //   : _buildProductCard() );
  }

   Map<String, dynamic> product = {

   };

    Widget _buildProductCard(){
      var imageqw = attachemnts;
      print(imageqw);
      print("imageqw");
     
      // print("${product != null && product == 0 && product["data"] == null && product["data"]['customerDetails'] == null
      //                                 && product["data"]['customerDetails']["communication_detials"] == null ? "aa" :product["data"]['customerDetails']["personal_details1"]["first_name1"]}");
    //   Future.delayed(const Duration(seconds: 3), () {
       Future.delayed(const Duration(seconds: 3), () {
        
      print('aaaa: ${controller1.DoorNoController.text}');
       });
      
    //   });

      
         
      
       @override
  void dispose() {
    controller1.DoorNoController.dispose();
    super.dispose();
  } 

      final screenHeight = MediaQuery.of(context).size.height;
     return 
       Scaffold(
         body: Stack(
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
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
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
                    onPressed: () {Navigator.pop(context);},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Text(
                    'edit_profile'.tr,
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 20),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                               Dialogs.materialDialog(
                                    msg: 'Upload photo and view photo',
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
                                             Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                setState(() {
                                                _onAlertPress();   
                                                });
                                               
                                              //  Navigator.pop(context);
                                                // controller.checkInput(context);
                                              },
                                              child: Container(
                                                width: 100,
                                                padding:
                                                    EdgeInsets.symmetric(vertical: 10),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(25)),
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color: Colors.grey.shade200,
                                                          offset: Offset(2, 4),
                                                          blurRadius: 5,
                                                          spreadRadius: 2)
                                                    ],
                                                    gradient: LinearGradient(
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                        colors: [
                                                          Color(0xffEAF12D),
                                                          Color(0xffEAF12D)
                                                        ])),
                                                child: Text(
                                                  'add_photo'.tr,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: "Raleway",
                                                      fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 130,
                                                padding:
                                                    EdgeInsets.symmetric(vertical: 10),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(25)),
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color: Colors.grey.shade200,
                                                          offset: Offset(2, 4),
                                                          blurRadius: 5,
                                                          spreadRadius: 2)
                                                    ],
                                                    gradient: LinearGradient(
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                        colors: [
                                                          Color(0xffEAF12D),
                                                          Color(0xffEAF12D)
                                                        ])),
                                                child: Text(
                                                  'remove_photo'.tr,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: "Raleway",
                                                      fontWeight: FontWeight.bold,
                                                  ),    
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                 ),

            SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                                                onTap: () {
                                                  // Navigator.pop(context);
                                                  setState(() {
                                                      Dialogs.materialDialog(
                                  msg: 'selected image for profile picture ',
                                  msgStyle: TextStyle(fontSize: 16, fontFamily: "Raleway"),
                                  // title: "Delete",
                                  color: Colors.white,
                                  context: context,
                                  dialogWidth: kIsWeb ? 0.3 : null,
                                  onClose: (value) =>
                                      print("returned value is '$value'"),
                                  actions: [
                                      Obx(() => wishcontroller.profileValidSelect.value ?
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                             height: 250,
                                              width: double.infinity,
                                            child:  Row(
                                                children: [
                                                  Expanded(
                                                    child: ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                            
                                                      
                                                                                          itemCount: wishcontroller.profileattachemnts1.value.length,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                    var attachment = wishcontroller.profileattachemnts1.value[index];
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: InkWell(
                                                        onTap:(){
                                                          
                                                          setState((){
                                                            detailed.MakeAsProfileAPI(context, attachment['order']);
                                                          });
                                                          
                                                        },
                                                        child:   ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  29),
                                                                      child: Image(
                                                                        image: NetworkImage(
                                                                            attachment['url']),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                            height: 170,
                                                          width: 140,
                                                                        
                                                                      ),
                                                                    ),
                                                          
                                                        
                                                      ),
                                                    );
                                                                                          },
                                                                                        ),
                                                  ),
                                                ],
                                              
                                            ) 
                                          ),
                                        ) : Center(child:  Center(
          child: Container(
              height: 80,
              width: 80,
              alignment: AlignmentDirectional.center,
              child: Lottie.asset(
                "assets/loading/heart.json",
              )),
        ),),
                                      ),

                                    
                                  ]);
                                                  });
                                                 
                                                  // controller.checkInput(context);
                                                },
                                                child: Container(
                                                  width: 200,
                                                  padding:
                                                      EdgeInsets.symmetric(vertical: 10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(25)),
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            color: Colors.grey.shade200,
                                                            offset: Offset(2, 4),
                                                            blurRadius: 5,
                                                            spreadRadius: 2)
                                                      ],
                                                      gradient: LinearGradient(
                                                          begin: Alignment.centerLeft,
                                                          end: Alignment.centerRight,
                                                          colors: [
                                                            Color(0xffEAF12D),
                                                            Color(0xffEAF12D)
                                                          ])),
                                                  child: Text(
                                                    'select_photo'.tr,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "Raleway",
                                                        fontWeight: FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                  ),
                                          ],
                                        ),
                                      ),
                                    ]);
                                print("object");
                              },
                              child: Obx(() => wishcontroller.profileValid.value ? 
                              Obx(() => dashBoard.DetailedPage.value ? Container() :
                              RadialProgress(
                                  width: 4,
                                  goalCompleted: dashBoard.percent.value / 100,
                                  child: ClipOval(
                                    child: Image(image:NetworkImage(wishcontroller.profilePicUrl.value,
                                    
                                      ),
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.fill,
                                      
                                    ),
                                    
                                  ),
                                  
                                )) :
                                Center(child:  Center(
          child: Container(
              height: 80,
              width: 80,
              alignment: AlignmentDirectional.center,
              child: Lottie.asset(
                "assets/loading/heart.json",
              )),
        ),)
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${wishcontroller.name.value} ${wishcontroller.name1.value}',
                                    // "${(product != 0 && product["data"] != null && product['data']['customerDetails'] != null && product['data']['customerDetails']["personal_details"] != null) ?  product['data']['customerDetails']["personal_details"]["full_name"] : ""}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'profile_completed'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Obx(() => dashBoard.DetailedPage.value ? Container() :
                                        Text(
                                          "${dashBoard.percent.value} %",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() => dashBoard.DetailedPage.value ? Container() :
                                  LinearPercentIndicator(
                                    width: 200,
                                    animation: true,
                                    lineHeight: 15.0,
                                    barRadius: Radius.circular(25),
                                    animationDuration: 2500,
                                    percent: dashBoard.percent.value / 100,
                                    center: Text(
                                      "${dashBoard.percent.value}%",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: Color(0xffEAF12D),
                                  ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Profile1InfoCard(
                                  onPressed: (){
                                    Get.toNamed(RouteNames.myPostFeed);
                                  },
                                    firstText: "My", secondText: "Post"),
                                SizedBox(
                                  width: 10,
                                ),
                                ProfileInfoCard(
                                  onPressed: (){
                                    Get.toNamed(RouteNames.myDetails);
                                    print("aa");
                                  },
                                    firstText: "My", secondText: "Details"),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                // ProfileInfoCard(
                                //   onPressed: (){

                                //   },
                                //     firstText: "152", secondText: "Level"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 330),
              child: Container(
                child: ListView(
                  // scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ExpansionTileCard(
                        borderRadius: BorderRadius.all(Radius.circular(20)),

                      key: card1,
                      // expandedTextColor: Colors.red,
                      expandedColor: Colors.white.withOpacity(0.9),
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),

                      title: Text(
                        'Community Details',
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),

                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              children: [
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'religion'.tr,
                                            hintText: 'religion'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[2].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller.Religion =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[2]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[2].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[2]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[2]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[2].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[2]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "Religion")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                 SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF)),
                                          decoration: InputDecoration(
                                            labelText: 'caste'.tr,
                                            hintText: 'caste'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[3].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller.Caste = newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[3]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[3].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[3]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[3]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[3].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[3]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category == "Caste")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                               TextFormField(
                                    controller: controller.SubCasteController,
                                   
                                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'sub_caste'.tr,
                                      labelText: 'sub_caste'.tr,
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Icon(Icons.people,
                                            color: Color(0xFF134FAF)),
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF)),
                                          decoration: InputDecoration(
                                            labelText: 'community'.tr,
                                            hintText: 'community'.tr,
                                          labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[4].filterOptions!.where((element) => element.isSelected!  == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller.Community =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[4]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[4].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[4]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[4]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[4].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[4]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "Community")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF)),
                                          decoration: InputDecoration(
                                            labelText: 'mother_tongue'.tr,
                                            hintText: 'mother_tongue'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[6].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller.MotherTongue =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[6]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[6].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[6]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[6]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[6].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[6]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "MotherTongue")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                               
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          card2.currentState?.expand();
                                          card1.currentState?.collapse();
                                        });
                                        // controller.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'cancel'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'save'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      expandedColor: Colors.white.withOpacity(0.9),
                      key: card2,
                      // expandedTextColor: Colors.red,
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),
                      title: Text(
                        'communication_address'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: controller1.DoorNoController,
                                   
                                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'door_no'.tr,
                                      labelText: 'door_no'.tr,
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Icon(Icons.people,
                                            color: Color(0xFF134FAF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: controller1.StreetController,
                                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'street'.tr,
                                      labelText: 'street'.tr,
                                      hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Icon(Icons.people,
                                            color: Color(0xFF134FAF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: controller1.AreaController,
                                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'area'.tr,
                                      labelText: 'area'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Icon(Icons.people,
                                            color: Color(0xFF134FAF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CountryStateCityPicker(
                                    country: controller1.CountryController,
                                    state: controller1.StateController,
                                    city: controller1.CityController,
                                    distict: controller1.DistrictController,
                                    // district: controller.nickNameController,4
                            
                                    textFieldInputBorder: OutlineInputBorder(
                                      gapPadding: 20,
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  DropdownButtonFormField(
                                    isExpanded: true,
                                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                    decoration: InputDecoration(
                                      labelText: 'nationality'.tr,
                                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                      // hintText: "aa",
                                      enabledBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Color(0xFF134FAF)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Color(0xFF134FAF)),
                                      ),
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Icon(Icons.person,
                                            color: Color(0xFF134FAF)),
                                      ),
                                      filled: true,
                                      // fillColor: Colors.white,
                                      fillColor: Colors.grey.shade100,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: Color(0xFF134FAF),
                                    ),
                                    dropdownColor: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    value: controller1.nationality,
                                    onChanged: (String? newValue1) {
                                      setState(() {
                                        controller1.nationality = newValue1!;
                                      });
                                    },
                                    items: <String>[
                                      'Indian',
                                      'American',
                                      'United Arab Emirates'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value1) {
                                      return DropdownMenuItem<String>(
                                        value: value1,
                                        child: Text(
                                          value1,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF134FAF),
                                              fontFamily: "Raleway"),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonFormField(
                                    isExpanded: true,
                                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                    decoration: InputDecoration(
                                      labelText: 'current_nationality'.tr,
                                     labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                      // hintText: "aa",
                                      enabledBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Color(0xFF134FAF)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Color(0xFF134FAF)),
                                      ),
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child: Icon(Icons.person,
                                            color: Color(0xFF134FAF)),
                                      ),
                                      filled: true,
                                      // fillColor: Colors.white,
                                      fillColor: Colors.grey.shade100,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: Color(0xFF134FAF),
                                    ),
                                    dropdownColor: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    value: controller1.currentNationality,
                                    onChanged: (String? newValue1) {
                                      setState(() {
                                        controller1.currentNationality = newValue1!;
                                      });
                                    },
                                    items: <String>[
                                      'Indian',
                                      'American',
                                      'United Arab Emirates'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value1) {
                                      return DropdownMenuItem<String>(
                                        value: value1,
                                        child: Text(
                                          value1,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF134FAF),
                                              fontFamily: "Raleway"),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Obx(
                                    () => newfilter.isLoading.value
                                        ? Container()
                                        : DropdownButtonFormField(
                                          isExpanded: true,
                                            style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                            decoration: InputDecoration(
                                              labelText: 'resident_status'.tr,
                                              hintText: 'resident_status'.tr,
                                             labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                              // hintText: "aa",
                                              enabledBorder: OutlineInputBorder(
                                                //<-- SEE HERE
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF134FAF)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                //<-- SEE HERE
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF134FAF)),
                                              ),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, right: 15),
                                                child: Icon(Icons.emoji_people,
                                                    color: Color(0xFF134FAF)),
                                              ),
                                              filled: true,
                                              // fillColor: Colors.white,
                                              fillColor: Colors.grey.shade100,
                                            ),
                                            icon: Icon(
                                              Icons.arrow_drop_down_circle,
                                              color: Color(0xFF134FAF),
                                            ),
                                            dropdownColor: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            value: newfilter.filterCatList
                                              .value[15].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                            // validator: (value) => value == null
                                            //                           ? 'field required'
                                            //                           : null,
                                            // hint: Text('Enter team'),
                            
                                            onChanged: (newValue) async {
                                              print(newValue!.options);
                                              controller1.residentStatus =
                                                  newValue.options!;
                                              int? ind;
                                              List<FilterOptions>? temp =
                                                  newfilter.filterCatList
                                                      .value[15].filterOptions
                                                      ?.where((element) =>
                                                          element.isSelected!)
                                                      .toList();
                                              if (temp!.length > 0) {
                                                ind = newfilter.filterCatList
                                                    .value[15].filterOptions
                                                    ?.indexOf(temp.first);
                                                temp.first.isSelected = false;
                                                newfilter.filterCatList.value[15]
                                                    .filterOptions
                                                    ?.removeAt(ind!);
                                                newfilter.filterCatList.value[15]
                                                    .filterOptions
                                                    ?.insert(ind!, temp.first);
                                              }
                                              ind = newfilter.filterCatList
                                                  .value[15].filterOptions
                                                  ?.indexOf(newValue);
                                              newfilter
                                                  .filterCatList
                                                  .value[15]
                                                  .filterOptions?[ind!]
                                                  .isSelected = true;
                                              newfilter.filterCatList.refresh();
                                            },
                                            items: newfilter.filterCatList.value
                                                .where((element) =>
                                                    element.category ==
                                                    "ResidentStatus")
                                                .first
                                                .filterOptions!
                                                .map((FilterOptions option) {
                                              return DropdownMenuItem(
                                                child: new Text(
                                                  option.options!,
                                                ),
                                                value: option,
                                              );
                                            }).toList(),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // controller.checkInput(context);
                                        },
                                        child: Container(
                                          width: 100,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    offset: Offset(2, 4),
                                                    blurRadius: 5,
                                                    spreadRadius: 2)
                                              ],
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xffEAF12D),
                                                    Color(0xffEAF12D)
                                                  ])),
                                          child: Text(
                                            'cancel'.tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF134FAF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller1.checkInput(context);
                                        },
                                        child: Container(
                                          width: 100,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    offset: Offset(2, 4),
                                                    blurRadius: 5,
                                                    spreadRadius: 2)
                                              ],
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xffEAF12D),
                                                    Color(0xffEAF12D)
                                                  ])),
                                          child: Text(
                                            'save'.tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF134FAF)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      expandedColor: Colors.white.withOpacity(0.9),
                      key: card3,
                      // expandedTextColor: Colors.red,
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),
                      title: Text(
                        'permanent_address'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller2.DoorNoController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'door_no'.tr,
                                    labelText: 'door_no'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller2.StreetController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'street'.tr,
                                    labelText: 'street'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller2.AreaController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'area'.tr,
                                    labelText: 'area'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CountryStateCityPicker(
                                  country: controller2.CountryController,
                                  state: controller2.StateController,
                                  city: controller2.CityController,
                                  distict: controller2.DistrictController,
                                  // district: controller.nickNameController,4

                                  textFieldInputBorder: OutlineInputBorder(
                                    gapPadding: 20,
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Color(0xFF134FAF)),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                  decoration: InputDecoration(
                                    labelText: 'nationality'.tr,
                                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    // hintText: "aa",
                                    enabledBorder: OutlineInputBorder(
                                      //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFF134FAF)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFF134FAF)),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.person,
                                          color: Color(0xFF134FAF)),
                                    ),
                                    filled: true,
                                    // fillColor: Colors.white,
                                    fillColor: Colors.grey.shade100,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Color(0xFF134FAF),
                                  ),
                                  dropdownColor: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  value: controller2.nationality,
                                  onChanged: (String? newValue1) {
                                    setState(() {
                                      controller2.nationality = newValue1!;
                                    });
                                  },
                                  items: <String>[
                                    'Indian',
                                    'American',
                                    'United Arab Emirates'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value1) {
                                    return DropdownMenuItem<String>(
                                      value: value1,
                                      child: Text(
                                        value1,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF134FAF),
                                            fontFamily: "Raleway"),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                  decoration: InputDecoration(
                                    labelText: 'current_nationality'.tr,
                                  labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    // hintText: "aa",
                                    enabledBorder: OutlineInputBorder(
                                      //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFF134FAF)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Color(0xFF134FAF)),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.person,
                                          color: Color(0xFF134FAF)),
                                    ),
                                    filled: true,
                                    // fillColor: Colors.white,
                                    fillColor: Colors.grey.shade100,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Color(0xFF134FAF),
                                  ),
                                  dropdownColor: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  value: controller2.currentNationality,
                                  onChanged: (String? newValue1) {
                                    setState(() {
                                      controller2.currentNationality = newValue1!;
                                    });
                                  },
                                  items: <String>[
                                    'Indian',
                                    'American',
                                    'United Arab Emirates'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value1) {
                                    return DropdownMenuItem<String>(
                                      value: value1,
                                      child: Text(
                                        value1,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF134FAF),
                                            fontFamily: "Raleway"),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'resident_status'.tr,
                                            hintText: 'resident_status'.tr,
                                          labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[15].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller2.residentStatus =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList
                                                    .value[15].filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[15].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[15]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[15]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[15].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[15]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "ResidentStatus")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // controller.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'cancel'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller2.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'save'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      key: card4,
                      expandedColor: Colors.white.withOpacity(0.9),
                      // expandedTextColor: Colors.red,
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),
                      title: Text(
                        'personal_details'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller3.HeightController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'height'.tr,
                                    labelText: 'height'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller3.WieghtController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'weight'.tr,
                                    labelText: 'weight'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller3.HobbiesController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'hobbies'.tr,
                                    labelText: 'hobbies'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'skin_tone'.tr,
                                            hintText: 'skin_tone'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[8].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller3.skinTone =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[8]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[8].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[8]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[8]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[8].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[8]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "Skintone")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'diet'.tr,
                                            hintText: 'diet'.tr,
                                         labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[9].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller3.deit =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[9]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[9].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[9]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[9]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[9].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[9]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category == "Diet")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'martial_status'.tr,
                                            hintText: 'martial_status'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[5].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller3.maritalStatus =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[5]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[5].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[5]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[5]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[5].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[5]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "Marital Status")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                 SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller3.NoChildController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'no_of_child'.tr,
                                    labelText: 'no_of_child'.tr,
                                  hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
               SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: controller3.livingDetailsController,
                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'living_with_details'.tr,
                      labelText: 'living_with_details'.tr,
                      hintStyle: TextStyle(fontFamily: "Raleway"),
                      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Color(0xFF134FAF)),
                      ),
                    ),
                  ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'drinking'.tr,
                                            hintText: 'drinking'.tr,
                                          labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[19].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller3.drinking =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList
                                                    .value[19].filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[19].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[19]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[19]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[19].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[19]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "Drinking")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'smoking'.tr,
                                            hintText: 'smoking'.tr,
                                           labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[20].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller3.smoking =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList
                                                    .value[20].filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[20].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[20]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[20]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[20].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[20]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category == "Smoking")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'physical_status'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF134FAF)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF134FAF)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller3.physicalStatus,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller3.physicalStatus = newValue1!;
                      controller3.showTextField = controller3.physicalStatus == 'Yes';
                    });
                  },
                  items: <String>['No', 'Yes']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                                
                                SizedBox(
                  height: 30,
                ),
                 Visibility(
                  visible: controller3.showTextField,
                   child: TextFormField(
                 
                        controller: controller3.physicalStatusController,
                        style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                        
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'physical_status_detalis'.tr,
                          labelText: 'physical_status_detalis'.tr,
                          hintStyle: TextStyle(fontFamily: "Raleway"),
                          
                  labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20, right: 15),
                            child: Icon(Icons.people, color: Color(0xFF134FAF)),
                          ),
                        ),
                      ),
                 ),
                   
               
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: controller3.otherLanguagesController,
                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'other_languages'.tr,
                      labelText: 'other_languages'.tr,
                      hintStyle: TextStyle(fontFamily: "Raleway"),
                      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Color(0xFF134FAF)),
                      ),
                    ),
                  ),
                
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller3.FirstNameController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'firstname'.tr,
                                    labelText: 'firstname'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller3.LastNameController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'lastname'.tr,
                                    labelText: 'lastname'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller3.NickNameController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'nickname'.tr,
                                    labelText: 'nickname'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'gender'.tr,
                                            hintText: 'gender'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[7].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller3.gender =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[7]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[7].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[7]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[7]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[7].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[7]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category == "Gender")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'age'.tr,
                                            hintText: 'age'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[1].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            print("newValue!.options");
                                            controller3.age =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList.value[1]
                                                    .filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[1].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[1]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[1]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[1].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[1]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category == "Age")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  controller: controller3.DobController,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'date_Birth'.tr,
                                    labelText: 'date_Birth'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                    labelStyle:
                                        TextStyle(fontFamily: "Raleway"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.date_range,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2018),
                                        firstDate: DateTime(
                                            1980), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      if (kDebugMode) {
                                        print(pickedDate);
                                      } //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      if (kDebugMode) {
                                        print(formattedDate);
                                      } //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement
                                      setState(() {
                                        controller3.DobController.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      if (kDebugMode) {
                                        print("Date is not selected");
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // controller.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'cancel'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller3.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'save'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      expandedColor: Colors.white.withOpacity(0.9),
                      key: card5,
                      // expandedTextColor: Colors.red,

                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),
                      title: Text(
                        'carrier_details'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              children: [
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'education_qual'.tr,
                                            hintText: 'education_qual'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[10].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller4.education =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList
                                                    .value[10].filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[10].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[10]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[10]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[10].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[10]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "Education")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                 SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller4.educationDetailsController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'education_details'.tr,
                                    labelText: 'education_details'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                  height: 30,
                ),
               
                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'occupation'.tr,
                      hintText:  'occupation'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF134FAF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF134FAF)),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList
                                              .value[23].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller4.occupation = newValue.options!;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[23].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[23].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[23].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[23].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[23].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[23].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "occupation").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                                 SizedBox(
                                  height: 30,
                                ),
                                
                                TextFormField(
                                  controller: controller4.WorkingDetailsController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'working_details'.tr,
                                    labelText: 'working_details'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(() => newfilter.isLoading.value ? Container() :
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                    decoration: InputDecoration(
                      labelText: 'working_in'.tr,
                      hintText:  'working_in'.tr,
                      labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF134FAF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF134FAF)),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people, color: Color(0xFF134FAF)),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),
                    ),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    value: newfilter.filterCatList
                                              .value[17].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                    // validator: (value) => value == null
                    //                           ? 'field required'
                    //                           : null,
                    // hint: Text('Enter team'),
                    
                    onChanged: (newValue) async {
                      print(newValue!.options);
                      controller4.workingIn = newValue.options!;
                      int? ind;
                      List<FilterOptions>? temp = newfilter.filterCatList.value[17].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = newfilter.filterCatList.value[17].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            newfilter.filterCatList.value[17].filterOptions?.removeAt(ind!);
            newfilter.filterCatList.value[17].filterOptions?.insert(ind!, temp.first);
          }
          ind = newfilter.filterCatList.value[17].filterOptions?.indexOf(newValue);
          newfilter.filterCatList.value[17].filterOptions?[ind!].isSelected = true;
          newfilter.filterCatList.refresh();
                        
                      
                    },
                    items: newfilter.filterCatList.value.where((element) => element.category == "Working In").first.filterOptions!.map((FilterOptions option) {
                      return DropdownMenuItem(
                        child: new Text(
                          option.options!,
                        ),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
                                // TextFormField(
                                //   controller: controller4.WorkingInController,
                                //   style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                //   decoration: InputDecoration(
                                //     fillColor: Colors.grey.shade100,
                                //     filled: true,
                                //     hintText: 'working_in'.tr,
                                //     labelText: 'working_in'.tr,
                                //    hintStyle: TextStyle(fontFamily: "Raleway"),
                                //      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //       borderSide: BorderSide(
                                //           color: Color(0xFF134FAF), width: 2),
                                //     ),
                                //     prefixIcon: Padding(
                                //       padding:
                                //           EdgeInsets.only(left: 20, right: 15),
                                //       child: Icon(Icons.people,
                                //           color: Color(0xFF134FAF)),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller4.WorkingAsController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'working_as'.tr,
                                    labelText: 'working_as'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller4.CompanyController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'company_details'.tr,
                                    labelText: 'company_details'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller4.IncomeController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'annual_income'.tr,
                                    labelText: 'annual_income'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // controller.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'cancel'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller4.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'save'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      expandedColor: Colors.white.withOpacity(0.9),
                      key: card6,
                      // expandedTextColor: Colors.red,
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),
                      title: Text(
                        'jathagam_details'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              children: [
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'rasi'.tr,
                                            hintText: 'rasi'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[11].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller5.rasi = newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList
                                                    .value[11].filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[11].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[11]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[11]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[11].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[11]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category == "Rasi")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'nactchathiram'.tr,
                                            hintText: 'nactchathiram'.tr,
                                            labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[13].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller5.natchathiram =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList
                                                    .value[13].filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[13].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[13]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[13]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[13].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[13]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category ==
                                                  "Natchathiram")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(
                                  () => newfilter.isLoading.value
                                      ? Container()
                                      : DropdownButtonFormField(
                                        isExpanded: true,
                                          style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                                          decoration: InputDecoration(
                                            labelText: 'laknam'.tr,
                                            hintText: 'laknam'.tr,
                                           labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                            // hintText: "aa",
                                            enabledBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 15),
                                              child: Icon(Icons.emoji_people,
                                                  color: Color(0xFF134FAF)),
                                            ),
                                            filled: true,
                                            // fillColor: Colors.white,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Color(0xFF134FAF),
                                          ),
                                          dropdownColor: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: newfilter.filterCatList
                                              .value[12].filterOptions!.where((element) => element.isSelected! == true).toList().first,
                                          // validator: (value) => value == null
                                          //                           ? 'field required'
                                          //                           : null,
                                          // hint: Text('Enter team'),

                                          onChanged: (newValue) async {
                                            print(newValue!.options);
                                            controller5.lakhan =
                                                newValue.options!;
                                            int? ind;
                                            List<FilterOptions>? temp =
                                                newfilter.filterCatList
                                                    .value[12].filterOptions
                                                    ?.where((element) =>
                                                        element.isSelected!)
                                                    .toList();
                                            if (temp!.length > 0) {
                                              ind = newfilter.filterCatList
                                                  .value[12].filterOptions
                                                  ?.indexOf(temp.first);
                                              temp.first.isSelected = false;
                                              newfilter.filterCatList.value[12]
                                                  .filterOptions
                                                  ?.removeAt(ind!);
                                              newfilter.filterCatList.value[12]
                                                  .filterOptions
                                                  ?.insert(ind!, temp.first);
                                            }
                                            ind = newfilter.filterCatList
                                                .value[12].filterOptions
                                                ?.indexOf(newValue);
                                            newfilter
                                                .filterCatList
                                                .value[12]
                                                .filterOptions?[ind!]
                                                .isSelected = true;
                                            newfilter.filterCatList.refresh();
                                          },
                                          items: newfilter.filterCatList.value
                                              .where((element) =>
                                                  element.category == "Laknam")
                                              .first
                                              .filterOptions!
                                              .map((FilterOptions option) {
                                            return DropdownMenuItem(
                                              child: new Text(
                                                option.options!,
                                              ),
                                              value: option,
                                            );
                                          }).toList(),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller5.GothramController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'gothram'.tr,
                                    labelText: 'gothram'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller5.KuladeivamController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'kuladeivam'.tr,
                                    labelText: 'kuladeivam'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                DropdownButtonFormField(
                  isExpanded: true,
                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 17),
                  decoration: InputDecoration(
                    labelText: 'dosham'.tr,
                    labelStyle: TextStyle(fontSize: 19, fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                    // hintText: "aa",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF134FAF)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF134FAF)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF)),
                    ),
                    filled: true,
                    // fillColor: Colors.white,
                    fillColor: Colors.grey.shade100,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color(0xFF134FAF),
                  ),
                  dropdownColor: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  value: controller3.physicalStatus,
                  onChanged: (String? newValue1) {
                    setState(() {
                      controller5.dosham = newValue1!;
                      controller5.showTextField = controller5.dosham == 'Yes';
                    });
                  },
                  items: <String>['No', 'Yes']
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(
                        value1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway"),
                      ),
                    );
                  }).toList(),
                ),
                 SizedBox(
                                  height: 30,
                                ),
                                Visibility(
                                  visible: controller5.showTextField,
                                  child: TextFormField(
                                  controller:
                                      controller5.DoshamDetailsController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'dosham_details'.tr,
                                    labelText: 'dosham_details'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                
                               
                                CountryStateCityPicker2(
                                    country: controller5.PlaceCountryController,
                                    state: controller5.PlaceStateController,
                                    distict: controller5.PlaceCityController,
                                    // district: controller.nickNameController,4
                              
                                    textFieldInputBorder: OutlineInputBorder(
                                      gapPadding: 20,
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller5.TimeController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  readOnly: true,
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      print(pickedTime
                                          .format(context)); //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
                                      //converting to DateTime so that we can further format on different pattern.
                                      print(
                                          parsedTime); //output 1970-01-01 22:53:00.000
                                      String formattedTime =
                                          DateFormat('HH:mm:ss')
                                              .format(parsedTime);
                                      print(formattedTime); //output 14:59:00
                                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                                      setState(() {
                                        controller5.TimeController.text =
                                            pickedTime.format(
                                                context); //set the value of text field.
                                      });
                                    } else {
                                      print("Time is not selected");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'time_birth'.tr,
                                    labelText: 'time_birth'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // controller.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'cancel'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller5.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'save'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      key: card7,
                      expandedColor: Colors.white.withOpacity(0.9),

                      // expandedTextColor: Colors.red,
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),
                      title: Text(
                        'family_details'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller6.FatherNameController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'father_name'.tr,
                                    labelText: 'father_name'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller:
                                      controller6.FatherOccupationController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'father_occupation'.tr,
                                    labelText: 'father_occupation'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.MotherNameController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'mother_name'.tr,
                                    labelText: 'mother_name'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller:
                                      controller6.MotherOccupationController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'mother_occupation'.tr,
                                    labelText: 'mother_occupation'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.NoBroController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'no_bro'.tr,
                                    labelText: 'no_bro'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.BroMarryController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'no_bro_married'.tr,
                                    labelText: 'no_bro_married'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.NoSisController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'no_sis'.tr,
                                    labelText: 'no_sis'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.SisMarryController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'no_sis_married'.tr,
                                    labelText: 'no_sis_married'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.OwnVechileController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'own_vechile'.tr,
                                    labelText: 'own_vechile'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.OwnHouseController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'own_house'.tr,
                                    labelText: 'own_house'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.OwnlandsController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'own_lands'.tr,
                                    labelText: 'own_lands'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.OwnFlatsController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'own_flats'.tr,
                                    labelText: 'own_flats'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller6.ExpectationController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'expectation'.tr,
                                    labelText: 'expectation'.tr,
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller6.AboutController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'about_me'.tr,
                                    labelText: 'about_me'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller6.AboutFamilyController,
                                  style: TextStyle(color: Color(0xFF134FAF), fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'about_family'.tr,
                                    labelText: 'about_family'.tr,
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.people,
                                          color: Color(0xFF134FAF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // controller.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'cancel'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller6.checkInput(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  offset: Offset(2, 4),
                                                  blurRadius: 5,
                                                  spreadRadius: 2)
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffEAF12D),
                                                  Color(0xffEAF12D)
                                                ])),
                                        child: Text(
                                          'save'.tr,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF134FAF)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ExpansionTileCard(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      key: card8,
                      expandedColor: Colors.white.withOpacity(0.9),
                      // expandedTextColor: Colors.red,
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffEAF12D),
                          child: Icon(
                            CupertinoIcons.heart_circle,
                            color: Color(0xFF134FAF),
                          )),
                      title: Text(
                        'horoscopic_details'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'edit_pref'.tr,
                        style: TextStyle(
                            color: Color(0xFF134FAF),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 8.0,
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Table(
                                          defaultColumnWidth:
                                              FixedColumnWidth(85.0),
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.top,
                                          border: TableBorder.all(
                                              color: Color(0xFF134FAF),
                                              style: BorderStyle.solid,
                                              width: 3.5),
                                          children: [
                                            TableRow(children: [
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                setState(() {
                                                                   print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                                  
                                                                              setState(() {
                                                                                controller7.Rselected11 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected11.isEmpty ? controller7.Rselected11 : [],
                                                                                
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected11.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                             
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'L',
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(left: 30),
                                                                            child: 
                                                                                InkWell(
                                                                                  onTap:
                                                                                      () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child:
                                                                                      Container(
                                                                                    width: 100,
                                                                                    padding: EdgeInsets.symmetric(vertical: 10),
                                                                                    alignment: Alignment.center,
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                        boxShadow: <BoxShadow>[
                                                                                          BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                        ],
                                                                                        gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                    child: Text(
                                                                                      'Ok',
                                                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                                                         
                                                                                        });
                                                               
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'l'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected.isEmpty ? controller7.Rselected : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                               hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'A',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'a'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected1 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected1.isEmpty ? controller7.Rselected1 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected1.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'B',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'b'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected2 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected2.isEmpty ? controller7.Rselected2 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected2.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'C',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'c'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected10 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected10.isEmpty ? controller7.Rselected10 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                               suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected10.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'K',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'k'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                  child: SizedBox.shrink()),
                                              TableCell(
                                                  child: SizedBox.shrink()),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected3 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected3.isEmpty ? controller7.Rselected3 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                               suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected3.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'D',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'd'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected9 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected9.isEmpty ? controller7.Rselected9 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                               suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected9.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'J',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'j'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                  child: SizedBox.shrink()),
                                              TableCell(
                                                  child: SizedBox.shrink()),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected4 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected4.isEmpty ? controller7.Rselected4 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                               suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected4.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'E',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'e'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected8 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected8.isEmpty ? controller7.Rselected8 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected8.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'I',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'i'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected7 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected7.isEmpty ? controller7.Rselected7 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                             suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected7.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'H',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'h'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected6 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected6.isEmpty ? controller7.Rselected6 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected6.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'G',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'g'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TableCell(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                print("aaa");
                                                                Dialogs
                                                                    .materialDialog(
                                                                        msg:
                                                                            'select_check_box'.tr,
                                                                        msgStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors
                                                                            .white,
                                                                        context:
                                                                            context,
                                                                        dialogWidth: kIsWeb
                                                                            ? 0.3
                                                                            : null,
                                                                        onClose:
                                                                            (value) =>
                                                                                print("returned value is '$value'"),
                                                                        actions: [
                                                                      Column(
                                                                        children: [
                                                                          DropDownMultiSelect(
                                                                            onChanged:
                                                                                (List<String> x) {
                                                                              setState(() {
                                                                                controller7.Rselected5 = x;
                                                                                print(x.toString());
                                                                                loginToast(x.toString());
                                                                              });
                                                                            },
                                                                            options: [
                                                                              'Lakanam',
                                                                              'Suriyan',
                                                                              'Chandran',
                                                                              'Chevvai',
                                                                              'Ragu',
                                                                              'Kethu',
                                                                              'Sani',
                                                                              'Sukkiran',
                                                                              'Guru',
                                                                              'Budhan',
                                                                              'Maandhi'
                                                                            ],
                                                                            selectedValues:
                                                                                controller7.Rselected5.isEmpty ? controller7.Rselected5 : [],
                                                                            decoration:
                                                                                InputDecoration(
                                                                               suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Rselected5.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                              ),
                                                                            ),
                                                                            whenEmpty:
                                                                                'F',
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              padding: EdgeInsets.symmetric(vertical: 10),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                  boxShadow: <BoxShadow>[
                                                                                    BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                  ],
                                                                                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                              child: Text(
                                                                                'Ok',
                                                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]);
                                                              },
                                                              child:Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'f'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Center(
                                        child: Column(children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Table(
                                              defaultColumnWidth:
                                                  FixedColumnWidth(85.0),
                                              defaultVerticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .top,
                                              border: TableBorder.all(
                                                  color: Color(0xFF134FAF),
                                                  style: BorderStyle.solid,
                                                  width: 3.5),
                                              children: [
                                                TableRow(children: [
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected11 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected11.isEmpty ? controller7.Aselected11 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected11.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'L',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'l'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected.isEmpty ? controller7.Aselected : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'A',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'a'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected1 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected1.isEmpty ? controller7.Aselected1 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected1.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'B',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'b'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected2 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected2.isEmpty ? controller7.Aselected2 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected2.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'C',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'c'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected10 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected10.isEmpty ? controller7.Aselected10 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected10.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'K',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'k'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                      child: SizedBox.shrink()),
                                                  TableCell(
                                                      child: SizedBox.shrink()),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected3 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected3.isEmpty ? controller7.Aselected3 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected3.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'D',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'd'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected9 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected9.isEmpty ? controller7.Aselected9 : [],
                                                                                decoration: InputDecoration(
                                                                                   suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected9.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                 hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'J',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'j'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                      child: SizedBox.shrink()),
                                                  TableCell(
                                                      child: SizedBox.shrink()),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected4 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected4.isEmpty ? controller7.Aselected4 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected4.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                 hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'E',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'e'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected8 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected8.isEmpty ? controller7.Aselected8 : [],
                                                                                decoration: InputDecoration(
                                                                                 suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected8.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'I',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'i'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected7 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected7.isEmpty ? controller7.Aselected7 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected7.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'H',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'h'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected6 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected6.isEmpty ? controller7.Aselected6 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected6.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                  hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'G',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'g'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 100,
                                                                width: 100,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "aaa");
                                                                    Dialogs.materialDialog(
                                                                        msg: 'select_check_box'.tr,
                                                                        msgStyle: TextStyle(fontSize: 15, fontFamily: "Raleway"),
                                                                        // title: "Delete",
                                                                        color: Colors.white,
                                                                        context: context,
                                                                        dialogWidth: kIsWeb ? 0.3 : null,
                                                                        onClose: (value) => print("returned value is '$value'"),
                                                                        actions: [
                                                                          Column(
                                                                            children: [
                                                                              DropDownMultiSelect(
                                                                                onChanged: (List<String> x) {
                                                                                  setState(() {
                                                                                    controller7.Aselected5 = x;
                                                                                    print(x.toString());
                                                                                    loginToast(x.toString());
                                                                                  });
                                                                                },
                                                                                options: [
                                                                                  'Lakanam',
                                                                                  'Suriyan',
                                                                                  'Chandran',
                                                                                  'Chevvai',
                                                                                  'Ragu',
                                                                                  'Kethu',
                                                                                  'Sani',
                                                                                  'Sukkiran',
                                                                                  'Guru',
                                                                                  'Budhan',
                                                                                  'Maandhi'
                                                                                ],
                                                                                selectedValues: controller7.Aselected5.isEmpty ? controller7.Aselected5 : [],
                                                                                decoration: InputDecoration(
                                                                                  suffixIcon: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          
                                                                                      controller7.Aselected5.clear();      
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        color: Color(0xFF134FAF),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 10),
                                                                                    Icon(
                                                                                      Icons.arrow_drop_down_circle,
                                                                                      color: Color(0xFF134FAF),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                                   hintStyle: TextStyle(fontSize: 21, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                              labelStyle: TextStyle(fontSize: 15, fontFamily: "Raleway", color: Color(0xFF134FAF)),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    borderSide: BorderSide(color: Color(0xFF134FAF), width: 2),
                                                                                  ),
                                                                                ),
                                                                                whenEmpty: 'F',
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                                                      boxShadow: <BoxShadow>[
                                                                                        BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)
                                                                                      ],
                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff79c4f), Color(0xfff79c4f)])),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]);
                                                                  },
                                                                  child: Container(
                                                                       height: 20,
                                                                           width: 20,
                                                                     decoration: BoxDecoration(color: Color(0xFF134FAF), borderRadius: BorderRadius.circular(100)
                                                                                                                //more than 50% of width makes circle
                  
                                                                                                                ),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'f'.tr,
                                                                                                                style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                // card8.currentState?.expand();
                                                // card1.currentState?.collapse();
                                              });
                                              // controller.checkInput(context);
                                            },
                                            child: Container(
                                              width: 100,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25)),
                                                  boxShadow: <BoxShadow>[
                                                    BoxShadow(
                                                        color: Colors
                                                            .grey.shade200,
                                                        offset: Offset(2, 4),
                                                        blurRadius: 5,
                                                        spreadRadius: 2)
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color(0xffEAF12D),
                                                        Color(0xffEAF12D)
                                                      ])),
                                              child: Text(
                                                'cancel'.tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF134FAF)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller7.checkInput(context);
                                            },
                                            child: Container(
                                              width: 100,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(25)),
                                                  boxShadow: <BoxShadow>[
                                                    BoxShadow(
                                                        color: Colors
                                                            .grey.shade200,
                                                        offset: Offset(2, 4),
                                                        blurRadius: 5,
                                                        spreadRadius: 2)
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color(0xffEAF12D),
                                                        Color(0xffEAF12D)
                                                      ])),
                                              child: Text(
                                                'save'.tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF134FAF)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                  Positioned(
                                    top: 110,
                                    right: 87.5,
                                    child: Container(
                                      height: 200.0,
                                      width: 170.0,
                                      color: Colors.transparent,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Color(0xFF134FAF),
                                                  width: 3)),
                                          child: new Center(
                                            child: new Text(
                                              'raasi'.tr,
                                              style: TextStyle(
                                                  fontFamily: "Raleway",
                                                  fontSize: 25,
                                                  color: Color(0xFF134FAF),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Positioned(
                                    top: 550,
                                    right: 87.5,
                                    child: Container(
                                      height: 200.0,
                                      width: 170.0,
                                      color: Colors.transparent,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Color(0xFF134FAF),
                                                  width: 3)),
                                          child: new Center(
                                            child: new Text(
                                              'amsam'.tr,
                                              style: TextStyle(
                                                  fontFamily: "Raleway",
                                                  fontSize: 25,
                                                  color: Color(0xFF134FAF),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        //
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}