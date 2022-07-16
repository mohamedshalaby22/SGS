// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/degrees.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

class DegressPage extends StatelessWidget {
  const DegressPage(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    var random = degrees.toList()..shuffle();
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text1(
              text: 'Degrees',
              size: 25,
              color: primaryColor,
            ),
            const SizedBox(
              height: defaultPading,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/grades.jpg',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: defaultPading,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text1(
                      text: 'Degrees Title',
                      size: 17,
                      color: primaryColor,
                    ),
                    Text1(
                      text: 'Degrees Value',
                      size: 17,
                      color: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1.2,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(
                  degrees.length,
                  (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            width: 100,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(
                                  color: Colors.blue.shade200,
                                )),
                            child: Center(
                              child: Text1(
                                  text: degrees[index].text,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 100,
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(
                                  color: Colors.blue.shade200,
                                )),
                            child: Center(
                              child: Text1(
                                  text: random[index].deg.toString(),
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      )),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text1(
                  text: 'Total',
                  color: Colors.blue,
                  size: 25,
                ),
                const SizedBox(
                  width: 40,
                ),
                Text1(
                  text: '54',
                  color: Colors.blue,
                  size: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class LocalSa extends StatelessWidget {
//   LocalSa({
//     Key? key,
//     this.color = const Color(0xffBDBDBD),
//     required this.text,
//   }) : super(key: key);
//   String text;
//   Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         bottom: 10,
//       ),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Center(
//             child: Container(
//               width: double.infinity,
//               height: 1,
//               color: Colors.grey.shade300,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Center(
//             child: Text1(
//               text: text,
//               size: 17,
//               color: color,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
