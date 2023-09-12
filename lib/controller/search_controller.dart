import 'dart:async';
import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:http/http.dart' as http;
import 'package:thirumanam/models/admin_data_model.dart';

import '../models/all_users_model.dart';
import '../models/data_model.dart';
import '../utils/api_config.dart';
import '../utils/constants.dart';

class SearchController extends BaseController{

  var searchUser = <HomeProfileModel> [].obs;
  List<HomeProfileModel> tempSearchUser = [];
  final TextEditingController searchController = TextEditingController();

  var filterCatList = <FilterData>[].obs;
  AdminDataModel adminDataModel = AdminDataModel();
  var selectedState = "TN".obs;
  var stateModel = <StateModel>[];
  Timer? timer;

  List<Map<String, String>>? filter;
  bool filterApplied = false, stateSelected = false;

  @override
  void onInit() {
    super.onInit();
    frameFilterData();
    getSearchUsers();
  }

  frameFilterData() {
    isLoading.value = true;


    http.get(
        RestApiClient().adminData).then((value) {
      print("Admin Data Response: ${value.body}");
      final res = jsonDecode(value.body);
      if (res["success"] == 1) {
        adminDataModel = AdminDataModel.fromJson(res);
        // FilterData model1 = FilterData(
        //     category: "Gender",
        //     catId: 1,
        //     isCatSel: false
        // );
        // List<FilterOptions> filterOption11 = [];
        // adminDataModel.data
        //     ?.where((element) => element.categoryName == "GENDER")
        //     .first
        //     .subCat
        //     ?.asMap()
        //     .forEach((index, element1) {
        //   filterOption11.add(
        //     FilterOptions(
        //         options: element1.subCategoryName,
        //         optionId: index,
        //         isSelected: false
        //     ),);
        // });
        // model1.filterOptions = filterOption11;
        // filterCatList.value.add(model1);
        FilterData model2 = FilterData(
            category: "age_max",
            catId: 2,
            isCatSel: false,
            filterOptions: [
              for(int i = 18; i < 45; i++)
                FilterOptions(
                    options: "${i}",
                    optionId: i - 14,
                    isSelected: false
                ),
            ]
        );
        filterCatList.value.add(model2);
        FilterData model3 = FilterData(
            category: "religion",
            catId: 3,
            isCatSel: false);
        List<FilterOptions> filterOption = [];
        adminDataModel.data
            ?.where((element) => element.categoryName == "RELIGION")
            .first
            .subCat
            ?.asMap()
            .forEach((index, element1) {
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
            category: "caste",
            catId: 4,
            isCatSel: false);
        List<FilterOptions> filterOption1 = [];
       adminDataModel.data?.where((element) => element.categoryName == "RELIGION").first.subCat?.forEach((getNestedSubCategories) {
           getNestedSubCategories.getNestedSubCategories?.asMap().forEach((index, subSubCategory) {
          filterOption1.add(
            FilterOptions(
                options: subSubCategory.subName,
                optionId: index,
                isSelected: false
            ),);
            });
        });
        model4.filterOptions = filterOption1;
        filterCatList.value.add(model4);
        FilterData model5 = FilterData(
            category: "community",
            catId: 5,
            isCatSel: false);
        List<FilterOptions> filterOption2 = [];
        adminDataModel.data
            ?.where((element) => element.categoryName == "COMMUNITY")
            .first
            .subCat
            ?.asMap()
            .forEach((index, element1) {
          filterOption2.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model5.filterOptions = filterOption2;
        filterCatList.value.add(model5);
        // FilterData model6 = FilterData(
        //     category: "Marital Status",
        //     catId: 6,
        //     isCatSel: false,
        //     filterOptions: [
        //       FilterOptions(
        //           options: "Single",
        //           optionId: 1,
        //           isSelected: false
        //       ),
        //       FilterOptions(
        //           options: "Married",
        //           optionId: 2,
        //           isSelected: false
        //       ),
        //       FilterOptions(
        //           options: "Widowed",
        //           optionId: 3,
        //           isSelected: false
        //       ),
        //       FilterOptions(
        //           options: "Divorced",
        //           optionId: 4,
        //           isSelected: false
        //       ),
        //       FilterOptions(
        //           options: "Separated",
        //           optionId: 5,
        //           isSelected: false
        //       ),
        //     ]
        // );
        // filterCatList.value.add(model6);
        FilterData model7 = FilterData(
            category: "rasi",
            catId: 5,
            isCatSel: false);
        List<FilterOptions> filterOption7 = [];
        adminDataModel.data
            ?.where((element) => element.categoryName == "RASI")
            .first
            .subCat
            ?.asMap()
            .forEach((index, element1) {
          filterOption7.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model7.filterOptions = filterOption7;
        filterCatList.value.add(model7);
        FilterData model8 = FilterData(
            category: "laknam",
            catId: 5,
            isCatSel: false);
        List<FilterOptions> filterOption8 = [];
        adminDataModel.data
            ?.where((element) => element.categoryName == "LAKNAM")
            .first
            .subCat
            ?.asMap()
            .forEach((index, element1) {
          filterOption8.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model8.filterOptions = filterOption8;
        filterCatList.value.add(model8);
        FilterData model9 = FilterData(
            category: "natchathiram",
            catId: 5,
            isCatSel: false);
        List<FilterOptions> filterOption9 = [];
        adminDataModel.data
            ?.where((element) => element.categoryName == "NATCHATHIRAM")
            .first
            .subCat
            ?.asMap()
            .forEach((index, element1) {
          filterOption9.add(
            FilterOptions(
                options: element1.subCategoryName,
                optionId: index,
                isSelected: false
            ),);
        });
        model9.filterOptions = filterOption9;
        filterCatList.value.add(model9);
        // http.get(
        //     Uri.parse("https://www.universal-tutorial.com/api/getaccesstoken"),
        //     headers: {
        //       "Accept": "application/json",
        //       "api-token": "Fp4GKOjKvSuHDzmgyqhm9HYPA8LdvOtGDSvvwj9C9W7gDzHdgYrB3B_28GIWNE54VUo",
        //       "user-email": "umamahacse@gmail.com"
        //     }).then((value) {
        // http.get(
        //     Uri.parse("https://api.countrystatecity.thirumanam/v1/countries/IN/states"),
        //     headers: {
        //       "X-CSCAPI-KEY": "TGZ5N2VTQVZidmlYN0FYN1ZhbExZUGlseFNOVVh0cWxIZ2FPemJtTA==",
        //     }).then((value) {
        //   print("State Data Response: ${value.body}");
        //   final res = jsonDecode(value.body);

        //   List<FilterOptions> option = [];
        //   for (int j = 0; j < res.length; j++) {
        //     StateModel m = StateModel(
        //         name: res[j]["name"],
        //         code: res[j]["iso2"],
        //         isSelected: false
        //     );
        //     stateModel.add(m);
        //     FilterOptions o = FilterOptions(
        //         options: res[j]["name"],
        //         optionId: j,
        //         isSelected: res[j]["name"] == "Tamil Nadu" ? true : false);
        //     option.add(o);
        //   }

          // FilterData model7 = FilterData(
          //     category: "State",
          //     catId: 7,
          //     isCatSel: false,
          //     filterOptions: option
          // );

          // filterCatList.value.add(model7);
          // getCity(false);
        // });
      }
    });



  }

  getCity(bool isFirstCall){
    http.get(
        Uri.parse("https://api.countrystatecity.thirumanam/v1/countries/IN/states/${selectedState.value}/cities"),
        headers: {
          "X-CSCAPI-KEY": "TGZ5N2VTQVZidmlYN0FYN1ZhbExZUGlseFNOVVh0cWxIZ2FPemJtTA==",
        }).then((value) {
      final res = jsonDecode(value.body);
      FilterData model7 = FilterData(
          category: "City",
          catId: 8,
          isCatSel: false,
          filterOptions: [
            for(int j=0; j< res.length; j++)
                FilterOptions(
                    options: res[j]["name"],
                    optionId: j,
                    isSelected: false)
          ]
      );
      if(!isFirstCall)
        filterCatList.value.removeLast();
      filterCatList.value.add(model7);
    });
    filterCatList.refresh();
    if(isFirstCall){
      isLoading.value = false;
    }
  }

    // FilterData model3 = FilterData(
    //     category: "Religion",
    //     catId: 3,
    //     isCatSel: false,
    //     filterOptions: [
    //         FilterOptions(
    //             options: "Hinduism",
    //             optionId: 1,
    //             isSelected: false
    //         ),
    //       FilterOptions(
    //           options: "Islam",
    //           optionId: 2,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Christianity",
    //           optionId: 3,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Sikhism",
    //           optionId: 4,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Buddhism",
    //           optionId: 5,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Jainism",
    //           optionId: 6,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Other Religion",
    //           optionId: 7,
    //           isSelected: false
    //       ),
    //     ]
    // );
    // filterCatList.value.add(model3);
    //
    // FilterData model4 = FilterData(
    //     category: "Caste",
    //     catId: 4,
    //     isCatSel: false,
    //     filterOptions: [
    //       FilterOptions(
    //           options: "BC",
    //           optionId: 1,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "MBC",
    //           optionId: 2,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "DC",
    //           optionId: 3,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "OBC",
    //           optionId: 4,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "OBCM",
    //           optionId: 5,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "ST",
    //           optionId: 6,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "SC",
    //           optionId: 7,
    //           isSelected: false
    //       ),
    //     ]
    // );
    // filterCatList.value.add(model4);
    //
    // FilterData model5 = FilterData(
    //     category: "Community",
    //     catId: 5,
    //     isCatSel: false,
    //     filterOptions: [
    //       FilterOptions(
    //           options: "BC",
    //           optionId: 1,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "MBC",
    //           optionId: 2,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "DC",
    //           optionId: 3,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "OBC",
    //           optionId: 4,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "OBCM",
    //           optionId: 5,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "ST",
    //           optionId: 6,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "SC",
    //           optionId: 7,
    //           isSelected: false
    //       ),
    //     ]
    // );
    // filterCatList.value.add(model5);
    //
    // FilterData model6 = FilterData(
    //     category: "Marital Status",
    //     catId: 6,
    //     isCatSel: false,
    //     filterOptions: [
    //       FilterOptions(
    //           options: "Single",
    //           optionId: 1,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Married",
    //           optionId: 2,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Widowed",
    //           optionId: 3,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Divorced",
    //           optionId: 4,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Separated",
    //           optionId: 5,
    //           isSelected: false
    //       ),
    //     ]
    // );
    // filterCatList.value.add(model6);
    //
    // FilterData model7 = FilterData(
    //     category: "State",
    //     catId: 7,
    //     isCatSel: false,
    //     filterOptions: [
    //       FilterOptions(
    //           options: "Andhra Pradesh",
    //           optionId: 1,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Arunachal Pradesh",
    //           optionId: 2,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Assam",
    //           optionId: 3,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Bihar",
    //           optionId: 4,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Chhattisgarh",
    //           optionId: 5,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Goa",
    //           optionId: 6,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Gujarat",
    //           optionId: 7,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Haryana",
    //           optionId: 8,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Himachal Pradesh",
    //           optionId: 9,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Jharkhand",
    //           optionId: 10,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Karnataka",
    //           optionId: 11,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Kerala",
    //           optionId: 12,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Madhya Pradesh",
    //           optionId: 13,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Maharashtra",
    //           optionId: 14,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Manipur",
    //           optionId: 15,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Meghalaya",
    //           optionId: 16,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Mizoram",
    //           optionId: 17,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Nagaland",
    //           optionId: 18,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Odisha",
    //           optionId: 19,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Punjab",
    //           optionId: 20,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Rajasthan",
    //           optionId: 21,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Sikkim",
    //           optionId: 22,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Tamil Nadu",
    //           optionId: 23,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Telangana",
    //           optionId: 24,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Tripura",
    //           optionId: 25,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Uttar Pradesh",
    //           optionId: 26,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "Uttarakhand",
    //           optionId: 27,
    //           isSelected: false
    //       ),
    //       FilterOptions(
    //           options: "West Bengal",
    //           optionId: 28,
    //           isSelected: false
    //       ),
    //     ]
    // );
    // filterCatList.value.add(model7);


  getSearchUsers(){
    isLoading.value = true;
    AllUsersModel allUser = AllUsersModel();
    searchUser.value.clear();
    tempSearchUser.clear();
    http.get(
        RestApiClient().searchUser,
        headers: {
          "x-access-token": appPreference.accessToken!
        }).then((value) {
      print("getAllUsersAPI Response: ${value.body}");
      final res = jsonDecode(value.body);
      if(res["success"]== 1){
        allUser = AllUsersModel.fromJson(res);

        for(int i =0 ;i<allUser.data!.length; i++){
          String? name = "";
          String? gender = "";
          int? age;
          String? des = "";
          String? address = "";
          int? height = 0;
          if(allUser.data![i].personalDetails != null){
            if(allUser.data![i].personalDetails?.firstName != null || allUser.data![i].personalDetails?.lastName != null){
              name = '${allUser.data![i].personalDetails?.firstName != null ? "${allUser.data![i].personalDetails?.firstName} " : ""}'
                  '${allUser.data![i].personalDetails?.lastName ?? ""}';
            }
            if(allUser.data![i].personalDetails?.gender != null && allUser.data![i].personalDetails?.gender != ""){
              gender = allUser.data![i].personalDetails?.gender;
            }
            if(allUser.data![i].personalDetails?.dOB != null && allUser.data![i].personalDetails?.dOB != ""){
              DateTime? tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(allUser.data![i].personalDetails?.dOB ?? "");
              age = AgeCalculator.age(tempDate).years;
            }
            if(allUser.data![i].personalDetails?.height != null && allUser.data![i].personalDetails?.height != ""){
              height = allUser.data![i].personalDetails!.height!;
            }
          }
          if(allUser.data![i].carrierAndWorkingDetails != null){
            if(allUser.data![i].carrierAndWorkingDetails?.workingAs != null && allUser.data![i].carrierAndWorkingDetails?.workingAs != ""){
              des = allUser.data![i].carrierAndWorkingDetails?.workingAs ?? "";
            }
          }
          if(allUser.data![i].permanentAddress != null){
            address = '${allUser.data![i].permanentAddress?.city != null ? "${allUser.data![i].permanentAddress?.city}, " : ""}'
                '${allUser.data![i].permanentAddress?.district != null ? "${allUser.data![i].permanentAddress?.district}, " : ""}'
                '${allUser.data![i].permanentAddress?.state != null ? "${allUser.data![i].permanentAddress?.state}" : ""}';
          }



          HomeProfileModel model = HomeProfileModel(
              id: allUser.data![i].sId,
              userId: allUser.data![i].userObjId,
              name: name,
              gender: gender,
              image: allUser.data![i].attachments!.length > 0 ? allUser.data![i].attachments![0].url : "",
              designation: des,
              location: address,
              cusId: allUser.data![i].userObjId,
              heightInch: height,
              age: age,
              isLiked: false
          );
          searchUser.value.add(model);
        }
      
        tempSearchUser = searchUser.value.map((e) => HomeProfileModel.clone(e)).toList();
        HomePageDataModel dataModel1 = HomePageDataModel(
            title: "Search Result",
            itemList: searchUser.value
        );
        isLoading.value = false;

      }
    });
  }

  getFilterUser(){
    isLoading.value = true;
    searchUser.value.clear();
    tempSearchUser.clear();
    AllUsersModel allUser = AllUsersModel();
    List<Map<String,String>>? params = [];
    if(filterApplied) {
      filterCatList.value.asMap().forEach((key, filterCat) {
        List<FilterOptions> temp = filterCat.filterOptions!.where((
            element) => element.isSelected!).toList();
        if (temp.length > 0) {
          params.add({"${filterCat.category!}": "${temp.first.options}"});
        }
      });
    }
    print("Search Result: $params");

    String requestParams = "${URL}auth/all-user-details";

    params.asMap().forEach((index, element) {
      if(index == 0) {
        requestParams = requestParams + '?${element.keys.first}=${element.values.first.replaceAll(" ", "")}';
      }else{
        requestParams = requestParams + '&${element.keys.first}=${element.values.first.replaceAll(" ", "")}';
      }
    });

    print("Filter request url ${requestParams}");

    http.get(
        Uri.parse(requestParams),
        headers: {
          "x-access-token": appPreference.accessToken!
        }).then((value) {
      print("getAllUsersAPI Response: ${value.body}");
      final res = jsonDecode(value.body);
      if(res["success"]== 1){
        allUser = (AllUsersModel.fromJson(res));

        for(int i =0 ;i<allUser.data!.length; i++){
          String? name = "";
          String? gender = "";
          int? age;
          String? des = "";
          String? address = "";
          int? height = 0;
          if(allUser.data![i].personalDetails != null){
            if(allUser.data![i].personalDetails?.firstName != null || allUser.data![i].personalDetails?.lastName != null){
              name = '${allUser.data![i].personalDetails?.firstName != null ? "${allUser.data![i].personalDetails?.firstName} " : ""}'
                  '${allUser.data![i].personalDetails?.lastName ?? ""}';
            }
            if(allUser.data![i].personalDetails?.gender != null && allUser.data![i].personalDetails?.gender != ""){
              gender = allUser.data![i].personalDetails?.gender;
            }
            if(allUser.data![i].personalDetails?.dOB != null && allUser.data![i].personalDetails?.dOB != ""){
              DateTime? tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(allUser.data![i].personalDetails?.dOB ?? "");
              age = AgeCalculator.age(tempDate).years;
            }
            if(allUser.data![i].personalDetails?.height != null && allUser.data![i].personalDetails?.height != ""){
              height = allUser.data![i].personalDetails!.height!;
            }
          }
          if(allUser.data![i].carrierAndWorkingDetails != null){
            if(allUser.data![i].carrierAndWorkingDetails?.workingAs != null && allUser.data![i].carrierAndWorkingDetails?.workingAs != ""){
              des = allUser.data![i].carrierAndWorkingDetails?.workingAs ?? "";
            }
          }
          if(allUser.data![i].permanentAddress != null){
            address = '${allUser.data![i].permanentAddress?.city != null ? "${allUser.data![i].permanentAddress?.city}, " : ""}'
                '${allUser.data![i].permanentAddress?.district != null ? "${allUser.data![i].permanentAddress?.district}, " : ""}'
                '${allUser.data![i].permanentAddress?.state != null ? "${allUser.data![i].permanentAddress?.state}" : ""}';
          }



          HomeProfileModel model = HomeProfileModel(
              id: allUser.data![i].sId,
              userId: allUser.data![i].userObjId,
              name: name,
              gender: gender,
              image: allUser.data![i].attachments!.length > 0 ? allUser.data![i].attachments![0].url : "",
              designation: des,
              location: address,
              cusId: allUser.data![i].userObjId,
              heightInch: height,
              age: age,
              isLiked: false
          );
          searchUser.value.add(model);
        }
        tempSearchUser = searchUser.value.map((e) => HomeProfileModel.clone(e)).toList();
        HomePageDataModel dataModel1 = HomePageDataModel(
            title: "Search Result",
            itemList: searchUser.value
        );
        isLoading.value = false;

      }
    });
  }

  getSearchUserResult(){
    print("getSearchUserResult called");
    isLoading.value = true;
    if(searchController.text.isNotEmpty) {
      List<HomeProfileModel> temp = [];
      temp = tempSearchUser.where((element) =>
          element.name!.toLowerCase().contains(searchController.text.toLowerCase().trim())).toList();
      searchUser.value.clear();
      searchUser.value = temp;
    }else{
      searchUser.value.clear();
      searchUser.value = tempSearchUser;
    }
    isLoading.value = false;
  }

}