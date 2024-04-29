import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_listing_using_bloc/features/details_page/repo/details_repo.dart';
import 'package:product_listing_using_bloc/model/product_details.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsInitialFetchEvent>(detailsInitialFetchEvent);
  }

  FutureOr<void> detailsInitialFetchEvent(
      DetailsInitialFetchEvent event, Emitter<DetailsState> emit) async {
        emit(DetailsLoadingState());
        List<ProductDetails> products= await DetailsRepo.fetchProductDetails();
        emit(DetailsSucessState(products: products));
      }
}
