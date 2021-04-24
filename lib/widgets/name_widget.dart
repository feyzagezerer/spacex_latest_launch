import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import 'package:spacex_latest_launch/services/spacex_api_service.dart';

class NameWidget extends StatelessWidget {
  SpacexApiService client = SpacexApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Launch>(
      future: client.apiCall(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Text(
              '${snapshot.data.name}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
