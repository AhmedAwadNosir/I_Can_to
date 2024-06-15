part of 'fetch_userdata_cubit.dart';

@immutable
sealed class FetchUserdataState {}

final class FetchUserdataInitial extends FetchUserdataState {}

final class FetchUserdataLoading extends FetchUserdataState {}

final class FetchUserdataFailure extends FetchUserdataState {
  final String errorMessage;

  FetchUserdataFailure({required this.errorMessage});
}

final class FetchUserdataSuccess extends FetchUserdataState {
  final UserModel userData;

  FetchUserdataSuccess({required this.userData});
}
