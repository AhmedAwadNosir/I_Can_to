part of 'add_to_favorite_cubit.dart';

@immutable
sealed class AddToFavoriteState {}

final class AddToFavoriteInitial extends AddToFavoriteState {}

final class AddToFavoriteLoading extends AddToFavoriteState {}

final class AddToFavoriteFailure extends AddToFavoriteState {
  final String errorMessage;

  AddToFavoriteFailure({required this.errorMessage});
}

final class AddToFavoriteSuccess extends AddToFavoriteState {}
