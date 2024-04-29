part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}
sealed class DetailsActionState extends DetailsState{}

final class DetailsInitial extends DetailsState {}

class DetailsLoadingState extends DetailsState{}
class DetailsErrorState extends DetailsState{}
class DetailsSucessState extends DetailsState{
  final List<ProductDetails> products;
  DetailsSucessState({required this.products});
}
