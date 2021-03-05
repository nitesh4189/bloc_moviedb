import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedb/bloc/home_screen_bloc/home_bloc.dart';
import 'package:flutter_moviedb/presentation/screens/home_screen.dart';

class InitialView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitialViewState();
  }
}

class InitialViewState extends State<InitialView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: BlocProvider(
        create: (BuildContext context) => HomeBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
