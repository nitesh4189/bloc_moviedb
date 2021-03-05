import 'package:flutter_moviedb/data/repo/home_data.dart';

abstract class HomeEvent {}

class ShowAllDataEvent extends HomeEvent {}

class ShowSearchedData extends HomeEvent {
  List<HomeDataList> homeDataList;
  ShowSearchedData({this.homeDataList});
}
