import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonText;
  final ValueChanged onPressed;

  const ElevatedButtonWidget({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        onPressed("SUBMIT")
      },
      child: Text(buttonText),
    );
  }
}
