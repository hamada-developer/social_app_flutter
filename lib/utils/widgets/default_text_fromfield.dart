import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  final bool obscureText;

  const DefaultTextFormField({
    Key? key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.validator,
    this.onEditingComplete,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onEditingComplete: onEditingComplete,
    );
  }
}
