import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdl_mobile/common/widgets/textfields/textfields/index.dart';

import '../../index.dart';
import '../../widgets/buttons/app_button.dart';

class DialogService {
  static Future<dynamic> createFolder(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: _CreateFolderDialog(),
      ),
    );
  }

  static Future<dynamic> showActionDialog(
    BuildContext context, {
    String? leftButtonText,
    String? rightButtonText,
    VoidCallback? onPressedLeftButton,
    VoidCallback? onPressedRightButton,
    String? description,
    TextStyle? descriptionTextStyle,
    TextStyle? leftButtonTextStyle,
    TextStyle? rightButtonTextStyle,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: _DialogWidget(
            leftButtonTextStyle: leftButtonTextStyle,
            leftButtonText: leftButtonText,
            onPressedLeftButton: onPressedLeftButton,
            description: description,
            descriptionTextStyle: descriptionTextStyle,
            rightButtonText: rightButtonText,
            onPressedRightButton: onPressedRightButton,
            rightButtonTextStyle: rightButtonTextStyle,
          ),
        );
      },
    );
  }
}

class _DialogWidget extends StatefulWidget {
  final String? leftButtonText;
  final String? rightButtonText;
  final VoidCallback? onPressedLeftButton;
  final VoidCallback? onPressedRightButton;
  final String? description;
  final TextStyle? descriptionTextStyle;
  final TextStyle? leftButtonTextStyle;
  final TextStyle? rightButtonTextStyle;

  const _DialogWidget({
    Key? key,
    this.leftButtonText,
    this.rightButtonText,
    this.onPressedLeftButton,
    this.onPressedRightButton,
    this.description,
    this.descriptionTextStyle,
    this.leftButtonTextStyle,
    this.rightButtonTextStyle,
  }) : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<_DialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.description != null ? Text(widget.description ?? "", textAlign: TextAlign.center, style: widget.descriptionTextStyle ?? AppStyles.t14r) : const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    isOutlined: true,
                    verticalPadding: 0,
                    title: widget.leftButtonText ?? "OK",
                    onPressed: () {
                      widget.onPressedLeftButton?.call();
                      Navigator.pop(context);
                    },
                    borderRadius: 2,
                    textColor: Colors.black,
                    textStyle: widget.leftButtonTextStyle ?? AppStyles.t14r,
                  ),
                ),
                widget.rightButtonText != null
                    ? const SizedBox(
                        width: 16,
                      )
                    : const SizedBox.shrink(),
                widget.rightButtonText != null
                    ? Expanded(
                        child: AppButton(
                          verticalPadding: 0,
                          title: widget.rightButtonText ?? "",
                          onPressed: () {
                            widget.onPressedRightButton?.call();
                            Navigator.pop(context);
                          },
                          borderRadius: 2,
                          textStyle: widget.leftButtonTextStyle ?? AppStyles.t14r,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CreateFolderDialog extends StatefulWidget {
  const _CreateFolderDialog({super.key});

  @override
  State<_CreateFolderDialog> createState() => _CreateFolderDialogState();
}

class _CreateFolderDialogState extends State<_CreateFolderDialog> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            height: 60.h,
            controller: _controller,
          ),
          SizedBox(
            height: 30.h,
          ),
          AppButton(
            isDisable: true,
            onPressed: () {
              Navigator.pop(context, _controller.text.trim());
            },
            title: 'create_folder'.tr(),
            textStyle: AppStyles.s18w7,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
