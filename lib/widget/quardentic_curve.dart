import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
class MyWaveClipper extends StatefulWidget{

  @override
  _MyWaveClipperState createState() => _MyWaveClipperState();
}

class _MyWaveClipperState extends State<MyWaveClipper> {

   final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  String dropdownValue = 'Myself';
  String dropdownValue1 = 'FeMale';
  String dropdownValue2 = 'Hindu';
  String dropdownValue3 = 'BC';
  String dropdownValue4 = 'Tamil';
  String dropdownValue5 = 'Bramin';
  String dropdownValue6 = 'Karukkupattaiyathar';
  String dropdownValue7 = 'Chennai';
  String dropdownValue8 = 'Chennai';
  String dropdownValue9 = 'Tamilnadu';
  String dropdownValue10 = 'India';
  String dropdownValue11 = 'Indian';
  String dropdownValue12 = 'Chennai';
  String dropdownValue13 = 'Chennai';
  String dropdownValue14 = 'Tamilnadu';
  String dropdownValue15 = 'India';
  String dropdownValue16 = 'Indian';
  String dropdownValue17 = 'Fair';
  String dropdownValue18 = 'Vegitarian';
  String dropdownValue19 = 'Single';
  String dropdownValue20 = 'B.E';
  String dropdownValue21 = 'Chennai';
  String dropdownValue22 = 'Aries';
  String dropdownValue23 = 'Ashwini';
  String dropdownValue24 = 'Ashwini';
  String dropdownValue25 = 'Yes';
  String dropdownValue26 = 'Yes';
  String dropdownValue27 = 'Yes';
  String dropdownValue28 = '0';
  String dropdownValue29 = '0';
  String dropdownValue30 = '0';
  String dropdownValue31 = '0';
  String dropdownValue32 = '0';
  String dropdownValue33 = '0';
  String dropdownValue34 = '0';
  String dropdownValue35 = '0';
  late ScrollController _stepperScrollController;

  @override
  void initState() {
    super.initState();
    _stepperScrollController = ScrollController(keepScrollOffset: false)
      ..addListener(() => controlScroll());
  }

  // You can do whatever you want with the scrollController listener
  void controlScroll() {
    print(_stepperScrollController.offset);
  }

  int currentStep = 0;
  bool isCompleted = false;
  final Firstname = TextEditingController();
  final Lastname = TextEditingController();
  final Email = TextEditingController();
  final PhoneNumber = TextEditingController();

  bool _secureText = true;
  bool? remember = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  late String Idcard, password;
  final _key = new GlobalKey<FormState>();
check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();

      login();

