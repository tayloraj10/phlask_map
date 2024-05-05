import 'package:flutter/material.dart';
import 'package:phlask_map/models/app_data.dart';
import 'package:provider/provider.dart';

class FilterToggle extends StatefulWidget {
  final String name;
  const FilterToggle({
    super.key,
    required this.name,
  });

  @override
  State<FilterToggle> createState() => _FilterToggleState();
}

class _FilterToggleState extends State<FilterToggle> {
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    if (widget.name == 'Open Now') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getOpen;
      });
    }
    if (widget.name == 'ADA Accessible') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getADA;
      });
    }
    if (widget.name == 'Filtered Water') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getFilteredWater;
      });
    }
    if (widget.name == 'Sparkling Water') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getSparkling;
      });
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            width: 10,
          ),
          Switch(
              value: enabled,
              onChanged: (bool value) => {
                    setState(() {
                      enabled = value;
                      if (widget.name == 'Open Now') {
                        Provider.of<AppData>(context, listen: false)
                            .setOpen(enabled);
                      }
                      if (widget.name == 'ADA Accessible') {
                        Provider.of<AppData>(context, listen: false)
                            .setADA(enabled);
                      }
                      if (widget.name == 'Filtered Water') {
                        Provider.of<AppData>(context, listen: false)
                            .setFilteredWater(enabled);
                      }
                      if (widget.name == 'Sparkling Water') {
                        Provider.of<AppData>(context, listen: false)
                            .setSparkling(enabled);
                      }
                    })
                  }),
        ],
      ),
    );
  }
}
