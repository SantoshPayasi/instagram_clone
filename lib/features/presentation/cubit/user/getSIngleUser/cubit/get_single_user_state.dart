part of 'get_single_user_cubit.dart';

sealed class GetSingleUserState extends Equatable {
  const GetSingleUserState();
}

final class GetSingleUserInitial extends GetSingleUserState {
  @override
  List<Object> get props => [];
}

final class SIngleUserLoading extends GetSingleUserState {
  @override
  List<Object> get props => [];
}

final class SingleUserLoaded extends GetSingleUserState {
  final UserEntity user;
  SingleUserLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

final class SIngleUserFailure extends GetSingleUserState {
  @override
  List<Object> get props => [];
}
