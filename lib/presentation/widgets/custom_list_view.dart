//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedb/data/provider/base_url.dart';

class CustomListView extends StatelessWidget {
  int index;
  String imageURL;
  String title;
  String releaseDate;
  CustomListView({this.index, this.imageURL, this.title, this.releaseDate});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: index % 2 == 0 ? Colors.white : Color(0xFFF9F6F0),
        ),
        //height: 65,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage:
                    NetworkImage("${BaseURL.getImageBasePath}$imageURL"),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100.0,
                    child: Text(
                      '$title',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Release Date : $releaseDate',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
