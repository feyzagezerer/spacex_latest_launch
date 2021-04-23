import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import 'package:spacex_latest_launch/services/spacex_api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Latest Launch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SpacexApiService client = SpacexApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Launch>(
        future: client.apiCall(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                child: Center(
                    child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network('${snapshot.data.links.patch.small}'),
                  Text(
                    "name: ${snapshot.data.name} \n" +
                        "details : ${snapshot.data.details}",
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                ],
              ),
            )));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
