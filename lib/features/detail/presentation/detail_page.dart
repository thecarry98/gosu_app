import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../base/base_widget.dart';
import '../../home/presentation/entity/folder_entity.dart';
import 'bloc/detail_bloc.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    this.folder,
  });
  final FolderEntity? folder;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends BaseState<DetailPage, DetailEvent, DetailState, DetailBloc> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget renderUI(BuildContext context) {
    return const Placeholder();
  }
}
