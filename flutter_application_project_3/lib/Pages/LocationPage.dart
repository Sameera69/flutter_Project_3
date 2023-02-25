import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/NavBar.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPage();
}

MapController _mapController = MapController();
LatLng _center = LatLng(26, 46);

class _LocationPage extends State<LocationPage> {
  bool result = false;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 400, child: MapFrame(latitude: 26, longitude: 46)),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavBar(
                            currentIndex: 0,
                            secondePage: 1,
                            restaurantId: 0,
                          )));
              setState(() {});
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                border: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text('Select the delivery location',
                      style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    setState(() {
      _center = LatLng(locationData.latitude!, locationData.longitude!);
      result = _mapController.move(LatLng(locationData.latitude!, locationData.longitude!), 13.0);
      Cart.Lat = locationData.latitude!;
      Cart.lng = locationData.longitude!;
    });
  }
}

class MapFrame extends StatelessWidget {
  const MapFrame({
    Key? key,
    required double latitude,
    required double longitude,
  })  : _latitude = latitude,
        _longitude = longitude,
        super(key: key);

  final double _latitude;
  final double _longitude;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: _center,
        zoom: 15,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: () {},
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(_latitude, _longitude),
              width: 80,
              height: 80,
              builder: (context) => const Icon(
                Icons.circle,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
