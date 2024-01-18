import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../base/network/models/base_data.dart';

part 'home_service.g.dart';

@RestApi()
@injectable
abstract class HomeService {
  @factoryMethod
  factory HomeService(Dio dio) = _HomeService;
}
