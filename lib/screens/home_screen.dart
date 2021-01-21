import 'package:flutter/material.dart';
import 'package:google_maps_demo/values/appAssets.dart';
import 'package:google_maps_demo/values/utility.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  double margin16 = 16.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Location via latitude longitude'),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(margin16),
          child: Center(
            child: Text(
              'Here is the image of showing location based on latitude and longitude.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        mapImageWidget(
          Utility.getMapUrl('43.7132977', '10.4003996'),
        ) //here you can provide latitude and longitude
      ],
    );
  }

  Widget mapImageWidget(String url) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      margin: EdgeInsets.only(left: margin16, right: margin16),
      decoration: Utility().getBoxDecoration(),
      child: Utility.imageLoader(url, AppAssets.demoImage),
    );
  }
}
