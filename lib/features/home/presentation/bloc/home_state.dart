part of 'home_bloc.dart';

@CopyWith()
class HomeState extends BaseBlocState {
  const HomeState({
    required super.status,
    super.message,
    this.listFolder,
  });
  final List<FolderEntity>? listFolder;

  factory HomeState.init() => const HomeState(status: BaseStateStatus.init);

  @override
  List get props => [
        status,
        message,
        listFolder,
      ];
}
