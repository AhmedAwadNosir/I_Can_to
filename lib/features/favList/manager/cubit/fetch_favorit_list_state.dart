part of 'fetch_favorit_list_cubit.dart';

@immutable
sealed class FetchFavoritListState {}

final class FetchFavoritListInitial extends FetchFavoritListState {}

final class FetchFavoritListLoading extends FetchFavoritListState {}

final class FetchFavoritListFailure extends FetchFavoritListState {
  final String errorMessage;

  FetchFavoritListFailure({required this.errorMessage});
}

final class FetchFavoritListSuccess extends FetchFavoritListState {
  final List<TranslatedItemModel> favoritList;

  FetchFavoritListSuccess({required this.favoritList});
}
