import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme/index.dart';
import '../../widgets/buttons/app_button.dart';
import '../../widgets/textfields/search_textfield.dart';

Future<int> showSelectionChooseOption(
  BuildContext context, {
  int? currentIndex,
  List<String>? listOption,
  String? title,
}) async {
  final res = await showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    context: context,
    builder: (context) => _SelectionOptionWidget(
      listOption: listOption,
      title: title,
      currentIndex: currentIndex,
    ),
  );
  return res ?? -1;
}

class _SelectionOptionWidget extends StatefulWidget {
  const _SelectionOptionWidget({
    super.key,
    this.listOption,
    this.currentIndex,
    this.title,
  });
  final List<String>? listOption;
  final String? title;
  final int? currentIndex;

  @override
  State<_SelectionOptionWidget> createState() => __SelectionOptionWidgetState();
}

class __SelectionOptionWidgetState extends State<_SelectionOptionWidget> {
  late int? _index;
  @override
  void initState() {
    super.initState();
    _index = widget.currentIndex;
  }

  void _selectOption(String? e) {
    setState(() {
      _index = (widget.listOption ?? []).indexOf(e ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.w),
        topRight: Radius.circular(16.w),
      ),
      child: Container(
        // height: 200.h,
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 20.w,
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.title}',
                  style: AppStyles.s13w5.copyWith(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),

            Expanded(
              child: ListView.builder(
                itemBuilder: (c, i) => InkWell(
                  onTap: () => _selectOption(widget.listOption?[i]),
                  child: _OptionWidget(
                    title: widget.listOption?[i],
                    selected: (widget.listOption ?? []).indexOf(widget.listOption?[i] ?? '') == _index,
                  ),
                ),
                itemCount: widget.listOption?.length,
              ),
            ),

            // ...(widget.listOption ?? [])
            //     .map((e) => InkWell(
            //           onTap: () => _selectOption(e),
            //           child: _OptionWidget(
            //             title: e,
            //             selected:
            //                 (widget.listOption ?? []).indexOf(e) == _index,
            //           ),
            //         ))
            //     .toList(),
            SizedBox(
              height: 10.h,
            ),
            AppButton(
              onPressed: () {
                Navigator.pop(context, _index);
              },
              title: 'accept'.tr(),
              textColor: Colors.white,
              textStyle: AppStyles.s12w6,
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionWidget extends StatelessWidget {
  const _OptionWidget({
    super.key,
    this.title,
    this.selected,
  });
  final String? title;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '$title',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.s11w3.copyWith(
                color: AppColors.textSecondaryColor,
              ),
            ),
          ),
          // selected == true ? Assets.icons.iconTick.svg() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

Future<List<int>> showSelectionBottomSheet(
  BuildContext context, {
  required List<String> data,
  List<int>? selectedIndexes,
  bool? hasSelectedAll,
  String? title,
}) async {
  final res = await showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    context: context,
    builder: (c) => SelectionBottomSheetWidget(
      isRadio: false,
      data: data,
      selectedIndexes: selectedIndexes ?? [],
      hasSelectAll: hasSelectedAll ?? false,
    ),
  );
  return res ?? [0];
}

class ItemSelection {
  final String title;
  final bool show;
  final bool selected;

  ItemSelection({
    required this.title,
    this.show = true,
    this.selected = false,
  });

  ItemSelection copyWith({
    bool? show,
    bool? selected,
  }) {
    return ItemSelection(
      title: title,
      show: show ?? this.show,
      selected: selected ?? this.selected,
    );
  }
}

class SelectionBottomSheetWidget extends StatefulWidget {
  final List<String> data;
  final List<int> selectedIndexes;
  final bool isRadio;
  final bool hasSelectAll;
  final bool hasRefreshButton;
  final String? title;
  final bool isSearch;
  const SelectionBottomSheetWidget({
    Key? key,
    required this.data,
    this.selectedIndexes = const [],
    this.isRadio = true,
    this.hasSelectAll = false,
    this.hasRefreshButton = false,
    this.title,
    this.isSearch = false,
  }) : super(key: key);

  @override
  State<SelectionBottomSheetWidget> createState() => _SelectionBottomSheetWidgetState();
}

class _SelectionBottomSheetWidgetState extends State<SelectionBottomSheetWidget> {
  final searchController = TextEditingController();
  final List<ItemSelection> items = [];

  @override
  void initState() {
    items.addAll(widget.data.map((e) => ItemSelection(title: e)));
    for (final idx in widget.selectedIndexes) {
      items[idx] = items[idx].copyWith(selected: true);
    }

    super.initState();
  }

  void search(String key) {
    setState(() {
      final List<ItemSelection> copy = List.from(items);
      items.clear();
      items.addAll(
        copy
            .map(
              (e) => e.copyWith(
                show: e.title.toLowerCase().contains(key.trim().toLowerCase()),
              ),
            )
            .toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        submit();
        return Future<bool>.value(true);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // InkWell(
                  //   onTap: () => submit(),
                  //   child: Container(
                  //     height: 4.h,
                  //     width: 32.h,
                  //     margin: EdgeInsets.all(8.w),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(100),
                  //       color: Colors.red,
                  //       // color: ColorUtils.gray4BackgroundColor,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 8.h),
                  AppBar(
                    toolbarHeight: 40,
                    title: Text(
                      '${widget.title ?? 'haha'}',
                      style: AppStyles.s14w4.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leadingWidth: 70.w,
                    leading: widget.hasRefreshButton
                        ? TextButton(
                            onPressed: () => selectAll(value: false),
                            child: FittedBox(
                              child: Text(
                                "refresh".tr(),
                                // style: StyleUtils.buttonText2
                                //     .copyWith(color: ColorUtils.primaryColor),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    actions: const [
                      SizedBox.shrink(),
                    ],
                    // actions: [
                    //   if (!widget.isRadio)
                    //     TextButton(
                    //       // onPressed: () => submit(),
                    //       onPressed: () => Navigator.pop(context),
                    //       child: FittedBox(
                    //         child: Text(
                    //           "confirm_dialog_ok_title".tr(),
                    //           // style: StyleUtils.buttonText2
                    //           //     .copyWith(color: ColorUtils.primaryColor),
                    //         ),
                    //       ),
                    //     ),
                    // ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  // SizedBox(height: 20.h),
                  if (widget.isSearch == true)
                    CustomTextFieldSearch(
                      focusNode: FocusNode(),
                      searchTextController: searchController,
                      onSearch: search,
                      onChanged: search,
                    ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            if (!widget.isRadio && widget.hasSelectAll)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: TextButton(
                    onPressed: selectAll,
                    child: Text(
                      "select_all".tr(),
                      // style: StyleUtils.buttonText2
                      //     .copyWith(color: ColorUtils.primaryColor),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: EdgeInsets.all(16.w),
                margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (c, i) => items[i].show ? const Divider() : const SizedBox.shrink(),
                  itemBuilder: (c, i) => items[i].show
                      ? InkWell(
                          onTap: () {
                            if (items[i].selected) {
                              if (widget.isRadio) {
                                //do nothing
                                submit(res: [i]);
                              } else {
                                setState(() {
                                  items[i] = items[i].copyWith(selected: false);
                                });
                              }
                            } else {
                              setState(() {
                                if (widget.isRadio) {
                                  submit(res: [i]);
                                } else {
                                  //multi Selection
                                  items[i] = items[i].copyWith(selected: true);
                                  Navigator.pop(context);
                                }
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    items[i].title,
                                    // style: StyleUtils.title6.copyWith(
                                    //   color: ColorUtils.typographyPrimaryText,
                                    // ),
                                  ),
                                ),
                                Container(
                                  height: 20.w,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: items[i].selected ? AppColors.primaryColor : Colors.white,
                                    border: items[i].selected
                                        ? Border.all(
                                            width: 4.w,
                                            color: AppColors.primaryColor,
                                          )
                                        : Border.all(
                                            color: Colors.black,
                                          ),
                                  ),
                                ),
                                // Container(
                                //   height: 24.h,
                                //   width: 24.w,
                                //   color: Colors.white,
                                //   child: items[i].selected ? Icon(Icons.airplane_ticket) : const SizedBox.shrink(),
                                // ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  itemCount: items.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void submit({List<int>? res}) {
    final List<int> result = [];
    if (res == null) {
      for (int i = 0; i < items.length; i++) {
        if (items[i].selected) result.add(i);
      }
    }
    Navigator.pop(context, res ?? result);
    setState(() {});
  }

  void selectAll({bool value = true}) {
    setState(() {
      final List<ItemSelection> copy = List.from(items);
      items.clear();
      items.addAll(
        copy
            .map(
              (e) => e.copyWith(
                selected: value,
              ),
            )
            .toList(),
      );
    });
  }
}
