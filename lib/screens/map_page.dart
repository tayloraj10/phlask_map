import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phlask_map/components/map_app_bar.dart';
import 'package:phlask_map/components/phlask_map.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MapAppBar(),
      body: const SafeArea(
        child: Row(
          children: [
            Expanded(
              child: PhlaskMap(),
            ),
          ],
        ),
      ),
    );
  }
}
