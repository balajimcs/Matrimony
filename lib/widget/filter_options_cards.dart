import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thirumanam/controller/search_controller.dart';

import '../models/data_model.dart';
import '../resources/app_colors.dart';

class FilterOptionsCard extends GetView{

  FilterOptions? selectedIndex;
  List<FilterOptions>? optionsList;
  SearchController? controller;
  int? index;

  FilterOptionsCard({this.selectedIndex, this.optionsList, this.controller, this.index});

  var liveSel = FilterOptions().obs;

  @override
  Widget build(BuildContext context) {
    liveSel.value = selectedIndex!;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
        // color: AppColors.filterbg,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4.0,),
      ),
      child: Obx(() => DropdownButton(
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down_sharp, color: Colors.grey.shade600,),
        underline: Container(),
        onChanged: (newValue) {
          int? ind;
          liveSel.value = newValue!;
          List<FilterOptions>? temp = controller?.filterCatList.value[index!].filterOptions?.where((element) => element.isSelected!).toList();
          if(temp!.length > 0){
            ind = controller?.filterCatList.value[index!].filterOptions?.indexOf(temp.first);
            temp.first.isSelected = false;
            controller?.filterCatList.value[index!].filterOptions?.removeAt(ind!);
            controller?.filterCatList.value[index!].filterOptions?.insert(ind!, temp.first);
          }
          controller?.filterCatList.value[index!].isCatSel = true;
          ind = controller?.filterCatList.value[index!].filterOptions?.indexOf(newValue);
          controller?.filterCatList.value[index!].filterOptions?[ind!].isSelected = true;
          controller?.filterCatList.refresh();
          // controller?.filt er!.add({"controller?.filterCatList.value[index!].category!": "${
          //   controller?.filterCatList.value[index!].filterOptions?[ind!]
          //       .options!
          // }" });
          if(index == 9){
            controller!.stateSelected = true;
            controller!.selectedState.value = controller!.stateModel.where((sModel) => sModel.name == newValue.options).first.code!;
            controller!.getCity(false);
          }
        },
        value: liveSel.value,
        items: optionsList!.map((FilterOptions option) {
          return DropdownMenuItem(
            child: new Text(
              option.options!,
            ),
            value: option,
          );
        }).toList(),
      )),
    );
  }

}