import 'package:flutter/material.dart';

class CheckConnection extends StatelessWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/10_Connection Lost.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 25,
                      color: const Color(0xFF59618B).withOpacity(0.17),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    child: Text(
                      "retry".toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
