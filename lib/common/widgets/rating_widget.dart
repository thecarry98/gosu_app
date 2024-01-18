import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    this.color,
    this.initValue,
  });
  final Color? color;
  final double? initValue;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initValue ?? 0,
      direction: Axis.horizontal,
      ignoreGestures: true,
      allowHalfRating: true,
      // glow: false,
      itemSize: 15.w,
      itemCount: 5,
      glowColor: color,
      // unratedColor: color?.withAlpha(50),
      itemBuilder: (c, _) => Icon(
        Icons.star,
        color: color,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
