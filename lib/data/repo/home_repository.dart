import 'package:flutter_moviedb/data/provider/api_provider.dart';
import 'package:flutter_moviedb/data/repo/home_data.dart';
import 'package:flutter_moviedb/data/repo/home_response_model.dart';
import 'package:intl/intl.dart';

class HomeRepository {
  Future<List<HomeDataList>> fetchListResponse() async {
    List<HomeDataList> _homeData;
    try {
      String apiResponse = await ApiProvider().getListResponse();

      if (apiResponse != null) {
        HomeMovieResponse homeMovieResponse =
            homeMovieResponseFromMap(apiResponse);
        _homeData = mapHomeData(homeMovieResponse);
      }
      return _homeData;
    } catch (e) {
      return _homeData;
    }
  }

  List<HomeDataList> mapHomeData(HomeMovieResponse homeMovieResponse) {
    List<HomeDataList> _homeDataList = [];
    int dataRequired = 0;

    try {
      if (homeMovieResponse != null && homeMovieResponse.results.isNotEmpty) {
        homeMovieResponse.results.forEach((element) {
          HomeDataList homeData = HomeDataList();
          homeData.movieName = element?.originalTitle;
          homeData.imageURL = element?.posterPath;
          final formattedDate =
              new DateFormat('dd-MMM-yyyy').format(element?.releaseDate);
          homeData.releaseDate = formattedDate;
          homeData.movieID = element?.id.toString();
          homeData.detail = element?.overview;
          _homeDataList.add(homeData);
        });
      }
    } catch (e) {}
    return _homeDataList;
  }

  List<HomeDataList> searchMovies(
      {List<HomeDataList> homedataList, String searchText}) {
    List<HomeDataList> _tempList = [];
    try {
      if (homedataList != null && searchText != null && searchText != "") {
        _tempList = homedataList
            .where((i) =>
                i.movieName.contains(RegExp(searchText, caseSensitive: false)))
            .toList();
        _tempList = _tempList.where((element) {
          var list = element.movieName.split(' ');
          if (list != null && list.length > 1) {
            int i = 0;
            list.forEach((e) {
              if (i == 0) {
                if (e.toLowerCase().startsWith(searchText.toLowerCase())) {
                  i = i + 1;
                  return true;
                }
              } else {
                return true;
              }
            });
            if (i == 0)
              return false;
            else
              return true;
          } else
            return false;
        }).toList();
        return _tempList;
      } else {
        return homedataList;
      }
    } catch (e) {
      return homedataList;
    }
  }
}
