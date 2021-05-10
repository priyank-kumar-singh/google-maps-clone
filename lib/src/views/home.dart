import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void permit() async {
    var perm = await PermissionHandler(Permission.location).verifyAndRequest();
    if (perm && mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    // permit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Maps(),
            FloatingAppBar(),
          ],
        ),
        backgroundColor: Colors.yellow.shade50,
        floatingActionButton: FancyFABFixed(
          children: [
            FancyFABItem(
              child: Icon(
                Icons.gps_fixed,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              onPressed: handleGPS,
            ),
            FancyFABItem(
              child: Icon(Icons.directions),
              onPressed: handleDirections,
            ),
          ],
        ),
        bottomNavigationBar: MapsBottomNavigationBar(),
      ),
    );
  }

  void handleDirections() {

  }

  void handleGPS() {

  }
}
