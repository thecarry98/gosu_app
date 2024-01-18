import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sdl_mobile/common/index.dart';
import 'package:sdl_mobile/features/home/presentation/entity/folder_entity.dart';

import '../../../../base/bloc/index.dart';

part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> with BaseCommonMethodMixin {
  HomeBloc() : super(HomeState.init()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) async {
      await event.when(
        init: () => _onInit(emit),
        createFolder: (folderName) => _onCreateFolder(folderName, emit),
        setListFolder: () => _onSetListFolder(emit),
      );
    });
  }

  late Directory? dirFolder;
  late List<FolderEntity>? _listFolder;

  _onInit(Emitter emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    _listFolder = [];
    await _getPath();
    add(const HomeEvent.setListFolder());
  }

  _onCreateFolder(String folderName, Emitter emit) async {
    emit(state.copyWith(status: BaseStateStatus.appLoading));
    await Directory('${dirFolder?.path}$folderName/').create(recursive: true);
    Directory('${dirFolder?.path}').list().length.then((value) {
      print(value);
    });
    add(const HomeEvent.setListFolder());

    emit(state.copyWith(status: BaseStateStatus.appSuccess));
  }

  _getPath() async {
    final dir = await getTemporaryDirectory();
    dirFolder = await Directory('${dir.path}/folder/').create(recursive: true);
  }

  _onSetListFolder(Emitter emit) async {
    _listFolder?.clear();
    Directory('${dirFolder?.path}').listSync().forEach((event) {
      final f = FolderEntity(
        name: p.basename(event.path),
        path: event.path,
      );
      _listFolder?.add(f);
    });
    emit(state.copyWith(listFolder: _listFolder, status: BaseStateStatus.success));
  }
}
