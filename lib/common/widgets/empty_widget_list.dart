import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../index.dart';

class EmptyWidgetList extends StatelessWidget {
  const EmptyWidgetList({
    super.key,
    this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'uploading'.tr(),
      style: AppStyles.s13w6.copyWith(
        color: AppColors.c282828,
      ),
    );
  }
}
