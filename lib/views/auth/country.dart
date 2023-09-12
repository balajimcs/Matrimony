import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class CountryStateCityPicker extends StatefulWidget {
  TextEditingController country;
  TextEditingController state;
  TextEditingController distict;
  TextEditingController city;
  InputBorder? textFieldInputBorder;

  CountryStateCityPicker({required this.distict,required this.country, required this.state, required this.city, this.textFieldInputBorder, });

  @override
  _CountryStateCityPickerState createState() => _CountryStateCityPickerState();
}

class _CountryStateCityPickerState extends State<CountryStateCityPicker> {
  List<CountryModel> _countryList=[];
  List<StateModel> _stateList=[];
  List<CityModel> _cityList=[];
  List<DistrictModel> _discrictList=[];

  List<CountryModel> _countrySubList=[];
  List<StateModel> _stateSubList=[];
  List<CityModel> _citySubList=[];
  List<DistrictModel> _discrictSubList=[];
  String _title='';

  @override
  void initState() {
    super.initState();
    _getCountry();
  }

  Future<void> _getCountry()async{
    _countryList.clear();
    var jsonString = await rootBundle.loadString('packages/country_state_city_pro/assets/country.json');
    List<dynamic> body = json.decode(jsonString);
    setState(() {
      _countryList = body.map((dynamic item) => CountryModel.fromJson(item)).toList();
      _countrySubList=_countryList;
    });
  }

  Future<void> _getState(String countryId)async{
    _stateList.clear();
    _discrictList.clear();
    _cityList.clear();
    List<StateModel> _subStateList=[];
    var jsonString = await rootBundle.loadString('packages/country_state_city_pro/assets/state.json');
    List<dynamic> body = json.decode(jsonString);

    _subStateList = body.map((dynamic item) => StateModel.fromJson(item)).toList();
    _subStateList.forEach((element) {
      if(element.countryId==countryId){
        setState(() {
          _stateList.add(element);
        });
      }
    });
    _stateSubList=_stateList;
  }

 

