import 'package:flutter/material.dart';

class InputDecorationForm {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required Color labelTheme,
    IconData? prefixIcon,
    IconButton? suffixIcon,
    Color? borderColor,
  }) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Color.fromARGB(255, 124, 33, 131))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Color.fromARGB(255, 124, 33, 131))),
        hintText: hintText,
        labelText: labelText,
        
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: borderColor ?? Color.fromARGB(255, 124, 33, 131),
              )
            : null,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(
          color: labelTheme,
          decorationThickness: 30,
        ),
        hintStyle: TextStyle(color: labelTheme),
        
        );
  }
}