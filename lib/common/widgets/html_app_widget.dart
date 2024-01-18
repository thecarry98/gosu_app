import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../index.dart';

class HtmlAppWidget extends StatelessWidget {
  const HtmlAppWidget({
    super.key,
    this.html,
    this.textStyle,
  });
  final String? html;
  final TextStyle? textStyle;

  Future<bool> onTapUrl(String url) async {
    print('Can not launch url');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html ?? '',
      customStylesBuilder: (element) {
        return null;
      },
      onTapUrl: (url) => onTapUrl(url),
      customWidgetBuilder: (element) {
        if (element.localName?.contains('img') == true) {
          return CachedImageWidget(
            height: 200.h,
            borderRadius: 16.r,
            url: element.attributes['src'],
            fit: BoxFit.fill,
          );
        }
        return null;
      },
      renderMode: RenderMode.column,
      textStyle: textStyle ?? AppStyles.s13w4.copyWith(color: AppColors.c282828),
    );
  }
}
