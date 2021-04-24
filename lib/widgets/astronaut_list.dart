import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AstronautList extends StatefulWidget {
  @override
  _AstronautListState createState() => _AstronautListState();
}

class _AstronautListState extends State<AstronautList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 50),
      body: Container(
        color: Colors.grey.shade200,
        height: 130,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            astronaut(
                'assets/images/shane_kimbrough.jpg',
                'assets/images/nasa.png',
                'https://twitter.com/astro_kimbrough'),
            SizedBox(
              width: 25,
            ),
            astronaut('assets/images/megan_mcarthur.jpg',
                'assets/images/nasa.png', 'https://twitter.com/Astro_Megan'),
            SizedBox(
              width: 25,
            ),
            astronaut('assets/images/akihiko_hoshide.jpeg',
                'assets/images/jaxa.png', 'https://twitter.com/aki_hoshide'),
            SizedBox(
              width: 25,
            ),
            astronaut('assets/images/thomas_pesquet.jpg',
                'assets/images/esa.png', 'https://twitter.com/Thom_astro'),
            SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    );
  }
}

Future _goLink(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint("link failed");
  }
}

Widget astronaut(String imagePath, String logoPath, String link) {
  return Column(
    children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              width: 25,
              height: 25,
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(logoPath), fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 19,
        width: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blue),
        child: Center(
          child: InkWell(
            child: Text(
              "Follow",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            onTap: () => _goLink(link),
          ),
        ),
      ),
    ],
  );
}
