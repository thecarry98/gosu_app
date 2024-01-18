// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:event_bus/event_bus.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/local_data/shared_pref.dart' as _i11;
import '../common/logger/logger.dart' as _i12;
import '../common/notification/local_notification_helper.dart' as _i10;
import '../common/utils/loading/loading_service.dart' as _i9;
import '../common/utils/snack_bar/snack_bar_helper.dart' as _i13;
import '../features/detail/presentation/bloc/detail_bloc.dart' as _i4;
import '../features/home/data/service/home_service.dart' as _i8;
import '../features/home/presentation/bloc/home_bloc.dart' as _i7;
import '../routes/app_pages.dart' as _i3;
import 'app_module.dart' as _i14;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.factory<_i4.DetailBloc>(() => _i4.DetailBloc());
  gh.singleton<_i5.Dio>(appModule.dio);
  gh.singleton<_i6.EventBus>(appModule.eventBus);
  gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc());
  gh.factory<_i8.HomeService>(() => _i8.HomeService(gh<_i5.Dio>()));
  gh.singleton<_i9.LoadingService>(_i9.LoadingService());
  gh.singleton<_i10.LocalNotificationHelper>(_i10.LocalNotificationHelper());
  gh.factory<_i11.LocalStorage>(() => _i11.LocalStorageImpl());
  gh.singleton<_i12.LogUtils>(_i12.LogUtils());
  gh.singleton<_i13.SnackBarHelper>(_i13.SnackBarHelper());
  return getIt;
}

class _$AppModule extends _i14.AppModule {}
