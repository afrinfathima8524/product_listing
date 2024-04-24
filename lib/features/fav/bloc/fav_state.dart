part of 'fav_bloc.dart';

@immutable
sealed class FavState {}
sealed class FavActionState extends FavState{}

final class FavInitial extends FavState {}

class FavSucessState extends FavState{
  final List<ProductsData> favItems;
  FavSucessState({required this.favItems});
}
class FavRemovedActionState extends FavActionState{}