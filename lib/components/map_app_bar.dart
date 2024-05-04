import 'package:flutter/material.dart';

class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MapAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static const TextStyle textStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontFamily: 'RobotoMono');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => {Navigator.pushNamed(context, '/map')},
        child: Tooltip(
          message: 'Go to the map',
          child: Image.asset(
            'images/phlask_logo.png',
            height: 40,
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Mission',
            style: textStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Project',
            style: textStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Share Water & Food',
            style: textStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Contribute',
            style: textStyle,
          ),
        )
      ],
    );
  }
}
