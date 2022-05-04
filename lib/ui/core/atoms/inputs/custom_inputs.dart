import 'package:flutter/material.dart';


class CustomInputs {

  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.3))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.3))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon( icon, color: Colors.grey ),
      labelStyle: TextStyle( color: Colors.grey ),
      hintStyle: TextStyle( color: Colors.grey ),
    );
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon
  }) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon( icon, color: Colors.grey ),
      labelStyle: TextStyle( color: Colors.grey ),
      hintStyle: TextStyle( color: Colors.grey )
    );
  }


  static InputDecoration formInputDecorationIcon({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon( icon, color: Colors.grey ),
      labelStyle: TextStyle( color: Colors.grey ),
      hintStyle: TextStyle( color: Colors.grey ),
      suffixIcon: Icon(
                Icons.error,
              ),
    );
  }

  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
    String? errorText,
  }){
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      hintText: hint,
      labelText: label,
      errorText: errorText,
      labelStyle: TextStyle( color: Colors.grey ),
      hintStyle: TextStyle( color: Colors.grey ),
      suffixIcon: Icon( Icons.error ),
    );
  }

}