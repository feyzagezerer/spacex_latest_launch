import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import 'package:spacex_latest_launch/services/spacex_api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  @override
  void initState() {
    super.initState();
  }

  SpacexApiService client = SpacexApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Launch>(
      future: client.apiCall(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: '${snapshot.data.links.youtubeId}',
              flags: YoutubePlayerFlags(
                hideControls: false,
                controlsVisibleAtStart: true,
                autoPlay: true,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blue.shade900,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
