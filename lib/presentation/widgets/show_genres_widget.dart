import 'package:flutter/material.dart';

Widget showGenres(BuildContext context) {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
    shrinkWrap: true,
    itemCount: 4,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 4, crossAxisCount: 2),
    itemBuilder: (context, index) {
      return Container(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.apps,
              size: 24,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Adventure',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(
                      0xFF333333,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
