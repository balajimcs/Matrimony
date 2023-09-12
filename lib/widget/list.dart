import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/stepper_register_controller.dart';
class Item {
  String date;
  String name;
  String billNo;
  String netWeight;
  String totalAmount;
  String totalSales;
  String sgst;
  String csgt;
  String igst;
  String createdOn;
  String giftvoc;

  Item({required this.date, required this.name, required this.billNo, required this.netWeight, required this.totalAmount, required this.totalSales, required this.sgst, required this.csgt, required this.igst, required this.createdOn, required this.giftvoc});
}
class ListPage extends StatefulWidget{
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  final controller = Get.find<StepperRegisterController>();
   final _formKey = GlobalKey<FormState>();
    bool _showSecondFields = false;
    final _formKey1 = GlobalKey<FormState>();
    bool _showSecondFields1 = false;
    final _formKey2 = GlobalKey<FormState>();
    
   TextEditingController msgController = TextEditingController(text: '');
  TextEditingController msgController1 = TextEditingController(text: '');
  TextEditingController msgController2 = TextEditingController(text: '');
  TextEditingController msgController3 = TextEditingController(text: '');
  TextEditingController msgController4 = TextEditingController(text: '');
  TextEditingController msgController5 = TextEditingController(text: '');
  TextEditingController msgController6 = TextEditingController(text: '');
  TextEditingController msgController7 = TextEditingController(text: '');
  TextEditingController msgController8 = TextEditingController(text: '');
  TextEditingController msgController9 = TextEditingController(text: '');
  TextEditingController msgController10 = TextEditingController(text: '');
   int currentStep = 0;
  var totalAmountState;
 var SalesAmount;
 var SGstAmount;
 var IGstAmount;
 var CGstAmount;
 var NetWeightAmount;
 final int pageSize = 10;
  int pageNumber = 1;
 
  Future<void> addItemToSharedPreferences(String Date, String Name,String billNo, String netWeight,String totalAmount,
  String totalSales,String sgst,String csgt,String igst,String createdOn,String giftvoc,) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> itemList = prefs.getStringList('items') ?? []; 
  itemList.add(Date);
  itemList.add(Name);
  itemList.add(billNo);
  itemList.add(netWeight);
  itemList.add(totalAmount);
  itemList.add(totalSales);
  itemList.add(sgst);
  itemList.add(csgt);
  itemList.add(igst);
  itemList.add(createdOn);
  itemList.add(giftvoc);
  await prefs.setStringList('items', itemList);
  getItemsFromSharedPreferences();
}
void removeItem(int index) {
  setState(() {
    itemList.removeAt(index);
  });
}
List<Item> itemList = [];

