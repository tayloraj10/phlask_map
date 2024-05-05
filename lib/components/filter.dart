import 'package:flutter/material.dart';
import 'package:phlask_map/components/filter_row.dart';
import 'package:phlask_map/components/filter_toggle.dart';
import 'package:phlask_map/models/app_data.dart';
import 'package:provider/provider.dart';

class TapFilter extends StatefulWidget {
  const TapFilter({super.key});

  @override
  State<TapFilter> createState() => _TapFilterState();
}

class _TapFilterState extends State<TapFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(10), // Adjust the value for roundness
      ),
      height: MediaQuery.of(context).size.height * .4,
      // color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IntrinsicWidth(
                      stepWidth: 100,
                      child: Column(
                        children: [
                          FilterRow(
                            name: 'PUBLIC',
                            image: 'images/water_public.svg',
                          ),
                          FilterRow(
                            name: 'SHARED',
                            image: 'images/water_shared.svg',
                          ),
                          FilterRow(
                            name: 'PRIVATE',
                            image: 'images/water_private.svg',
                          ),
                          FilterRow(
                            name: 'RESTRICTED',
                            image: 'images/water_restricted.svg',
                          )
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    IntrinsicWidth(
                      stepWidth: 100,
                      child: Column(
                        children: [
                          FilterToggle(
                            name: 'Open Now',
                          ),
                          FilterToggle(
                            name: 'ADA Accessible',
                          ),
                          FilterToggle(
                            name: 'Filtered Water',
                          ),
                          FilterToggle(
                            name: 'Sparkling Water',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () => {
                          Provider.of<AppData>(context, listen: false).reset(),
                          Navigator.pop(context)
                        },
                    child: const Text('RESET'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
