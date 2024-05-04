import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phlask_map/models/app_data.dart';
import 'package:provider/provider.dart';

class PhlaskMap extends StatefulWidget {
  const PhlaskMap({super.key});

  @override
  State<PhlaskMap> createState() => _PhlaskMapState();
}

class _PhlaskMapState extends State<PhlaskMap> {
  late LatLng droppedPostiion;
  late String droppedType;
  bool addClean = false;
  bool addTrash = false;
  bool pinDropped = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  loadPosition() async {
    panToPosition();
    // await _loadCustomMarker().then((value) => {loadCleanups(), loadTrash()});
    await getCurrentLocation().then((value) => {setCurrentLocationMarker()});
    getLocationStream();
  }

  setCurrentLocationMarker() {
    setState(() {
      Provider.of<AppData>(context, listen: false).addMarker(Marker(
        markerId: const MarkerId('current_location'),
        icon: Provider.of<AppData>(context, listen: false).getIcons['current'],
        position: Provider.of<AppData>(context, listen: false).getLatLng,
      ));
    });
    panToPosition();
  }

  static const CameraPosition _kStart = CameraPosition(
    target: LatLng(40.7798, -73.9676),
    zoom: 12,
  );

  panToPosition() {
    LatLng position = Provider.of<AppData>(context, listen: false).getLatLng;
    if (position.latitude != 0 && position.longitude != 0) {
      Provider.of<AppData>(context, listen: false)
          .getMapController
          .animateCamera(CameraUpdate.newLatLngZoom(
              LatLng(position.latitude, position.longitude), 15.6));
    }
  }

  void zoomToMarkers() {
    List<LatLng> positions = [];
    if (Provider.of<AppData>(context, listen: false).getMarkers.length > 1) {
      for (var element
          in Provider.of<AppData>(context, listen: false).getMarkers) {
        if (element.markerId != const MarkerId('current_location')) {
          positions.add(element.position);
        }
      }
      final southwestLat = positions.map((p) => p.latitude).reduce(
          (value, element) => value < element ? value : element); // smallest
      final southwestLon = positions
          .map((p) => p.longitude)
          .reduce((value, element) => value < element ? value : element);
      final northeastLat = positions.map((p) => p.latitude).reduce(
          (value, element) => value > element ? value : element); // biggest
      final northeastLon = positions
          .map((p) => p.longitude)
          .reduce((value, element) => value > element ? value : element);
      Provider.of<AppData>(context, listen: false)
          .getMapController
          .animateCamera(CameraUpdate.newLatLngBounds(
              LatLngBounds(
                  southwest: LatLng(southwestLat, southwestLon),
                  northeast: LatLng(northeastLat, northeastLon)),
              20));
    }
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    if (mounted) {
      Provider.of<AppData>(context, listen: false).updateLatLng(position);
      Provider.of<AppData>(context, listen: false)
          .getMapController
          .animateCamera(CameraUpdate.newLatLngZoom(
              Provider.of<AppData>(context, listen: false).getLatLng, 15.6));
    }
  }

  Future<void> getLocationStream() async {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 10,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      log(position.toString());
      setState(() {
        Provider.of<AppData>(context, listen: false).updateLatLng(position!);
      });
      // _controller.animateCamera(CameraUpdate.newLatLngZoom(
      //     Provider.of<AppData>(context, listen: false).getPosition, 15.6));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            initialCameraPosition: _kStart,
            markers: Provider.of<AppData>(context, listen: true).getMarkers,
            onMapCreated: (controller) async {
              setState(() {
                Provider.of<AppData>(context, listen: false)
                    .updateMapController(controller);
              });
              await loadPosition();
            }),
        Positioned(
          bottom: 120,
          right: 10,
          child: Tooltip(
            message: 'Zoom to Location',
            child: Container(
              color: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.location_searching),
                onPressed: () => {panToPosition()},
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 175,
          right: 10,
          child: Tooltip(
            message: 'Zoom to Data',
            child: Container(
              color: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.zoom_in_map),
                onPressed: () => {zoomToMarkers()},
              ),
            ),
          ),
        )
      ],
    );
  }
}
