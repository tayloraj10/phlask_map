import 'package:flutter/material.dart';

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
                    })
                  }),
        ],
      ),
    );
  }
}
