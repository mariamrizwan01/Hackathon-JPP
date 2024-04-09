import 'package:flutter/material.dart';
import 'package:hackathon/resource/colors.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final bool isLoading;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.isLoading = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 16,
      ),
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      enabled: !widget.isLoading,
      decoration: InputDecoration(
        hintText: "Enter your ${widget.title}",
        hintStyle: const TextStyle(
          color: AppColors.grey,
          fontSize: 16,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
    );
  }
}
