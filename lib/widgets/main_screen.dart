import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/widgets/astronaut_list.dart';
import 'package:spacex_latest_launch/widgets/details_widget.dart';
import 'package:spacex_latest_launch/widgets/image_widget.dart';
import 'package:spacex_latest_launch/widgets/name_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 70),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              child: ListView(
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        color: Colors.blue.shade900,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            // margin: EdgeInsets.only(top: 30),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.grey.shade200,
                                  child: ImageWidget(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "SpaceX Latest Launch",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          NameWidget(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: AstronautList(),
          ),
          Flexible(
            flex: 2,
            child: DetailsWidget(),
          )
        ],
      ),
    );
  }
}
