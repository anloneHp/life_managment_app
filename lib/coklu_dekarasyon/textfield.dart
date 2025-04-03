import 'package:flutter/material.dart';
import 'package:futbol3/constlar/colors.dart';

class TextFieldDecorations {
  static Widget textfieldDekorasyonu({
    required String labelText,
    required IconData prefixIcon,
    required Color fillColor,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: arkaplanrengi.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: arkaplanrengi),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: yesil),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          prefixIcon: Icon(prefixIcon),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
