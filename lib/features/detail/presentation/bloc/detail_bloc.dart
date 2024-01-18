import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/bloc/index.dart';

part 'detail_bloc.freezed.dart';
part 'detail_bloc.g.dart';
part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends BaseBloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState.init()) {
    on<DetailEvent>((DetailEvent event, Emitter<DetailState> emit) async {
      await event.when(
        init: () => _onInit(emit),
      );
    });
  }

  _onInit(Emitter emit) {}
}
