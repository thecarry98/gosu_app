import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator(
                color: color,
              )
            : CupertinoActivityIndicator(
                color: color,
              ),
      ),
    );
  }
}
