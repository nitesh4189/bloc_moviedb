import 'package:flutter/material.dart';
import 'package:flutter_moviedb/data/provider/base_url.dart';
import 'package:flutter_moviedb/presentation/widgets/home_app_bar.dart';

class DetailScreen extends StatelessWidget {
  String detail;
  String imageURL;
  String title;
  DetailScreen({this.imageURL, this.detail, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: HomeAppBar(
            showInHome: false,
          )),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                //color: Colors.blue,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "${BaseURL.getImageBasePath}$imageURL"),
                        fit: BoxFit.fill))),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
              child: Text(
                '$title',
                maxLines: 2,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Text(
                '$detail',
                maxLines: 9,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
