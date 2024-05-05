import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phlask_map/models/app_data.dart';
import 'package:provider/provider.dart';

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
    if (widget.name == 'PUBLIC') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getPublic;
      });
    }
    if (widget.name == 'PRIVATE') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getPrivate;
      });
    }
    if (widget.name == 'SHARED') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getShared;
      });
    }
    if (widget.name == 'RESTRICTED') {
      setState(() {
        enabled = Provider.of<AppData>(context, listen: false).getRestricted;
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
          GestureDetector(
            onTap: () => {
              setState(() {
                enabled = !enabled;
                if (widget.name == 'PUBLIC') {
                  Provider.of<AppData>(context, listen: false)
                      .setPublic(enabled);
                }
                if (widget.name == 'PRIVATE') {
                  Provider.of<AppData>(context, listen: false)
                      .setPrivate(enabled);
                }
                if (widget.name == 'SHARED') {
                  Provider.of<AppData>(context, listen: false)
                      .setShared(enabled);
                }
                if (widget.name == 'RESTRICTED') {
                  Provider.of<AppData>(context, listen: false)
                      .setRestricted(enabled);
                }
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
