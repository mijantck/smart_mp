import 'package:flutter/material.dart';

class OTPTextFieldMy extends StatelessWidget {
  final List<TextEditingController> controllers;

  OTPTextFieldMy(this.controllers);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              controller: controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  // Move focus to the next field if available
                  if (index < 5) {
                    FocusScope.of(context).nextFocus();
                  }
                } else {
                  // Move focus to the previous field if available
                  if (index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