@override
  void initState() {
    super.initState();
    getItemsFromSharedPreferences();
    loadItems();
  }
   Future<void> loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int startIndex = (pageNumber - 1) * pageSize;
    int endIndex = startIndex + pageSize;
    List<Item> itemObjList = [];
    for (int i = startIndex; i < endIndex; i++) {
       List<String> itemStringList = prefs.getStringList('items') ?? [];
      if (itemStringList != null) {
        
      }
    }
    setState(() {
      itemObjList = itemList;
    });
  }
   Future<void> _goToNextPage() async {
    pageNumber++;
    itemList.clear();
    await loadItems();
  }

  Future<void> _goToPreviousPage() async {
    if (pageNumber > 1) {
      pageNumber--;
      itemList.clear();
      await loadItems();
    }
  }
 Future<void> getItemsFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemStringList = prefs.getStringList('items') ?? [];
    List<Item> itemObjList = [];
     String totalAmount = '';
     double netWeight = 0;
     String totalSales = '';
     double sgst = 0;
     double csgt = 0;
     double igst = 0;
    for (int i = 0; i < itemStringList.length; i += 11) {
      Item item = Item(
        date: itemStringList[i],
        name: itemStringList[i + 1],
        billNo: itemStringList[i + 2],
        netWeight: itemStringList[i + 3],
        totalAmount: itemStringList[i + 4],
        totalSales: itemStringList[i + 5],
        sgst: itemStringList[i + 6],
        csgt: itemStringList[i + 7],
        igst: itemStringList[i + 8],
        createdOn: itemStringList[i + 9],
        giftvoc: itemStringList[i + 10],
        
      );
      // print(totalAmount);
      itemObjList.add(item);
      totalAmount += item.totalAmount.toString();
      netWeight += double.parse(item.netWeight);
      totalSales += item.totalSales.toString();
      sgst += double.parse(item.sgst);
      csgt += double.parse(item.csgt);
      igst += double.parse(item.igst);


    }
    setState(() {
      
      itemList = itemObjList;
       totalAmountState = totalAmount;
       SalesAmount = totalSales;
       SGstAmount = sgst;
       CGstAmount = csgt;
      IGstAmount = igst;
      NetWeightAmount = netWeight;
       print(totalAmountState);
    });
  }
   
  
  @override
  Widget build(BuildContext context) {
    

 
    return Scaffold(
      backgroundColor: Color(0xFF134FAF),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                       IconButton(
                    onPressed:(){
                      Navigator.pop(context);
                      } ,
                                icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 25,),
                  ),
                   Text(
                "Add Product",
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
              ),
              SizedBox(width: 180,),
              InkWell(
                onTap: (){
                  showMenu(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFF134FAF),
        context: context,
        
        position: RelativeRect.fromLTRB(300, 50, 50, 30),
        items: [
          
          PopupMenuItem(
           
            value: 1,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
                setState(() {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text
 
              // Returning SizedBox instead of a Container
              return SizedBox(
                height: 800,
                child: Padding(
        padding: EdgeInsets.all(16.0),
        child:Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary: Color(0xFF134FAF)),
                                        ),
                                        child: Container(
                                          child: Form(
                                            key: _formKey,
                                            child:  Obx(() => Stepper(
                                                // controlsBuilder: (context, ControlsDetails details)
                                                type: StepperType.vertical,
                                                physics: ScrollPhysics(),
                                            
                                                steps: getStep(),
                                                currentStep:
                                                    controller.currentStep.value,
                                                onStepContinue: () {
                                                  final isLastStep =
                                                      controller.currentStep.value ==
                                                          getStep().length - 1;
                                                  final isFrstStep =
                                                      controller.currentStep.value == 0;
                                                  final issecondStep =
                                                      controller.currentStep.value == 1;
                                                  final isthirdStep =
                                                      controller.currentStep.value == 2;
                                                  
                                            
                                                  if (isLastStep) {
                                                    Get.back();
                                                               setState(() {
           addItemToSharedPreferences(msgController.text, msgController1.text, msgController2.text, msgController3.text, msgController4.text, msgController5.text, msgController6.text, msgController7.text, msgController8.text, msgController8.text, msgController9.text);
                                                               });
                                                    print("balaji");
                                                  } else if (isFrstStep) {
                                                      controller.currentStep.value = 1;
                                                      
                                                    print("object");
                                                  } else if (issecondStep) {
                                                      controller.currentStep.value = 2;
                                                                
                                                    print("object");
                                                  } else {
                                                    print(isFrstStep);
                                                   
                                                  }
                                                },
                                                onStepTapped: (step) => setState(
                                                    () => controller.currentStep.value =
                                                        step),
                                                onStepCancel: controller.currentStep.value ==
                                                        0
                                                    ? null
                                                    : () => setState(() =>
                                                        controller.currentStep.value -=
                                                            1),
                                            
                                                controlsBuilder: ((BuildContext
                                                        context,
                                                    ControlsDetails controls,
                                                    {VoidCallback? onStepContinue,
                                                    VoidCallback? onStepCancel}) {
                                                  final isLastStep =
                                                      controller.currentStep.value ==
                                                          getStep().length - 1;
                                                  return Container(
                                                    margin:
                                                        EdgeInsets.only(top: 50),
                                                    child: Row(
                                                      children: [
                                                        if (controller.currentStep.value !=
                                                            0)
                                                          ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  primary: Color(0xFF134FAF),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25.0))),
                                            
                                                              onPressed: 
                                                                
                                                                  controls
                                                                  .onStepCancel,
                                                              child: Text(
                                                                'back',
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      "Raleway",
                                                                ),
                                                              )),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        
                                                        ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color(0xFF134FAF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0))),
                                                            onPressed: (){
                                                                controls
                                                                .onStepContinue;  
                                                              
                                                              
                                                            },
                                                            child: Text(
                                                              isLastStep
                                                                  ? 'confirm'
                                                                  : 'next',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Raleway"),
                                                            )),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                                //  controlsBuilder: (BuildContext context, ControlsDetails details)
                                              ),
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
      
              );
            },
          );
                  

                });
              },
              child: Text("Add Items", style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "Raleway"),),
            ),
          ),
          PopupMenuItem(
            
             value: 2,
            child: InkWell(
              onTap: (){
                Dialogs.materialDialog(
                                            msg:
                                                'Total Amount and bills',
                                                msgStyle: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),
                                            // title: "Delete",
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                             
                                           
                                              SizedBox(
                                                height: 300,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Card(
                              elevation: 50,
                              shadowColor: Colors.white,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                              child: SizedBox(
                                height: 240,
                                  
                                child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10, top: 10),
                                                child: Expanded(
                                                  child: Text('Total Amt: ₹ 100000', overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w900,
                                                                  color: Colors.black, fontSize: 21),),
                                                ),
                                              ),
                                              
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Expanded(
                                              child: Text('Total Sales Amt: ₹ ${SalesAmount}', overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Raleway",
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black, fontSize: 18),),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Expanded(
                                              child: Text('Total SGST: ₹ ${SGstAmount}',overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: "Raleway",
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black, fontSize: 18),),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Expanded(
                                              child: Text('Total CGST: ₹ ${CGstAmount}', overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Raleway",
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black, fontSize: 18),),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Expanded(
                                              child: Text('Total IGST: ₹ ${IGstAmount}', overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Raleway",
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black, fontSize: 18),),
                                            ),
                                          ),
                                          
                                          
                                        ],
                                      ),
                                    ),
                                 
                              ),
                              
                            ),
                                                    ])))]);
              },
              child: Text("Total Amount",style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "Raleway"),),
            ),
          ),
          PopupMenuItem(
            
             value: 2,
            child: InkWell(
              onTap: (){
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Episode5()),
  );
              },
              child: Text("Add Receipt",style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "Raleway"),),
            ),
          ),
          
        ],
        elevation: 8.0,
      ).then((value){

// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null 


      if(value!=null)
       print(value);

       });
                },
                child: Icon(Icons.add_box_rounded, color: Colors.white,))
                    ],
                  ),
                ),
                 Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextField(
                                
                              
  //            onChanged: (text) {
  //             List<DetailedFilterModel> foodList =  controller.fetchDetailedFilter().where((item) => item.firstName.toLowerCase().contains(text.toLowerCase())); // Replace with your list source
  // },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xFF134FAF),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed:  (){}
                                    ),
                                    hintText: 'Search Product',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF134FAF)),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Sort by:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          _settingModalBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Text("Search by filter",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Raleway",
                                    color: Colors.white)),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    width: 1000,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: itemList.length == 0 ? Container(child: Center(child: Text("No items found", style: TextStyle(fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold, color: Colors.grey),),),):
                    
                    ListView.builder(
                      itemCount: itemList.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(top: 8,  bottom: 8),
                          child: InkWell(
                            onLongPress: (){
                               Dialogs.materialDialog(
                                            
                                             msg:
                                                'Actions',
                                                msgStyle: TextStyle(
                                                          fontSize: 18.0,
                                                          fontFamily: "Raleway",
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                            ),   
                                            color: Colors.white,
                                            context: context,
                                            dialogWidth: kIsWeb ? 0.3 : null,
                                            onClose: (value) => print(
                                                "returned value is '$value'"),
                                            actions: [
                                              
                                              SizedBox(
                                                height: 30,
                                                
                                                child: SingleChildScrollView(
                                                  
                                                  child: Column(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(Icons.remove_red_eye_outlined, color: Color(0xFF134FAF),),
                                                          SizedBox(width: 25,),
                                                          Icon(Icons.edit, color: Color(0xFF134FAF),),
                                                          SizedBox(width: 25,),
                                                          Icon(Icons.edit_note_sharp, color: Color(0xFF134FAF),),
                                                          SizedBox(width: 25,),
                                                          InkWell(
                                                            onTap: (){
                                                              Get.back();
                                                            },
                                                            child: Icon(Icons.cancel, color: Color(0xFF134FAF),)),
                                                          SizedBox(width: 25,),
                                                          Icon(Icons.print, color: Color(0xFF134FAF),),
                                                          SizedBox(width: 25,),
                                                          InkWell(
                                                            onTap: (){
                                                              removeItem(0);
                                                            },
                                                            child: Icon(Icons.delete, color: Color(0xFF134FAF),)),
                                                        ],
                                                      )
                                                    ])),
                                              ),
                                            ],
                  );

                
                            },
                            child: Card(
                              elevation: 50,
                              // shadowColor: Colors.white,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                              child: SizedBox(
                                height: 240,
                                  
                                child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                                  child: Text('${itemList[index].billNo}', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w900,
                                                                  color: Colors.black, fontSize: 21),),
                                                ),
                                                SizedBox(width: 160,),
                                                 Padding(
                                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                                  child: Text('${itemList[index].date}', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black, fontSize: 18),),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Text('BillDate: ${itemList[index].date}', style: TextStyle(fontFamily: "Raleway",
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black, fontSize: 18),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Text('LedgerName: ${itemList[index].name}', style: TextStyle(fontFamily: "Raleway",
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black, fontSize: 18),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Text('NetWeight: ${itemList[index].netWeight}', style: TextStyle(fontFamily: "Raleway",
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black, fontSize: 18),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            child: Text('Gift Vhr: ₹ ${itemList[index].giftvoc}', style: TextStyle(fontFamily: "Raleway",
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black, fontSize: 18),),
                                          ),
                                          SizedBox(height: 5,),
                                          Divider(thickness: 1.6,color: Colors.black, ),
                                          SizedBox(height: 13,),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('TotalAmt', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w900,
                                                                  color: Colors.black, fontSize: 12),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('₹ ${itemList[index].totalAmount}', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black, fontSize: 16),),
                                            ),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('SalesAmt', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w900,
                                                                  color: Colors.black, fontSize: 12),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('₹ ${itemList[index].totalSales}', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black, fontSize: 16),),
                                            ),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('SGST', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w900,
                                                                  color: Colors.black, fontSize: 12),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('₹ ${itemList[index].sgst}', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black, fontSize: 16),),
                                            ),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('CGST', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w900,
                                                                  color: Colors.black, fontSize: 12),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('₹ ${itemList[index].csgt}', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black, fontSize: 16),),
                                            ),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('IGST', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w900,
                                                                  color: Colors.black, fontSize: 12),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('₹ ${itemList[index].igst}', style: TextStyle(fontFamily: "Raleway",
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black, fontSize: 16),),
                                            ),
                                              
                                             
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                 
                              ),
                              
                            ),
                          ),
                        );
                    },),
                     
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                  onPressed: _goToPreviousPage,
                  child: Text('Previous', style: TextStyle(color: Color(0xFF134FAF)),),
                ),
                SizedBox(width: 200),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                  onPressed: _goToNextPage,
                  child: Text('Next', style: TextStyle(color: Color(0xFF134FAF)),),
                ),
            ],
          ),
              ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }

  List<Step> getStep() => [
    Step(
      
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.currentStep.value >= 0,
      title: Text('Sale Bill'),
      content: Column(
        children: [
          SizedBox(height: 30,),
          TextField(
                                  controller: msgController,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Bill Date',
                                    labelText: 'Bill Date',
                                    hintStyle: TextStyle(fontFamily: "Raleway"),
                                    labelStyle:
                                        TextStyle(fontFamily: "Raleway"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                                        msgController.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      if (kDebugMode) {
                                        print("Date is not selected");
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: 30,),
                                TextFormField(
                                  controller: msgController1,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Ledger Name',
                                    labelText: 'Ledger Name',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
                                SizedBox(height: 30,),
                                TextFormField(
                                  controller: msgController2,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Bill No',
                                    labelText: 'Bill No',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
          
        ],
      ),
    ),
    Step(
        state: controller.currentStep.value > 1
                ? StepState.complete
                : StepState.indexed,
            isActive: controller.currentStep.value >= 1,
      title: Text('Bill weight and amount'),
      content: Column(
        children: [
          SizedBox(height: 30,),
          TextFormField(
                                  controller: msgController3,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Net Weight',
                                    labelText: 'Net Weight',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
                                SizedBox(height: 30,),
                                TextFormField(
                                  controller: msgController4,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Total Amount',
                                    labelText: 'Total Amount',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
                                 SizedBox(height: 30,),
                                TextFormField(
                                  controller: msgController5,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Sales Amount',
                                    labelText: 'Sales Amount',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
        ],
      ),
    ),
    Step(
       isActive: controller.currentStep.value >= 2,
      title: Text('Bill amount and gift'),
      content: Column(
        children: [
          SizedBox(height: 30,),
          TextFormField(
                                  controller: msgController6,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'SGST',
                                    labelText: 'SGST',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
                                SizedBox(height: 30,),
                                TextFormField(
                                  controller: msgController7,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'CGST',
                                    labelText: 'CGST',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
                                 SizedBox(height: 30,),
                                TextFormField(
                                  controller: msgController8,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'IGST',
                                    labelText: 'IGST',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
                                 SizedBox(height: 30,),
                                TextFormField(
                                  controller: msgController9,
                                  style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Gift Vhr',
                                    labelText: 'Gift Vhr',
                                   hintStyle: TextStyle(fontFamily: "Raleway"),
                                     labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color(0xFF134FAF), width: 2),
                                    ),
                                    
                                  ),
                                ),
                                Center(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                                primary: Color(0xFF134FAF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                25.0))),
                                                onPressed: (){
                                                  Get.back();
                                                               setState(() {
           addItemToSharedPreferences(msgController.text, msgController1.text, msgController2.text, msgController3.text, msgController4.text, msgController5.text, msgController6.text, msgController7.text, msgController8.text, msgController8.text, msgController9.text);
                                                               });
                                              }, child: Text("Save"),),
                                            )
        ],
      ),
    ),
  ];

  void _settingModalBottomSheet(context) {

    Dialogs.materialDialog(
                              useSafeArea: true,
                                msg: 'Filter Search',
                                msgStyle: TextStyle(color: Color(0xFF134FAF)),
                                // title: "Delete",
                                color: Colors.white,
                                
                                context: context,
                                dialogWidth: kIsWeb ? 0.3 : null,
                                onClose: (value) =>
                                    print("returned value is '$value'"),
                                actions: [
                                  SizedBox(
                                    height: 500,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                     Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Select Range",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),     
                                       
                  CustomDropdown(
                    selectedStyle: TextStyle(fontFamily: "Raleway",
                                    fontSize: 15,),
                                fillColor: Colors.grey.withOpacity(0.2),
                                
                                fieldSuffixIcon: Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Color(0xFF134FAF),
                                ),
                                hintText: 'Select Range',
                                
                                hintStyle: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                items: const ['Recently', 'Last 10 Days',  'Last 20 Days', 'Last 30 Days', 'Last 40 Days'],
                                
                                controller: msgController10,
                                onChanged: (value) {
                                  
                                  
                                  print(value);
                                },
                              ),
                            
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Date Filter by",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),
                                TextField(
                  // controller: controller.dobController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                    hintText: 'Date Filter By',
                    labelText: 'Date Filter By',
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold, fontSize: 19),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: controller.isEmailCorrect == "false"
                        ? Icon(
                            Icons.close_sharp,
                            color: Colors.red,
                          )
                        : controller.isEmailCorrect == "true"
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Container(
                                width: 0,
                              ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.date_range, color: Color(0xFF134FAF)),
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
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      if (kDebugMode) {
                        print(formattedDate);
                      } //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement
                      setState(() {
                        controller.dobController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      if (kDebugMode) {
                        print("Date is not selected");
                      }
                    }
                  },
                ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Ornaments Type",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),
                              CustomDropdown(
                                selectedStyle: TextStyle(fontFamily: "Raleway",
                                    fontSize: 15,),
                                fillColor: Colors.grey.withOpacity(0.2),
                                // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Color(0xFF134FAF),
                                ),
                                hintText: 'Ornaments Type',
                                hintStyle: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                items: const ['with_photo', 'with_horoscope', 'premium_members'],
                                controller: msgController10,
                                onChanged: (value) {
                                  // controller.Profile = value;
                                  print(value);
                                },
                              ),
                                
                               Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Product Group",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),
                              
                             
                             
                                
                                     
                CustomDropdown(
                  selectedStyle: TextStyle(fontFamily: "Raleway",
                                    fontSize: 15,),
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(
                                        Icons.arrow_drop_down_circle,
                                        color: Color(0xFF134FAF),
                                      ),
                                      hintText: 'Product Group',
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      items: const [
                                        'Private',
                                              'Not Working',
                                              'Government/PSU',
                                              'Self Employed',
                                              'Business',
                                      ],
                                      controller:
                                          msgController10,
                                      onChanged: (value) {
                                        // controller.EmployedIn = value;
                                        print(value);
                                      },
                                    ),

                                                  
                
                                             SizedBox(height: 25,),
                                            
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF134FAF),
                      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                            child: Text("Search"),
                            onPressed: () {
                            
                             
                              setState(() {
                                // controller.fetchDetailedFilter();  
                              });
                              Navigator.pop(context);
                              
                            },
                          ),
                
                
                                        ],
                                
    ),
                                    ),
                                  ),
  
  
                                ]);
  }
  
}




