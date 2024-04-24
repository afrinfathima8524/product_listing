import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_listing_using_bloc/data/fav_items.dart';
import 'package:product_listing_using_bloc/model/product_data.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  FavBloc() : super(FavInitial()) {
    on<FavInitialEvent>(favInitialEvent);
    on<FavRemoveEvent>(favRemoveEvent);
  }

  FutureOr<void> favInitialEvent(
      FavInitialEvent event, Emitter<FavState> emit) {
        emit(FavSucessState(favItems: favItems));
      }

  FutureOr<void> favRemoveEvent(FavRemoveEvent event, Emitter<FavState> emit) {
    favItems.remove(event.productsData);
    emit(FavRemovedActionState());
    emit(FavSucessState(favItems: favItems));
  }
}
