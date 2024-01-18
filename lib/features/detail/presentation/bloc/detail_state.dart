part of 'detail_bloc.dart';

@CopyWith()
class DetailState extends BaseBlocState {
  const DetailState({
    required super.status,
    super.message,
  });

  factory DetailState.init() => const DetailState(status: BaseStateStatus.init);

  @override
  List get props => [status, message];
}