  Future<void> _getCity(String stateId)async{
    _cityList.clear();
    List<CityModel> _subCityList=[];
    var jsonString = await rootBundle.loadString('packages/country_state_city_pro/assets/city.json');
    List<dynamic> body = json.decode(jsonString);

    _subCityList = body.map((dynamic item) => CityModel.fromJson(item)).toList();
    _subCityList.forEach((element) {
      if(element.stateId==stateId){
        setState(() {
          _cityList.add(element);
        });
      }
    });
    _citySubList = _cityList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Country TextField
        TextField(
          style: TextStyle(fontSize: 15,fontFamily: "Raleway"),
          controller: widget.country,
          onTap: (){
            setState(()=>_title='Country');
            _showDialog(context);
          },
          decoration: InputDecoration(
              isDense: true,
              fillColor: Color(0xffEAF12D),
              filled: true,
              hintText: 'country'.tr,
              labelText: 'country'.tr,
              labelStyle: TextStyle(fontSize: 19,fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
              hintStyle: TextStyle(fontSize: 15,fontFamily: "Raleway",color: Color(0xFF134FAF)),
              prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF), size: 25),
                    ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),size: 23,
                    ),
              ),
              border: widget.textFieldInputBorder?? OutlineInputBorder()
          ),
          readOnly: true,
        ),
        SizedBox(height: 20.0),

        ///State TextField
        TextField(
          controller: widget.state,
          style: TextStyle(fontSize: 15,fontFamily: "Raleway"),
          onTap: (){
            setState(()=>_title='State');
            if(widget.country.text.isNotEmpty)
            _showDialog(context);
            else _showSnackBar('Select Country');
          },
          decoration: InputDecoration(
              isDense: true,
              fillColor: Color.fromRGBO(234, 241, 45, 1),
              filled: true,
              hintText: 'state'.tr,
              labelText: 'state'.tr,
              labelStyle: TextStyle(fontSize: 19,fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
              hintStyle: TextStyle(fontSize: 15,fontFamily: "Raleway"),
              
              prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF), size: 25),
                    ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),size: 23,
                    ),
              ),
              border: widget.textFieldInputBorder?? OutlineInputBorder()
          ),
          readOnly: true,
        ),
        SizedBox(height: 20.0),

        ///City TextField
        TextField(
          style: TextStyle(fontSize: 15,fontFamily: "Raleway"),
          controller: widget.distict,
          onTap: (){
            setState(()=>_title='District');
            if(widget.state.text.isNotEmpty)
              _showDialog(context);
            else _showSnackBar('Select State');
          },
          decoration: InputDecoration(
              isDense: true,
              fillColor: Color(0xffEAF12D),
              filled: true,
              hintText: 'district'.tr,
              labelText: 'district'.tr,
              labelStyle: TextStyle(fontSize: 18,fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
              hintStyle: TextStyle(fontSize: 15,fontFamily: "Raleway"),
              
               prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF), size: 25,),
                    ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),size: 23,
                    ),
              ),
              border: widget.textFieldInputBorder?? OutlineInputBorder()
          ),
          readOnly: true,
        ),
         SizedBox(height: 20.0),

        ///City TextField
        TextField(
          style: TextStyle(fontSize: 15,fontFamily: "Raleway"),
          controller: widget.city,
          onTap: (){
            setState(()=>_title='City');
            if(widget.state.text.isNotEmpty)
              _showDialog(context);
            else _showSnackBar('Select District');
          },
          decoration: InputDecoration(
              isDense: true,
              fillColor: Color(0xffEAF12D),
              filled: true,
              hintText: 'city'.tr,
              labelText: 'city'.tr,
              labelStyle: TextStyle(fontSize: 18,fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold),
              hintStyle: TextStyle(fontSize: 15,fontFamily: "Raleway"),
              
               prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.person, color: Color(0xFF134FAF), size: 25,),
                    ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xFF134FAF),size: 23,
                    ),
              ),
              border: widget.textFieldInputBorder?? OutlineInputBorder()
          ),
          readOnly: true,
        ),
      ],
    );
  }

  void _showDialog(BuildContext context){
    TextEditingController _controller=TextEditingController();
    TextEditingController _controller2=TextEditingController();
    TextEditingController _controller3=TextEditingController();
    TextEditingController _controller4=TextEditingController();

    showGeneralDialog(
      barrierLabel: _title,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context,__,___){
        return Material(
          color: Colors.transparent,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState){
              return Align(
                alignment: Alignment.topCenter,
                child:  Container(
                  height: MediaQuery.of(context).size.height*.7,
                  margin: EdgeInsets.only(top: 60, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(_title,style: TextStyle(color:Colors.grey.shade800,
                          fontSize: 17,fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      ///Text Field
                      TextField(
                        controller: _title=='Country'
                            ? _controller
                            : _title=='State'
                            ? _controller2
                            : _title=='District'
                            ? _controller3
                            : _controller4,
                        onChanged: (val){
                          setState(() {
                            if(_title=='Country'){
                              _countrySubList = _countryList.where((element) =>
                                  element.name.toLowerCase().contains(_controller.text.toLowerCase())).toList();
                            }
                            else if(_title=='State'){
                              _stateSubList = _stateList.where((element) =>
                                  element.name.toLowerCase().contains(_controller2.text.toLowerCase())).toList();
                            }
                            else if(_title=='District'){
                              _citySubList = _cityList.where((element) =>
                                  element.name.toLowerCase().contains(_controller3.text.toLowerCase())).toList();
                            }
                            else if(_title=='City'){
                              _citySubList = _cityList.where((element) =>
                                  element.name.toLowerCase().contains(_controller4.text.toLowerCase())).toList();
                            }
                          });
                        },
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16.0
                        ),
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Search here...",
                            contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                            isDense: true,
                            prefixIcon: Icon(Icons.search)
                        ),
                      ),
                      ///Dropdown Items
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: _title=='Country'
                                ? _countrySubList.length
                                : _title=='State'
                                ? _stateSubList.length
                                : _title=='District'
                                ? _citySubList.length
                                : _citySubList.length,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: ()async{
                                  setState((){
                                    if(_title=="Country"){
                                      widget.country.text= _countrySubList[index].name;
                                      _getState(_countrySubList[index].id);
                                      _countrySubList=_countryList;
                                      widget.state.clear();
                                      widget.distict.clear();
                                      widget.city.clear();
                                    }
                                    else if(_title=='State'){
                                      widget.state.text= _stateSubList[index].name;
                                      _getCity(_stateSubList[index].id);
                                      _stateSubList = _stateList;
                                      widget.distict.clear();
                                      widget.city.clear();
                                    }
                                    else if(_title=='District'){
                                      widget.distict.text= _citySubList[index].name;
                                      _citySubList = _cityList;
                                    }
                                    else if(_title=='City'){
                                      widget.city.text= _citySubList[index].name;
                                      _citySubList = _cityList;
                                    }
                                  });
                                  _controller.clear();
                                  _controller2.clear();
                                  _controller3.clear();
                                  _controller4.clear();
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.0,left: 10.0,right: 10.0),
                                  child: Text(
                                      _title=='Country'
                                          ? _countrySubList[index].name
                                          : _title=='State'
                                          ? _stateSubList[index].name
                                          : _title=='District'
                                          ? _citySubList[index].name
                                          :_citySubList[index].name,
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 16.0
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          if(_title=='City' && _citySubList.isEmpty){
                            widget.city.text= _controller4.text;
                          }
                          _countrySubList=_countryList;
                          _stateSubList = _stateList;
                          _citySubList = _cityList;

                          _controller.clear();
                          _controller2.clear();
                          _controller3.clear();
                          _controller4.clear();
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      transitionBuilder: (_,anim,__,child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
          content: Text(message,
              textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontSize: 16.0)))
    );
  }
}


class StateModel {
  String id;
  String name;
  String countryId;

  StateModel({required this.id, required this.name, required this.countryId});

  factory StateModel.fromJson(Map<String, dynamic> json){
    return StateModel(
        id: json['id'] as String,
        name: json['name'] as String,
        countryId: json['country_id'] as String
    );
  }
}


class CountryModel {
  String id;
  String sortName;
  String name;
  String phoneCode;

  CountryModel(
      {required this.id,
      required this.sortName,
      required this.name,
      required this.phoneCode});

  factory CountryModel.fromJson(Map<String, dynamic> json){
    return CountryModel(
        id: json['id'] as String,
        sortName: json['sortname'] as String,
        name: json['name'] as String,
        phoneCode: json['phonecode'] as String
    );
  }
}


class CityModel {
  String id;
  String name;
  String stateId;

  CityModel({required this.id, required this.name, required this.stateId});

  factory CityModel.fromJson(Map<String, dynamic> json){
    return CityModel(
        id: json['id'] as String,
        name: json['name'] as String,
        stateId: json['state_id'] as String,
    );
  }
}

class DistrictModel {
  String id;
  String name;
  String stateId;

  DistrictModel({required this.id, required this.name, required this.stateId});

  factory DistrictModel.fromJson(Map<String, dynamic> json){
    return DistrictModel(
        id: json['id'] as String,
        name: json['name'] as String,
        stateId: json['state_id'] as String,
    );
  }
}
