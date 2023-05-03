import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.nameController,
    required this.validator,
    required this.labelText,
    required this.prefixIcon,
    this.onFieldSubmitted,
    @required this.suffixIcon,
    required this.textInputType,
    this.obscureText = false,
    this.onPressedSuffixIcon,
  });

  final TextEditingController nameController;
  final String? Function(String?) validator;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType textInputType;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final void Function()? onPressedSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: textInputType,
      controller: nameController,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: onPressedSuffixIcon, icon: Icon(suffixIcon))
            : null,
        prefixIcon: Icon(prefixIcon),
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
