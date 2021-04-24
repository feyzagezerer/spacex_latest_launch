import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/widgets/astronaut_list.dart';
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
            flex: 1,
            child: Container(
              child: ListView(
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 330,
                        color: Colors.blue.shade900,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            // margin: EdgeInsets.only(top: 30),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 100,
                                  backgroundColor: Colors.grey.shade200,
                                  child: ImageWidget(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          Text(
                            "SpaceX Latest Launch",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
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
            child: Container(
              child: AstronautList(),
            ),
          ),
        ],
      ),
    );
  }
}

/*
  havaDurumuGetiriliyor() {
    return CircularProgressIndicator();
  }

  havaDurumuGetirHata() {
    return Text("Data failed to fetch");
  }
}*/
