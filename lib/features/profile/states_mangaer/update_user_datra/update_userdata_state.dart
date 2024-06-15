part of 'update_userdata_cubit.dart';

@immutable
sealed class UpdateUserdataState {}

final class UpdateUserdataInitial extends UpdateUserdataState {}

final class UpdateUserdataLoading extends UpdateUserdataState {}

final class UpdateUserdataFailure extends UpdateUserdataState {
  final String errorMessage;

  UpdateUserdataFailure({required this.errorMessage});
}

final class UpdateUserdataSuccess extends UpdateUserdataState {}