// class TableList extends StatefulWidget {
//   @override
//   _TableListState createState() => _TableListState();
// }

// class _TableListState extends State<TableList> {
//   String _userInformation = 'No information yet';
//   void languageInformation() async {
//     final language = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Episode5(),
//       ),
//     );
//     updateLanguageInformation(language);
//   }

//   void updateLanguageInformation(List<User> userList) {
//     for (var i = 0; i <= userList.length; i++) {
//       for (var name thirumanam userList) {
//         print("Name: " + name.name[i] + " Email: " + name.email[i]);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Testing List View Data From second page to first page"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(_userInformation),
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               languageInformation();
//             },
//             child: Text("Go to Form"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class User {
  String Type;
  String Product;
  String Qty;
  String Weight;
  String Wst;
  String NetWt;
  String Touch;
  String Rate;
  String Amount;

  User({required this.Type, required this.Touch, required this.Rate, required this.Amount, required this.Product, required this.Qty, required this.Weight, required this.Wst, required this.NetWt});
}

class User1 {
  String VoucherType;
  String Amount;
  String CardType;
  String Reference;
  
  User1({required this.VoucherType, required this.Amount, required this.CardType, required this.Reference});
}




class Episode5 extends StatefulWidget{
  @override
  _Episode5State createState() => _Episode5State();
}

