import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: Column(
          children: [
            Row(
              children: [
                Text1(
                  text: 'Attendance',
                  size: 25,
                  color: primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: defaultPading,
            ),
            Image.asset(
              'assets/files.png',
              width: 200,
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text1(
                  text: 'Absence date',
                  color: primaryColor,
                  size: 20,
                ),
                Text1(
                  text: 'Absence status',
                  color: primaryColor,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: defaultPading / 2,
            ),
            const Divider(
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(
                      top: defaultPading, bottom: defaultPading / 2),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text1(
                        text: '2022-6-11',
                        color: Colors.grey.shade500,
                        size: 18,
                      ),
                      Container(
                        width: 30,
                        height: 7,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Text1(
                        text: 'Attendant',
                        color: Colors.green,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
