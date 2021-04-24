import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import 'package:spacex_latest_launch/services/spacex_api_service.dart';

class ImageWidget extends StatelessWidget {
  SpacexApiService client = SpacexApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Launch>(
      future: client.apiCall(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 29,
                  width: 5,
                ),
                Image.network('${snapshot.data.links.patch.small}'),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
