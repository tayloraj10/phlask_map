import 'package:flutter/material.dart';
import 'package:phlask_map/components/filter.dart';
import 'package:phlask_map/models/app_data.dart';
import 'package:phlask_map/models/constants.dart';
import 'package:provider/provider.dart';

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
              Tooltip(
                message: 'Filters/Legend',
                child: IconButton(
                    onPressed: () => {
                          showModalBottomSheet(
                            context: context,
                            constraints: const BoxConstraints(
                              maxWidth: double.infinity,
                            ),
                            builder: (BuildContext context) {
                              return const TapFilter();
                            },
                          )
                        },
                    icon: const Icon(
                      Icons.filter_list,
                      size: 40,
                      color: primaryColor,
                    )),
              ),
              Tooltip(
                message: 'New Submission',
                child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: primaryColor,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${Provider.of<AppData>(context, listen: true).filteredTaps.length} Taps',
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
