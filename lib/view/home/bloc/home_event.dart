part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class FetchColorEvent extends HomeEvent {
  final String placeTypes;
  const FetchColorEvent({this.placeTypes = ''});
  @override
  List<Object> get props {
    return [placeTypes];
  }
}
