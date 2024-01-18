// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../app_theme/index.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    Key? key,
    required this.isChecked,
  }) : super(key: key);
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      width: 16.w,
      padding: isChecked ? EdgeInsets.all(2.w) : EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryColor),
        color: Colors.white,
      ),
      child: isChecked
          ? Container(
              height: 12.h,
              width: 12.h,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
            )
          : Container(
              height: 12.h,
              width: 12.h,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
    );
  }
}

class ListCheckBoxWidget extends StatefulWidget {
  const ListCheckBoxWidget({
    super.key,
    this.listData,
    this.listDataSelected,
    this.isAll,
    this.chooseData,
    this.hasAll,
    this.isDisable,
    this.isHorizontalPadding,
    this.padding,
    this.itemPadding,
  });
  final List<String>? listData;
  final List<String>? listDataSelected;
  final Function(List<String>?)? chooseData;
  final bool? isAll;
  final bool? hasAll;
  final bool? isDisable;
  final double? isHorizontalPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? itemPadding;

  @override
  State<ListCheckBoxWidget> createState() => _ListCheckBoxWidgetState();
}

class _ListCheckBoxWidgetState extends State<ListCheckBoxWidget> {
  List<String>? _listSelected;
  late bool? isAll;
  bool? isExtend;
  late bool? isDisable;
  @override
  void initState() {
    isDisable = widget.isDisable;
    isExtend = widget.listData!.length <= 5;
    _listSelected = [];
    if (widget.listDataSelected?.isNotEmpty == true) {
      _listSelected?.addAll(widget.listDataSelected!);
    } else {
      _listSelected = [];
    }
    _checkIsAll();
    super.initState();
  }

  _extendsFn() {
    setState(() {
      isExtend = true;
    });
  }

  _checkIsAll() {
    if (_listSelected?.length == widget.listData?.length) {
      isAll = true;
    } else {
      isAll = false;
    }

    print(_listSelected?.length);
    widget.chooseData?.call(_listSelected);
  }

  @override
  void didUpdateWidget(mode) {
    super.didUpdateWidget(mode);

    if (widget.listDataSelected?.isNotEmpty == true) {
      _listSelected = [];
      _listSelected?.addAll(widget.listDataSelected ?? []);
    } else {
      _listSelected = [];
    }

    // _checkIsAll();
  }

  void change(int i, bool? value) {
    setState(() {
      if (value == true) {
        _listSelected?.add(widget.listData?[i] ?? '');
      } else {
        if (_listSelected!.contains(widget.listData?[i])) {
          final index = _listSelected?.indexOf(widget.listData?[i] ?? '');
          // _listSelected ?? [].removeWhere((e) => e == widget.listData?[i]);
          _listSelected?.removeAt(index ?? -1);
        }
      }
      _checkIsAll();
    });
  }

  void onChangeAll(bool? value) {
    if (value == true) {
      //  setState(() {
      _listSelected?.clear();
      _listSelected?.addAll(widget.listData ?? []);
      //  });
    } else {
      //  setState(() {
      _listSelected = [];
      //});
    }
    _checkIsAll();
  }

  _setCheckBox() {
    return ListView.builder(
      key: UniqueKey(),
      padding: widget.padding ?? EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (c, i) => Padding(
        padding: widget.itemPadding ?? EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
              child: Checkbox(
                  side: const BorderSide(width: 1, color: AppColors.cE0E0E0),
                  activeColor: AppColors.c25BB94,
                  value: _listSelected?.any((element) => element == widget.listData?[i]),
                  onChanged: isDisable == true
                      ? null
                      : (value) {
                          change(i, value);
                        }),
            ),
            Expanded(
              child: Text(
                '${widget.listData?[i]}',
                style: AppStyles.s15w5.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      // separatorBuilder: (c, i) => SizedBox(height: 5.h),
      itemCount: isExtend == false ? 5 : widget.listData?.length ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.isHorizontalPadding ?? 20.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.hasAll == true
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                      child: Checkbox(
                        side: const BorderSide(width: 1, color: AppColors.cE0E0E0),
                        value: isAll,
                        activeColor: AppColors.c25BB94,
                        onChanged: isDisable == true
                            ? null
                            : (value) {
                                onChangeAll(value);
                              },
                      ),
                    ),
                    Text(
                      'all'.tr(),
                      style: AppStyles.s15w5.copyWith(color: Colors.black),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          _setCheckBox(),
          SizedBox(
            height: 10.h,
          ),
          isExtend == false
              ? GestureDetector(
                  onTap: _extendsFn,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'extend'.tr(),
                        style: AppStyles.s15w5.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Assets.svg.arrowDown.svg(),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
