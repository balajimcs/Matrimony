
// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import 'model/message.dart';
// class ChatScreen extends StatefulWidget {
  

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {


  

//   final TextEditingController _messageController = new TextEditingController();
  
//   final ScrollController _scrollController = ScrollController();
//   final List<Message> _messages = [];

//   final bool _showSpinner = false;
//   final bool _showVisibleWidget = false;
//   final bool _showErrorIcon = false;

//   void setStateIfMounted(f) {
//     if (mounted) setState(f);
//   }

//   late IO.Socket socket;
  

//   @override
//   void initState() {
//     // SharedPreferences preferences = await SharedPreferences.getInstance();
//     // _loadCounter();
//     try {
//       socket = IO.io(
//           "https://bitzfun.com/auth/post-message",
//           IO.OptionBuilder()
//               .setTransports(['websocket']) // for Flutter or Dart VM
//               .disableAutoConnect() // disable auto-connection
//               .setQuery({
//                 'token':"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiYmFsYWppQGdtYWlsLmNvbSIsImlhdCI6MTY3NjkxMjI2NSwiZXhwIjoxNzA4NDQ4MjY1fQ.iljq7UTkIDmQmaUFZSZr52TyfnZhI_C8cnUmypwVLY8",
//                 // 'token': await preferences.getString('token'),
//                 // 'id': await preferences.getString('id'),
//               })
//               .build());

//       socket.connect();

//       socket.on('connect', (data) {
//         print(data);
//         debugPrint('connected');
//         print(socket.connected);
//       });

//       socket.on('message-receive', (data) {
//         print(data);
//         var message = Message.fromJson(data);
//         setStateIfMounted(() {
//           _messages.add(message);
//         });
//       });

//       socket.onDisconnect((_) => debugPrint('disconnect'));
//     } catch (e) {
//       print(e);
//     }

//     super.initState();
//     print(_messageController);
//   }

//   // _loadCounter() async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();

//   //   setState(() {
     
//   //      token = (preferences.getString('token') ?? '');
//   //   });
//   //   // var token = await preferences.getString('token') as String;
//   //   // print(username);
//   //   // if (token == null) {
//   //   //   Navigator.of(context).pushAndRemoveUntil(
//   //   //       MaterialPageRoute(builder: (context) => new Login()),
//   //   //       ((route) => false));
//   //   // }
//   //   // phoneNumber = (preferences.getString('phoneNumber') ?? '');
    
//   // }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Chat Screen'),
//           backgroundColor: const Color(0xFF271160)),
//       body: SafeArea(
//         child: Container(
//           color: const Color(0xFFEAEFF2),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Flexible(
//                 child: MediaQuery.removePadding(
//                   context: context,
//                   removeTop: true,
//                   child: ListView.builder(
//                     controller: _scrollController,
//                     physics: const BouncingScrollPhysics(),
//                     reverse: _messages.isEmpty ? false : true,
//                     itemCount: 1,
//                     shrinkWrap: false,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(
//                             top: 10, left: 10, right: 10, bottom: 3),
//                         child: Column(
//                           mainAxisAlignment: _messages.isEmpty
//                               ? MainAxisAlignment.center
//                               : MainAxisAlignment.start,
//                           children: <Widget>[
//                             Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: _messages.map((Message) {
//                                   print(Message);
//                                   return ChatBubble(
//                                     date: DateTime.now().toString(),
//                                     message: Message.message,
//                                     socket_id: socket.id.toString(),
//                                     isMe:
//                                         Message.user_id == index,
//                                   );
//                                 }).toList()),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 padding: const EdgeInsets.only(
//                     bottom: 10, left: 20, right: 10, top: 5),
//                 child: Row(
//                   children: <Widget>[
//                     Flexible(
//                       child: Container(
//                         child: TextFormField(
//                           minLines: 1,
//                           maxLines: 5,
//                           controller: _messageController,
//                           textCapitalization: TextCapitalization.sentences,
//                           decoration: const InputDecoration.collapsed(
//                             hintText: "Type a message",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 43,
//                       width: 42,
//                       child: FloatingActionButton(
//                         backgroundColor: const Color(0xFF271160),
//                         onPressed: () async {
//                           if (_messageController.text.trim().isNotEmpty) {
//                             String message = _messageController.text.trim();
//                             print(message);
//                             socket.emit("message", {"message": message});

//                             _messageController.clear();
//                           }
//                         },
//                         mini: true,
//                         child: Transform.rotate(
//                             angle: 5.79449,
//                             child: const Icon(Icons.send, size: 20)),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChatBubble extends StatelessWidget {
//   final String socket_id;
//   final bool isMe;
//   final String message;
//   final String date;

//   ChatBubble({
//     Key? key,
//     required this.message,
//     required this.isMe,
//     required this.socket_id,
//     required this.date,
//   });
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       child: Column(
//         mainAxisAlignment:
//             isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         crossAxisAlignment:
//             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             margin: const EdgeInsets.symmetric(vertical: 5.0),
//             constraints: BoxConstraints(maxWidth: size.width * .5),
//             decoration: BoxDecoration(
//               color: isMe ? const Color(0xFF2E1963) : const Color(0xFFFFFFFF),
//               borderRadius: isMe
//                   ? const BorderRadius.only(
//                       topRight: Radius.circular(11),
//                       topLeft: Radius.circular(11),
//                       bottomRight: Radius.circular(0),
//                       bottomLeft: Radius.circular(11),
//                     )
//                   : const BorderRadius.only(
//                       topRight: Radius.circular(11),
//                       topLeft: Radius.circular(11),
//                       bottomRight: Radius.circular(11),
//                       bottomLeft: Radius.circular(0),
//                     ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   message,
//                   textAlign: TextAlign.start,
//                   softWrap: true,
//                   style:
//                       const TextStyle(color: Color(0xFF2E1963), fontSize: 14),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 7),
//                     child: Text(
//                       date,
//                       textAlign: TextAlign.start,
//                       style: const TextStyle(
//                           color: Color(0xFF594097), fontSize: 9),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
