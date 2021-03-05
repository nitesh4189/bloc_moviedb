import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_event.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_state.dart';
import 'package:flutter_moviedb/data/repo/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeUninitializedState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    try {
      if (event is ShowAllDataEvent) {
        yield HomeFetchingState();

        var response = await HomeRepository().fetchListResponse();
        if (response != null && response.isNotEmpty) {
          yield HomeFetchedState(list: response, isFromSearch: false);
        } else {
          yield HomeEmptyState();
        }
      } else if (event is ShowSearchedData) {
        yield HomeFetchingState();

        var response = event.homeDataList;
        if (response != null && response.isNotEmpty) {
          yield HomeFetchedState(list: response, isFromSearch: true);
        } else {
          yield HomeEmptyState();
        }
      } else {}
    } catch (_) {
      yield HomeErrorState();
    }
  }

  @override
  // TODO: implement initialState
  HomeState get initialState => HomeUninitializedState();
}
