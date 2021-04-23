import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex_latest_launch/models/launch.dart';

class SpacexApiService {
  static const url = "https://api.spacexdata.com/v4/launches/latest";
  final http.Client httpClient = http.Client();
  Future<Launch> apiCall() async {
    final response =
        await http.get('https://api.spacexdata.com/v4/launches/latest');
    if (response.statusCode == 200) {
      return Launch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
