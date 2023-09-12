
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:thirumanam/utils/constants.dart';

// import '../../preferences/app_preference.dart';

// class PdfScreen extends StatefulWidget {
//   const PdfScreen({Key? key}) : super(key: key);

//   @override
//   _PdfScreenState createState() => _PdfScreenState();
// }

// class _PdfScreenState extends State<PdfScreen> {
//   bool _isLoading = false;
//   final AppPreference appPreference = Get.find();
//   Future<Map<String, dynamic>> _fetchDataAndGeneratePdf() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final url = await http.get(Uri.parse("${URL}auth/myprofile"));
//     final response =
//         await http.get(Uri.parse(url.toString()), headers: <String, String>{
//       "Content-Type": "application/json",
//       'x-access-token':
//           appPreference.accessToken!
//     });

//     final Map<String, dynamic> body = json.decode(response.body);
//      if (response.statusCode == 200) {
//       final pdf = pw.Document();
//     final fontData = await rootBundle.load('assets/fonts/Helvetica.ttf');
// final font = pw.Font.ttf(fontData.buffer.asByteData());
//     pdf.addPage(pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text(response.body, style: pw.TextStyle(font: font),),
//           );
//         }));

//   final directory = await getExternalStorageDirectory();
// final file = File('${directory!.path}/tamilvivaham.pdf');
// print(file);
// print(directory.path);
// await file.writeAsBytes(await pdf.save());

//     setState(() {
//       _isLoading = false;
//     });
//     }
//     return body;

    
//   }

// // Future<void> _sharePdfFile() async {
// //   final directory = await getExternalStorageDirectory();
// //   if (directory == null) {
// //     // Handle the case where the directory is null
// //     return;
// //   }
// //   final filePath = '${directory.path}/tamilvivaham.pdf';
// //   await FlutterShareFile.share(
// //     filePath,
// //     'tamilvivaham.pdf',
// //     ShareFileType.pdf,
// //   );
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Viewer'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? const CircularProgressIndicator()
//             : ElevatedButton(
//                 onPressed: _fetchDataAndGeneratePdf,
//                 child: const Text('Generate PDF'),
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: _sharePdfFile,
//         onPressed:(){},
//         child: const Icon(Icons.share),
//       ),
//     );
//   }
// }



