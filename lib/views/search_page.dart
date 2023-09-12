import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thirumanam/controller/search_controller.dart';
import 'package:thirumanam/models/data_model.dart';
import 'package:thirumanam/views/auth/detailed_page.dart';
import 'package:thirumanam/widget/filter_options_cards.dart';

import '../controller/dashboard_controller.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimen.dart';
import '../resources/app_font.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);

  final controller = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors:
                [Color(0xFF134FAF), Color(0xFF134FAF)]),
          ),
        ),
        // backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Obx(() =>
      controller.isLoading.value ?
      Center(
        child: Container(
            height: 80,
            width: 80,
            alignment: AlignmentDirectional.center,
            child: Lottie.asset(
              "assets/loading/heart.json",
            )),
      ) :
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: AppDimen.screenPadding,
            vertical: 20),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      // padding: const EdgeInsets.only(right: 8, left: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffdcdcdc)),
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: controller.searchController,
                          onChanged: (v) {
                            if (controller.timer?.isActive ?? false)
                              controller.timer?.cancel();
                            controller.timer = Timer(
                                const Duration(
                                    milliseconds: 500),
                                    () {
                                  controller.getSearchUserResult();
                                });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top:14),
                            hintText: "Search for Partner",
                            hintStyle: TextStyle(color: Colors.grey),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            suffix: InkWell(
                              onTap: () {
                                controller.searchController.text = "";
                                controller.getSearchUserResult();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.close,
                                  color: Color(0xffb3b3b3),
                                  size: 16,
                                ),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 3),
                              child: Icon(Icons.search,
                                  color: Colors.grey),
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    // flex: 2,
                      child: InkWell(
                        onTap: () => showFilterBottomSheet(context),
                        child: Container(
                          // height: 30,
                          // width: 30,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffdcdcdc)),
                              color: const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.filter_list_rounded,
                                size: 28,
                              ),
                              // if (filterApplied!)
                              //   const CircleAvatar(
                              //     radius: 4,
                              //     backgroundColor: Colors.red,
                              //   )
                            ],
                          ),
                        ),
                      ),)
                ],
              ),
              SizedBox(height: 20,),
              Text("Search Result",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: AppFont.font,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),),
              SizedBox(height: 20,),
              renderSearchResult(context)
            ],
          ),
        ),
      )),
    );
  }

  Widget renderSearchResult(context){
    return  controller.searchUser.value.length == 0 ?
        Text("No Result found", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)
      : ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: controller.searchUser.value.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Get.to(() => DetailPage(idMatch: '${controller.searchUser.value[index].userId}'));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius:
                      BorderRadius.circular(8),
                      child: controller.searchUser.value[index].image!.isNotEmpty ?
                      Image.network(controller.searchUser.value[index].image!, fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,)
                          : Center(child: Image.network("https://www.linkpicture.com/q/WhatsApp-Image-2023-02-16-at-12.46.25-PM.jpeg", fit: BoxFit.cover,))
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(right: 10,left: 10),
                      decoration: BoxDecoration(
                        // color: Colors.black45,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow:   [ BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 20.0,
                            spreadRadius: 10
                        ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: controller.searchUser.value[index].name!,
                                    style: TextStyle(color: AppColors.white, fontSize: 24, fontFamily: AppFont.font,
                                        fontWeight: FontWeight.w900,letterSpacing: 1.5)
                                  ),
                                  // TextSpan(
                                  //   text: " (${controller.searchUser.value[index].cusId!})",
                                  //     style: TextStyle(fontWeight: FontWeight.w900,color: AppColors.white, fontSize: 12, fontFamily: AppFont.font)
                                  // )
                                ],
                              ),
                            ),
                            SizedBox(height: 3,),
                            controller.searchUser.value[index].designation != null && controller.searchUser.value[index].designation!.isNotEmpty ? Text(controller.searchUser.value[index].designation!,
                                style: TextStyle(fontWeight: FontWeight.w900,color: AppColors.white, fontSize: 16, fontFamily: AppFont.font))
                            : Container(),
                            SizedBox(height: 3,),
                            Text("${controller.searchUser.value[index].age ?? ""}, ${controller.searchUser.value[index].heightInch ?? ""}",
                                style: TextStyle(fontWeight: FontWeight.w900,color: AppColors.white, fontSize: 16, fontFamily: AppFont.font)),
                            SizedBox(height: 3,),
                            controller.searchUser.value[index].location != null && controller.searchUser.value[index].location!.isNotEmpty ? Text(controller.searchUser.value[index].location!,
                                style: TextStyle(fontWeight: FontWeight.w900,color: AppColors.white, fontSize: 16, fontFamily: AppFont.font)) : Container(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  showFilterBottomSheet(context){
    var selCat = 0.obs;
    return Get.bottomSheet(
        SafeArea(
          bottom: true,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(10))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filters',
                          style: TextStyle(fontFamily: AppFont.font, fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.close, color: Colors.black,)),
                    )
                  ]
                ),
                Divider(height: 4,color: Colors.grey,),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration:  BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors
                                            .white,
                                        width: 1))),
                            child: ListView(
                                physics: ClampingScrollPhysics(),
                                // mainAxisSize: MainAxisSize.max,
                                //   crossAxisAlignment:
                                //       CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: 20),
                                  for (int i = 0;
                                  i <
                                      controller.filterCatList
                                          .value.length;
                                  i++)
                                    Obx(() =>
                                        InkWell(
                                      onTap: () {
                                        selCat.value = i;
                                        selCat.refresh();
                                      },
                                      child: Container(
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width,
                                        color: (selCat.value ==
                                            i)
                                            ? Colors.grey.shade200
                                            : Colors.grey.shade50,
                                        padding:
                                        const EdgeInsets.only(
                                            left: 12.0,
                                            top: 24,
                                            bottom: 24),
                                        child:
                                        Text(controller.filterCatList.value[i].category!,
                                        style: TextStyle(fontFamily: AppFont.font, fontSize: 14, color: AppColors.textColor, fontWeight: FontWeight.w300),),
                                      ),
                                    )

                                    ),
                                ]),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors
                                            .white,
                                        width: 1))),
                            child: Obx(() => FilterOptionsCard(
                              selectedIndex: getIndexedElement(controller.filterCatList.value[selCat.value].filterOptions!),
                              optionsList: controller.filterCatList.value[selCat.value].filterOptions!,
                            index: selCat.value,
                            controller: controller,)
                            )
                          )),
                    ],
                  ),
                ),
                Divider(height: 4,color: Colors.grey,),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          color: Colors.transparent,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Clear all',
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {
                          controller.filterApplied = true;
                          controller.getFilterUser();
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.9,
                          child: Center(
                            child: Text('Apply',
                                style: TextStyle(color: AppColors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                // Expanded(
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Expanded(
                //           flex: 3,
                //           child: Container(
                //             decoration: const BoxDecoration(
                //                 color: AppColors.bottomColor,
                //                 border: Border(
                //                     top: BorderSide(
                //                         color: AppColors
                //                             .bottomColor,
                //                         width: 1))),
                //             child: ListView(
                //                 physics: ClampingScrollPhysics(),
                //                 // mainAxisSize: MainAxisSize.max,
                //                 //   crossAxisAlignment:
                //                 //       CrossAxisAlignment.start,
                //                 children: [
                //                   // SizedBox(height: 20)
                //                   for (int i = 0; i < controller.filterCatList.value.length; i++)
                //                     InkWell(
                //                       child: Container(
                //                         child: Padding(
                //                           padding:
                //                           const EdgeInsets.only(
                //                               left: 12.0,
                //                               top: 24,
                //                               bottom: 24),
                //                           child: Text(
                //                               controller.filterCatList.value[i].category!
                //                               ),
                //                         ),
                //                       ),
                //                     )
                //
                //
                //                 ]),
                //           )),
                //       // Expanded(
                //       //     flex: 5,
                //       //     child: Container(
                //       //       decoration: const BoxDecoration(
                //       //           border: Border(
                //       //               top: BorderSide(
                //       //                   color: AppColors
                //       //                       .settingsPanelColor,
                //       //                   width: 1))),
                //       //       child: Obx(
                //       //             () => ListView(
                //       //           physics:
                //       //           ClampingScrollPhysics(),
                //       //           children: [
                //       //             FilterOptionsWidget(
                //       //               index: selectedOption
                //       //                   .value -
                //       //                   1,
                //       //               isImageShown: controller
                //       //                   .filteringData
                //       //                   .value[
                //       //               selectedOption.value -
                //       //                   1]
                //       //                   .fieldType ==
                //       //                   "user"
                //       //                   ? true
                //       //                   : false,
                //       //               isSortBy: false,
                //       //               filterConditions: controller
                //       //                   .filteringData
                //       //                   .value[selectedOption.value -
                //       //                   1]
                //       //                   .fieldType ==
                //       //                   "user" ||
                //       //                   controller
                //       //                       .filteringData
                //       //                       .value[selectedOption.value -
                //       //                       1]
                //       //                       .fieldType ==
                //       //                       "multiselect" ||
                //       //                   controller
                //       //                       .filteringData
                //       //                       .value[selectedOption.value -
                //       //                       1]
                //       //                       .fieldType ==
                //       //                       "tag"
                //       //                   ? controller
                //       //                   .multiSelectValues
                //       //                   : controller
                //       //                   .singleSelectValue,
                //       //               initialData:
                //       //               getInitialData(
                //       //                   selectedOption
                //       //                       .value),
                //       //               // controller.filteringData.value[selectedOption.value - 1].fieldType == "user"
                //       //               //     || controller.filteringData.value[selectedOption.value - 1].fieldType == "multiselect" ||
                //       //               //     controller.filteringData.value[selectedOption.value - 1].fieldType == "tag" ?
                //       //               // controller.multiSelectValues[1] : controller.singleSelectValue[0],
                //       //               alreadySelectedIndex:
                //       //               controller
                //       //                   .optionChoosen,
                //       //               filterData: controller
                //       //                   .filteringData
                //       //                   .value[
                //       //               selectedOption
                //       //                   .value -
                //       //                   1],
                //       //               tempAppliedFilterData:
                //       //               controller
                //       //                   .tempAppliedFilterData
                //       //                   .value,
                //       //               cont: controller,
                //       //             ),
                //       //           ],
                //       //         ),
                //       //       ),
                //       //     )),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true);
  }

  FilterOptions getIndexedElement(List<FilterOptions>? options){
    List<FilterOptions> selOption = options!.where((element) => element.isSelected!).toList();
    if(selOption.length > 0){
      return selOption.first;
    }
    return options.first;
  }

}