class _Episode5State extends State<Episode5> {
  final controller = Get.find<StepperRegisterController>();
  TextEditingController TypeController = TextEditingController();
  TextEditingController ProducrController = TextEditingController();
  TextEditingController QtyController = TextEditingController();
  TextEditingController WeightController = TextEditingController();
  TextEditingController WstController = TextEditingController();
  TextEditingController NetWtController = TextEditingController();
  TextEditingController TouchController = TextEditingController();
  TextEditingController RateController = TextEditingController();
  TextEditingController AmountController = TextEditingController();

  TextEditingController VoucherType = TextEditingController();
  TextEditingController VoucherAmount = TextEditingController();
  TextEditingController CardType = TextEditingController();
  TextEditingController Reference = TextEditingController();

  final form = GlobalKey<FormState>();
  static var _focusNode = new FocusNode();
  bool update = false;
  int currentIndex = 0;

  List<User> userList = [
    User(Type: "Damage Gold", Product: "sdf", Qty: "1", Weight: "54.00", Wst: "10.00", NetWt: "54.00", Touch: "79", Rate: "5410",Amount: "40,000,00"),
    User(Type: "Beaten Gold", Product: "sdf", Qty: "3", Weight: "14.00", Wst: "8.00", NetWt: "14.00", Touch: "85", Rate: "5410",Amount: "10,000,00"),
    User(Type: "Polish Gold", Product: "sdf", Qty: "4", Weight: "35.00", Wst: "2.00", NetWt: "35.00", Touch: "64", Rate: "5410",Amount: "25,000,00"),

    
    
  ];
   List<User1> userList1 = [
  User1(VoucherType: "CASH", Amount: "100000", CardType: "CREDIT CARD", Reference: ""),
    User1(VoucherType: "UPI", Amount: "200000", CardType: "", Reference: ""),
    User1(VoucherType: "CAED", Amount: "900000", CardType: "", Reference: ""),
   ];
  
