import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdl_mobile/base/bloc/index.dart';
import 'package:sdl_mobile/common/widgets/app_loading_widget.dart';
import 'package:sdl_mobile/features/home/presentation/widgets/home_folder_widget.dart';
import 'package:sdl_mobile/routes/app_pages.dart';

import '../../../base/base_widget.dart';
import '../../../common/index.dart';
import 'bloc/home_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeEvent, HomeState, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const HomeEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        hasBack: false,
        leading: const SizedBox.shrink(),
        title: 'Gosu',
        textStyle: AppStyles.s20w7,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: blocBuilder(
          (c, s) => s.status == BaseStateStatus.loading
              ? const AppLoadingWidget()
              : ListView.separated(
                  // reverse: true,
                  itemBuilder: (c, i) => HomeFolderWidget(
                    folder: s.listFolder?[i],
                    onTapFolder: () {
                      context.router.push(DetailRoute(folder: s.listFolder?[i]));
                    },
                  ),
                  itemCount: s.listFolder?.length ?? 0,
                  separatorBuilder: (c, i) => SizedBox(height: 20.h),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);

          // if (result != null) {
          //   File file = File(result.files.single.path!);
          // } else {
          //   // User canceled the picker
          // }
          final res = await DialogService.createFolder(context);
          bloc.add(HomeEvent.createFolder(res));
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
