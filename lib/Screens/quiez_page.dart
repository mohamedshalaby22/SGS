// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/components/default_button.dart';
// import 'package:flutter_application_3/components/leading_icon.dart';
// import 'package:flutter_application_3/components/text1.dart';
// import 'package:flutter_application_3/constant/const.dart';
// import 'package:flutter_application_3/main.dart';

// class QuiezPage extends StatefulWidget {
//   const QuiezPage({Key? key}) : super(key: key);

//   @override
//   State<QuiezPage> createState() => _QuiezPageState();
// }

// int selectedValue = 0;

// class _QuiezPageState extends State<QuiezPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: const LeadingIcon(),
//           centerTitle: true,
//           title: Row(
//             children: [
//               Text1(
//                 text: 'Assignment Information',
//                 color: primaryColor,
//                 size: 20,
//               ),
//             ],
//           )),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(defaultPading),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text1(
//                 text: 'Description',
//                 size: 20,
//                 color: primaryColor,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text1(
//                 text: 'Notes Of The Description',
//               ),
//               const Divider(
//                 thickness: 2,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text1(
//                 text: 'Question Number',
//                 size: 20,
//                 color: primaryColor,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text1(
//                 text: '1',
//                 size: 20,
//               ),
//               const Divider(
//                 thickness: 2,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text1(
//                 text: 'Total Degree',
//                 size: 20,
//                 color: primaryColor,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text1(
//                 text: '1',
//                 size: 20,
//               ),
//               const Divider(
//                 thickness: 2,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text1(text: 'Questions', size: 25, color: primaryColor),
//               const SizedBox(
//                 height: 20,
//               ),
//               Align(
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade50,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text1(
//                         text: 'Question 1?',
//                         size: 20,
//                       ),
//                       const Divider(),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Transform.scale(
//                         scale: 1.1,
//                         child: RadioListTile(
//                             value: 1,
//                             title: Text1(
//                               text: 'First Choice',
//                               color: Colors.black,
//                             ),
//                             groupValue: selectedValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedValue = 1;
//                               });
//                             }),
//                       ),
//                       Transform.scale(
//                         scale: 1.1,
//                         child: RadioListTile(
//                             value: 2,
//                             title: Text1(
//                               text: 'Second Choice',
//                               color: Colors.black,
//                             ),
//                             groupValue: selectedValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedValue = 2;
//                               });
//                             }),
//                       ),
//                       Transform.scale(
//                         scale: 1.1,
//                         child: RadioListTile(
//                             value: 3,
//                             title: Text1(
//                               text: 'Third Choice',
//                               color: Colors.black,
//                             ),
//                             groupValue: selectedValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedValue = 3;
//                               });
//                             }),
//                       ),
//                       Transform.scale(
//                         scale: 1.1,
//                         child: RadioListTile(
//                             value: 4,
//                             title: Text1(
//                               text: 'Fourth Choice',
//                               color: Colors.black,
//                             ),
//                             groupValue: selectedValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedValue = 4;
//                               });
//                             }),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Align(
//                   child: isDoctor
//                       ? null
//                       : DefaultButton(text: 'Send Answer', onPressed: () {})),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
