import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../gen/assets.gen.dart';
import '../constants.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

///Use for Network Image
class CachedImageWidget extends StatelessWidget {
  final String? url;
  final Alignment alignment;
  final double? borderRadius;
  final BoxShape? shape;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  const CachedImageWidget({
    Key? key,
    this.url,
    this.borderRadius,
    this.alignment = Alignment.topLeft,
    this.fit,
    this.shape,
    this.width,
    this.height,
    this.boxShadow,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? 'https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=',
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          boxShadow: boxShadow,
          borderRadius: shape == null ? BorderRadius.circular(borderRadius ?? 0) : null,
          shape: shape ?? BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      fit: BoxFit.cover,
      alignment: alignment,
      memCacheHeight: Config.memCacheHeight,
      memCacheWidth: Config.memCacheWidth,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Center(
          child: Assets.svg.appLogo.svg(),
        ),
      ),
    );
  }
}

CachedNetworkImageProvider cachedNetworkImageProvider(url) => CachedNetworkImageProvider(
      url,
    );
