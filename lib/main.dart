import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_demo/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MapsWithLatLongDemo());
  });
}

class MapsWithLatLongDemo extends StatefulWidget {
  @override
  _MapsWithLatLongDemoState createState() => _MapsWithLatLongDemoState();
}

class _MapsWithLatLongDemoState extends State<MapsWithLatLongDemo> {
  FocusNode fn = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(fn);
      },
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: Homescreen(),
      ),
    );
  }
}
