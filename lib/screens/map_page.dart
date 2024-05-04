import 'package:flutter/material.dart';
import 'package:phlask_map/components/map_app_bar.dart';
import 'package:phlask_map/components/phlask_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MapAppBar(),
      body: SafeArea(
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
