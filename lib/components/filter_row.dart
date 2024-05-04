import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterRow extends StatefulWidget {
  final String name;
  final String image;
  const FilterRow({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  bool enabled = true;
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
          GestureDetector(
            onTap: () => {
              setState(() {
                enabled = !enabled;
              })
            },
            child: SvgPicture.asset(
              widget.image,
              height: 50,
              colorFilter: enabled
                  ? null
                  : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
