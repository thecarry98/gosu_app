import 'package:event_bus/event_bus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/index.dart';
import '../../di/di_setup.dart';
import 'base_bloc_state.dart';

abstract class BaseBloc<E, S extends BaseBlocState> extends Bloc<E, S> {
  BaseBloc(super.initialState);
  final localPref = getIt<LocalStorage>();
  final eventBus = getIt<EventBus>();
  // Future<AssessorInfo> getUser() async {
  //   final res = await localPref.get(PrefKeys.assessorInfo);
  //   return AssessorInfo.fromJson(jsonDecode(res));
  // }

  Future<void> logOut() async {
    //   await localPref.remove(PrefKeys.assessorInfo);
    //   await localPref.remove(PrefKeys.token);
    // Future<void> logOut() async {
    //   await localPref.remove(PrefKeys.assessorInfo);
    //   await localPref.remove(PrefKeys.token);
    // }
  }
  // void saveUser(UserModel data) {
  //   localPref.save(PrefKeys.assessorInfo, jsonEncode(data));
  // }

  // void saveToken(String? token) {
  //   localPref.save(PrefKeys.token, token);
  // }

  // Future<User?> getUser() async {
  //   final String _u = await localPref.get(PrefKeys.assessorInfo);
  //   return UserModel.fromJson(jsonDecode(_u)).user;
  // }
}
