import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../common/index.dart';
import '../entity/folder_entity.dart';

class HomeFolderWidget extends StatelessWidget {
  const HomeFolderWidget({
    super.key,
    this.folder,
    this.onTapFolder,
  });
  final FolderEntity? folder;
  final Function()? onTapFolder;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: InkWell(
        onTap: onTapFolder,
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.cECECEC),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 6.w),
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10.r,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text('${folder?.name}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
