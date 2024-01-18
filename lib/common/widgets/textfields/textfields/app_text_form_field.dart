import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../index.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  FocusNode? focusNode;
  bool autoFocus;
  bool showPassword;
  final Color colorText;
  final Color colorHint;
  final double fontSize;
  bool autoCorrect;
  final String? hinText;
  final double radius;
  final Widget? suffixIcon;
  final TextInputType keyBoardType;
  final int? maxLenght;
  final int? maxLine;
  final TextInputAction? textInputAction;
  final InputBorder? inputBorder;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final bool? readOnly;
  final Function(String)? onSubmitted;
  List<TextInputFormatter>? inputFormatters;
  final bool? enableText;

  AppTextFormField(
      {super.key,
      this.controller,
      this.focusNode,
      this.style,
      this.inputBorder,
      this.contentPadding,
      this.onChanged,
      required this.autoFocus,
      required this.colorText,
      required this.colorHint,
      this.hinText,
      required this.autoCorrect,
      required this.radius,
      required this.fontSize,
      this.suffixIcon,
      this.showPassword = false,
      this.keyBoardType = TextInputType.text,
      this.maxLenght,
      this.maxLine = 1,
      this.textInputAction,
      this.readOnly,
      this.inputFormatters,
      this.onSubmitted,
      this.enableText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      autofocus: autoFocus,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: autoCorrect,
      keyboardType: keyBoardType,
      textInputAction: textInputAction ?? TextInputAction.done,
      obscureText: showPassword,
      maxLength: maxLenght,
      maxLines: maxLine,
      inputFormatters: inputFormatters,
      style: style ??
          TextStyle(
            color: colorText,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
        hintText: hinText,
        suffixIcon: suffixIcon,
        counterText: '',
        enabled: enableText ?? true,
        enabledBorder: inputBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.cECECEC),
              borderRadius: BorderRadius.circular(radius),
            ),
        focusedBorder: inputBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.cECECEC),
              borderRadius: BorderRadius.circular(radius),
            ),
      ),
    );
  }
}
