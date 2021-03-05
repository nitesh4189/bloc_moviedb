import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_bloc.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_event.dart';
import 'package:flutter_moviedb/data/repo/home_data.dart';
import 'package:flutter_moviedb/data/repo/home_repository.dart';

typedef MovieList = void Function(List<HomeDataList> homeDataList);
TextEditingController _textController = new TextEditingController();
Widget searchWidget(List<HomeDataList> homeDataList, BuildContext context,
    {MovieList movieList}) {
  return Container(
    margin: EdgeInsets.only(left: 15.0, right: 15.0),
    //width: 80,
    height: 50,
    decoration: BoxDecoration(
        color: Color(0xFFF9F6F0),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: TextFormField(
      controller: _textController,
      keyboardType: TextInputType.text,
      onFieldSubmitted: (value) {
        List<HomeDataList> list = HomeRepository().searchMovies(
            homedataList: homeDataList, searchText: _textController.text);
        print(list.length);
        BlocProvider.of<HomeBloc>(context)
            .add(ShowSearchedData(homeDataList: list));
      },
      onSaved: (value) => {},
      decoration: InputDecoration(
          labelText: 'Search Movie',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 2.0,
            bottom: 5.0,
          )),
    ),
  );
}
