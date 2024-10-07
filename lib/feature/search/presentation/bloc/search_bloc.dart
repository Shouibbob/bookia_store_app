import 'dart:developer';

import 'package:bookia_store_app/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_store_app/feature/search/data/repo/search_repo.dart';
import 'package:bookia_store_app/feature/search/presentation/bloc/search_event.dart';
import 'package:bookia_store_app/feature/search/presentation/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchProductEvent>(productSearch);
  }

  BestSellerResponseModel? searchResponseModel;

  Future<void> productSearch(
      SearchProductEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      await SearchRepo.productSearch(searchName: event.searchName)
          .then((value) {
        if (value != null) {
          searchResponseModel = value;
          emit(SearchLoaded());
        } else {
          emit(SearchError());
        }
      });
    } catch (e) {
      log(e.toString());
      emit(SearchError());
    }
  }
}