  @override
  Widget build(BuildContext context) {
    

 
    return Scaffold(
      backgroundColor: Color(0xFF134FAF),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                       IconButton(
                    onPressed:(){
                      Navigator.pop(context);
                      } ,
                                icon: Icon(Icons.arrow_back,
                    color: Colors.white,
                    size: 25,),
                  ),
                   Text(
                "Add Receipts",
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Raleway"),
              ),
              ],
                  ),
                ),
                 Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextField(
                                
                              
  //            onChanged: (text) {
  //             List<DetailedFilterModel> foodList =  controller.fetchDetailedFilter().where((item) => item.firstName.toLowerCase().contains(text.toLowerCase())); // Replace with your list source
  // },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xFF134FAF),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed:  (){}
                                    ),
                                    hintText: 'Search Product',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF134FAF)),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Sort by:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                              color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          _settingModalBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Text("Search by filter",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Raleway",
                                    color: Colors.white)),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    width: 1000,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child:   

    Container(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Scrap Details", style: TextStyle(fontFamily: "Raleway", fontSize: 20, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 140),
                  child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                            primary: Color(0xFF134FAF),
                            shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                    onPressed: (){
                     showModalBottomSheet<void>(
                        isScrollControlled: true,
                // context and builder are
                // required properties in this widget
                context: context,
                builder: (BuildContext context) {
                  // we set up a container inside which
                  // we create center column and display text
 
                  // Returning SizedBox instead of a Container
                  return SizedBox(
                    height: 800,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35, right: 15, left: 15),
                        child: Column(
                          children: [
                            Center(
                              child: Text("Scrap Details", style: TextStyle(fontFamily: "Raleway", fontSize: 20, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 20,),
                            CustomDropdown(
                                                    selectedStyle: TextStyle(fontFamily: "Raleway",
                                          fontSize: 15,),
                                            fillColor: Colors.grey.withOpacity(0.2),
                                            // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                            fieldSuffixIcon: Icon(
                                              Icons.arrow_drop_down_circle,
                                              color: Color(0xFF134FAF),
                                            ),
                                            hintText: 'Type',
                                            hintStyle: TextStyle(
                                                fontFamily: "Raleway",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                            items: const [
                                             'BEATEN GOLD',
                                                    'DAMAGE GOLD',
                                                    'EXCHANGE GOLD',
                                                    'POLISH GOLD',
                                            ],
                                            controller:
                                                TypeController,
                                          ),
                                          SizedBox(height: 20,),
                                          TextFormField(
                                        controller: ProducrController,
                                        style: TextStyle( fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Product',
                                          labelText: 'Product',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                         
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      CustomDropdown(
                          selectedStyle: TextStyle(fontFamily: "Raleway",
                                          fontSize: 15,),
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      
                                      fieldSuffixIcon: Icon(
                                        Icons.arrow_drop_down_circle,
                                        color: Color(0xFF134FAF),
                                      ),
                                      hintText: 'Qty',
                                      
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      items: const ['1','2','3','4','5','6','7','8','9','10','11','12'],
                                      
                                      controller: QtyController,
                                      
                                    ),
                                     SizedBox(height: 20,),
                                          TextFormField(
                                        controller: WeightController,
                                        style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Weight',
                                          labelText: 'Weight',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                         
                                        ),
                                      ),
                                       SizedBox(height: 20,),
                                          TextFormField(
                                        controller: WstController,
                                        style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Wst',
                                          labelText: 'Wst',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                          
                                        ),
                                      ),
                                       SizedBox(height: 20,),
                                          TextFormField(
                                        controller: NetWtController,
                                        style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Net Wt',
                                          labelText: 'Net Wt',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                         
                                        ),
                                      ),
                                       SizedBox(height: 20,),
                                          TextFormField(
                                        controller: TouchController,
                                        style: TextStyle( fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Touch (%)',
                                          labelText: 'Touch (%)',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,  fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                          
                                        ),
                                      ),
                                       SizedBox(height: 20,),
                                          TextFormField(
                                        controller: RateController,
                                        style: TextStyle(fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Rate',
                                          labelText: 'Rate',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,  fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                         
                                        ),
                                      ),
                                       SizedBox(height: 20,),
                                          TextFormField(
                                        controller: AmountController,
                                        style: TextStyle(fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Amount',
                                          labelText: 'Amount',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,  fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                         
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      ElevatedButton(
                     style: ElevatedButton.styleFrom(
                              primary: Color(0xFF134FAF),
                              shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                    onPressed: (){
                      Get.back();
                      setState(() {
                                            addUserToList(
                                              TypeController.text,
                                              ProducrController.text,
                                              QtyController.text,
                                              WeightController.text,
                                              WstController.text,
                                              NetWtController.text,
                                              TouchController.text,
                                              RateController.text,
                                              AmountController.text,
                                            );  
                      });
                      
                    },
                    child: Text("Save"),
                    ),
                    
                          ],
                        
                        ),
                      ),
                    ),
                  );});
                    }, child: Text("✢ Add")),
                ),
              ],
            ),
            Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            dividerThickness: 5,
                  decoration: BoxDecoration(
                      border:Border(
                          right: Divider.createBorderSide(context, width: 5.0),
                          left: Divider.createBorderSide(context, width: 5.0)
                      ),
                      
                  ),
                  showBottomBorder: true,
                 dataRowHeight: 30, // set the row height to 30
          headingRowHeight: 40, 
          headingRowColor:
        MaterialStateColor.resolveWith((states) => Color(0xFF134FAF)),
                onSelectAll: (b) {},
                sortColumnIndex: 0,
                sortAscending: true,
                columns: <DataColumn>[
                  DataColumn(label: Center(
                    child: Text("Type",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "To Display name"),
                  DataColumn(label: Center(
                    child: Text("Product",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "To Display Email"),
                  DataColumn(label: Center(
                    child: Text("Qty",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                  DataColumn(label: Center(
                    child: Text("Weight",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                  DataColumn(label: Center(
                    child: Text("Wst",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                  DataColumn(label: Center(
                    child: Text("Net Wt",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                                          DataColumn(label: Center(
                                            child: Text("Touch (%)",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                                          ), tooltip: "Update data"),
                                          DataColumn(label: Center(
                                            child: Text("Rate",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                                          ), tooltip: "Update data"),
                                          DataColumn(label: Center(
                                            child: Text("Amount",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                                          ), tooltip: "Update data"),
                  DataColumn(label: Center(
                    child: Text("Actions",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                ],
                rows: userList
                    .map(
                      (user) => DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text(user.Type,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user.Product,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user.Qty,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user.Weight,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('${user.Wst} gm',style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user.NetWt,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user.Touch,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user.Rate,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('₹ ${user.Amount}',style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            IconButton(
                              onPressed: () {
                                 showModalBottomSheet<void>(
                    isScrollControlled: true,
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text
 
              // Returning SizedBox instead of a Container
              return SizedBox(
                height: 800,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, right: 15, left: 15),
                    child: Column(
                      children: [
                        Center(
                          child: Text("Scrap Details Update", style: TextStyle(fontFamily: "Raleway", fontSize: 20, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20,),
                        CustomDropdown(
                                                selectedStyle: TextStyle(fontFamily: "Raleway",
                                      fontSize: 15,),
                                        fillColor: Colors.grey.withOpacity(0.2),
                                        // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                        fieldSuffixIcon: Icon(
                                          Icons.arrow_drop_down_circle,
                                          color: Color(0xFF134FAF),
                                        ),
                                        hintText: 'Type',
                                        hintStyle: TextStyle(
                                            fontFamily: "Raleway",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        items: const [
                                         'BEATEN GOLD',
                                                'DAMAGE GOLD',
                                                'EXCHANGE GOLD',
                                                'POLISH GOLD',
                                        ],
                                        controller:
                                            TypeController,
                                      ),
                                      SizedBox(height: 20,),
                                      TextFormField(
                                    controller: ProducrController,
                                    style: TextStyle( fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Product',
                                      labelText: 'Product',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                     
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  CustomDropdown(
                      selectedStyle: TextStyle(fontFamily: "Raleway",
                                      fontSize: 15,),
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  
                                  fieldSuffixIcon: Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Color(0xFF134FAF),
                                  ),
                                  hintText: 'Qty',
                                  
                                  hintStyle: TextStyle(
                                      fontFamily: "Raleway",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  items: const ['1','2','3','4','5','6','7','8','9','10','11','12'],
                                  
                                  controller: QtyController,
                                  
                                ),
                                 SizedBox(height: 20,),
                                      TextFormField(
                                    controller: WeightController,
                                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Weight',
                                      labelText: 'Weight',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                     
                                    ),
                                  ),
                                   SizedBox(height: 20,),
                                      TextFormField(
                                    controller: WstController,
                                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Wst',
                                      labelText: 'Wst',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                      
                                    ),
                                  ),
                                   SizedBox(height: 20,),
                                      TextFormField(
                                    controller: NetWtController,
                                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Net Wt',
                                      labelText: 'Net Wt',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                     
                                    ),
                                  ),
                                   SizedBox(height: 20,),
                                      TextFormField(
                                    controller: TouchController,
                                    style: TextStyle( fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Touch (%)',
                                      labelText: 'Touch (%)',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,  fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                      
                                    ),
                                  ),
                                   SizedBox(height: 20,),
                                      TextFormField(
                                    controller: RateController,
                                    style: TextStyle(fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Rate',
                                      labelText: 'Rate',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,  fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                     
                                    ),
                                  ),
                                   SizedBox(height: 20,),
                                      TextFormField(
                                    controller: AmountController,
                                    style: TextStyle(fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Amount',
                                      labelText: 'Amount',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19,  fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                     
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  ElevatedButton(
                 style: ElevatedButton.styleFrom(
                          primary: Color(0xFF134FAF),
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                onPressed: (){
                  Get.back();
                  setState(() {
                                        updateForm();
                  });
                  
                },
                child: Text("Save"),
                ),
                
                      ],
                    
                    ),
                  ),
                ),
              );
            }
                                 );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
        ),
      ),
    ),
           

                 Row(
                   children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Receipts", style: TextStyle(fontFamily: "Raleway", fontSize: 20, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),),
                      ),
                     Padding(
              padding: const EdgeInsets.only(top: 5, left: 180),
              child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                            primary: Color(0xFF134FAF),
                            shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                onPressed: (){
                     showModalBottomSheet<void>(
                        isScrollControlled: true,
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text
 
              // Returning SizedBox instead of a Container
              return SizedBox(
                height: 800,
                child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35, right: 15, left: 15),
                        child: Column(
                          children: [
                            Center(
                              child: Text("Receipts Details", style: TextStyle(fontFamily: "Raleway", fontSize: 20, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 20,),
                            CustomDropdown(
                                                    selectedStyle: TextStyle(fontFamily: "Raleway",
                                          fontSize: 15,),
                                            fillColor: Colors.grey.withOpacity(0.2),
                                            // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                            fieldSuffixIcon: Icon(
                                              Icons.arrow_drop_down_circle,
                                              color: Color(0xFF134FAF),
                                            ),
                                            hintText: 'Voucher Type',
                                            hintStyle: TextStyle(
                                                fontFamily: "Raleway",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                            items: const [
                                             'CASH',
                                                    'CARD',
                                                    'UPI',
                                                    'CHECK',
                                            ],
                                            controller:
                                                VoucherType,
                                          ),
                                          SizedBox(height: 20,),
                                          TextFormField(
                                        controller: VoucherAmount,
                                        style: TextStyle( fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Amount',
                                          labelText: 'Amount',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                         
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      
                                          TextFormField(
                                        controller: CardType,
                                        style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Card Type',
                                          labelText: 'Card Type',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                         
                                        ),
                                      ),
                                       SizedBox(height: 20,),
                                          TextFormField(
                                        controller: Reference,
                                        style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: 'Reference',
                                          labelText: 'Reference',
                                         hintStyle: TextStyle(fontFamily: "Raleway"),
                                           labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Color(0xFF134FAF), width: 2),
                                          ),
                                          
                                        ),
                                      ),
                                       
                                      SizedBox(height: 20,),
                                      ElevatedButton(
                     style: ElevatedButton.styleFrom(
                              primary: Color(0xFF134FAF),
                              shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                onPressed: (){
                      Get.back();
                      setState(() {
                                            addUserToList1(
                                              VoucherAmount.text,
                                              VoucherType.text,
                                              CardType.text,
                                              Reference.text,
                                              
                                            );  
                      });
                      
                },
                child: Text("Save"),
                ),
                
                          ],
                        
                        ),
                      ),
                ),
              );});
                }, child: Text("✢ Add")),
            ),
                   ],
                 ),
            Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            dividerThickness: 5,
                  decoration: BoxDecoration(
                      border:Border(
                          right: Divider.createBorderSide(context, width: 5.0),
                          left: Divider.createBorderSide(context, width: 5.0)
                      ),
                      
                  ),
                  showBottomBorder: true,
                 dataRowHeight: 30, // set the row height to 30
          headingRowHeight: 40, 
          headingRowColor:
        MaterialStateColor.resolveWith((states) => Color(0xFF134FAF)),
                onSelectAll: (b) {},
                sortColumnIndex: 0,
                sortAscending: true,
                columns: <DataColumn>[
                  DataColumn(label: Center(
                    child: Text("Voucher Type",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "To Display name"),
                  DataColumn(label: Center(
                    child: Text("Amount",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "To Display Email"),
                  DataColumn(label: Center(
                    child: Text("CardType",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                  DataColumn(label: Center(
                    child: Text("Reference",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                  
                  
                  DataColumn(label: Center(
                    child: Text("Actions",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.white)),
                  ), tooltip: "Update data"),
                ],
                rows: userList1
                    .map(
                      (user1) => DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text(user1.VoucherType ,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text("${user1.Amount}",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user1.CardType,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(user1.Reference,style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Raleway",
                                            color: Colors.black)),
                            ),
                          ),
                         
                          DataCell(
                            IconButton(
                              onPressed: () {
                                 showModalBottomSheet<void>(
                    isScrollControlled: true,
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text
 
              // Returning SizedBox instead of a Container
              return SizedBox(
                height: 800,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, right: 15, left: 15),
                    child: Column(
                      children: [
                        Center(
                          child: Text("Receipts Details Update", style: TextStyle(fontFamily: "Raleway", fontSize: 20, color: Color(0xFF134FAF), fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20,),
                        CustomDropdown(
                                                selectedStyle: TextStyle(fontFamily: "Raleway",
                                      fontSize: 15,),
                                        fillColor: Colors.grey.withOpacity(0.2),
                                        // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                        fieldSuffixIcon: Icon(
                                          Icons.arrow_drop_down_circle,
                                          color: Color(0xFF134FAF),
                                        ),
                                        hintText: 'Voucher Type',
                                        hintStyle: TextStyle(
                                            fontFamily: "Raleway",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        items: const [
                                         'CASH',
                                                'CARD',
                                                'UPI',
                                                'CHECK',
                                        ],
                                        controller:
                                            VoucherType,
                                      ),
                                      SizedBox(height: 20,),
                                      TextFormField(
                                    controller: VoucherAmount,
                                    style: TextStyle( fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Amount',
                                      labelText: 'Amount',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                     
                                    ),
                                  ),
                                  
                                 SizedBox(height: 20,),
                                      TextFormField(
                                    controller: CardType,
                                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'CardType',
                                      labelText: 'CardType',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                     
                                    ),
                                  ),
                                   SizedBox(height: 20,),
                                      TextFormField(
                                    controller: Reference,
                                    style: TextStyle(color: Colors.black, fontFamily: "Raleway",fontSize: 18),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Reference',
                                      labelText: 'Reference',
                                     hintStyle: TextStyle(fontFamily: "Raleway"),
                                       labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 19, ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF134FAF), width: 2),
                                      ),
                                      
                                    ),
                                  ),
                                  
                                  SizedBox(height: 20,),
                                  ElevatedButton(
                 style: ElevatedButton.styleFrom(
                          primary: Color(0xFF134FAF),
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                onPressed: (){
                  Get.back();
                  setState(() {
                                        updateForm1();
                  });
                  
                },
                child: Text("Save"),
                ),
                
                      ],
                    
                    ),
                  ),
                ),
              );
            }
                                 );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
        ),
      ),
    ),
       
          ],
        ),
      ),
    
                  ),
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }

  void updateForm() {
    setState(() {
      User user = User(Type: TypeController.text, Product: ProducrController.text, Qty: QtyController.text
      , Weight: WeightController.text, Wst: WstController.text, NetWt: NetWtController.text, Touch: TouchController.text
      , Rate: RateController.text, Amount: AmountController.text);
      userList[currentIndex] = user;
    });
  }

  void _updateTextControllers(User user) {
    setState(() {
      TypeController.text = user.Type;
      ProducrController.text = user.Product;
      WeightController.text = user.Weight;
      WstController.text = user.Wst;
      QtyController.text = user.Qty;
      NetWtController.text = user.NetWt;
      TouchController.text = user.Touch;
      RateController.text = user.Rate;
      AmountController.text = user.Amount;
    });
  }

  void addUserToList(Type, Product, Qty, Weight, Wst, NetWt, Touch, Rate, Amount) {
    setState(() {
      userList.add(User(Type: Type, Product: Product, Qty: Qty, Weight: Weight, Wst: Wst, NetWt: NetWt
      ,Touch: Touch, Rate:Rate, Amount: Amount));
    });
  }

  void updateForm1() {
    setState(() {
      User1 user1 = User1(VoucherType: VoucherType.text, Amount: VoucherAmount.text, CardType: CardType.text
      , Reference: Reference.text);
      userList1[currentIndex] = user1;
    });
  }

  void _updateTextControllers1(User1 user1) {
    setState(() {
      VoucherType.text = user1.VoucherType;
      VoucherAmount.text = user1.Amount;
      CardType.text = user1.CardType;
      Reference.text = user1.Reference;
      
    });
  }

  void addUserToList1(VoucherType, Amount, CardType, Reference) {
    setState(() {
      userList1.add(User1(VoucherType: VoucherType, Amount: Amount, CardType: CardType, Reference: Reference));
    });
  }

  void _settingModalBottomSheet(context) {

    Dialogs.materialDialog(
                              useSafeArea: true,
                                msg: 'Filter Search',
                                msgStyle: TextStyle(color: Color(0xFF134FAF)),
                                // title: "Delete",
                                color: Colors.white,
                                
                                context: context,
                                dialogWidth: kIsWeb ? 0.3 : null,
                                onClose: (value) =>
                                    print("returned value is '$value'"),
                                actions: [
                                  SizedBox(
                                    height: 500,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                     Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Select Range",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),     
                                       
                  CustomDropdown(
                    selectedStyle: TextStyle(fontFamily: "Raleway",
                                    fontSize: 15,),
                                fillColor: Colors.grey.withOpacity(0.2),
                                
                                fieldSuffixIcon: Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Color(0xFF134FAF),
                                ),
                                hintText: 'Select Range',
                                
                                hintStyle: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                items: const ['Recently', 'Last 10 Days',  'Last 20 Days', 'Last 30 Days', 'Last 40 Days'],
                                
                                controller: TouchController,
                                onChanged: (value) {
                                  
                                  
                                  print(value);
                                },
                              ),
                            
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Date Filter by",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),
                                TextField(
                  // controller: controller.dobController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                    hintText: 'Date Filter By',
                    labelText: 'Date Filter By',
                    hintStyle: TextStyle(fontFamily: "Raleway"),
                    labelStyle: TextStyle(fontFamily: "Raleway", color: Color(0xFF134FAF), fontWeight: FontWeight.bold, fontSize: 19),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: controller.isEmailCorrect == "false"
                        ? Icon(
                            Icons.close_sharp,
                            color: Colors.red,
                          )
                        : controller.isEmailCorrect == "true"
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Container(
                                width: 0,
                              ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Icon(Icons.date_range, color: Color(0xFF134FAF)),
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
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      if (kDebugMode) {
                        print(formattedDate);
                      } //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement
                      setState(() {
                        controller.dobController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      if (kDebugMode) {
                        print("Date is not selected");
                      }
                    }
                  },
                ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Ornaments Type",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),
                              CustomDropdown(
                                selectedStyle: TextStyle(fontFamily: "Raleway",
                                    fontSize: 15,),
                                fillColor: Colors.grey.withOpacity(0.2),
                                // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                fieldSuffixIcon: Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Color(0xFF134FAF),
                                ),
                                hintText: 'Ornaments Type',
                                hintStyle: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                items: const ['with_photo', 'with_horoscope', 'premium_members'],
                                controller: TouchController,
                                onChanged: (value) {
                                  // controller.Profile = value;
                                  print(value);
                                },
                              ),
                                
                               Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Text("Product Group",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Raleway",
                                          color: Color(0xFF134FAF))),
                                          
                                ),
                              ),
                              
                             
                             
                                
                                     
                CustomDropdown(
                  selectedStyle: TextStyle(fontFamily: "Raleway",
                                    fontSize: 15,),
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      // fieldSuffixIcon: Icon(Icons.arrow_drop_down_circle, color: Colors.blue,),
                                      fieldSuffixIcon: Icon(
                                        Icons.arrow_drop_down_circle,
                                        color: Color(0xFF134FAF),
                                      ),
                                      hintText: 'Product Group',
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      items: const [
                                        'Private',
                                              'Not Working',
                                              'Government/PSU',
                                              'Self Employed',
                                              'Business',
                                      ],
                                      controller:
                                          TouchController,
                                      onChanged: (value) {
                                        // controller.EmployedIn = value;
                                        print(value);
                                      },
                                    ),

                                                  
                
                                             SizedBox(height: 25,),
                                            
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF134FAF),
                      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                            child: Text("Search"),
                            onPressed: () {
                            
                             
                              setState(() {
                                // controller.fetchDetailedFilter();  
                              });
                              Navigator.pop(context);
                              
                            },
                          ),
                
                
                                        ],
                                
    ),
                                    ),
                                  ),
  
  
                                ]);
  }
  
}







