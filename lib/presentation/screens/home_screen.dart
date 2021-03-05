import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_bloc.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_event.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_state.dart';
import 'package:flutter_moviedb/data/repo/home_data.dart';
import 'package:flutter_moviedb/presentation/screens/detail_screen.dart';
import 'package:flutter_moviedb/presentation/widgets/custom_list_view.dart';
import 'package:flutter_moviedb/presentation/widgets/home_app_bar.dart';
import 'package:flutter_moviedb/presentation/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<HomeDataList> homeDataList = [];
  List<HomeDataList> tempDataList = [];
  bool hasLoded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(ShowAllDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: HomeAppBar(
            showInHome: true,
          )),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
//            searchWidget(homeDataList, context, movieList: (movieList) {}),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Container(
                    child: Center(
                      child: Text(
                        'Unable to retrieve any details, please try again after sometime...',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                } else if (state is HomeFetchingState) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is HomeFetchedState) {
                  List<HomeDataList> _list = state.list;
                  if (state.isFromSearch) {
                    homeDataList = _list;
                  } else {
                    homeDataList = _list;
                    tempDataList = _list;
                  }
                  return Column(
                    children: [
                      searchWidget(tempDataList, context,
                          movieList: (movieList) {}),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          //itemExtent: 100.0,
                          itemCount: homeDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      imageURL: homeDataList[index].imageURL,
                                      detail: homeDataList[index].detail,
                                      title: homeDataList[index].movieName,
                                    ),
                                  ),
                                );
                              },
                              child: CustomListView(
                                index: index,
                                title: homeDataList[index].movieName,
                                imageURL: homeDataList[index].imageURL,
                                releaseDate: homeDataList[index].releaseDate,
                              ),
                            );
                          }),
                    ],
                  );
                } else if (state is HomeUninitializedState) {
                  return Center(
                      child: Container(
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ));
                } else {
                  return Container(
                    child: Center(
                      child: Text(
                        'No Data To Show',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
