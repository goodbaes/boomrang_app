import 'package:flutter/material.dart';

class CustomTextFieldProfile extends StatelessWidget {
  const CustomTextFieldProfile({
    Key? key,
    this.labelText = '',
    required this.textController,
  }) : super(key: key);
  final String labelText;
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: .2,
          ),
        ),
      ),
    );
  }
}
