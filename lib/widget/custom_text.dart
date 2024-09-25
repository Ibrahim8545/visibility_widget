import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.hint,
    required this.text,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  final String hint;
  final String text;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return text;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Icon(icon),
        label: Text('$hint',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
       border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
