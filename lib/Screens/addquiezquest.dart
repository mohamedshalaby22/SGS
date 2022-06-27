// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/Screens/quiez_page.dart';
// import 'package:flutter_application_3/Services/api.dart';
// import 'package:flutter_application_3/components/default_button.dart';
// import 'package:flutter_application_3/components/formfield.dart';
// import 'package:flutter_application_3/components/text1.dart';
// import 'package:flutter_application_3/constant/const.dart';
// import 'package:get/get.dart';

// class CreateQuiez extends StatefulWidget {
//   const CreateQuiez(this.data, {Key? key}) : super(key: key);
//   final Map data;
//   @override
//   State<CreateQuiez> createState() => _CreateQuiezState();
// }

// class _CreateQuiezState extends State<CreateQuiez> {
//   int selectedValue = 0;
//   var question = TextEditingController();
//   var answer1 = TextEditingController();
//   var answer2 = TextEditingController();
//   var answer3 = TextEditingController();
//   var answer4 = TextEditingController();
//   List questions = [
//     {
//       'saved': false,
//       'key': GlobalKey<FormState>(),
//       'question': TextEditingController(),
//       'answer1': TextEditingController(),
//       'answer2': TextEditingController(),
//       'answer3': TextEditingController(),
//       'answer4': TextEditingController(),
//       'ranswer': TextEditingController(),
//     }
//   ];

//   addNewQuestion() {
//     if (questions.length < int.parse(widget.data['qn'])) {
//       questions.add({
//         'saved': false,
//         'key': GlobalKey<FormState>(),
//         'question': TextEditingController(),
//         'answer1': TextEditingController(),
//         'answer2': TextEditingController(),
//         'answer3': TextEditingController(),
//         'answer4': TextEditingController(),
//         'ranswer': TextEditingController(),
//       });
//       setState(() {});
//     }
//   }

//   saveQuestionToDB(e) async {
//     if (e['key'].currentState!.validate() &&
//         e['ranswer'].text.trim().isNotEmpty) {
//       final pd =
//           double.parse(widget.data['td']) / double.parse(widget.data['qn']);
//       await Api.addQuestion(
//               e['question'].text.trim(),
//               e['answer1'].text.trim(),
//               e['ranswer'].text.trim(),
//               pd.toString(),
//               widget.data['id'].toString(),
//               e['answer2'].text.trim(),
//               e['answer4'].text.trim(),
//               e['answer3'].text.trim(),
//               showLoading: true)
//           .then((value) {
//         if (value.isNotEmpty) {
//           e['saved'] = true;
//           setState(() {});
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
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
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
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
//                 text: widget.data['desc'],
//               ),
//               const Divider(
//                 thickness: 2,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text1(
//                 text: 'Number Of Questions',
//                 size: 20,
//                 color: primaryColor,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text1(
//                 text: widget.data['qn'],
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
//                 text: widget.data['td'],
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
//               ...questions.map((e) => buidQuestionWidget(e)).toList(),

