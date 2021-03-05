import 'dart:async';
import 'dart:convert';

import 'package:flutter_moviedb/data/provider/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiProvider {
  final apiKey = 'ac8dc3aa6078309dfc56c776d1822b15';

  /// Function for fetching [ List]
  Future<String> getListResponse() async {
    try {
      Response response = await http.get(
        '${BaseURL.getMovieList}?api_key=$apiKey',
      );

      var jsonObject = json.decode(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
