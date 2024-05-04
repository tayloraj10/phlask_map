import 'package:flutter/material.dart';
import 'package:phlask_map/models/constants.dart';

class MapControl extends StatefulWidget {
  const MapControl({super.key});

  @override
  State<MapControl> createState() => _MapControlState();
}

class _MapControlState extends State<MapControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'WATER MAP',
              style: TextStyle(fontSize: 26, color: primaryColor),
            ),
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.water_drop,
                  size: 40,
                  color: primaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
