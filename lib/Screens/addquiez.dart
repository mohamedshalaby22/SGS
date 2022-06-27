// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/Screens/addquiezquest.dart';
// import 'package:flutter_application_3/Services/api.dart';
// import 'package:flutter_application_3/components/default_button.dart';
// import 'package:flutter_application_3/components/formfield.dart';
// import 'package:flutter_application_3/constant/const.dart';
// import 'package:flutter_application_3/controller/auth.dart';
// import 'package:get/get.dart';
// import '../components/text1.dart';

// class AddQuiezNotes extends StatelessWidget {
//   AddQuiezNotes({Key? key}) : super(key: key);
//   var formKey = GlobalKey<FormState>();
//   var notes = TextEditingController();
//   var number = TextEditingController();
//   var degree = TextEditingController();
//   var hour = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     AuthController controller = Get.put(AuthController());
//     controller.getSubjects();

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text1(
//           text: 'Create Assignment +',
//           color: primaryColor,
//           size: 25,
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(defaultPading),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text1(
//                   text: 'Enter Notes',
//                   size: 17,
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 DefaultFormField(
//                   controller: notes,
//                   maxLines: 3,
//                   hint: 'Assignment Notes',
//                   onSave: () {},
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Notes musn\'t be empty';
//                     }
//                     return null;
//                   },
//                   type: TextInputType.text,
//                   icon: Icons.sort,
//                 ),
//                 const SizedBox(
//                   height: defaultPading,
//                 ),
//                 Text1(
//                   text: 'Question Number',
//                   size: 17,
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 DefaultFormField(
//                   controller: number,
//                   hint: '0',
//                   onSave: () {},
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Question Number musn\'t be empty';
//                     }
//                     return null;
//                   },
//                   type: TextInputType.number,
//                   icon: Icons.check_circle,
//                 ),
//                 const SizedBox(
//                   height: defaultPading,
//                 ),
//                 Text1(
//                   text: 'Assignment degree',
//                   size: 17,
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 DefaultFormField(
//                   controller: degree,
//                   hint: '0',
//                   onSave: () {},
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Assignment degree musn\'t be empty';
//                     }
//                     return null;
//                   },
//                   type: TextInputType.number,
//                   icon: Icons.check_circle,
//                 ),
//                 const SizedBox(
//                   height: defaultPading,
//                 ),
//                 Text1(
//                   text: 'Choose subjects',
//                   size: 17,
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Obx(
//                   () => DropdownButtonFormField<String>(
//                     hint: const Text(
//                       'Subjects',
//                     ),
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                     value: controller.item3.value,
//                     items: controller.items3
//                         .map((item) => DropdownMenuItem<String>(
//                             value: item['id'].toString(),
//                             child: Text(
//                               item['subject_name'],
//                               style: TextStyle(
//                                   color: Colors.grey.shade600,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15),
//                             )))
//                         .toList(),
//                     onChanged: (item) {
//                       controller.ChangeSelected3(item!);
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: defaultPading,
//                 ),
//                 DefaultFormField(
//                   controller: hour,
//                   hint: '0',
//                   onSave: () {},
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Duration musn\'t be empty';
//                     }
//                     return null;
//                   },
//                   type: TextInputType.number,
//                   icon: Icons.check_circle,
//                 ),
//                 const SizedBox(
//                   height: defaultPading,
//                 ),
//                 DefaultButton(
//                     text: 'Create Assignment',
//                     onPressed: () async {
//                       if (formKey.currentState!.validate() &&
//                           controller.item3.value.isNotEmpty) {
//                         final data = {
//                           'desc': notes.text.trim(),
//                           'qn': number.text.trim(),
//                           'td': degree.text.trim(),
//                           'id': controller.item3.value.trim(),
//                         };
//                         await Api.addQuiz(
//                                 controller.item3.value.trim(),
//                                 number.text.trim(),
//                                 notes.text.trim(),
//                                 degree.text.trim(),
//                                 hour.text.trim())
//                             .then((value) {
//                           if (value.isNotEmpty) {
//                             Get.to(() => CreateQuiez(data),
//                                 transition: Transition.leftToRight);
//                           }
//                         });
//                       }
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
