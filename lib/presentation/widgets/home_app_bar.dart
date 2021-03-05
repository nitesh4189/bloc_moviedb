import 'package:flutter/material.dart';

const _headingTitle = 'Show Movies';
const _headingTitleDetail = 'Movie Detail';
const _constColorWhite = Colors.white;
const _colorBackArrow = Color(0xff004164);
const _iconSizeConstant = 30.0;

class HomeAppBar extends StatelessWidget {
  bool showInHome;
  HomeAppBar({this.showInHome});
  Widget leadingIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: _iconSizeConstant,
        color: _colorBackArrow,
      ),
    );
  }

  Widget appBarText(BuildContext context) {
    return Text(
      showInHome ? '$_headingTitle' : '$_headingTitleDetail',
      style: TextStyle(fontSize: 23, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showInHome ? Container() : leadingIcon(context),
      centerTitle: true,
      title: appBarText(context),
      titleSpacing: 0,
      backgroundColor: _constColorWhite,
    );
  }
}
