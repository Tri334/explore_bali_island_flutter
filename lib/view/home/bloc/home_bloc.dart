import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explore_bali_island_flutter/view/home/bloc/api/service_api.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, InitialState> {
  final ApiService _apiService;
  HomeBloc(this._apiService) : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        if (state.newStatus == ApiRespond.fetchInitial) {
          final fetchPopular = await _apiService.getPopular();
          final fetchNearby = await _apiService.getNearby();
          return emit(state.copyWith(
              nearby: fetchNearby,
              popular: fetchPopular,
              status: ApiRespond.fetchSucces));
        }
      } catch (_) {
        emit(state.copyWith(status: ApiRespond.fetchFailed));
      }
      ;
    });
  }
}