//               if (questions.length < int.parse(widget.data['qn']))
//                 DefaultButton(
//                     text: 'Add New Question', onPressed: addNewQuestion),
//               // const SizedBox(height: 20),
//               // DefaultButton(
//               //     text: 'Preview',
//               //     onPressed: () {
//               //       Get.to(() => const QuiezPage(),
//               //           transition: Transition.leftToRight);
//               //     }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buidQuestionWidget(e) {
//     return Form(
//       key: e['key'],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text1(
//             text:
//                 'Enter the text of the question number ${questions.indexOf(e) + 1}',
//             size: 17,
//           ),
//           const SizedBox(
//             height: 7,
//           ),
//           DefaultFormField(
//             readOnly: e['saved'],
//             controller: e['question'],
//             hint: 'question',
//             onSave: () {},
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'question musn\'t be empty';
//               }
//               return null;
//             },
//             type: TextInputType.text,
//             icon: Icons.sort,
//           ),
//           const SizedBox(
//             height: defaultPading,
//           ),
//           Text1(
//             text: 'Enter the first answer',
//             size: 17,
//           ),
//           const SizedBox(
//             height: 7,
//           ),
//           DefaultFormField(
//             readOnly: e['saved'],
//             controller: e['answer1'],
//             hint: 'First choice',
//             onSave: () {},
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'answer musn\'t be empty';
//               }
//               return null;
//             },
//             type: TextInputType.text,
//             icon: Icons.check_circle,
//           ),
//           const SizedBox(
//             height: defaultPading,
//           ),
//           Text1(
//             text: 'Enter the second answer',
//             size: 17,
//           ),
//           const SizedBox(
//             height: 7,
//           ),
//           DefaultFormField(
//             readOnly: e['saved'],
//             controller: e['answer2'],
//             hint: 'second choice',
//             onSave: () {},
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'answer musn\'t be empty';
//               }
//               return null;
//             },
//             type: TextInputType.text,
//             icon: Icons.check_circle,
//           ),
//           const SizedBox(
//             height: defaultPading,
//           ),
//           Text1(
//             text: 'Enter the third answer',
//             size: 17,
//           ),
//           const SizedBox(
//             height: 7,
//           ),
//           DefaultFormField(
//             readOnly: e['saved'],
//             controller: e['answer3'],
//             hint: 'third choice',
//             onSave: () {},
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'answer musn\'t be empty';
//               }
//               return null;
//             },
//             type: TextInputType.text,
//             icon: Icons.check_circle,
//           ),
//           const SizedBox(
//             height: defaultPading,
//           ),
//           Text1(
//             text: 'Enter the last answer',
//             size: 17,
//           ),
//           const SizedBox(
//             height: 7,
//           ),
//           DefaultFormField(
//             readOnly: e['saved'],
//             controller: e['answer4'],
//             hint: 'last choice',
//             onSave: () {},
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'answer musn\'t be empty';
//               }
//               return null;
//             },
//             type: TextInputType.text,
//             icon: Icons.check_circle,
//           ),
//           const SizedBox(
//             height: defaultPading,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.blue.shade50,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Text1(
//                     text: 'Which one is the correct answer?',
//                     size: 17,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Transform.scale(
//                   scale: 1.1,
//                   child: RadioListTile(
//                       value: '1',
//                       title: Text1(
//                         text: 'First Choice',
//                         color: Colors.black,
//                       ),
//                       groupValue: e['ranswer'].text,
//                       onChanged: e['saved']
//                           ? null
//                           : (value) {
//                               e['ranswer'].text = value;
//                               setState(() {});
//                             }),
//                 ),
//                 Transform.scale(
//                   scale: 1.1,
//                   child: RadioListTile(
//                       value: '2',
//                       title: Text1(
//                         text: 'Second Choice',
//                         color: Colors.black,
//                       ),
//                       groupValue: e['ranswer'].text,
//                       onChanged: e['saved']
//                           ? null
//                           : (value) {
//                               e['ranswer'].text = value;
//                               setState(() {});
//                             }),
//                 ),
//                 Transform.scale(
//                   scale: 1.1,
//                   child: RadioListTile(
//                       value: '3',
//                       title: Text1(
//                         text: 'Third Choice',
//                         color: Colors.black,
//                       ),
//                       groupValue: e['ranswer'].text,
//                       onChanged: e['saved']
//                           ? null
//                           : (value) {
//                               e['ranswer'].text = value;
//                               setState(() {});
//                             }),
//                 ),
//                 Transform.scale(
//                   scale: 1.1,
//                   child: RadioListTile(
//                       value: '4',
//                       title: Text1(
//                         text: 'Fourth Choice',
//                         color: Colors.black,
//                       ),
//                       groupValue: e['ranswer'].text,
//                       onChanged: e['saved']
//                           ? null
//                           : (value) {
//                               e['ranswer'].text = value;
//                               setState(() {});
//                             }),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: defaultPading),
//           DefaultButton(
//               text: 'Save',
//               onPressed: e['saved'] ? null : () => saveQuestionToDB(e)),
//           const SizedBox(height: defaultPading),
//         ],
//       ),
//     );
//   }
// }