      // loginwithphone();

    }
  }

  

  login() async {
    print(Idcard);
    print(password);
    final response = await http.post(
      Uri.parse("http://192.168.1.6:4000/users/userLogin"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Idcard": Idcard,
        "password": password,
      }),
    );

    print(response.body);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print("object");
      print(data);
      setState(() {
        currentStep = 1;
        print(currentStep = 1);
      });
      loginToast("Login Sucessfull");
    } else if (response.statusCode == 400) {
      loginToast("Email or password is not correct");
    } else {
      loginToast("Login Failed");
    }
  }

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 

        body:Container(
          
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"), fit: BoxFit.cover)),

        

          child: Container(
            
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RotatedBox(
                quarterTurns: -2,
                child: Container( 
                  // padding: EdgeInsets.only(top: 100),
                   child:Stack(children: <Widget>[ 
                    // Image(image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80"), width: 10,),
                    Container(
                      color: Colors.black,
                      width: 10,
                      height: 10,
                    ),
                    RotatedBox(
                      quarterTurns: 2,
                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                                                          child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                                                        ),
                                                        Text('Back',
                                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                        ),
                    ),
                    
                    //stack overlaps widgets
                        Opacity( //semi red clippath with more height and with 0.5 opacity
                          opacity: 0.5, 
                          child: ClipPath( 
                              clipper:WaveClipper(), //set our custom wave clipper
                                child:
                                    Container( 
                                        color:Colors.white,
                                        height:570,
                                    ),
                                  
                             ),
                        ),
              
                        ClipPath(  //upper clippath with less height
                            clipper:WaveClipper(), //set our custom wave clipper.
                              child:Container( 
                                  padding: EdgeInsets.only(bottom: 50),
                                  color:Colors.white,
                                  height:550,
                                  alignment: Alignment.center,
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 250),
                                          child: Container(
                                            width: 100,
                                            height: 50,
                                            child: StepProgressIndicator(
    totalSteps: 10,
    currentStep: 6,
    selectedColor: Colors.grey,
    unselectedColor: Colors.blue,
),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 5, right: 150, left: 30),
                                              child: Text("Register", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold))),
                                          Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text("Go to login", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold))),
                                          
                                          ],
                                        ),
                                        isCompleted
                                                  ? Container()
                                                  : Theme(
                                                      data: Theme.of(context).copyWith(
                                                          colorScheme: ColorScheme.light(primary: Color(0xFF0C8CE9)), 
                                                          
                                                          ),
                                                      child: Container(
                                                        child: Stepper(
                                                            // controlsBuilder: (context, ControlsDetails details)
                                                            type: StepperType.vertical,
                                                            physics: ScrollPhysics(),
                                                            
                                                            steps: getStep(),
                                                            currentStep: currentStep,
                                                            onStepContinue: () {
                                                              final isLastStep = currentStep == getStep().length - 1;
                                                              final isFrstStep = currentStep == 0;
                                                              final issecondStep = currentStep == 1;
                                                              final isthirdStep = currentStep == 2;
                                                              
                                                              if (isLastStep) {
                                                                setState(() => isCompleted = true);
                                                                print('Completed');
                                                              } else if (isFrstStep) {
                                                                setState(() => check());
                                                              
                                                                print('barat');
                                                              } else if (issecondStep) {
                                                                setState(() => currentStep += 2);
                                                                print("object");
                                                              } else if (isthirdStep) {
                                                                setState(() => currentStep += 3);
                                                                print("object");
                                                              } else {
                                                                print(isFrstStep);
                                                                // setState(() => currentStep += 1);
                                                              }
                                                            },
                                                            onStepTapped: (step) => setState(() => currentStep = step),
                                                            onStepCancel: currentStep == 0
                                                                ? null
                                                                : () => setState(() => currentStep -= 1),
                                                              
                                                            controlsBuilder:
                                                                ((BuildContext context, ControlsDetails controls,
                                                                    {VoidCallback? onStepContinue,
                                                                    VoidCallback? onStepCancel}) {
                                                              final isLastStep = currentStep == getStep().length - 1;
                                                              return Container(
                                                                margin: EdgeInsets.only(top: 50),
                                                                child: Row(
                                                                  children: [
                                                                    if (currentStep != 0)
                                                                      ElevatedButton(
                                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                                      
                                        onPressed: controls.onStepCancel,
                                        child: Text("Back")),
                                                                    
                                                                    SizedBox(
                                                                      width: 12,
                                                                    ),
                                                                    ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
                                      onPressed: controls.onStepContinue,
                                      child: Text(isLastStep ? "Confirm" : "Next")),
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                            //  controlsBuilder: (BuildContext context, ControlsDetails details)
                                                          ),
                                                          
                                                      ),
                                                    ),
                                    
                                      ],),
                                    ),
                                    
                                  ),
                             ),
                        ),
                   ],)
                ),
              ),
              
            ),
          ),
          
        ),
        
        
    );
    
  }
  List<Step> getStep() => [
    
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: Text("Basic Information", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
            
            content: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Profile For",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.emoji_people , color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Myself', 'Friend', 'Brother', 'Sister', "Son", "Daughter"]
                        .map<DropdownMenuItem<String>>((String value) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "First Name",
                      labelText: "FirstName",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: Lastname,
                         validator: (e) {
                      if (e!.isEmpty) {
                        return "Please Insert passowrd";
                      }
                    },
                    onSaved: (e) => password = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Last Name",
                      labelText: "LastName",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.nature_people , color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue1,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue1 = newValue1!;
                      });
                    },
                    items: <String>['FeMale', 'Male', 'other']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0, top: 8.0, bottom: 8.0),
                          child: ElevatedButton(
                            
                            child: Text("OTP"), onPressed: (){},),
                        ),
                      ),
                      prefixIcon: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final code = await countryPicker.showPicker(
                                    context: context);
                                setState(() {
                                  countryCode = code;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: countryCode != null
                                        ? countryCode!.flagImage
                                        : null,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      countryCode?.dialCode ?? "+1",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ),
                    
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: Email,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.email, color: Colors.black),
                      ),
                    ),
                  ),
                  
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    //     validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Password Can't be Empty";
                    //   }
                    // },
                    // obscureText: _secureText,
                    // onSaved: (e) => password = e!,
                    style: TextStyle(),
            
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.password, color: Colors.black),
                      ),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                    SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    //     validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Password Can't be Empty";
                    //   }
                    // },
                    // obscureText: _secureText,
                    // onSaved: (e) => password = e!,
                    style: TextStyle(),
            
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.password, color: Colors.black),
                      ),
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text("Basic Information", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
            content: Column(
              children: [
                SizedBox(
                    height: 30,
                  ),
                DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Religion",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue2,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue2 = newValue1!;
                      });
                    },
                    items: <String>['Hindu', 'Christian', 'Muslim']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Community",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue3,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue3 = newValue1!;
                      });
                    },
                    items: <String>['BC', 'MBC', 'SC']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Mother Tounge",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue4,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue4 = newValue1!;
                      });
                    },
                    items: <String>['Tamil', 'Malayalam', 'Hindi']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Caste",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue5,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue5 = newValue1!;
                      });
                    },
                    items: <String>['Bramin', 'Nadar', 'vishwakarma']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Sub-Caste",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue6,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue6 = newValue1!;
                      });
                    },
                    items: <String>['Karukkupattaiyathar', 'Mel-nattar', 'Kammalar']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  
              ],
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: Text("Address Details", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
            content: Column(
              children: [
                SizedBox(
                    height: 10,
                  ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(text: TextSpan(text: "Communcation Address", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25)))),
                SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Door no",
                      labelText: "Door no",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Street",
                      labelText: "Street",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Area",
                      labelText: "Area",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "City",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue7,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue7 = newValue1!;
                      });
                    },
                    items: <String>['Chennai', 'Maduari', 'Theni']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "District",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue8,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue8 = newValue1!;
                      });
                    },
                    items: <String>['Chennai', 'Maduari', 'Theni']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "State",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue9,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue9 = newValue1!;
                      });
                    },
                    items: <String>['Tamilnadu', 'Kerala', 'Telangana']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Country",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue10,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue10 = newValue1!;
                      });
                    },
                    items: <String>['India', 'US', 'UAE']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Nationality",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue11,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue11 = newValue1!;
                      });
                    },
                    items: <String>['Indian', 'American', 'United Arab Emirates']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(text: TextSpan(text: "Permanent Address", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25)))),
                      SizedBox(
                    height: 30,
                  ),

                    TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Door no",
                      labelText: "Door no",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Street",
                      labelText: "Street",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Area",
                      labelText: "Area",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "City",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue12,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue12 = newValue1!;
                      });
                    },
                    items: <String>['Chennai', 'Maduari', 'Theni']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "District",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue13,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue13 = newValue1!;
                      });
                    },
                    items: <String>['Chennai', 'Maduari', 'Theni']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "State",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue14,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue14 = newValue1!;
                      });
                    },
                    items: <String>['Tamilnadu', 'Kerala', 'Telangana']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Country",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue15,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue15 = newValue1!;
                      });
                    },
                    items: <String>['India', 'US', 'UAE']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Nationality",
                      labelStyle: TextStyle(color: Colors.blue),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue16,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue16 = newValue1!;
                      });
                    },
                    items: <String>['Indian', 'American', 'United Arab Emirates']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),

                ],
            )),

        // ------------

        Step(
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
            title: Text("Personal Details", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
            content: Column(
              children: [
                SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Height",
                      labelText: "Height",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Weight",
                      labelText: "Weight",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Hobbies",
                      labelText: "Hobbies",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Skin Tone",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue17,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue17 = newValue1!;
                      });
                    },
                    items: <String>['Fair', 'Medium', 'Light', 'Dark']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Diet",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue18,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue18 = newValue1!;
                      });
                    },
                    items: <String>['Vegitarian', 'Non-Vegitarian']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Martial Details",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue19,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue19 = newValue1!;
                      });
                    },
                    items: <String>['Single', 'Married', 'Divorce']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "No.of Children",
                      labelText: "No.of Children",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Children Status",
                      labelText: "Children Status",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            )),

        Step(
            state: currentStep > 4 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 4,
            title: Text("Carrier & Working Details", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
            content: Column(
              
              children: [
                SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Educational Qualification",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue20,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue20 = newValue1!;
                      });
                    },
                    items: <String>['B.E', 'B.Com', 'B.Sc']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Working thirumanam",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue21,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue21 = newValue1!;
                      });
                    },
                    items: <String>['Chennai', 'Maduari', 'Banglore']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Working as",
                      labelText: "Working as",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Company Details",
                      labelText: "Company Details",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Annual Income",
                      labelText: "Annual Income",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            )),

        Step(
            state: currentStep > 5 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 5,
            title: Text("Carrier & Working Details", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
            content: Column(
              children: [
                
                  SizedBox(
                    height: 30,
                  ),

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Rasi",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue22,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue22 = newValue1!;
                      });
                    },
                    items: <String>['Aries', 'Taurus', 'Gemini','Cancer','Leo','Virgo','Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Natchathiram",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue23,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue23 = newValue1!;
                      });
                    },
                    items: <String>['Ashwini', 'Bharani', 'Krittika','Rohini','Mrighasira','Ardra','Punarvasu','Pushya','Ashlesha','Magha','Purva Phalguni','Uttara Phalguni','Hasta','Chitra','Swati','Vishaka',]
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Laknam",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue24,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue24 = newValue1!;
                      });
                    },
                    items: <String>['Ashwini', 'Bharani', 'Krittika','Rohini','Mrighasira','Ardra','Punarvasu','Pushya','Ashlesha','Magha','Purva Phalguni','Uttara Phalguni','Hasta','Chitra','Swati','Vishaka',]
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Gothram",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue25,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue25 = newValue1!;
                      });
                    },
                    items: <String>['Yes', 'No']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                                    DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Kuladeivam",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue26,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue26 = newValue1!;
                      });
                    },
                    items: <String>['Yes', 'No']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  

                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Dosham",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue27,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue27 = newValue1!;
                      });
                    },
                    items: <String>['Yes', 'No']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "If Yes Details",
                      labelText: "If Yes Details",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            )),

        Step(
            isActive: currentStep >= 6,
            
            title: Text("Family Details", style: GoogleFonts.nunito(textStyle: Theme.of(context).textTheme.displaySmall, fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
            content: Column(
              children: [
                SizedBox(height: 30,),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Father Name",
                      labelText: "Father Name",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Father Occupation",
                      labelText: "Father Occupation",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Mother Name",
                      labelText: "Mother Name",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    // controller: Firstname,
                    //      validator: (e) {
                    //   if (e!.isEmpty) {
                    //     return "Please Insert Idcard";
                    //   }
                    // },
                    // onSaved: (e) => Idcard = e!,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Mother Occupation",
                      labelText: "Mother Occupation",
                      hintStyle: TextStyle(fontFamily: "nunto"),
                      labelStyle: TextStyle(fontFamily: "nunto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.people, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "No of Brother",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue28,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue28 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "No of Brother Married",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue29,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue29 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "No of Sister",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue30,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue30 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "No of Sister Married",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue31,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue31 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Own Vehicle",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue32,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue32 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Own House",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue33,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue33 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Own Lands",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue34,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue34 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30,),
                  DropdownButtonFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      
                      labelText: "Own Flats",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 21),
                      // hintText: "aa",
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor: Colors.grey.shade100,
                    ),
                    icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    
                    value: dropdownValue35,
                    onChanged: (String? newValue1) {
                      setState(() {
                        dropdownValue35 = newValue1!;
                      });
                    },
                    items: <String>['0', '1']
                        .map<DropdownMenuItem<String>>((String value1) {
                          
                          
                      return DropdownMenuItem<String>(
                        
                        value: value1,
                        child: Text(
                          value1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "nunto"),
                        ),
                        
                      );
                    }).toList(),
                  ),
                  
              ],
            )),
      ];
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    
      var path = new Path();
      path.lineTo(0, size.height); //start path with this if you are making at bottom
      
      var firstStart = Offset(size.width / 5, size.height); 
      //fist point of quadratic bezier curve
      var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
      //second point of quadratic bezier curve
      path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

      var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105); 
      //third point of quadratic bezier curve
      var secondEnd = Offset(size.width, size.height - 10);
      //fourth point of quadratic bezier curve
      path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

      path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
      path.close();
      return path; 
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
     return false; //if new instance have different instance than old instance 
     //then you must return true;
  }
}