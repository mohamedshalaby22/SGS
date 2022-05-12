import 'package:flutter/material.dart';

class BlockButton extends StatefulWidget {
  const BlockButton({Key? key}) : super(key: key);

  @override
  State<BlockButton> createState() => _BlockButtonState();
}

final isLoading = ValueNotifier<bool>(false);

class _BlockButtonState extends State<BlockButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    isLoading.value = !isLoading.value;
                  },
                  child: AnimatedBuilder(
                      animation: isLoading,
                      builder: (context, _) {
                        return isLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white))
                            : const Text('Login');
                      }))),
        ),
      ),
    );
  }
}
