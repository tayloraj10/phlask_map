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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(100), // Adjust the value for roundness
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'WATER MAP',
                  style: TextStyle(fontSize: 20, color: primaryColor),
                ),
              ),
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.water_drop,
                    size: 40,
                    color: primaryColor,
                  )),
              // IconButton(
              //     onPressed: () => {},
              //     icon: const Icon(
              //       Icons.food_bank_outlined,
              //       size: 40,
              //       color: Colors.green,
              //     )),
              const VerticalDivider(
                color: Colors.grey,
                thickness: 1,
              ),
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.filter_list,
                    size: 40,
                    color: primaryColor,
                  )),
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.add,
                    size: 40,
                    color: primaryColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
