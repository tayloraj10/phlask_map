import 'package:flutter/material.dart';
import 'package:phlask_map/components/marker_text.dart';
import 'package:phlask_map/models/constants.dart';

class MarkerDialog extends StatelessWidget {
  final Map data;
  final String id;
  final String type;
  const MarkerDialog(
      {super.key, required this.data, required this.type, required this.id});
  static const TextStyle style = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(type),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data['location'] != null && data['location'] != '')
            MarkerText(
                tooltip: "Location",
                text: data['location'],
                style: style,
                icon: Icons.pin_drop),
          if (data['group'] != null && data['group'] != '')
            MarkerText(
                tooltip: "Group",
                text: data['group'],
                style: style,
                icon: Icons.group),
          if (data['bags'] != null && data['bags'] != 0)
            MarkerText(
                tooltip: "# of Bags Cleaned",
                text: data['bags'].toString(),
                style: style,
                icon: Icons.restore_from_trash),
          if (data['weight'] != null && data['weight'] != 0)
            MarkerText(
                tooltip: "Pounds of Trash Cleaned",
                text: data['weight'].toString(),
                style: style,
                icon: Icons.fitness_center),
          if (data['date'] != null)
            MarkerText(
                tooltip: "Date",
                text: timestampToString(data['date']),
                style: style,
                icon: Icons.date_range),
          if (type == 'Trash Report')
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () => {}, child: const Text("Mark As Cleaned")),
            ),
        ],
      ),
    );
  }
}
