import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_theme/index.dart';

class NoBorderTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String text)? onChanged;
  final Function(bool focus)? onFocus;
  final Function(String text)? onSubmitted;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final bool? isShowPrefix;
  final bool? hasCurrentInput;
  final bool? enable;
  final bool? expand;
  final FocusNode? focusNode;
  final bool? readOnly;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final bool? requestFocus;
  final Color textColor;
  final TextStyle? textStyle;
  final int? maxLength;
  final Function()? onTap;
  final bool hasClearButton;
  final bool? autofocus;
  final bool? filled;

  const NoBorderTextField({
    Key? key,
    this.keyboardType,
    this.isPassword = false,
    this.textColor = AppColors.primaryColor,
    this.enable = true,
    this.textAlign,
    this.requestFocus,
    this.inputFormatters,
    this.hasClearButton = true,
    this.onTap,
    this.focusNode,
    this.onFocus,
    this.readOnly,
    this.hasCurrentInput,
    this.textStyle,
    this.maxLength,
    this.hintStyle,
    this.hintText,
    this.controller,
    this.onChanged,
    this.maxLine,
    this.isShowPrefix,
    this.onSubmitted,
    this.expand,
    this.autofocus,
    this.filled,
  }) : super(key: key);

  @override
  State<NoBorderTextField> createState() => _NoBorderTextFieldState();
}

class _NoBorderTextFieldState extends State<NoBorderTextField> {
  late bool hasText;
  final FocusNode _focusNode = FocusNode();
  late TextEditingController controller;

  @override
  void didUpdateWidget(covariant NoBorderTextField oldWidget) {
    if (widget.isShowPrefix != null) {
      hasText = widget.isShowPrefix!;
      return;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    if (widget.requestFocus != null) {
      _focusNode.requestFocus();
    }
    hasText = controller.text.isNotEmpty;
    super.initState();
  }

  void _showXIcon() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        // if (widget.readOnly ?? false)
        hasText = controller.text.trim().isNotEmpty;
      });
    });
  }

  void _clearText() {
    controller.clear();
    widget.onChanged?.call('');

    setState(() {
      if (!mounted) return;
      hasText = false;
      _focusNode.requestFocus();
    });
  }

  void _setTextValue(bool value) {
    if (!(widget.hasCurrentInput ?? true)) return;
    widget.onFocus?.call(value);

    try {
      controller.value = TextEditingValue(
        text: controller.text,
        selection: TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        ),
      );
    } catch (e) {
      //do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // if (widget.isShowPrefix ?? false)
        //   Padding(
        //     padding: EdgeInsets.all(4.0.w),
        //     child: BaseImage(ImageUtils.icCheckBoxSelect),
        //   ),
        Flexible(
          child: Focus(
            onFocusChange: _setTextValue,
            child: TextField(
              autofocus: widget.autofocus ?? false,
              focusNode: widget.requestFocus == null ? widget.focusNode : _focusNode,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword,
              controller: controller,
              expands: widget.expand ?? false,
              enabled: widget.enable,
              textCapitalization: TextCapitalization.sentences,
              minLines: (widget.expand ?? false) ? null : 1,
              textAlign: widget.textAlign ?? TextAlign.start,
              readOnly: widget.readOnly ?? false,
              style: widget.textStyle ?? AppStyles.t14l,
              maxLines: (widget.expand ?? false) ? null : widget.maxLine ?? 1,
              onChanged: (v) {
                _showXIcon();
                widget.onChanged?.call(v);
              },
              onSubmitted: widget.onSubmitted,
              onTap: () {
                _showXIcon();
                widget.onChanged?.call(controller.text);
                widget.onTap?.call();
              },
              inputFormatters: [
                ...?widget.inputFormatters,
                LengthLimitingTextInputFormatter(widget.maxLength),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                isCollapsed: true,
                labelStyle: null, //todo
                hintText: widget.hintText ?? "",
                hintStyle: widget.hintStyle ?? AppStyles.t14l.copyWith(color: AppColors.primaryColor),
                filled: widget.filled,
              ),
            ),
          ),
        ),
        if ((widget.readOnly ?? false) || (!widget.hasClearButton))
          const SizedBox.shrink()
        else
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: hasText ? 16.w : 0,
            width: hasText ? 16.w : 0,
            child: InkWell(
              onTap: () => _clearText(),
              // child: Assets.svg.icCloseCircle.svg(height: 16.w, width: 16.w),
            ),
          ),
      ],
    );
  }
}
