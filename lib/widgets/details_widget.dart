import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import 'package:spacex_latest_launch/services/spacex_api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsWidget extends StatelessWidget {
  SpacexApiService client = SpacexApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Launch>(
      future: client.apiCall(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Card(
              // margin: EdgeInsets.all(0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    width: 20,
                    height: 22,
                    color: Colors.blue.shade900,
                    child: Text(
                      " Date:   ${snapshot.data.dateLocal} ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: YoutubePlayer(
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
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 10.0),
                    child: AnimatedButton(
                      text: 'Details',
                      buttonTextStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      color: Colors.blue.shade900,
                      pressEvent: () {
                        AwesomeDialog(
                          context: context,
                          borderSide:
                              BorderSide(color: Colors.blue.shade900, width: 2),
                          width: 420,
                          buttonsBorderRadius:
                              BorderRadius.all(Radius.circular(8)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Details',
                          desc: '${snapshot.data.details}',
                          showCloseIcon: true,
                          btnOkColor: Colors.blue.shade900,
                          btnOkOnPress: () {},
                        )..show();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
