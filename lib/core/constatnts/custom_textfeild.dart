import 'package:flutter/material.dart';
import '../../../core/constatnts/font_types.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width >= 600
            ? 20 // Tablets → bigger margin
            : MediaQuery.of(context).size.width < 380
            ? 5 // Small phones → very small margin
            : 10, // Normal phones → default margin
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width >= 600 ? 20 : 16, // Responsive font size
          fontWeight: FontWeight.w500,
          fontFamily: MyFonts.poppins, // ✅ Added custom font family

        ),
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.white, size: MediaQuery.of(context).size.width >= 600 ? 28 : 24),
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width >= 600 ? 18 : 16,
            fontWeight: FontWeight.w400,
            fontFamily: MyFonts.poppins, // ✅ Added custom font family

          ),
          hintText: "Enter your ${widget.label}",
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontFamily: MyFonts.poppins,
            fontSize: MediaQuery.of(context).size.width >= 600 ? 18 : 14,
          ),
          filled: true,
          fillColor: Colors.transparent,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
              size: MediaQuery.of(context).size.width >= 600 ? 26 : 22,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.6),
              width: MediaQuery.of(context).size.width >= 600 ? 2 : 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.4),
              width: MediaQuery.of(context).size.width >= 600 ? 2 : 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.white,
              width: MediaQuery.of(context).size.width >= 600 ? 2.5 : 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width >= 600 ? 20 : 16,
            horizontal: MediaQuery.of(context).size.width >= 600 ? 18 : 14,
          ),
        ),
      ),
    );

  }
}
