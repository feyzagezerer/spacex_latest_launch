import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import 'package:spacex_latest_launch/services/spacex_api_service.dart';

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
            child: Column(
              children: <Widget>[
                Card(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(2),
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Date:   ${snapshot.data.dateLocal}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blue.shade900),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            AnimatedButton(
                              text: 'Details',
                              buttonTextStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              width: 80,
                              color: Colors.blue.shade900,
                              pressEvent: () {
                                AwesomeDialog(
                                  context: context,
                                  borderSide: BorderSide(
                                      color: Colors.blue.shade900, width: 2),
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
                          ],
                        ))
                      ],
                    ),
                  ),
                )
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
