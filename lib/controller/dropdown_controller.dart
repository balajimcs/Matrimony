import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thirumanam/app_localization.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:http/http.dart' as http;
import 'package:thirumanam/models/admin_data_model.dart';

import '../models/all_users_model.dart';
import '../models/data_model.dart';
import '../utils/api_config.dart';

class DropDownController extends BaseController{
  

  var searchUser = <HomeProfileModel> [].obs;
  final TextEditingController searchController = TextEditingController();

  var filterCatList = <FilterData>[].obs;
  AdminDataModel adminDataModel = AdminDataModel();

  @override
  void onInit() {
    super.onInit();
    frameFilterData();
    
  }

  

  frameFilterData(){

    isLoading.value = true;


    http.get(
        RestApiClient().adminData).then((value) {
      print("Admin Data Response: ${value.body}");
      final res = jsonDecode(value.body);
      if (res["success"] == 1) {
         Future.delayed(const Duration(milliseconds: 500), () {
        adminDataModel = AdminDataModel.fromJson(res);
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
        // adminDataModel.data?.where((element) => element.categoryName == "RELIGION").first.subCat?.map((getNestedSubCategories) => getNestedSubCategories).toList().first.getNestedSubCategories?.asMap().forEach((index, element1) {
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

        

            isLoading.value = false;
         });
      
      }


    });
  }
}