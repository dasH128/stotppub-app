import 'package:flutter/material.dart';

class TextFormFieldCustom1 extends StatelessWidget {
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? errorMesagge;
  final Color colorError;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  TextFormFieldCustom1({
    super.key,
    this.label,
    this.hint,
    this.obscureText = false,
    this.errorMesagge,
    this.colorError = const Color(0xFFC62828),
    this.onChanged,
    this.validator,
    this.prefixIcon,
  });
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var colorPrimary = color.primary;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colorPrimary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colorError),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colorError),
        ),
        focusColor: colorPrimary,
        errorText: errorMesagge,
        hintText: hint,
        filled: true,
        fillColor: colorPrimary.withOpacity(0.1),
        prefixIcon:prefixIcon,
        prefixIconColor: colorPrimary,
      ),
    );
  }
}
