part of 'home_bloc.dart';

enum ApiRespond { fetchInitial, fetchSucces, fetchFailed }

class HomeInitial extends Equatable {
  const HomeInitial(
      {this.popular = const <Popular>[],
      this.nearby = const <Nearby>[],
      this.newStatus = ApiRespond.fetchInitial});
  final List<Popular> popular;
  final List<Nearby> nearby;
  final ApiRespond newStatus;

  HomeInitial copyWith() {
    return HomeInitial(nearby: nearby, popular: popular, newStatus: newStatus);
  }

  @override
  List<Object> get props => [popular, nearby, newStatus];
}

class InitialState extends Equatable {
  final String selectedFilter;
  final String type;

  final List<Nearby> nearby;
  final List<Popular> popular;
  final ApiRespond newStatus;

  const InitialState(
      {required this.selectedFilter,
      this.type = 'nearby',
      this.nearby = const <Nearby>[],
      this.popular = const <Popular>[],
      this.newStatus = ApiRespond.fetchInitial});

  InitialState copyWith({
    selectedFilter,
    type,
    List<Nearby>? nearby,
    List<Popular>? popular,
    ApiRespond? status,
  }) {
    return InitialState(
        type: type ?? this.type,
        selectedFilter: selectedFilter ?? this.selectedFilter,
        nearby: nearby ?? this.nearby,
        popular: popular ?? this.popular,
        newStatus: status ?? newStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedFilter, nearby, popular, newStatus];
}
