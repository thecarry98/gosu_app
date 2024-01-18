import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../features/detail/presentation/detail_page.dart';
import '../features/home/presentation/entity/folder_entity.dart';
import '../features/home/presentation/home_page.dart';
import 'app_routes.dart';

part 'app_pages.gr.dart';

@singleton
@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: AppRoutes.home, initial: true),
        AutoRoute(page: DetailRoute.page, path: AppRoutes.detail),
      ];
}
