part of 'store_user_data_cubit.dart';

@immutable
sealed class StoreUserDataState {}

final class StoreUserDataInitial extends StoreUserDataState {}

final class StoreUserDataLoading extends StoreUserDataState {}

final class StoreUserDataFialure extends StoreUserDataState {
  final String errorMessage;

  StoreUserDataFialure({required this.errorMessage});
}

final class StoreUserDataSuccess extends StoreUserDataState {}
