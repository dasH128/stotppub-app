import 'package:flutter/material.dart';

class TextDateCustom1Widget extends StatelessWidget {
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final String? errorMesagge;
  final Color colorError;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const TextDateCustom1Widget(
      {super.key,
      this.label,
      this.hint,
      this.prefixIcon,
      this.errorMesagge,
      required this.colorError,
      this.onChanged,
      this.validator});

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
        prefixIcon: prefixIcon,
        prefixIconColor: colorPrimary,
      ),
    );
  }
}
