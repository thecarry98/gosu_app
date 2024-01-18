import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';

import '../base/network/dio/dio_builder.dart';

@module
abstract class AppModule {
  @singleton
  Dio get dio => DioBuilder().getDio();

  @singleton
  EventBus get eventBus => EventBus();
}
