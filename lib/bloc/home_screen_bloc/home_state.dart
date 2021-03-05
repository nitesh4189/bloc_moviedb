import 'package:flutter_moviedb/data/repo/home_data.dart';

abstract class HomeState {}

class HomeUninitializedState extends HomeState {}

class HomeFetchingState extends HomeState {}

class HomeFetchedState extends HomeState {
  List<HomeDataList> list;
  bool isFromSearch;
  HomeFetchedState({this.list, this.isFromSearch});
}

class HomeErrorState extends HomeState {}

class HomeEmptyState extends HomeState {}
