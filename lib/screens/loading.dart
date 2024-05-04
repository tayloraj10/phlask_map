import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phlask_map/components/marker_dialog.dart';
import 'package:phlask_map/models/app_data.dart';
import 'package:phlask_map/models/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Duration of the animation
    );
    _animation = Tween<double>(
      begin: 0.0, // Start from an empty bottle
      end: 1.0, // Fill up the bottle completely
    ).animate(_controller);
    _controller.forward();
    _controller.repeat();

    loadData();
  }

  Future<void> loadData() async {
    await loadIcons();
    // await loadCleanups();
    await loadWater();
    if (mounted) {
      Navigator.pushNamed(context, '/map');
    }
  }

  Future<void> loadIcons() async {
    BitmapDescriptor currentLocationMarkerIcon =
        await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'images/current_location.png',
    );
    BitmapDescriptor waterPublicIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'images/water_public.svg',
    );
    BitmapDescriptor waterPrivateIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'images/water_private.svg',
    );
    BitmapDescriptor waterRestrictedIcon =
        await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'images/water_restricted.svg',
    );
    BitmapDescriptor waterSharedIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'images/water_shared.svg',
    );
    if (mounted) {
      Provider.of<AppData>(context, listen: false).updateIcons({
        'current': currentLocationMarkerIcon,
        'water_public': waterPublicIcon,
        'water_private': waterPrivateIcon,
        'water_restricted': waterRestrictedIcon,
        'water_shared': waterSharedIcon,
      });
    }
  }

  loadWater() async {
    final snapshot = await FirebaseDatabase.instance.ref().get();
    if (snapshot.value != null && mounted) {
      var data = snapshot.value as List?;
      for (var element in data!) {
        Provider.of<AppData>(context, listen: false).updateTaps(data);
        if (element != null) {
          // print(element);
          if (element.containsKey('access') &&
              acceptedTapTypes.contains(element['access'])) {
            Provider.of<AppData>(context, listen: false).addMarker(
              Marker(
                markerId: MarkerId(element['tapnum'].toString()),
                icon: Provider.of<AppData>(context, listen: false)
                    .getIcons[getIconType(element['access'])],
                position: LatLng(element['lat'], element['lon']),
                onTap: (() => {}),
              ),
            );
          }
        }
      }
    }
  }

  loadCleanups() async {
    await FirebaseFirestore.instance
        .collection("cleanups")
        .where('active', isEqualTo: true)
        .get()
        .then((value) => {
              for (var element in value.docs)
                {
                  Provider.of<AppData>(context, listen: false).addMarker(
                    Marker(
                      markerId: MarkerId('cleanup${element.id}'),
                      icon: Provider.of<AppData>(context, listen: false)
                          .getIcons['cleanup'],
                      position:
                          LatLng(element.data()['lat'], element.data()['lng']),
                      onTap: (() => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // Return widget tree containing the AlertDialog
                              return MarkerDialog(
                                data: element.data(),
                                id: element.id,
                                type: 'Cleanup',
                              );
                            },
                          )),
                    ),
                  )
                }
            });
  }

  hideCleanedTrash(String markerID) {
    Provider.of<AppData>(context, listen: false).removeMarker(markerID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/phlask_logo.png',
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            left: 33,
                            right: 33,
                            child: Container(
                              width: 10,
                              height: 300 *
                                  _animation.value, // Height of water level
                              color: Colors.lightBlue, // Water color
                            ),
                          ),
                          const Icon(Icons.local_drink, // Water bottle icon
                              size: 150,
                              color: Colors.lightGreen // Bottle color
                              ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
