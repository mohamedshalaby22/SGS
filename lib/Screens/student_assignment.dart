// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/Screens/quiez_page.dart';
// import 'package:flutter_application_3/components/default_button.dart';
// import 'package:flutter_application_3/components/text1.dart';
// import 'package:flutter_application_3/constant/const.dart';
// import 'package:get/get.dart';

// class StudentAssignment extends StatelessWidget {
//   const StudentAssignment({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(defaultPading),
//             padding: const EdgeInsets.all(defaultPading),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey.shade50,
//                 border: Border.all(color: Colors.grey.shade300)),
//             child: Column(
//               children: [
//                 Container(
//                   height: 300,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular((10))),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: CachedNetworkImage(
//                         fit: BoxFit.cover,
//                         imageUrl:
//                             'https://img.freepik.com/free-vector/add-tasks-concept-illustration_114360-4885.jpg?t=st=1653736774~exp=1653737374~hmac=c6068fd8cdb3a78c7397c4737e0f483c938056505e4b4c12f5ef2839867af785&w=826'),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.check_circle,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text1(
//                       text: 'Assignment',
//                       size: 18,
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 DefaultButton(
//                     text: 'Open Asignment',
//                     onPressed: () {
//                       Get.to(() => const QuiezPage(),
//                           transition: Transition.leftToRight);
//                     }),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text1(
//                       text: 'Degree',
//                       size: 20,
//                       color: primaryColor,
//                     ),
//                     Text1(
//                       text: '1',
//                       size: 20,
//                       color: primaryColor,
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
