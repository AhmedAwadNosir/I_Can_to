part of 'delet_item_form_fav_list_cubit.dart';

@immutable
sealed class DeletItemFormFavListState {}

final class DeletItemFormFavListInitial extends DeletItemFormFavListState {}

final class DeletItemFormFavListLoading extends DeletItemFormFavListState {}

final class DeletItemFormFavListFailure extends DeletItemFormFavListState {
  final String errorMessage;

  DeletItemFormFavListFailure({required this.errorMessage});
}

final class DeletItemFormFavListSuccess extends DeletItemFormFavListState {}
